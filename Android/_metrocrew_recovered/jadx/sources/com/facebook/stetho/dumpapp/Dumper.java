package com.facebook.stetho.dumpapp;

import java.io.InputStream;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.GnuParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.ParseException;

/* JADX INFO: loaded from: classes.dex */
public class Dumper {
    private final Map<String, DumperPlugin> mDumperPlugins;
    private final GlobalOptions mGlobalOptions;
    private final CommandLineParser mParser;

    public Dumper(Iterable<DumperPlugin> dumperPlugins) {
        this(dumperPlugins, new GnuParser());
    }

    public Dumper(Iterable<DumperPlugin> dumperPlugins, CommandLineParser parser) {
        this.mDumperPlugins = generatePluginMap(dumperPlugins);
        this.mParser = parser;
        this.mGlobalOptions = new GlobalOptions();
    }

    private static Map<String, DumperPlugin> generatePluginMap(Iterable<DumperPlugin> plugins) {
        Map<String, DumperPlugin> map = new HashMap<>();
        for (DumperPlugin plugin : plugins) {
            map.put(plugin.getName(), plugin);
        }
        return Collections.unmodifiableMap(map);
    }

    public int dump(InputStream input, PrintStream out, PrintStream err, String[] args) {
        try {
            return doDump(input, out, err, args);
        } catch (DumpException e) {
            err.println(e.getMessage());
            return 1;
        } catch (DumpappOutputBrokenException e2) {
            throw e2;
        } catch (RuntimeException e3) {
            e3.printStackTrace(err);
            return 1;
        } catch (ParseException e4) {
            err.println(e4.getMessage());
            dumpUsage(err);
            return 1;
        }
    }

    private int doDump(InputStream input, PrintStream out, PrintStream err, String[] args) throws DumpException, ParseException {
        CommandLine parsedArgs = this.mParser.parse(this.mGlobalOptions.options, args, true);
        if (parsedArgs.hasOption(this.mGlobalOptions.optionHelp.getOpt())) {
            dumpUsage(out);
            return 0;
        }
        if (parsedArgs.hasOption(this.mGlobalOptions.optionListPlugins.getOpt())) {
            dumpAvailablePlugins(out);
            return 0;
        }
        if (!parsedArgs.getArgList().isEmpty()) {
            dumpPluginOutput(input, out, err, parsedArgs);
            return 0;
        }
        dumpUsage(err);
        return 1;
    }

    private void dumpAvailablePlugins(PrintStream output) {
        List<String> pluginNames = new ArrayList<>();
        for (DumperPlugin pluginToDump : this.mDumperPlugins.values()) {
            pluginNames.add(pluginToDump.getName());
        }
        Collections.sort(pluginNames);
        for (String pluginName : pluginNames) {
            output.println(pluginName);
        }
    }

    private void dumpPluginOutput(InputStream input, PrintStream out, PrintStream err, CommandLine parsedArgs) throws DumpException {
        List<String> args = new ArrayList<>(parsedArgs.getArgList());
        if (args.size() < 1) {
            throw new DumpException("Expected plugin argument");
        }
        String pluginName = args.remove(0);
        DumperPlugin plugin = this.mDumperPlugins.get(pluginName);
        if (plugin == null) {
            throw new DumpException("No plugin named '" + pluginName + "'");
        }
        DumperContext dumperContext = new DumperContext(input, out, err, this.mParser, args);
        plugin.dump(dumperContext);
    }

    private void dumpUsage(PrintStream output) {
        HelpFormatter formatter = new HelpFormatter();
        output.println("Usage: dumpapp [options] <plugin> [plugin-options]");
        PrintWriter writer = new PrintWriter(output);
        try {
            formatter.printOptions(writer, formatter.getWidth(), this.mGlobalOptions.options, formatter.getLeftPadding(), formatter.getDescPadding());
        } finally {
            writer.flush();
        }
    }
}
