package com.facebook.stetho.dumpapp.plugins;

import android.content.Context;
import android.os.Environment;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.dumpapp.ArgsHelper;
import com.facebook.stetho.dumpapp.DumpException;
import com.facebook.stetho.dumpapp.DumpUsageException;
import com.facebook.stetho.dumpapp.DumperContext;
import com.facebook.stetho.dumpapp.DumperPlugin;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import org.apache.commons.cli.HelpFormatter;

/* JADX INFO: loaded from: classes.dex */
public class FilesDumperPlugin implements DumperPlugin {
    private static final String NAME = "files";
    private final Context mContext;

    public FilesDumperPlugin(Context context) {
        this.mContext = context;
    }

    @Override // com.facebook.stetho.dumpapp.DumperPlugin
    public String getName() {
        return NAME;
    }

    @Override // com.facebook.stetho.dumpapp.DumperPlugin
    public void dump(DumperContext dumpContext) throws DumpException {
        Iterator<String> args = dumpContext.getArgsAsList().iterator();
        String command = ArgsHelper.nextOptionalArg(args, "");
        if ("ls".equals(command)) {
            doLs(dumpContext.getStdout());
            return;
        }
        if ("tree".equals(command)) {
            doTree(dumpContext.getStdout());
        } else {
            if ("download".equals(command)) {
                doDownload(dumpContext.getStdout(), args);
                return;
            }
            doUsage(dumpContext.getStdout());
            if (!"".equals(command)) {
                throw new DumpUsageException("Unknown command: " + command);
            }
        }
    }

    private void doLs(PrintStream writer) throws DumpUsageException {
        File baseDir = getBaseDir(this.mContext);
        if (baseDir.isDirectory()) {
            printDirectoryText(baseDir, "", writer);
        }
    }

    private void doTree(PrintStream writer) throws DumpUsageException {
        File baseDir = getBaseDir(this.mContext);
        printDirectoryVisual(baseDir, 0, writer);
    }

    private static File getBaseDir(Context context) {
        return context.getFilesDir().getParentFile();
    }

    private static void printDirectoryText(File dir, String path, PrintStream writer) {
        File[] listFiles = dir.listFiles();
        for (File file : listFiles) {
            if (file.isDirectory()) {
                printDirectoryText(file, path + file.getName() + "/", writer);
            } else {
                writer.println(path + file.getName());
            }
        }
    }

    private static void printDirectoryVisual(File dir, int depth, PrintStream writer) {
        File[] listFiles = dir.listFiles();
        for (File file : listFiles) {
            printHeaderVisual(depth, writer);
            writer.print("+---");
            writer.print(file.getName());
            writer.println();
            if (file.isDirectory()) {
                printDirectoryVisual(file, depth + 1, writer);
            }
        }
    }

    private static void printHeaderVisual(int depth, PrintStream writer) {
        for (int i = 0; i < depth; i++) {
            writer.print("|   ");
        }
    }

    private void doDownload(PrintStream writer, Iterator<String> remainingArgs) throws DumpUsageException {
        OutputStream outputStream;
        String outputPath = ArgsHelper.nextArg(remainingArgs, "Must specify output file or '-'");
        ArrayList<File> selectedFiles = new ArrayList<>();
        while (remainingArgs.hasNext()) {
            selectedFiles.add(resolvePossibleAppStoragePath(this.mContext, remainingArgs.next()));
        }
        try {
            if (HelpFormatter.DEFAULT_OPT_PREFIX.equals(outputPath)) {
                outputStream = writer;
            } else {
                outputStream = new FileOutputStream(resolvePossibleSdcardPath(outputPath));
            }
            ZipOutputStream output = new ZipOutputStream(new BufferedOutputStream(outputStream));
            try {
                byte[] buf = new byte[2048];
                if (selectedFiles.size() > 0) {
                    addFiles(output, buf, (File[]) selectedFiles.toArray(new File[selectedFiles.size()]));
                } else {
                    addFiles(output, buf, getBaseDir(this.mContext).listFiles());
                }
                try {
                    output.close();
                } catch (IOException e) {
                    Util.close(outputStream, 1 == 0);
                    if (1 != 0) {
                        throw e;
                    }
                }
            } catch (Throwable e2) {
                try {
                    output.close();
                } catch (IOException e3) {
                    Util.close(outputStream, 0 == 0);
                    if (0 != 0) {
                        throw e3;
                    }
                }
                throw e2;
            }
        } catch (IOException e4) {
            throw new RuntimeException(e4);
        }
    }

    private void addFiles(ZipOutputStream output, byte[] buf, File[] files) throws IOException {
        for (File file : files) {
            if (file.isDirectory()) {
                addFiles(output, buf, file.listFiles());
            } else {
                output.putNextEntry(new ZipEntry(relativizePath(getBaseDir(this.mContext).getParentFile(), file)));
                FileInputStream input = new FileInputStream(file);
                try {
                    copy(input, output, buf);
                    input.close();
                } catch (Throwable th) {
                    input.close();
                    throw th;
                }
            }
        }
    }

    private static void copy(InputStream in, OutputStream out, byte[] buf) throws IOException {
        while (true) {
            int n = in.read(buf);
            if (n >= 0) {
                out.write(buf, 0, n);
            } else {
                return;
            }
        }
    }

    private static String relativizePath(File base, File path) {
        String baseStr = base.getAbsolutePath();
        String pathStr = path.getAbsolutePath();
        if (pathStr.startsWith(baseStr)) {
            return pathStr.substring(baseStr.length() + 1);
        }
        return pathStr;
    }

    private static File resolvePossibleAppStoragePath(Context context, String path) {
        if (path.startsWith("/")) {
            return new File(path);
        }
        return new File(getBaseDir(context), path);
    }

    private static File resolvePossibleSdcardPath(String path) {
        if (path.startsWith("/")) {
            return new File(path);
        }
        return new File(Environment.getExternalStorageDirectory(), path);
    }

    private void doUsage(PrintStream writer) {
        writer.println("Usage: dumpapp files <command> [command-options]");
        writer.println("       dumpapp files ls");
        writer.println("       dumpapp files tree");
        writer.println("       dumpapp files download <output.zip> [<path>...]");
        writer.println();
        writer.println("dumpapp files ls: List files similar to the ls command");
        writer.println();
        writer.println("dumpapp files tree: List files similar to the tree command");
        writer.println();
        writer.println("dumpapp files download: Fetch internal application storage");
        writer.println("    <output.zip>: Output location or '-' for stdout");
        writer.println("    <path>: Fetch only those paths named (directories fetch recursively)");
    }
}
