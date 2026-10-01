package org.apache.commons.cli;

/* JADX INFO: loaded from: classes7.dex */
public class BasicParser extends Parser {
    @Override // org.apache.commons.cli.Parser
    protected String[] flatten(Options options, String[] arguments, boolean stopAtNonOption) {
        return arguments;
    }
}
