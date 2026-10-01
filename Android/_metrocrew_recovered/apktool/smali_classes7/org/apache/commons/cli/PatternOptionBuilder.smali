.class public Lorg/apache/commons/cli/PatternOptionBuilder;
.super Ljava/lang/Object;
.source "PatternOptionBuilder.java"


# static fields
.field public static final CLASS_VALUE:Ljava/lang/Class;

.field public static final DATE_VALUE:Ljava/lang/Class;

.field public static final EXISTING_FILE_VALUE:Ljava/lang/Class;

.field public static final FILES_VALUE:Ljava/lang/Class;

.field public static final FILE_VALUE:Ljava/lang/Class;

.field public static final NUMBER_VALUE:Ljava/lang/Class;

.field public static final OBJECT_VALUE:Ljava/lang/Class;

.field public static final STRING_VALUE:Ljava/lang/Class;

.field public static final URL_VALUE:Ljava/lang/Class;

.field static synthetic array$Ljava$io$File:Ljava/lang/Class;

.field static synthetic class$java$io$File:Ljava/lang/Class;

.field static synthetic class$java$io$FileInputStream:Ljava/lang/Class;

.field static synthetic class$java$lang$Class:Ljava/lang/Class;

.field static synthetic class$java$lang$Number:Ljava/lang/Class;

.field static synthetic class$java$lang$Object:Ljava/lang/Class;

.field static synthetic class$java$lang$String:Ljava/lang/Class;

.field static synthetic class$java$net$URL:Ljava/lang/Class;

.field static synthetic class$java$util$Date:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 58
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$String:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string v0, "java.lang.String"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_0

    :cond_0
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$String:Ljava/lang/Class;

    :goto_0
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->STRING_VALUE:Ljava/lang/Class;

    .line 61
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string v0, "java.lang.Object"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_1

    :cond_1
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Object:Ljava/lang/Class;

    :goto_1
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->OBJECT_VALUE:Ljava/lang/Class;

    .line 64
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Number:Ljava/lang/Class;

    if-nez v0, :cond_2

    const-string v0, "java.lang.Number"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Number:Ljava/lang/Class;

    goto :goto_2

    :cond_2
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Number:Ljava/lang/Class;

    :goto_2
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->NUMBER_VALUE:Ljava/lang/Class;

    .line 67
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$util$Date:Ljava/lang/Class;

    if-nez v0, :cond_3

    const-string v0, "java.util.Date"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$util$Date:Ljava/lang/Class;

    goto :goto_3

    :cond_3
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$util$Date:Ljava/lang/Class;

    :goto_3
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->DATE_VALUE:Ljava/lang/Class;

    .line 70
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Class:Ljava/lang/Class;

    if-nez v0, :cond_4

    const-string v0, "java.lang.Class"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Class:Ljava/lang/Class;

    goto :goto_4

    :cond_4
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$lang$Class:Ljava/lang/Class;

    :goto_4
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->CLASS_VALUE:Ljava/lang/Class;

    .line 77
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$io$FileInputStream:Ljava/lang/Class;

    if-nez v0, :cond_5

    const-string v0, "java.io.FileInputStream"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$io$FileInputStream:Ljava/lang/Class;

    goto :goto_5

    :cond_5
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$io$FileInputStream:Ljava/lang/Class;

    :goto_5
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->EXISTING_FILE_VALUE:Ljava/lang/Class;

    .line 80
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$io$File:Ljava/lang/Class;

    if-nez v0, :cond_6

    const-string v0, "java.io.File"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$io$File:Ljava/lang/Class;

    goto :goto_6

    :cond_6
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$io$File:Ljava/lang/Class;

    :goto_6
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->FILE_VALUE:Ljava/lang/Class;

    .line 83
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->array$Ljava$io$File:Ljava/lang/Class;

    if-nez v0, :cond_7

    const-string v0, "[Ljava.io.File;"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->array$Ljava$io$File:Ljava/lang/Class;

    goto :goto_7

    :cond_7
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->array$Ljava$io$File:Ljava/lang/Class;

    :goto_7
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->FILES_VALUE:Ljava/lang/Class;

    .line 86
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$net$URL:Ljava/lang/Class;

    if-nez v0, :cond_8

    const-string v0, "java.net.URL"

    invoke-static {v0}, Lorg/apache/commons/cli/PatternOptionBuilder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$net$URL:Ljava/lang/Class;

    goto :goto_8

    :cond_8
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->class$java$net$URL:Ljava/lang/Class;

    :goto_8
    sput-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->URL_VALUE:Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .line 58
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method public static getValueClass(C)Ljava/lang/Object;
    .locals 1
    .param p0, "ch"    # C

    .line 96
    sparse-switch p0, :sswitch_data_0

    .line 118
    const/4 v0, 0x0

    return-object v0

    .line 99
    :sswitch_0
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->OBJECT_VALUE:Ljava/lang/Class;

    return-object v0

    .line 111
    :sswitch_1
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->FILE_VALUE:Ljava/lang/Class;

    return-object v0

    .line 109
    :sswitch_2
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->EXISTING_FILE_VALUE:Ljava/lang/Class;

    return-object v0

    .line 101
    :sswitch_3
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->STRING_VALUE:Ljava/lang/Class;

    return-object v0

    .line 115
    :sswitch_4
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->URL_VALUE:Ljava/lang/Class;

    return-object v0

    .line 105
    :sswitch_5
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->CLASS_VALUE:Ljava/lang/Class;

    return-object v0

    .line 113
    :sswitch_6
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->FILES_VALUE:Ljava/lang/Class;

    return-object v0

    .line 103
    :sswitch_7
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->NUMBER_VALUE:Ljava/lang/Class;

    return-object v0

    .line 107
    :sswitch_8
    sget-object v0, Lorg/apache/commons/cli/PatternOptionBuilder;->DATE_VALUE:Ljava/lang/Class;

    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x23 -> :sswitch_8
        0x25 -> :sswitch_7
        0x2a -> :sswitch_6
        0x2b -> :sswitch_5
        0x2f -> :sswitch_4
        0x3a -> :sswitch_3
        0x3c -> :sswitch_2
        0x3e -> :sswitch_1
        0x40 -> :sswitch_0
    .end sparse-switch
