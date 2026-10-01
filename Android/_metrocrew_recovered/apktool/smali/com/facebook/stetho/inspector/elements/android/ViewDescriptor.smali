.class final Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;
.super Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;
.source "ViewDescriptor.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;,
        Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$MethodBackedCSSProperty;,
        Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$FieldBackedCSSProperty;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<",
        "Landroid/view/View;",
        ">;",
        "Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# static fields
.field private static final ACCESSIBILITY_STYLE_RULE_NAME:Ljava/lang/String; = "Accessibility Properties"

.field private static final ID_NAME:Ljava/lang/String; = "id"

.field private static final NONE_MAPPING:Ljava/lang/String; = "<no mapping>"

.field private static final NONE_VALUE:Ljava/lang/String; = "(none)"

.field private static final VIEW_STYLE_RULE_NAME:Ljava/lang/String; = "<this_view>"

.field private static final sHasSupportNodeInfo:Z


# instance fields
.field private final mMethodInvoker:Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;

.field private volatile mViewProperties:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mWordBoundaryPattern:Ljava/util/regex/Pattern;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 53
    const-string v0, "androidx.core.view.accessibility.AccessibilityNodeInfoCompat"

    invoke-static {v0}, Lcom/facebook/stetho/common/ReflectionUtil;->tryGetClassForName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->sHasSupportNodeInfo:Z

    .line 55
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 125
    new-instance v0, Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;-><init>()V

    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;-><init>(Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;)V

    .line 126
    return-void
.end method

.method public constructor <init>(Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;)V
    .locals 0
    .param p1, "methodInvoker"    # Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;

    .line 128
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;-><init>()V

    .line 129
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mMethodInvoker:Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;

    .line 130
    return-void
.end method

