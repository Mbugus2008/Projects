package com.facebook.stetho.dumpapp;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class ArgsHelper {
    public static String nextOptionalArg(Iterator<String> argsIter, String defaultValue) {
        return argsIter.hasNext() ? argsIter.next() : defaultValue;
    }

    public static String nextArg(Iterator<String> argsIter, String errorIfMissing) throws DumpUsageException {
        if (!argsIter.hasNext()) {
            throw new DumpUsageException(errorIfMissing);
        }
        return argsIter.next();
    }

    public static String[] drainToArray(Iterator<String> argsIter) {
        List<String> args = new ArrayList<>();
        while (argsIter.hasNext()) {
            args.add(argsIter.next());
        }
        return (String[]) args.toArray(new String[args.size()]);
    }
}
