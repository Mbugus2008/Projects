.class final Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;
.super Lcom/facebook/stetho/inspector/helper/ThreadBoundProxy;
.source "AndroidDocumentProvider.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/DocumentProvider;
.implements Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;
    }
.end annotation


# static fields
.field private static final INSPECT_HOVER_COLOR:I = 0x404040ff

.field private static final INSPECT_OVERLAY_COLOR:I = 0x40ffffff

.field private static final REPORT_CHANGED_INTERVAL_MS:J = 0x3e8L


# instance fields
.field private final mApplication:Landroid/app/Application;

.field private final mDescriptorMap:Lcom/facebook/stetho/inspector/elements/DescriptorMap;

.field private final mDocumentRoot:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentRoot;

.field private final mHighlighter:Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;

.field private final mHighlightingBoundsRect:Landroid/graphics/Rect;

.field private final mHitRect:Landroid/graphics/Rect;

.field private final mInspectModeHandler:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

.field private mIsReportChangesTimerPosted:Z

.field private mListener:Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mReportChangesTimer:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/app/Application;Ljava/util/List;Lcom/facebook/stetho/common/ThreadBound;)V
    .locals 4
    .param p1, "application"    # Landroid/app/Application;
    .param p3, "enforcer"    # Lcom/facebook/stetho/common/ThreadBound;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Ljava/util/List<",
            "Lcom/facebook/stetho/inspector/elements/DescriptorProvider;",
            ">;",
            "Lcom/facebook/stetho/common/ThreadBound;",
            ")V"
        }
    .end annotation

    .line 80
    .local p2, "descriptorProviders":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/stetho/inspector/elements/DescriptorProvider;>;"
    invoke-direct {p0, p3}, Lcom/facebook/stetho/inspector/helper/ThreadBoundProxy;-><init>(Lcom/facebook/stetho/common/ThreadBound;)V

    .line 46
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHighlightingBoundsRect:Landroid/graphics/Rect;

    .line 47
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHitRect:Landroid/graphics/Rect;

    .line 62
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mIsReportChangesTimerPosted:Z

    .line 63
    new-instance v0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$1;

    invoke-direct {v0, p0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$1;-><init>(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mReportChangesTimer:Ljava/lang/Runnable;

    .line 82
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Application;

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mApplication:Landroid/app/Application;

    .line 83
    new-instance v0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentRoot;

    invoke-direct {v0, p1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentRoot;-><init>(Landroid/app/Application;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mDocumentRoot:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentRoot;

    .line 85
    new-instance v0, Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;-><init>()V

    .line 86
    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->beginInit()Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    move-result-object v0

    const-class v1, Landroid/app/Activity;

    new-instance v2, Lcom/facebook/stetho/inspector/elements/android/ActivityDescriptor;

    invoke-direct {v2}, Lcom/facebook/stetho/inspector/elements/android/ActivityDescriptor;-><init>()V

    .line 87
    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->registerDescriptor(Ljava/lang/Class;Lcom/facebook/stetho/inspector/elements/Descriptor;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    move-result-object v0

    const-class v1, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentRoot;

    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mDocumentRoot:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentRoot;

    .line 88
    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->registerDescriptor(Ljava/lang/Class;Lcom/facebook/stetho/inspector/elements/Descriptor;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    move-result-object v0

    const-class v1, Landroid/app/Application;

    new-instance v2, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;

    invoke-direct {v2}, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;-><init>()V

    .line 89
    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->registerDescriptor(Ljava/lang/Class;Lcom/facebook/stetho/inspector/elements/Descriptor;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    move-result-object v0

    const-class v1, Landroid/app/Dialog;

    new-instance v2, Lcom/facebook/stetho/inspector/elements/android/DialogDescriptor;

    invoke-direct {v2}, Lcom/facebook/stetho/inspector/elements/android/DialogDescriptor;-><init>()V

    .line 90
    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->registerDescriptor(Ljava/lang/Class;Lcom/facebook/stetho/inspector/elements/Descriptor;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    move-result-object v0

    const-class v1, Ljava/lang/Object;

    new-instance v2, Lcom/facebook/stetho/inspector/elements/ObjectDescriptor;

    invoke-direct {v2}, Lcom/facebook/stetho/inspector/elements/ObjectDescriptor;-><init>()V

    .line 91
    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->registerDescriptor(Ljava/lang/Class;Lcom/facebook/stetho/inspector/elements/Descriptor;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    move-result-object v0

    const-class v1, Landroid/widget/TextView;

    new-instance v2, Lcom/facebook/stetho/inspector/elements/android/TextViewDescriptor;

    invoke-direct {v2}, Lcom/facebook/stetho/inspector/elements/android/TextViewDescriptor;-><init>()V

    .line 92
    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->registerDescriptor(Ljava/lang/Class;Lcom/facebook/stetho/inspector/elements/Descriptor;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    move-result-object v0

    const-class v1, Landroid/view/View;

    new-instance v2, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;

    invoke-direct {v2}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;-><init>()V

    .line 93
    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->registerDescriptor(Ljava/lang/Class;Lcom/facebook/stetho/inspector/elements/Descriptor;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    move-result-object v0

    const-class v1, Landroid/view/ViewGroup;

    new-instance v2, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;

    invoke-direct {v2}, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;-><init>()V

    .line 94
    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->registerDescriptor(Ljava/lang/Class;Lcom/facebook/stetho/inspector/elements/Descriptor;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    move-result-object v0

    const-class v1, Landroid/view/Window;

    new-instance v2, Lcom/facebook/stetho/inspector/elements/android/WindowDescriptor;

    invoke-direct {v2}, Lcom/facebook/stetho/inspector/elements/android/WindowDescriptor;-><init>()V

    .line 95
    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->registerDescriptor(Ljava/lang/Class;Lcom/facebook/stetho/inspector/elements/Descriptor;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mDescriptorMap:Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    .line 97
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mDescriptorMap:Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->register(Lcom/facebook/stetho/inspector/elements/DescriptorMap;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    .line 98
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mDescriptorMap:Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;->register(Lcom/facebook/stetho/inspector/elements/DescriptorMap;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    .line 100
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "size":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 101
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/inspector/elements/DescriptorProvider;

    .line 102
    .local v2, "descriptorProvider":Lcom/facebook/stetho/inspector/elements/DescriptorProvider;
    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mDescriptorMap:Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    invoke-interface {v2, v3}, Lcom/facebook/stetho/inspector/elements/DescriptorProvider;->registerDescriptor(Lcom/facebook/stetho/inspector/elements/DescriptorRegistrar;)V

    .line 100
    .end local v2    # "descriptorProvider":Lcom/facebook/stetho/inspector/elements/DescriptorProvider;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 105
    .end local v0    # "i":I
    .end local v1    # "size":I
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mDescriptorMap:Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    invoke-virtual {v0, p0}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->setHost(Lcom/facebook/stetho/inspector/elements/Descriptor$Host;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->endInit()Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    .line 107
    invoke-static {}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;->newInstance()Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHighlighter:Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;

    .line 108
    new-instance v0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;-><init>(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$1;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mInspectModeHandler:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

    .line 109
    return-void
.end method

.method static synthetic access$002(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;
    .param p1, "x1"    # Z

    .line 41
    iput-boolean p1, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mIsReportChangesTimerPosted:Z

    return p1
.end method

.method static synthetic access$100(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;)Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;

    .line 41
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mListener:Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;

    return-object v0
.end method

.method static synthetic access$300(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;)Landroid/app/Application;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;

    .line 41
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mApplication:Landroid/app/Application;

    return-object v0
.end method

.method static synthetic access$500(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 0
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;
    .param p1, "x1"    # Lcom/facebook/stetho/common/Accumulator;

    .line 41
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->getWindows(Lcom/facebook/stetho/common/Accumulator;)V

    return-void
.end method

.method static synthetic access$600(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;)Landroid/graphics/Rect;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;

    .line 41
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHitRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$700(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;)Landroid/graphics/Rect;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;

    .line 41
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHighlightingBoundsRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$800(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;)Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;

    .line 41
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHighlighter:Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;

    return-object v0
.end method

.method private getWindows(Lcom/facebook/stetho/common/Accumulator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Landroid/view/Window;",
            ">;)V"
        }
    .end annotation

    .line 249
    .local p1, "accumulator":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Landroid/view/Window;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mApplication:Landroid/app/Application;

    invoke-virtual {p0, v0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->getDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/Descriptor;

    move-result-object v0

    .line 250
    .local v0, "appDescriptor":Lcom/facebook/stetho/inspector/elements/Descriptor;
    if-eqz v0, :cond_0

    .line 251
    new-instance v1, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$2;

    invoke-direct {v1, p0, p1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$2;-><init>(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;Lcom/facebook/stetho/common/Accumulator;)V

    .line 267
    .local v1, "elementAccumulator":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mApplication:Landroid/app/Application;

    invoke-virtual {v0, v2, v1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V

    .line 269
    .end local v1    # "elementAccumulator":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    :cond_0
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 113
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->verifyThreadAccess()V

    .line 115
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHighlighter:Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;->clearHighlight()V

    .line 116
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mInspectModeHandler:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;->disable()V

    .line 117
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mReportChangesTimer:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 118
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mIsReportChangesTimerPosted:Z

    .line 119
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mListener:Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;

    .line 120
    return-void
.end method

.method public getDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/Descriptor;
    .locals 2
    .param p1, "element"    # Ljava/lang/Object;

    .line 203
    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mDescriptorMap:Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->get(Ljava/lang/Class;)Lcom/facebook/stetho/inspector/elements/Descriptor;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getHighlightableDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;
    .locals 6
    .param p1, "element"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 224
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 225
    return-object v0

    .line 228
    :cond_0
    const/4 v1, 0x0

    .line 229
    .local v1, "highlightableDescriptor":Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 230
    .local v2, "theClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    .line 231
    .local v3, "lastDescriptor":Lcom/facebook/stetho/inspector/elements/Descriptor;
    :goto_0
    if-nez v1, :cond_3

    if-eqz v2, :cond_3

    .line 232
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mDescriptorMap:Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    invoke-virtual {v4, v2}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->get(Ljava/lang/Class;)Lcom/facebook/stetho/inspector/elements/Descriptor;

    move-result-object v4

    .line 233
    .local v4, "descriptor":Lcom/facebook/stetho/inspector/elements/Descriptor;
    if-nez v4, :cond_1

    .line 234
    return-object v0

    .line 237
    :cond_1
    if-eq v4, v3, :cond_2

    instance-of v5, v4, Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;

    if-eqz v5, :cond_2

    .line 238
    move-object v1, v4

    check-cast v1, Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;

    .line 241
    :cond_2
    move-object v3, v4

    .line 242
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    .line 243
    .end local v4    # "descriptor":Lcom/facebook/stetho/inspector/elements/Descriptor;
    goto :goto_0

    .line 245
    :cond_3
    return-object v1
.end method

.method public getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 144
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->verifyThreadAccess()V

    .line 145
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->getDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/Descriptor;

    move-result-object v0

    return-object v0
.end method

.method public getRootElement()Ljava/lang/Object;
    .locals 1

    .line 138
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->verifyThreadAccess()V

    .line 139
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mDocumentRoot:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentRoot;

    return-object v0
.end method

.method public hideHighlight()V
    .locals 1

    .line 174
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->verifyThreadAccess()V

    .line 176
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHighlighter:Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;->clearHighlight()V

    .line 177
    return-void
.end method

.method public highlightElement(Ljava/lang/Object;I)V
    .locals 4
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "color"    # I

    .line 150
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->verifyThreadAccess()V

    .line 152
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->getHighlightableDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;

    move-result-object v0

    .line 153
    .local v0, "descriptor":Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;
    if-nez v0, :cond_0

    .line 154
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHighlighter:Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;

    invoke-virtual {v1}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;->clearHighlight()V

    .line 155
    return-void

    .line 158
    :cond_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHighlightingBoundsRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->setEmpty()V

    .line 159
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHighlightingBoundsRect:Landroid/graphics/Rect;

    .line 160
    invoke-interface {v0, p1, v1}, Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;->getViewAndBoundsForHighlighting(Ljava/lang/Object;Landroid/graphics/Rect;)Landroid/view/View;

    move-result-object v1

    .line 161
    .local v1, "highlightingView":Landroid/view/View;
    if-nez v1, :cond_1

    .line 162
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHighlighter:Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;

    invoke-virtual {v2}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;->clearHighlight()V

    .line 163
    return-void

    .line 166
    :cond_1
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHighlighter:Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;

    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mHighlightingBoundsRect:Landroid/graphics/Rect;

    invoke-virtual {v2, v1, v3, p2}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;->setHighlightedView(Landroid/view/View;Landroid/graphics/Rect;I)V

    .line 170
    return-void
.end method

.method public onAttributeModified(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .line 208
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mListener:Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;

    if-eqz v0, :cond_0

    .line 209
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mListener:Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;->onAttributeModified(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    :cond_0
    return-void
.end method

.method public onAttributeRemoved(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;

    .line 215
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mListener:Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;

    if-eqz v0, :cond_0

    .line 216
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mListener:Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;

    invoke-interface {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;->onAttributeRemoved(Ljava/lang/Object;Ljava/lang/String;)V

    .line 218
    :cond_0
    return-void
.end method

.method public setAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "text"    # Ljava/lang/String;

    .line 192
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->verifyThreadAccess()V

    .line 194
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mDescriptorMap:Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->get(Ljava/lang/Class;)Lcom/facebook/stetho/inspector/elements/Descriptor;

    move-result-object v0

    .line 195
    .local v0, "descriptor":Lcom/facebook/stetho/inspector/elements/Descriptor;
    if-eqz v0, :cond_0

    .line 196
    invoke-virtual {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Descriptor;->setAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V

    .line 198
    :cond_0
    return-void
.end method

.method public setInspectModeEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 181
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->verifyThreadAccess()V

    .line 183
    if-eqz p1, :cond_0

    .line 184
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mInspectModeHandler:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;->enable()V

    goto :goto_0

    .line 186
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mInspectModeHandler:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;->disable()V

    .line 188
    :goto_0
    return-void
.end method

.method public setListener(Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;)V
    .locals 3
    .param p1, "listener"    # Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;

    .line 124
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->verifyThreadAccess()V

    .line 126
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mListener:Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;

    .line 127
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mListener:Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mIsReportChangesTimerPosted:Z

    if-eqz v0, :cond_0

    .line 128
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mIsReportChangesTimerPosted:Z

    .line 129
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mReportChangesTimer:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mListener:Lcom/facebook/stetho/inspector/elements/DocumentProviderListener;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mIsReportChangesTimerPosted:Z

    if-nez v0, :cond_1

    .line 131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mIsReportChangesTimerPosted:Z

    .line 132
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->mReportChangesTimer:Ljava/lang/Runnable;

    const-wide/16 v1, 0x3e8

    invoke-virtual {p0, v0, v1, v2}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->postDelayed(Ljava/lang/Runnable;J)V

    .line 134
    :cond_1
    :goto_0
    return-void
.end method