.method private static canFlagsBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z
    .locals 1
    .param p0, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 302
    if-eqz p0, :cond_0

    .line 303
    invoke-interface {p0}, Landroid/view/ViewDebug$ExportedProperty;->flagMapping()[Landroid/view/ViewDebug$FlagToString;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 304
    invoke-interface {p0}, Landroid/view/ViewDebug$ExportedProperty;->flagMapping()[Landroid/view/ViewDebug$FlagToString;

    move-result-object v0

    array-length v0, v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 302
    :goto_0
    return v0
.end method

.method private static canIntBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z
    .locals 1
    .param p0, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 279
    if-eqz p0, :cond_0

    .line 280
    invoke-interface {p0}, Landroid/view/ViewDebug$ExportedProperty;->mapping()[Landroid/view/ViewDebug$IntToString;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 281
    invoke-interface {p0}, Landroid/view/ViewDebug$ExportedProperty;->mapping()[Landroid/view/ViewDebug$IntToString;

    move-result-object v0

    array-length v0, v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 279
    :goto_0
    return v0
.end method

.method private static capitalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .line 504
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isTitleCase(C)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 507
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 508
    .local v1, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toTitleCase(C)C

    move-result v2

    invoke-virtual {v1, v0, v2}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 509
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 505
    .end local v1    # "buffer":Ljava/lang/StringBuilder;
    :cond_1
    :goto_0
    return-object p0
.end method

.method private convertViewPropertyNameToCSSName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "getterName"    # Ljava/lang/String;

    .line 344
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getWordBoundaryPattern()Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v0

    .line 346
    .local v0, "words":[Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 348
    .local v1, "result":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_2

    .line 349
    aget-object v3, v0, v2

    const-string v4, "get"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    aget-object v3, v0, v2

    const-string v4, "m"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 350
    goto :goto_1

    .line 353
    :cond_0
    aget-object v3, v0, v2

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    if-ge v2, v3, :cond_1

    .line 356
    const/16 v3, 0x2d

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 348
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 360
    .end local v2    # "i":I
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getIdAttribute(Landroid/view/View;)Ljava/lang/String;
    .locals 2
    .param p0, "element"    # Landroid/view/View;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 161
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v0

    .line 162
    .local v0, "id":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 163
    const/4 v1, 0x0

    return-object v1

    .line 165
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {p0, v1, v0}, Lcom/facebook/stetho/common/android/ResourcesUtil;->getIdStringQuietly(Ljava/lang/Object;Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getIdStyle(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .locals 4
    .param p1, "element"    # Landroid/view/View;
    .param p2, "styles"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .line 399
    invoke-static {p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getIdAttribute(Landroid/view/View;)Ljava/lang/String;

    move-result-object v0

    .line 401
    .local v0, "id":Ljava/lang/String;
    const/4 v1, 0x0

    const-string v2, "id"

    if-nez v0, :cond_0

    .line 402
    const-string v3, "(none)"

    invoke-interface {p2, v2, v3, v1}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0

    .line 404
    :cond_0
    invoke-interface {p2, v2, v0, v1}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 406
    :goto_0
    return-void
.end method

.method private getStyleFromInteger(Ljava/lang/String;Ljava/lang/Integer;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Integer;
    .param p3, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "styles"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .line 414
    invoke-static {}, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;->getInstance()Lcom/facebook/stetho/inspector/helper/IntegerFormatter;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;->format(Ljava/lang/Integer;Landroid/view/ViewDebug$ExportedProperty;)Ljava/lang/String;

    move-result-object v0

    .line 416
    .local v0, "intValueStr":Ljava/lang/String;
    invoke-static {p3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->canIntBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v1

    const-string v2, ")"

    const-string v3, " ("

    const/4 v4, 0x0

    if-eqz v1, :cond_0

    .line 417
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 419
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3, p3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mapIntToStringUsingAnnotation(ILandroid/view/ViewDebug$ExportedProperty;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 417
    invoke-interface {p4, p1, v1, v4}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0

    .line 421
    :cond_0
    invoke-static {p3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->canFlagsBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 422
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 424
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3, p3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mapFlagsToStringUsingAnnotation(ILandroid/view/ViewDebug$ExportedProperty;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 422
    invoke-interface {p4, p1, v1, v4}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0

    .line 427
    :cond_1
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 431
    .local v1, "defaultValue":Ljava/lang/Boolean;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_2

    .line 432
    invoke-static {p3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->canFlagsBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 433
    invoke-static {p3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->canIntBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 434
    :cond_2
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 436
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-interface {p4, p1, v0, v2}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 438
    .end local v1    # "defaultValue":Ljava/lang/Boolean;
    :goto_0
    return-void
.end method

.method private getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .locals 7
    .param p1, "element"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "styles"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .line 370
    const-string v0, "id"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 371
    invoke-direct {p0, p1, p5}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getIdStyle(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    goto/16 :goto_7

    .line 372
    :cond_0
    instance-of v0, p3, Ljava/lang/Integer;

    if-eqz v0, :cond_1

    .line 373
    move-object v0, p3

    check-cast v0, Ljava/lang/Integer;

    invoke-direct {p0, p2, v0, p4, p5}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromInteger(Ljava/lang/String;Ljava/lang/Integer;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    goto/16 :goto_7

    .line 374
    :cond_1
    instance-of v0, p3, Ljava/lang/Float;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    .line 375
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v3, p3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-nez v3, :cond_2

    goto :goto_0

    :cond_2
    move v1, v2

    :goto_0
    invoke-interface {p5, p2, v0, v1}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_7

    .line 376
    :cond_3
    instance-of v0, p3, Ljava/lang/Boolean;

    if-eqz v0, :cond_4

    .line 377
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p5, p2, v0, v2}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_7

    .line 378
    :cond_4
    instance-of v0, p3, Ljava/lang/Short;

    if-eqz v0, :cond_6

    .line 379
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v3, p3

    check-cast v3, Ljava/lang/Short;

    invoke-virtual {v3}, Ljava/lang/Short;->shortValue()S

    move-result v3

    if-nez v3, :cond_5

    goto :goto_1

    :cond_5
    move v1, v2

    :goto_1
    invoke-interface {p5, p2, v0, v1}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_7

    .line 380
    :cond_6
    instance-of v0, p3, Ljava/lang/Long;

    if-eqz v0, :cond_8

    .line 381
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v3, p3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-nez v3, :cond_7

    goto :goto_2

    :cond_7
    move v1, v2

    :goto_2
    invoke-interface {p5, p2, v0, v1}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_7

    .line 382
    :cond_8
    instance-of v0, p3, Ljava/lang/Double;

    if-eqz v0, :cond_a

    .line 383
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v3, p3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmpl-double v3, v3, v5

    if-nez v3, :cond_9

    goto :goto_3

    :cond_9
    move v1, v2

    :goto_3
    invoke-interface {p5, p2, v0, v1}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_7

    .line 384
    :cond_a
    instance-of v0, p3, Ljava/lang/Byte;

    if-eqz v0, :cond_c

    .line 385
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v3, p3

    check-cast v3, Ljava/lang/Byte;

    invoke-virtual {v3}, Ljava/lang/Byte;->byteValue()B

    move-result v3

    if-nez v3, :cond_b

    goto :goto_4

    :cond_b
    move v1, v2

    :goto_4
    invoke-interface {p5, p2, v0, v1}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_7

    .line 386
    :cond_c
    instance-of v0, p3, Ljava/lang/Character;

    if-eqz v0, :cond_e

    .line 387
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v3, p3

    check-cast v3, Ljava/lang/Character;

    invoke-virtual {v3}, Ljava/lang/Character;->charValue()C

    move-result v3

    if-nez v3, :cond_d

    goto :goto_5

    :cond_d
    move v1, v2

    :goto_5
    invoke-interface {p5, p2, v0, v1}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_7

    .line 388
    :cond_e
    instance-of v0, p3, Ljava/lang/CharSequence;

    if-eqz v0, :cond_10

    .line 389
    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v3, p3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-nez v3, :cond_f

    goto :goto_6

    :cond_f
    move v1, v2

    :goto_6
    invoke-interface {p5, p2, v0, v1}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_7

    .line 391
    :cond_10
    invoke-direct/range {p0 .. p5}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStylesFromObject(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 393
    :goto_7
    return-void
.end method

.method private getStylesFromObject(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .locals 15
    .param p1, "view"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "styles"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .line 446
    move-object/from16 v1, p3

    if-eqz p4, :cond_5

    invoke-interface/range {p4 .. p4}, Landroid/view/ViewDebug$ExportedProperty;->deepExport()Z

    move-result v0

    if-eqz v0, :cond_5

    if-nez v1, :cond_0

    move-object/from16 v4, p2

    goto/16 :goto_6

    .line 450
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 452
    .local v2, "fields":[Ljava/lang/reflect/Field;
    array-length v0, v2

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v0, :cond_4

    aget-object v5, v2, v4

    .line 453
    .local v5, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    .line 454
    .local v6, "modifiers":I
    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 455
    goto/16 :goto_5

    .line 460
    :cond_1
    const/4 v7, 0x1

    :try_start_0
    invoke-virtual {v5, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 461
    invoke-virtual {v5, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v12, v8

    .line 467
    .local v12, "propertyValue":Ljava/lang/Object;
    nop

    .line 469
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    .line 471
    .local v8, "propertyName":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->hashCode()I

    move-result v9

    sparse-switch v9, :sswitch_data_0

    :cond_2
    goto :goto_1

    :sswitch_0
    const-string v7, "bottomMargin"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    move v7, v3

    goto :goto_2

    :sswitch_1
    const-string v7, "leftMargin"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    const/4 v7, 0x2

    goto :goto_2

    :sswitch_2
    const-string/jumbo v9, "topMargin"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    goto :goto_2

    :sswitch_3
    const-string v7, "rightMargin"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    const/4 v7, 0x3

    goto :goto_2

    :goto_1
    const/4 v7, -0x1

    :goto_2
    packed-switch v7, :pswitch_data_0

    .line 485
    invoke-interface/range {p4 .. p4}, Landroid/view/ViewDebug$ExportedProperty;->prefix()Ljava/lang/String;

    move-result-object v7

    .line 486
    .local v7, "annotationPrefix":Ljava/lang/String;
    if-nez v7, :cond_3

    move-object v9, v8

    goto :goto_3

    .line 482
    .end local v7    # "annotationPrefix":Ljava/lang/String;
    :pswitch_0
    const-string v7, "margin-right"

    .line 483
    .end local v8    # "propertyName":Ljava/lang/String;
    .local v7, "propertyName":Ljava/lang/String;
    move-object v11, v7

    goto :goto_4

    .line 479
    .end local v7    # "propertyName":Ljava/lang/String;
    .restart local v8    # "propertyName":Ljava/lang/String;
    :pswitch_1
    const-string v7, "margin-left"

    .line 480
    .end local v8    # "propertyName":Ljava/lang/String;
    .restart local v7    # "propertyName":Ljava/lang/String;
    move-object v11, v7

    goto :goto_4

    .line 476
    .end local v7    # "propertyName":Ljava/lang/String;
    .restart local v8    # "propertyName":Ljava/lang/String;
    :pswitch_2
    const-string v7, "margin-top"

    .line 477
    .end local v8    # "propertyName":Ljava/lang/String;
    .restart local v7    # "propertyName":Ljava/lang/String;
    move-object v11, v7

    goto :goto_4

    .line 473
    .end local v7    # "propertyName":Ljava/lang/String;
    .restart local v8    # "propertyName":Ljava/lang/String;
    :pswitch_3
    const-string v7, "margin-bottom"

    .line 474
    .end local v8    # "propertyName":Ljava/lang/String;
    .restart local v7    # "propertyName":Ljava/lang/String;
    move-object v11, v7

    goto :goto_4

    .line 486
    .local v7, "annotationPrefix":Ljava/lang/String;
    .restart local v8    # "propertyName":Ljava/lang/String;
    :cond_3
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    :goto_3
    invoke-direct {p0, v9}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->convertViewPropertyNameToCSSName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object v11, v8

    .line 491
    .end local v7    # "annotationPrefix":Ljava/lang/String;
    .end local v8    # "propertyName":Ljava/lang/String;
    .local v11, "propertyName":Ljava/lang/String;
    :goto_4
    const-class v7, Landroid/view/ViewDebug$ExportedProperty;

    .line 492
    invoke-virtual {v5, v7}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v7

    move-object v13, v7

    check-cast v13, Landroid/view/ViewDebug$ExportedProperty;

    .line 494
    .local v13, "subAnnotation":Landroid/view/ViewDebug$ExportedProperty;
    move-object v9, p0

    move-object/from16 v10, p1

    move-object/from16 v14, p5

    invoke-direct/range {v9 .. v14}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 452
    .end local v5    # "field":Ljava/lang/reflect/Field;
    .end local v6    # "modifiers":I
    .end local v11    # "propertyName":Ljava/lang/String;
    .end local v12    # "propertyValue":Ljava/lang/Object;
    .end local v13    # "subAnnotation":Landroid/view/ViewDebug$ExportedProperty;
    :goto_5
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 462
    .restart local v5    # "field":Ljava/lang/reflect/Field;
    .restart local v6    # "modifiers":I
    :catch_0
    move-exception v0

    .line 463
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "failed to get property of name: \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v4, p2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "\" of object: "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 465
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 463
    invoke-static {v0, v3}, Lcom/facebook/stetho/common/LogUtil;->e(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 466
    return-void

    .line 501
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v5    # "field":Ljava/lang/reflect/Field;
    .end local v6    # "modifiers":I
    :cond_4
    move-object/from16 v4, p2

    return-void

    .line 446
    .end local v2    # "fields":[Ljava/lang/reflect/Field;
    :cond_5
    move-object/from16 v4, p2

    .line 447
    :goto_6
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x23c1d116 -> :sswitch_3
        -0x18afe09d -> :sswitch_2
        0x72f7b095 -> :sswitch_1
        0x7b0f7fb9 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getViewProperties()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;",
            ">;"
        }
    .end annotation

    .line 79
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mViewProperties:Ljava/util/List;

    if-nez v0, :cond_5

    .line 80
    monitor-enter p0

    .line 81
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mViewProperties:Ljava/util/List;

    if-nez v0, :cond_4

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .local v0, "props":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;>;"
    const-class v1, Landroid/view/View;

    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v5, v1, v4

    .line 85
    .local v5, "method":Ljava/lang/reflect/Method;
    const-class v6, Landroid/view/ViewDebug$ExportedProperty;

    .line 86
    invoke-virtual {v5, v6}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Landroid/view/ViewDebug$ExportedProperty;

    .line 89
    .local v6, "annotation":Landroid/view/ViewDebug$ExportedProperty;
    if-eqz v6, :cond_0

    .line 90
    new-instance v7, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$MethodBackedCSSProperty;

    .line 92
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->convertViewPropertyNameToCSSName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, p0, v5, v8, v6}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$MethodBackedCSSProperty;-><init>(Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;Ljava/lang/reflect/Method;Ljava/lang/String;Landroid/view/ViewDebug$ExportedProperty;)V

    .line 90
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .end local v5    # "method":Ljava/lang/reflect/Method;
    .end local v6    # "annotation":Landroid/view/ViewDebug$ExportedProperty;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 97
    :cond_1
    const-class v1, Landroid/view/View;

    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    array-length v2, v1

    :goto_1
    if-ge v3, v2, :cond_3

    aget-object v4, v1, v3

    .line 98
    .local v4, "field":Ljava/lang/reflect/Field;
    const-class v5, Landroid/view/ViewDebug$ExportedProperty;

    .line 99
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Landroid/view/ViewDebug$ExportedProperty;

    .line 102
    .local v5, "annotation":Landroid/view/ViewDebug$ExportedProperty;
    if-eqz v5, :cond_2

    .line 103
    new-instance v6, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$FieldBackedCSSProperty;

    .line 105
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->convertViewPropertyNameToCSSName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, p0, v4, v7, v5}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$FieldBackedCSSProperty;-><init>(Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;Ljava/lang/reflect/Field;Ljava/lang/String;Landroid/view/ViewDebug$ExportedProperty;)V

    .line 103
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .end local v4    # "field":Ljava/lang/reflect/Field;
    .end local v5    # "annotation":Landroid/view/ViewDebug$ExportedProperty;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 110
    :cond_3
    new-instance v1, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$1;

    invoke-direct {v1, p0}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$1;-><init>(Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 116
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mViewProperties:Ljava/util/List;

    .line 118
    .end local v0    # "props":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;>;"
    :cond_4
    monitor-exit p0

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 121
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mViewProperties:Ljava/util/List;

    return-object v0
.end method

.method private getWordBoundaryPattern()Ljava/util/regex/Pattern;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mWordBoundaryPattern:Ljava/util/regex/Pattern;

    if-nez v0, :cond_0

    .line 72
    const-string v0, "(?<=\\p{Lower})(?=\\p{Upper})"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mWordBoundaryPattern:Ljava/util/regex/Pattern;

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mWordBoundaryPattern:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method private static mapFlagsToStringUsingAnnotation(ILandroid/view/ViewDebug$ExportedProperty;)Ljava/lang/String;
    .locals 10
    .param p0, "value"    # I
    .param p1, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 310
    invoke-static {p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->canFlagsBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 314
    const/4 v0, 0x0

    .line 315
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 317
    .local v1, "atLeastOneFlag":Z
    invoke-interface {p1}, Landroid/view/ViewDebug$ExportedProperty;->flagMapping()[Landroid/view/ViewDebug$FlagToString;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_4

    aget-object v6, v2, v5

    .line 318
    .local v6, "flagToString":Landroid/view/ViewDebug$FlagToString;
    invoke-interface {v6}, Landroid/view/ViewDebug$FlagToString;->outputIf()Z

    move-result v7

    invoke-interface {v6}, Landroid/view/ViewDebug$FlagToString;->mask()I

    move-result v8

    and-int/2addr v8, p0

    invoke-interface {v6}, Landroid/view/ViewDebug$FlagToString;->equals()I

    move-result v9

    if-ne v8, v9, :cond_0

    const/4 v8, 0x1

    goto :goto_1

    :cond_0
    move v8, v4

    :goto_1
    if-ne v7, v8, :cond_3

    .line 319
    if-nez v0, :cond_1

    .line 320
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object v0, v7

    .line 323
    :cond_1
    if-eqz v1, :cond_2

    .line 324
    const-string v7, " | "

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    :cond_2
    invoke-interface {v6}, Landroid/view/ViewDebug$FlagToString;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    const/4 v1, 0x1

    .line 317
    .end local v6    # "flagToString":Landroid/view/ViewDebug$FlagToString;
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 332
    :cond_4
    if-eqz v1, :cond_5

    .line 333
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 335
    :cond_5
    const-string v2, "<no mapping>"

    return-object v2

    .line 311
    .end local v0    # "stringBuilder":Ljava/lang/StringBuilder;
    .end local v1    # "atLeastOneFlag":Z
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot map using this annotation"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static mapIntToStringUsingAnnotation(ILandroid/view/ViewDebug$ExportedProperty;)Ljava/lang/String;
    .locals 5
    .param p0, "value"    # I
    .param p1, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 287
    invoke-static {p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->canIntBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 291
    invoke-interface {p1}, Landroid/view/ViewDebug$ExportedProperty;->mapping()[Landroid/view/ViewDebug$IntToString;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 292
    .local v3, "map":Landroid/view/ViewDebug$IntToString;
    invoke-interface {v3}, Landroid/view/ViewDebug$IntToString;->from()I

    move-result v4

    if-ne v4, p0, :cond_0

    .line 293
    invoke-interface {v3}, Landroid/view/ViewDebug$IntToString;->to()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 291
    .end local v3    # "map":Landroid/view/ViewDebug$IntToString;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 298
    :cond_1
    const-string v0, "<no mapping>"

    return-object v0

    .line 288
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot map using this annotation"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getElementToHighlightAtPosition(Landroid/view/View;IILandroid/graphics/Rect;)Ljava/lang/Object;
    .locals 3
    .param p1, "element"    # Landroid/view/View;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "bounds"    # Landroid/graphics/Rect;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 177
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p4, v2, v2, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 178
    return-object p1
.end method

.method public bridge synthetic getElementToHighlightAtPosition(Ljava/lang/Object;IILandroid/graphics/Rect;)Ljava/lang/Object;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 40
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getElementToHighlightAtPosition(Landroid/view/View;IILandroid/graphics/Rect;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getViewAndBoundsForHighlighting(Landroid/view/View;Landroid/graphics/Rect;)Landroid/view/View;
    .locals 0
    .param p1, "element"    # Landroid/view/View;
    .param p2, "bounds"    # Landroid/graphics/Rect;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 171
    return-object p1
.end method

.method public bridge synthetic getViewAndBoundsForHighlighting(Ljava/lang/Object;Landroid/graphics/Rect;)Landroid/view/View;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 40
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getViewAndBoundsForHighlighting(Landroid/view/View;Landroid/graphics/Rect;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method protected onGetAttributes(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V
    .locals 2
    .param p1, "element"    # Landroid/view/View;
    .param p2, "attributes"    # Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;

    .line 143
    invoke-static {p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getIdAttribute(Landroid/view/View;)Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, "id":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 145
    const-string v1, "id"

    invoke-interface {p2, v1, v0}, Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;->store(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    :cond_0
    return-void
.end method

.method protected bridge synthetic onGetAttributes(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V
    .locals 0

    .line 40
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->onGetAttributes(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V

    return-void
.end method

.method protected onGetComputedStyles(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;)V
    .locals 2
    .param p1, "element"    # Landroid/view/View;
    .param p2, "styles"    # Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;

    .line 272
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "left"

    invoke-interface {p2, v1, v0}, Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "top"

    invoke-interface {p2, v1, v0}, Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "right"

    invoke-interface {p2, v1, v0}, Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "bottom"

    invoke-interface {p2, v1, v0}, Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    return-void
.end method

.method protected bridge synthetic onGetComputedStyles(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;)V
    .locals 0

    .line 40
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->onGetComputedStyles(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;)V

    return-void
.end method

.method protected onGetNodeName(Landroid/view/View;)Ljava/lang/String;
    .locals 3
    .param p1, "element"    # Landroid/view/View;

    .line 134
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "className":Ljava/lang/String;
    nop

    .line 138
    const-string v1, "android.widget."

    invoke-static {v0, v1}, Lcom/facebook/stetho/common/StringUtil;->removePrefix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 137
    const-string v2, "android.view."

    invoke-static {v0, v2, v1}, Lcom/facebook/stetho/common/StringUtil;->removePrefix(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 136
    return-object v1
.end method

.method protected bridge synthetic onGetNodeName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 40
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->onGetNodeName(Landroid/view/View;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected onGetStyleRuleNames(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;)V
    .locals 2
    .param p1, "element"    # Landroid/view/View;
    .param p2, "accumulator"    # Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;

    .line 183
    const-string v0, "<this_view>"

    const/4 v1, 0x0

    invoke-interface {p2, v0, v1}, Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;->store(Ljava/lang/String;Z)V

    .line 184
    sget-boolean v0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->sHasSupportNodeInfo:Z

    if-eqz v0, :cond_0

    .line 185
    const-string v0, "Accessibility Properties"

    invoke-interface {p2, v0, v1}, Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;->store(Ljava/lang/String;Z)V

    .line 187
    :cond_0
    return-void
.end method

.method protected bridge synthetic onGetStyleRuleNames(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;)V
    .locals 0

    .line 40
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->onGetStyleRuleNames(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;)V

    return-void
.end method

.method protected onGetStyles(Landroid/view/View;Ljava/lang/String;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .locals 15
    .param p1, "element"    # Landroid/view/View;
    .param p2, "ruleName"    # Ljava/lang/String;
    .param p3, "accumulator"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .line 191
    move-object/from16 v1, p2

    const-string v0, "<this_view>"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 192
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getViewProperties()Ljava/util/List;

    move-result-object v2

    .line 193
    .local v2, "properties":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    move v4, v0

    .end local v0    # "i":I
    .local v3, "size":I
    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_2

    .line 194
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;

    .line 196
    .local v5, "property":Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;
    nop

    .line 198
    :try_start_0
    invoke-virtual {v5}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;->getCSSName()Ljava/lang/String;

    move-result-object v8

    .line 199
    move-object/from16 v10, p1

    invoke-virtual {v5, v10}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;->getValue(Landroid/view/View;)Ljava/lang/Object;

    move-result-object v9

    .line 200
    invoke-virtual {v5}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;->getAnnotation()Landroid/view/ViewDebug$ExportedProperty;

    move-result-object v10

    .line 196
    move-object v6, p0

    move-object/from16 v7, p1

    move-object/from16 v11, p3

    invoke-direct/range {v6 .. v11}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 209
    goto :goto_2

    .line 202
    :catch_0
    move-exception v0

    .line 203
    .local v0, "e":Ljava/lang/Exception;
    instance-of v6, v0, Ljava/lang/IllegalAccessException;

    if-nez v6, :cond_1

    instance-of v6, v0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v6, :cond_0

    goto :goto_1

    .line 207
    :cond_0
    invoke-static {v0}, Lcom/facebook/stetho/common/ExceptionUtil;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v6

    throw v6

    .line 204
    :cond_1
    :goto_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "failed to get style property "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;->getCSSName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " of element= "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 205
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 204
    invoke-static {v0, v6}, Lcom/facebook/stetho/common/LogUtil;->e(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 193
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v5    # "property":Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .end local v2    # "properties":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;>;"
    .end local v3    # "size":I
    .end local v4    # "i":I
    :cond_2
    goto/16 :goto_3

    .line 211
    :cond_3
    const-string v0, "Accessibility Properties"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 212
    sget-boolean v0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->sHasSupportNodeInfo:Z

    if-eqz v0, :cond_6

    .line 213
    invoke-static/range {p1 .. p1}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->getIgnored(Landroid/view/View;)Z

    move-result v0

    .line 214
    .local v0, "ignored":Z
    nop

    .line 217
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    .line 214
    const-string v11, "ignored"

    const/4 v13, 0x0

    move-object v9, p0

    move-object/from16 v10, p1

    move-object/from16 v14, p3

    invoke-direct/range {v9 .. v14}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 221
    if-eqz v0, :cond_4

    .line 222
    nop

    .line 225
    invoke-static/range {p1 .. p1}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->getIgnoredReasons(Landroid/view/View;)Ljava/lang/String;

    move-result-object v12

    .line 222
    const-string v11, "ignored-reasons"

    const/4 v13, 0x0

    move-object v9, p0

    move-object/from16 v10, p1

    move-object/from16 v14, p3

    invoke-direct/range {v9 .. v14}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 230
    :cond_4
    nop

    .line 233
    xor-int/lit8 v2, v0, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    .line 230
    const-string v11, "focusable"

    const/4 v13, 0x0

    move-object v9, p0

    move-object/from16 v10, p1

    move-object/from16 v14, p3

    invoke-direct/range {v9 .. v14}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 237
    if-nez v0, :cond_6

    .line 238
    nop

    .line 241
    invoke-static/range {p1 .. p1}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->getFocusableReasons(Landroid/view/View;)Ljava/lang/String;

    move-result-object v12

    .line 238
    const-string v11, "focusable-reasons"

    const/4 v13, 0x0

    move-object v9, p0

    move-object/from16 v10, p1

    move-object/from16 v14, p3

    invoke-direct/range {v9 .. v14}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 245
    nop

    .line 248
    invoke-static/range {p1 .. p1}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->getIsAccessibilityFocused(Landroid/view/View;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    .line 245
    const-string v11, "focused"

    invoke-direct/range {v9 .. v14}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 252
    nop

    .line 255
    invoke-static/range {p1 .. p1}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->getDescription(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object v12

    .line 252
    const-string v11, "description"

    invoke-direct/range {v9 .. v14}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 259
    nop

    .line 262
    invoke-static/range {p1 .. p1}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->getActions(Landroid/view/View;)Ljava/lang/String;

    move-result-object v12

    .line 259
    const-string v11, "actions"

    invoke-direct/range {v9 .. v14}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    goto :goto_4

    .line 211
    .end local v0    # "ignored":Z
    :cond_5
    :goto_3
    nop

    .line 268
    :cond_6
    :goto_4
    return-void
.end method

.method protected bridge synthetic onGetStyles(Ljava/lang/Object;Ljava/lang/String;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .locals 0

    .line 40
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->onGetStyles(Landroid/view/View;Ljava/lang/String;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    return-void
.end method

.method protected onSetAttributesAsText(Landroid/view/View;Ljava/lang/String;)V
    .locals 6
    .param p1, "element"    # Landroid/view/View;
    .param p2, "text"    # Ljava/lang/String;

    .line 151
    invoke-static {p2}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->parseSetAttributesAsTextArg(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 152
    .local v0, "attributeToValueMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 153
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "set"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->capitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 154
    .local v3, "methodName":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 155
    .local v4, "propertyValue":Ljava/lang/String;
    iget-object v5, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mMethodInvoker:Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;

    invoke-virtual {v5, p1, v3, v4}, Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;->invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "methodName":Ljava/lang/String;
    .end local v4    # "propertyValue":Ljava/lang/String;
    goto :goto_0

    .line 157
    :cond_0
    return-void
.end method

.method protected bridge synthetic onSetAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    .line 40
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->onSetAttributesAsText(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method
