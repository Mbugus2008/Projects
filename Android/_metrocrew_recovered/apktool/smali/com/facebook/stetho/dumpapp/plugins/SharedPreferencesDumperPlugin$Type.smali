.class final enum Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;
.super Ljava/lang/Enum;
.source "SharedPreferencesDumperPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

.field public static final enum BOOLEAN:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

.field public static final enum FLOAT:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

.field public static final enum INT:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

.field public static final enum LONG:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

.field public static final enum SET:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

.field public static final enum STRING:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 205
    new-instance v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    const/4 v1, 0x0

    const-string v2, "boolean"

    const-string v3, "BOOLEAN"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->BOOLEAN:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    .line 206
    new-instance v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    const/4 v1, 0x1

    const-string v2, "int"

    const-string v3, "INT"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->INT:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    .line 207
    new-instance v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    const/4 v1, 0x2

    const-string v2, "long"

    const-string v3, "LONG"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->LONG:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    .line 208
    new-instance v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    const/4 v1, 0x3

    const-string v2, "float"

    const-string v3, "FLOAT"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->FLOAT:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    .line 209
    new-instance v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    const/4 v1, 0x4

    const-string/jumbo v2, "string"

    const-string v3, "STRING"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->STRING:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    .line 210
    new-instance v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    const/4 v1, 0x5

    const-string/jumbo v2, "set"

    const-string v3, "SET"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->SET:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    .line 204
    sget-object v4, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->BOOLEAN:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    sget-object v5, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->INT:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    sget-object v6, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->LONG:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    sget-object v7, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->FLOAT:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    sget-object v8, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->STRING:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    sget-object v9, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->SET:Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    filled-new-array/range {v4 .. v9}, [Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    move-result-object v0

    sput-object v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->$VALUES:[Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 214
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 215
    iput-object p3, p0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->name:Ljava/lang/String;

    .line 216
    return-void
.end method

.method public static appendNamesList(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .locals 6
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "separator"    # Ljava/lang/String;

    .line 228
    const/4 v0, 0x1

    .line 229
    .local v0, "isFirst":Z
    invoke-static {}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->values()[Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 230
    .local v4, "type":Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;
    if-eqz v0, :cond_0

    .line 231
    const/4 v0, 0x0

    goto :goto_1

    .line 233
    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    :goto_1
    iget-object v5, v4, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->name:Ljava/lang/String;

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .end local v4    # "type":Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 237
    :cond_1
    return-object p0
.end method

.method public static of(Ljava/lang/String;)Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;
    .locals 5
    .param p0, "name"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 219
    invoke-static {}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->values()[Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 220
    .local v3, "type":Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;
    iget-object v4, v3, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->name:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 221
    return-object v3

    .line 219
    .end local v3    # "type":Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 224
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 204
    const-class v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    return-object v0
.end method

.method public static values()[Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;
    .locals 1

    .line 204
    sget-object v0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->$VALUES:[Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    invoke-virtual {v0}, [Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    return-object v0
.end method
