package com.facebook.stetho.dumpapp.plugins;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import com.facebook.stetho.dumpapp.DumpUsageException;
import com.facebook.stetho.dumpapp.DumperContext;
import com.facebook.stetho.dumpapp.DumperPlugin;
import com.facebook.stetho.inspector.domstorage.SharedPreferencesHelper;
import java.io.File;
import java.io.PrintStream;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public class SharedPreferencesDumperPlugin implements DumperPlugin {
    private static final String NAME = "prefs";
    private static final String XML_SUFFIX = ".xml";
    private final Context mAppContext;

    public SharedPreferencesDumperPlugin(Context context) {
        this.mAppContext = context.getApplicationContext();
    }

    @Override // com.facebook.stetho.dumpapp.DumperPlugin
    public String getName() {
        return NAME;
    }

    @Override // com.facebook.stetho.dumpapp.DumperPlugin
    public void dump(DumperContext dumpContext) throws DumpUsageException {
        PrintStream writer = dumpContext.getStdout();
        List<String> args = dumpContext.getArgsAsList();
        String commandName = args.isEmpty() ? "" : args.remove(0);
        if (commandName.equals("print")) {
            doPrint(writer, args);
        } else if (commandName.equals("write")) {
            doWrite(args);
        } else {
            doUsage(writer);
        }
    }

    private void doWrite(List<String> args) throws DumpUsageException {
        Iterator<String> argsIter = args.iterator();
        String path = nextArg(argsIter, "Expected <path>");
        String key = nextArg(argsIter, "Expected <key>");
        String typeName = nextArg(argsIter, "Expected <type>");
        Type type = Type.of(typeName);
        if (type == null) {
            throw new DumpUsageException(Type.appendNamesList(new StringBuilder("Usage: prefs write <path> <key> <type> <value>, where type is one of: "), ", ").toString());
        }
        SharedPreferences sharedPreferences = getSharedPreferences(path);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        switch (type) {
            case BOOLEAN:
                editor.putBoolean(key, Boolean.valueOf(nextArgValue(argsIter)).booleanValue());
                break;
            case INT:
                editor.putInt(key, Integer.valueOf(nextArgValue(argsIter)).intValue());
                break;
            case LONG:
                editor.putLong(key, Long.valueOf(nextArgValue(argsIter)).longValue());
                break;
            case FLOAT:
                editor.putFloat(key, Float.valueOf(nextArgValue(argsIter)).floatValue());
                break;
            case STRING:
                editor.putString(key, nextArgValue(argsIter));
                break;
            case SET:
                putStringSet(editor, key, argsIter);
                break;
        }
        editor.commit();
    }

    @Nonnull
    private static String nextArg(Iterator<String> iter, String messageIfNotPresent) throws DumpUsageException {
        if (!iter.hasNext()) {
            throw new DumpUsageException(messageIfNotPresent);
        }
        return iter.next();
    }

    @Nonnull
    private static String nextArgValue(Iterator<String> iter) throws DumpUsageException {
        return nextArg(iter, "Expected <value>");
    }

    private static void putStringSet(SharedPreferences.Editor editor, String key, Iterator<String> remainingArgs) {
        HashSet<String> set = new HashSet<>();
        while (remainingArgs.hasNext()) {
            set.add(remainingArgs.next());
        }
        editor.putStringSet(key, set);
    }

    private void doPrint(PrintStream writer, List<String> args) {
        String rootPath = this.mAppContext.getApplicationInfo().dataDir + "/shared_prefs";
        String offsetPrefix = args.isEmpty() ? "" : args.get(0);
        String keyPrefix = args.size() > 1 ? args.get(1) : "";
        printRecursive(writer, rootPath, "", offsetPrefix, keyPrefix);
    }

    private void printRecursive(PrintStream writer, String rootPath, String offsetPath, String pathPrefix, String keyPrefix) {
        String[] children;
        PrintStream writer2;
        String rootPath2;
        String pathPrefix2;
        String keyPrefix2;
        File file = new File(rootPath, offsetPath);
        if (file.isFile()) {
            if (offsetPath.endsWith(XML_SUFFIX)) {
                int suffixLength = XML_SUFFIX.length();
                String prefsName = offsetPath.substring(0, offsetPath.length() - suffixLength);
                printFile(writer, prefsName, keyPrefix);
                return;
            }
            return;
        }
        if (file.isDirectory() && (children = file.list()) != null) {
            int i = 0;
            while (i < children.length) {
                String childOffsetPath = TextUtils.isEmpty(offsetPath) ? children[i] : offsetPath + File.separator + children[i];
                if (!childOffsetPath.startsWith(pathPrefix)) {
                    writer2 = writer;
                    rootPath2 = rootPath;
                    pathPrefix2 = pathPrefix;
                    keyPrefix2 = keyPrefix;
                } else {
                    writer2 = writer;
                    rootPath2 = rootPath;
                    pathPrefix2 = pathPrefix;
                    keyPrefix2 = keyPrefix;
                    printRecursive(writer2, rootPath2, childOffsetPath, pathPrefix2, keyPrefix2);
                }
                i++;
                writer = writer2;
                rootPath = rootPath2;
                pathPrefix = pathPrefix2;
                keyPrefix = keyPrefix2;
            }
        }
    }

    private void printFile(PrintStream writer, String prefsName, String keyPrefix) {
        writer.println(prefsName + ":");
        SharedPreferences preferences = getSharedPreferences(prefsName);
        for (Map.Entry<String, ?> entry : SharedPreferencesHelper.getSharedPreferenceEntriesSorted(preferences)) {
            if (entry.getKey().startsWith(keyPrefix)) {
                writer.println("  " + entry.getKey() + " = " + entry.getValue());
            }
        }
    }

    private void doUsage(PrintStream writer) {
        writer.println("Usage: dumpapp prefs <command> [command-options]");
        writer.println("Usage: dumpapp prefs print [pathPrefix [keyPrefix]]");
        writer.println(Type.appendNamesList(new StringBuilder("       dumpapp prefs ").append("write <path> <key> <"), "|").append("> <value>"));
        writer.println();
        writer.println("dumpapp prefs print: Print all matching values from the shared preferences");
        writer.println();
        writer.println("dumpapp prefs write: Writes a value to the shared preferences");
    }

    private SharedPreferences getSharedPreferences(String name) {
        return this.mAppContext.getSharedPreferences(name, 4);
    }

    private enum Type {
        BOOLEAN(TypedValues.Custom.S_BOOLEAN),
        INT("int"),
        LONG("long"),
        FLOAT(TypedValues.Custom.S_FLOAT),
        STRING(TypedValues.Custom.S_STRING),
        SET("set");

        private final String name;

        Type(String name) {
            this.name = name;
        }

        @Nullable
        public static Type of(String name) {
            for (Type type : values()) {
                if (type.name.equals(name)) {
                    return type;
                }
            }
            return null;
        }

        public static StringBuilder appendNamesList(StringBuilder builder, String separator) {
            boolean isFirst = true;
            for (Type type : values()) {
                if (isFirst) {
                    isFirst = false;
                } else {
                    builder.append(separator);
                }
                builder.append(type.name);
            }
            return builder;
        }
    }
}
