package com.facebook.stetho.dumpapp.plugins;

import android.os.Process;
import com.facebook.stetho.common.ExceptionUtil;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.dumpapp.ArgsHelper;
import com.facebook.stetho.dumpapp.DumpException;
import com.facebook.stetho.dumpapp.DumpUsageException;
import com.facebook.stetho.dumpapp.DumperContext;
import com.facebook.stetho.dumpapp.DumperPlugin;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import javax.annotation.Nullable;
import org.apache.commons.cli.HelpFormatter;

/* JADX INFO: loaded from: classes.dex */
public class CrashDumperPlugin implements DumperPlugin {
    private static final String NAME = "crash";
    private static final String OPTION_EXIT_DEFAULT = "0";
    private static final String OPTION_KILL_DEFAULT = "9";
    private static final String OPTION_THROW_DEFAULT = "java.lang.Error";

    @Override // com.facebook.stetho.dumpapp.DumperPlugin
    public String getName() {
        return NAME;
    }

    @Override // com.facebook.stetho.dumpapp.DumperPlugin
    public void dump(DumperContext dumpContext) throws DumpException {
        Iterator<String> argsIter = dumpContext.getArgsAsList().iterator();
        String command = ArgsHelper.nextOptionalArg(argsIter, null);
        if ("throw".equals(command)) {
            doUncaughtException(argsIter);
            return;
        }
        if ("kill".equals(command)) {
            doKill(dumpContext, argsIter);
        } else {
            if ("exit".equals(command)) {
                doSystemExit(argsIter);
                return;
            }
            doUsage(dumpContext.getStdout());
            if (command != null) {
                throw new DumpUsageException("Unsupported command: " + command);
            }
        }
    }

    private void doUsage(PrintStream out) {
        out.println("Usage: dumpapp crash <command> [command-options]");
        out.println("Usage: dumpapp crash throw");
        out.println("       dumpapp crash kill");
        out.println("       dumpapp crash exit");
        out.println();
        out.println("dumpapp crash throw: Throw an uncaught exception (simulates a program crash)");
        out.println("    <Throwable>: Throwable class to use (default: java.lang.Error)");
        out.println();
        out.println("dumpapp crash kill: Send a signal to this process (simulates the low memory killer)");
        out.println("    <SIGNAL>: Either signal name or number to send (default: 9)");
        out.println("              See `adb shell kill -l` for more information");
        out.println();
        out.println("dumpapp crash exit: Invoke System.exit (simulates an abnormal Android exit strategy)");
        out.println("    <code>: Exit code (default: 0)");
    }

    private void doSystemExit(Iterator<String> argsIter) {
        String exitCodeStr = ArgsHelper.nextOptionalArg(argsIter, OPTION_EXIT_DEFAULT);
        System.exit(Integer.parseInt(exitCodeStr));
    }

    private void doKill(DumperContext dumpContext, Iterator<String> argsIter) throws DumpException {
        String signal = ArgsHelper.nextOptionalArg(argsIter, OPTION_KILL_DEFAULT);
        try {
            Process kill = new ProcessBuilder(new String[0]).command("/system/bin/kill", HelpFormatter.DEFAULT_OPT_PREFIX + signal, String.valueOf(Process.myPid())).redirectErrorStream(true).start();
            try {
                InputStream in = kill.getInputStream();
                Util.copy(in, dumpContext.getStdout(), new byte[1024]);
            } finally {
                kill.destroy();
            }
        } catch (IOException e) {
            throw new DumpException("Failed to invoke kill: " + e);
        }
    }

    private void doUncaughtException(Iterator<String> argsIter) throws DumpException {
        Throwable t;
        String throwableClassString = ArgsHelper.nextOptionalArg(argsIter, OPTION_THROW_DEFAULT);
        try {
            Class<?> cls = Class.forName(throwableClassString);
            Constructor<? extends Throwable> ctorWithMessage = tryGetDeclaredConstructor(cls, String.class);
            if (ctorWithMessage != null) {
                t = (Throwable) ctorWithMessage.newInstance("Uncaught exception triggered by Stetho");
            } else {
                t = (Throwable) cls.getDeclaredConstructor(new Class[0]).newInstance(new Object[0]);
            }
            Thread crashThread = new Thread(new ThrowRunnable(t));
            crashThread.start();
            Util.joinUninterruptibly(crashThread);
        } catch (ClassCastException e) {
            e = e;
            throw new DumpException("Invalid supplied Throwable class: " + e);
        } catch (ClassNotFoundException e2) {
            e = e2;
            throw new DumpException("Invalid supplied Throwable class: " + e);
        } catch (IllegalAccessException e3) {
            e = e3;
            throw new DumpException("Invalid supplied Throwable class: " + e);
        } catch (InstantiationException e4) {
            e = e4;
            throw new DumpException("Invalid supplied Throwable class: " + e);
        } catch (NoSuchMethodException e5) {
            e = e5;
            throw new DumpException("Invalid supplied Throwable class: " + e);
        } catch (InvocationTargetException e6) {
            throw ExceptionUtil.propagate(e6.getCause());
        }
    }

    @Nullable
    private static <T> Constructor<? extends T> tryGetDeclaredConstructor(Class<T> cls, Class<?>... clsArr) {
        try {
            return cls.getDeclaredConstructor(clsArr);
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    private static class ThrowRunnable implements Runnable {
        private final Throwable mThrowable;

        public ThrowRunnable(Throwable t) {
            this.mThrowable = t;
        }

        @Override // java.lang.Runnable
        public void run() throws Throwable {
            ExceptionUtil.sneakyThrow(this.mThrowable);
        }
    }
}
