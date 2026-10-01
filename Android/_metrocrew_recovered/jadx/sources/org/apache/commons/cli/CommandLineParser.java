package org.apache.commons.cli;

/* JADX INFO: loaded from: classes7.dex */
public interface CommandLineParser {
    CommandLine parse(Options options, String[] strArr) throws ParseException;

    CommandLine parse(Options options, String[] strArr, boolean z) throws ParseException;
}
