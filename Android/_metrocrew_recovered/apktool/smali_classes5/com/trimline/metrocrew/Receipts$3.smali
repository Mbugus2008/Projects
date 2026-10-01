.class Lcom/trimline/metrocrew/Receipts$3;
.super Ljava/lang/Object;
.source "Receipts.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/Receipts;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/Receipts;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/Receipts;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/Receipts;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 133
    iput-object p1, p0, Lcom/trimline/metrocrew/Receipts$3;->this$0:Lcom/trimline/metrocrew/Receipts;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "view"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "view",
            "event"
        }
    .end annotation

    .line 136
    const/4 v0, 0x0

    .line 137
    .local v0, "DRAWABLE_LEFT":I
    const/4 v1, 0x1

    .line 138
    .local v1, "DRAWABLE_TOP":I
    const/4 v2, 0x2

    .line 139
    .local v2, "DRAWABLE_RIGHT":I
    const/4 v3, 0x3

    .line 140
    .local v3, "DRAWABLE_BOTTOM":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 141
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    iget-object v6, p0, Lcom/trimline/metrocrew/Receipts$3;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v6, v6, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v6}, Landroid/widget/AutoCompleteTextView;->getRight()I

    move-result v6

    iget-object v7, p0, Lcom/trimline/metrocrew/Receipts$3;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v7, v7, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v7}, Landroid/widget/AutoCompleteTextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v7

    const/4 v8, 0x2

    aget-object v7, v7, v8

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v7

    sub-int/2addr v6, v7

    int-to-float v6, v6

    cmpl-float v4, v4, v6

    if-ltz v4, :cond_0

    .line 142
    iget-object v4, p0, Lcom/trimline/metrocrew/Receipts$3;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v4, v4, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    const-string v6, ""

    invoke-virtual {v4, v6}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    return v5

    .line 146
    :cond_0
    const/4 v4, 0x0

    return v4
.end method
