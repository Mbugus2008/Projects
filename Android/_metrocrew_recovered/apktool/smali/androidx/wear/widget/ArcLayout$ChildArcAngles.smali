.class Landroidx/wear/widget/ArcLayout$ChildArcAngles;
.super Ljava/lang/Object;
.source "ArcLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/ArcLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ChildArcAngles"
.end annotation


# instance fields
.field public actualChildAngle:F

.field public leftMarginAsAngle:F

.field public rightMarginAsAngle:F


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 867
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroidx/wear/widget/ArcLayout$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/wear/widget/ArcLayout$1;

    .line 867
    invoke-direct {p0}, Landroidx/wear/widget/ArcLayout$ChildArcAngles;-><init>()V

    return-void
.end method


# virtual methods
.method public getTotalAngle()F
    .locals 2

    .line 873
    iget v0, p0, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->leftMarginAsAngle:F

    iget v1, p0, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->rightMarginAsAngle:F

    add-float/2addr v0, v1

    iget v1, p0, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->actualChildAngle:F

    add-float/2addr v0, v1

    return v0
.end method
