package com.facebook.stetho.inspector.helper;

import android.view.ViewDebug;

/* JADX INFO: loaded from: classes.dex */
public class IntegerFormatter {
    private static IntegerFormatter cachedFormatter;

    public static IntegerFormatter getInstance() {
        if (cachedFormatter == null) {
            synchronized (IntegerFormatter.class) {
                if (cachedFormatter == null) {
                    cachedFormatter = new IntegerFormatterWithHex();
                }
            }
        }
        return cachedFormatter;
    }

    private IntegerFormatter() {
    }

    public String format(Integer integer, ViewDebug.ExportedProperty annotation) {
        return String.valueOf(integer);
    }

    private static class IntegerFormatterWithHex extends IntegerFormatter {
        private IntegerFormatterWithHex() {
            super();
        }

        @Override // com.facebook.stetho.inspector.helper.IntegerFormatter
        public String format(Integer integer, ViewDebug.ExportedProperty annotation) {
            if (annotation != null && annotation.formatToHexString()) {
                return "0x" + Integer.toHexString(integer.intValue());
            }
            return super.format(integer, annotation);
        }
    }
}
