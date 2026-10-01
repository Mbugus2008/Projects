.class Lcom/google/gson/internal/bind/EnumTypeAdapter;
.super Lcom/google/gson/TypeAdapter;
.source "EnumTypeAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Enum<",
        "TT;>;>",
        "Lcom/google/gson/TypeAdapter<",
        "TT;>;"
    }
.end annotation


# static fields
.field static final FACTORY:Lcom/google/gson/TypeAdapterFactory;


# instance fields
.field private final constantToName:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "TT;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final nameToConstant:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation
.end field

.field private final stringToConstant:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    new-instance v0, Lcom/google/gson/internal/bind/EnumTypeAdapter$1;

    invoke-direct {v0}, Lcom/google/gson/internal/bind/EnumTypeAdapter$1;-><init>()V

    sput-object v0, Lcom/google/gson/internal/bind/EnumTypeAdapter;->FACTORY:Lcom/google/gson/TypeAdapterFactory;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Class;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .line 57
    .local p0, "this":Lcom/google/gson/internal/bind/EnumTypeAdapter;, "Lcom/google/gson/internal/bind/EnumTypeAdapter<TT;>;"
    .local p1, "classOfT":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    move-object/from16 v1, p0

    invoke-direct {v1}, Lcom/google/gson/TypeAdapter;-><init>()V

    .line 53
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, v1, Lcom/google/gson/internal/bind/EnumTypeAdapter;->nameToConstant:Ljava/util/Map;

    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, v1, Lcom/google/gson/internal/bind/EnumTypeAdapter;->stringToConstant:Ljava/util/Map;

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, v1, Lcom/google/gson/internal/bind/EnumTypeAdapter;->constantToName:Ljava/util/Map;

    .line 61
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 62
    .local v0, "fields":[Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    .line 63
    .local v2, "constantCount":I
    array-length v3, v0

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_1

    aget-object v6, v0, v5

    .line 65
    .local v6, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v6}, Ljava/lang/reflect/Field;->isEnumConstant()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 66
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "constantCount":I
    .local v7, "constantCount":I
    aput-object v6, v0, v2

    move v2, v7

    .line 63
    .end local v6    # "f":Ljava/lang/reflect/Field;
    .end local v7    # "constantCount":I
    .restart local v2    # "constantCount":I
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 72
    :cond_1
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/reflect/Field;

    .line 74
    .end local v0    # "fields":[Ljava/lang/reflect/Field;
    .local v3, "fields":[Ljava/lang/reflect/Field;
    const/4 v0, 0x1

    invoke-static {v3, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible([Ljava/lang/reflect/AccessibleObject;Z)V

    .line 76
    array-length v0, v3

    move v5, v4

    :goto_1
    if-ge v5, v0, :cond_3

    aget-object v6, v3, v5

    .line 78
    .local v6, "constantField":Ljava/lang/reflect/Field;
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Enum;

    .line 79
    .local v7, "constant":Ljava/lang/Enum;, "TT;"
    invoke-virtual {v7}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v8

    .line 80
    .local v8, "name":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v9

    .line 82
    .local v9, "toStringVal":Ljava/lang/String;
    const-class v10, Lcom/google/gson/annotations/SerializedName;

    invoke-virtual {v6, v10}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v10

    check-cast v10, Lcom/google/gson/annotations/SerializedName;

    .line 83
    .local v10, "annotation":Lcom/google/gson/annotations/SerializedName;
    if-eqz v10, :cond_2

    .line 84
    invoke-interface {v10}, Lcom/google/gson/annotations/SerializedName;->value()Ljava/lang/String;

    move-result-object v11

    move-object v8, v11

    .line 85
    invoke-interface {v10}, Lcom/google/gson/annotations/SerializedName;->alternate()[Ljava/lang/String;

    move-result-object v11

    array-length v12, v11

    move v13, v4

    :goto_2
    if-ge v13, v12, :cond_2

    aget-object v14, v11, v13

    .line 86
    .local v14, "alternate":Ljava/lang/String;
    iget-object v15, v1, Lcom/google/gson/internal/bind/EnumTypeAdapter;->nameToConstant:Ljava/util/Map;

    invoke-interface {v15, v14, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    nop

    .end local v14    # "alternate":Ljava/lang/String;
    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    .line 89
    :cond_2
    iget-object v11, v1, Lcom/google/gson/internal/bind/EnumTypeAdapter;->nameToConstant:Ljava/util/Map;

    invoke-interface {v11, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    iget-object v11, v1, Lcom/google/gson/internal/bind/EnumTypeAdapter;->stringToConstant:Ljava/util/Map;

    invoke-interface {v11, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    iget-object v11, v1, Lcom/google/gson/internal/bind/EnumTypeAdapter;->constantToName:Ljava/util/Map;

    invoke-interface {v11, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    nop

    .end local v6    # "constantField":Ljava/lang/reflect/Field;
    .end local v7    # "constant":Ljava/lang/Enum;, "TT;"
    .end local v8    # "name":Ljava/lang/String;
    .end local v9    # "toStringVal":Ljava/lang/String;
    .end local v10    # "annotation":Lcom/google/gson/annotations/SerializedName;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 97
    .end local v2    # "constantCount":I
    .end local v3    # "fields":[Ljava/lang/reflect/Field;
    :cond_3
    nop

    .line 98
    return-void

    .line 93
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method synthetic constructor <init>(Ljava/lang/Class;Lcom/google/gson/internal/bind/EnumTypeAdapter$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Class;
    .param p2, "x1"    # Lcom/google/gson/internal/bind/EnumTypeAdapter$1;

    .line 35
    .local p0, "this":Lcom/google/gson/internal/bind/EnumTypeAdapter;, "Lcom/google/gson/internal/bind/EnumTypeAdapter<TT;>;"
    invoke-direct {p0, p1}, Lcom/google/gson/internal/bind/EnumTypeAdapter;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public read(Lcom/google/gson/stream/JsonReader;)Ljava/lang/Enum;
    .locals 3
    .param p1, "in"    # Lcom/google/gson/stream/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/stream/JsonReader;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    .local p0, "this":Lcom/google/gson/internal/bind/EnumTypeAdapter;, "Lcom/google/gson/internal/bind/EnumTypeAdapter<TT;>;"
    invoke-virtual {p1}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/google/gson/stream/JsonToken;->NULL:Lcom/google/gson/stream/JsonToken;

    if-ne v0, v1, :cond_0

    .line 103
    invoke-virtual {p1}, Lcom/google/gson/stream/JsonReader;->nextNull()V

    .line 104
    const/4 v0, 0x0

    return-object v0

    .line 106
    :cond_0
    invoke-virtual {p1}, Lcom/google/gson/stream/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v0

    .line 107
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lcom/google/gson/internal/bind/EnumTypeAdapter;->nameToConstant:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Enum;

    .line 109
    .local v1, "constant":Ljava/lang/Enum;, "TT;"
    if-nez v1, :cond_1

    iget-object v2, p0, Lcom/google/gson/internal/bind/EnumTypeAdapter;->stringToConstant:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Enum;

    goto :goto_0

    :cond_1
    move-object v2, v1

    :goto_0
    return-object v2
.end method

.method public bridge synthetic read(Lcom/google/gson/stream/JsonReader;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 35
    .local p0, "this":Lcom/google/gson/internal/bind/EnumTypeAdapter;, "Lcom/google/gson/internal/bind/EnumTypeAdapter<TT;>;"
    invoke-virtual {p0, p1}, Lcom/google/gson/internal/bind/EnumTypeAdapter;->read(Lcom/google/gson/stream/JsonReader;)Ljava/lang/Enum;

    move-result-object p1

    return-object p1
.end method

.method public write(Lcom/google/gson/stream/JsonWriter;Ljava/lang/Enum;)V
    .locals 1
    .param p1, "out"    # Lcom/google/gson/stream/JsonWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/stream/JsonWriter;",
            "TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 114
    .local p0, "this":Lcom/google/gson/internal/bind/EnumTypeAdapter;, "Lcom/google/gson/internal/bind/EnumTypeAdapter<TT;>;"
    .local p2, "value":Ljava/lang/Enum;, "TT;"
    if-nez p2, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/gson/internal/bind/EnumTypeAdapter;->constantToName:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_0
    invoke-virtual {p1, v0}, Lcom/google/gson/stream/JsonWriter;->value(Ljava/lang/String;)Lcom/google/gson/stream/JsonWriter;

    .line 115
    return-void
.end method

.method public bridge synthetic write(Lcom/google/gson/stream/JsonWriter;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 35
    .local p0, "this":Lcom/google/gson/internal/bind/EnumTypeAdapter;, "Lcom/google/gson/internal/bind/EnumTypeAdapter<TT;>;"
    check-cast p2, Ljava/lang/Enum;

    invoke-virtual {p0, p1, p2}, Lcom/google/gson/internal/bind/EnumTypeAdapter;->write(Lcom/google/gson/stream/JsonWriter;Ljava/lang/Enum;)V

    return-void
.end method