.end method

.method public static isValueCode(C)Z
    .locals 1
    .param p0, "ch"    # C

    .line 130
    const/16 v0, 0x40

    if-eq p0, v0, :cond_1

    const/16 v0, 0x3a

    if-eq p0, v0, :cond_1

    const/16 v0, 0x25

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2b

    if-eq p0, v0, :cond_1

    const/16 v0, 0x23

    if-eq p0, v0, :cond_1

    const/16 v0, 0x3c

    if-eq p0, v0, :cond_1

    const/16 v0, 0x3e

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2a

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2f

    if-eq p0, v0, :cond_1

    const/16 v0, 0x21

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static parsePattern(Ljava/lang/String;)Lorg/apache/commons/cli/Options;
    .locals 10
    .param p0, "pattern"    # Ljava/lang/String;

    .line 150
    const/16 v0, 0x20

    .line 151
    .local v0, "opt":C
    const/4 v1, 0x0

    .line 152
    .local v1, "required":Z
    const/4 v2, 0x0

    .line 154
    .local v2, "type":Ljava/lang/Object;
    new-instance v3, Lorg/apache/commons/cli/Options;

    invoke-direct {v3}, Lorg/apache/commons/cli/Options;-><init>()V

    .line 156
    .local v3, "options":Lorg/apache/commons/cli/Options;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x0

    const/16 v7, 0x20

    const/4 v8, 0x1

    if-ge v4, v5, :cond_4

    .line 158
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 162
    .local v5, "ch":C
    invoke-static {v5}, Lorg/apache/commons/cli/PatternOptionBuilder;->isValueCode(C)Z

    move-result v9

    if-nez v9, :cond_2

    .line 164
    if-eq v0, v7, :cond_1

    .line 166
    if-eqz v2, :cond_0

    move v6, v8

    :cond_0
    invoke-static {v6}, Lorg/apache/commons/cli/OptionBuilder;->hasArg(Z)Lorg/apache/commons/cli/OptionBuilder;

    .line 167
    invoke-static {v1}, Lorg/apache/commons/cli/OptionBuilder;->isRequired(Z)Lorg/apache/commons/cli/OptionBuilder;

    .line 168
    invoke-static {v2}, Lorg/apache/commons/cli/OptionBuilder;->withType(Ljava/lang/Object;)Lorg/apache/commons/cli/OptionBuilder;

    .line 171
    invoke-static {v0}, Lorg/apache/commons/cli/OptionBuilder;->create(C)Lorg/apache/commons/cli/Option;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/apache/commons/cli/Options;->addOption(Lorg/apache/commons/cli/Option;)Lorg/apache/commons/cli/Options;

    .line 172
    const/4 v1, 0x0

    .line 173
    const/4 v2, 0x0

    .line 174
    const/16 v0, 0x20

    .line 177
    :cond_1
    move v0, v5

    goto :goto_1

    .line 179
    :cond_2
    const/16 v6, 0x21

    if-ne v5, v6, :cond_3

    .line 181
    const/4 v1, 0x1

    goto :goto_1

    .line 185
    :cond_3
    invoke-static {v5}, Lorg/apache/commons/cli/PatternOptionBuilder;->getValueClass(C)Ljava/lang/Object;

    move-result-object v2

    .line 156
    .end local v5    # "ch":C
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 189
    .end local v4    # "i":I
    :cond_4
    if-eq v0, v7, :cond_6

    .line 191
    if-eqz v2, :cond_5

    move v6, v8

    :cond_5
    invoke-static {v6}, Lorg/apache/commons/cli/OptionBuilder;->hasArg(Z)Lorg/apache/commons/cli/OptionBuilder;

    .line 192
    invoke-static {v1}, Lorg/apache/commons/cli/OptionBuilder;->isRequired(Z)Lorg/apache/commons/cli/OptionBuilder;

    .line 193
    invoke-static {v2}, Lorg/apache/commons/cli/OptionBuilder;->withType(Ljava/lang/Object;)Lorg/apache/commons/cli/OptionBuilder;

    .line 196
    invoke-static {v0}, Lorg/apache/commons/cli/OptionBuilder;->create(C)Lorg/apache/commons/cli/Option;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/commons/cli/Options;->addOption(Lorg/apache/commons/cli/Option;)Lorg/apache/commons/cli/Options;

    .line 199
    :cond_6
    return-object v3
.end method
