.class public Lcom/facebook/stetho/dumpapp/plugins/CrashDumperPlugin;
.super Ljava/lang/Object;
.source "CrashDumperPlugin.java"

# interfaces
.implements Lcom/facebook/stetho/dumpapp/DumperPlugin;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/dumpapp/plugins/CrashDumperPlugin$ThrowRunnable;
    }
.end annotation


# static fields
.field private static final NAME:Ljava/lang/String; = "crash"

.field private static final OPTION_EXIT_DEFAULT:Ljava/lang/String; = "0"

.field private static final OPTION_KILL_DEFAULT:Ljava/lang/String; = "9"

.field private static final OPTION_THROW_DEFAULT:Ljava/lang/String; = "java.lang.Error"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method private doKill(Lcom/facebook/stetho/dumpapp/DumperContext;Ljava/util/Iterator;)V
    .locals 6
    .param p1, "dumpContext"    # Lcom/facebook/stetho/dumpapp/DumperContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/dumpapp/DumperContext;",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpException;
        }
    .end annotation

    .line 93
    .local p2, "argsIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const-string v0, "9"

    invoke-static {p2, v0}, Lcom/facebook/stetho/dumpapp/ArgsHelper;->nextOptionalArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "signal":Ljava/lang/String;
    :try_start_0
    new-instance v1, Ljava/lang/ProcessBuilder;

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/String;

    invoke-direct {v1, v3}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "/system/bin/kill"

    aput-object v4, v3, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "-"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v3, v4

    .line 96
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x2

    aput-object v2, v3, v5

    invoke-virtual {v1, v3}, Ljava/lang/ProcessBuilder;->command([Ljava/lang/String;)Ljava/lang/ProcessBuilder;

    move-result-object v1

    .line 97
    invoke-virtual {v1, v4}, Ljava/lang/ProcessBuilder;->redirectErrorStream(Z)Ljava/lang/ProcessBuilder;

    move-result-object v1

    .line 98
    invoke-virtual {v1}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .local v1, "kill":Ljava/lang/Process;
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 104
    .local v2, "in":Ljava/io/InputStream;
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getStdout()Ljava/io/PrintStream;

    move-result-object v3

    const/16 v4, 0x400

    new-array v4, v4, [B

    invoke-static {v2, v3, v4}, Lcom/facebook/stetho/common/Util;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    .end local v2    # "in":Ljava/io/InputStream;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Process;->destroy()V

    .line 107
    nop

    .line 110
    .end local v1    # "kill":Ljava/lang/Process;
    nop

    .line 111
    return-void

    .line 106
    .restart local v1    # "kill":Ljava/lang/Process;
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Ljava/lang/Process;->destroy()V

    .line 107
    nop

    .end local v0    # "signal":Ljava/lang/String;
    .end local p1    # "dumpContext":Lcom/facebook/stetho/dumpapp/DumperContext;
    .end local p2    # "argsIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    throw v2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 108
    .end local v1    # "kill":Ljava/lang/Process;
    .restart local v0    # "signal":Ljava/lang/String;
    .restart local p1    # "dumpContext":Lcom/facebook/stetho/dumpapp/DumperContext;
    .restart local p2    # "argsIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 109
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lcom/facebook/stetho/dumpapp/DumpException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to invoke kill: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/facebook/stetho/dumpapp/DumpException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private doSystemExit(Ljava/util/Iterator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 88
    .local p1, "argsIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const-string v0, "0"

    invoke-static {p1, v0}, Lcom/facebook/stetho/dumpapp/ArgsHelper;->nextOptionalArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "exitCodeStr":Ljava/lang/String;
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 90
    return-void
.end method

.method private doUncaughtException(Ljava/util/Iterator;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpException;
        }
    .end annotation

    .line 114
    .local p1, "argsIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const-string v0, "java.lang.Error"

    invoke-static {p1, v0}, Lcom/facebook/stetho/dumpapp/ArgsHelper;->nextOptionalArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "throwableClassString":Ljava/lang/String;
    nop

    .line 117
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 119
    .local v1, "throwableClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Throwable;>;"
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 120
    invoke-static {v1, v2}, Lcom/facebook/stetho/dumpapp/plugins/CrashDumperPlugin;->tryGetDeclaredConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 121
    .local v2, "ctorWithMessage":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Ljava/lang/Throwable;>;"
    if-eqz v2, :cond_0

    .line 122
    const-string v3, "Uncaught exception triggered by Stetho"

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Throwable;

    .local v3, "t":Ljava/lang/Throwable;
    goto :goto_0

    .line 124
    .end local v3    # "t":Ljava/lang/Throwable;
    :cond_0
    new-array v3, v4, [Ljava/lang/Class;

    .line 125
    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 126
    .local v3, "ctorParameterless":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Ljava/lang/Throwable;>;"
    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Throwable;

    move-object v3, v4

    .line 129
    .local v3, "t":Ljava/lang/Throwable;
    :goto_0
    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Lcom/facebook/stetho/dumpapp/plugins/CrashDumperPlugin$ThrowRunnable;

    invoke-direct {v5, v3}, Lcom/facebook/stetho/dumpapp/plugins/CrashDumperPlugin$ThrowRunnable;-><init>(Ljava/lang/Throwable;)V

    invoke-direct {v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 130
    .local v4, "crashThread":Ljava/lang/Thread;
    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    .line 132
    invoke-static {v4}, Lcom/facebook/stetho/common/Util;->joinUninterruptibly(Ljava/lang/Thread;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    .end local v1    # "throwableClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Throwable;>;"
    .end local v2    # "ctorWithMessage":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Ljava/lang/Throwable;>;"
    .end local v3    # "t":Ljava/lang/Throwable;
    .end local v4    # "crashThread":Ljava/lang/Thread;
    nop

    .line 145
    return-void

    .line 140
    :catch_0
    move-exception v1

    .line 143
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/stetho/common/ExceptionUtil;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 133
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_1

    :catch_3
    move-exception v1

    goto :goto_1

    :catch_4
    move-exception v1

    goto :goto_1

    :catch_5
    move-exception v1

    .line 139
    .local v1, "e":Ljava/lang/Exception;
    :goto_1
    new-instance v2, Lcom/facebook/stetho/dumpapp/DumpException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid supplied Throwable class: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/facebook/stetho/dumpapp/DumpException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private doUsage(Ljava/io/PrintStream;)V
    .locals 5
    .param p1, "out"    # Ljava/io/PrintStream;

    .line 67
    const-string v0, "dumpapp crash"

    .line 69
    .local v0, "cmdName":Ljava/lang/String;
    const-string v1, "Usage: dumpapp crash "

    .line 70
    .local v1, "usagePrefix":Ljava/lang/String;
    const-string v2, "       dumpapp crash "

    .line 71
    .local v2, "blankPrefix":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<command> [command-options]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 72
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "throw"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 73
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "kill"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 74
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "exit"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 75
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 76
    const-string v3, "dumpapp crash throw: Throw an uncaught exception (simulates a program crash)"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 77
    const-string v3, "    <Throwable>: Throwable class to use (default: java.lang.Error)"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 78
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 79
    const-string v3, "dumpapp crash kill: Send a signal to this process (simulates the low memory killer)"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 80
    const-string v3, "    <SIGNAL>: Either signal name or number to send (default: 9)"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 81
    const-string v3, "              See `adb shell kill -l` for more information"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 82
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 83
    const-string v3, "dumpapp crash exit: Invoke System.exit (simulates an abnormal Android exit strategy)"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 84
    const-string v3, "    <code>: Exit code (default: 0)"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 85
    return-void
.end method

.method private static varargs tryGetDeclaredConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Constructor<",
            "+TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 152
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p1, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 153
    :catch_0
    move-exception v0

    .line 154
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const/4 v1, 0x0

    return-object v1
.end method


# virtual methods
.method public dump(Lcom/facebook/stetho/dumpapp/DumperContext;)V
    .locals 5
    .param p1, "dumpContext"    # Lcom/facebook/stetho/dumpapp/DumperContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpException;
        }
    .end annotation

    .line 49
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getArgsAsList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 51
    .local v0, "argsIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/facebook/stetho/dumpapp/ArgsHelper;->nextOptionalArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 52
    .local v1, "command":Ljava/lang/String;
    const-string/jumbo v2, "throw"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 53
    invoke-direct {p0, v0}, Lcom/facebook/stetho/dumpapp/plugins/CrashDumperPlugin;->doUncaughtException(Ljava/util/Iterator;)V

    goto :goto_0

    .line 54
    :cond_0
    const-string v2, "kill"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 55
    invoke-direct {p0, p1, v0}, Lcom/facebook/stetho/dumpapp/plugins/CrashDumperPlugin;->doKill(Lcom/facebook/stetho/dumpapp/DumperContext;Ljava/util/Iterator;)V

    goto :goto_0

    .line 56
    :cond_1
    const-string v2, "exit"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 57
    invoke-direct {p0, v0}, Lcom/facebook/stetho/dumpapp/plugins/CrashDumperPlugin;->doSystemExit(Ljava/util/Iterator;)V

    goto :goto_0

    .line 59
    :cond_2
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getStdout()Ljava/io/PrintStream;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/facebook/stetho/dumpapp/plugins/CrashDumperPlugin;->doUsage(Ljava/io/PrintStream;)V

    .line 60
    if-nez v1, :cond_3

    .line 64
    :goto_0
    return-void

    .line 61
    :cond_3
    new-instance v2, Lcom/facebook/stetho/dumpapp/DumpUsageException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unsupported command: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/facebook/stetho/dumpapp/DumpUsageException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 44
    const-string v0, "crash"

    return-object v0
.end method
