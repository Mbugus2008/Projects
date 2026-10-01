.class public Landroidx/core/view/NestedScrollingChildHelper;
.super Ljava/lang/Object;
.source "NestedScrollingChildHelper.java"


# instance fields
.field private mIsNestedScrollingEnabled:Z

.field private mNestedScrollingParentNonTouch:Landroid/view/ViewParent;

.field private mNestedScrollingParentTouch:Landroid/view/ViewParent;

.field private mTempNestedScrollConsumed:[I

.field private final mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    .line 58
    return-void
.end method

.method private dispatchNestedScrollInternal(IIII[II[I)Z
    .locals 13
    .param p1, "dxConsumed"    # I
    .param p2, "dyConsumed"    # I
    .param p3, "dxUnconsumed"    # I
    .param p4, "dyUnconsumed"    # I
    .param p5, "offsetInWindow"    # [I
    .param p6, "type"    # I
    .param p7, "consumed"    # [I

    .line 239
    move-object/from16 v0, p5

    invoke-virtual {p0}, Landroidx/core/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_6

    .line 240
    move/from16 v9, p6

    invoke-direct {p0, v9}, Landroidx/core/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v3

    .line 241
    .local v3, "parent":Landroid/view/ViewParent;
    if-nez v3, :cond_0

    .line 242
    return v2

    .line 245
    :cond_0
    const/4 v1, 0x1

    if-nez p1, :cond_2

    if-nez p2, :cond_2

    if-nez p3, :cond_2

    if-eqz p4, :cond_1

    goto :goto_0

    .line 269
    :cond_1
    if-eqz v0, :cond_6

    .line 271
    aput v2, v0, v2

    .line 272
    aput v2, v0, v1

    goto :goto_3

    .line 246
    :cond_2
    :goto_0
    const/4 v4, 0x0

    .line 247
    .local v4, "startX":I
    const/4 v5, 0x0

    .line 248
    .local v5, "startY":I
    if-eqz v0, :cond_3

    .line 249
    iget-object v6, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v6, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 250
    aget v4, v0, v2

    .line 251
    aget v5, v0, v1

    move v11, v4

    move v12, v5

    goto :goto_1

    .line 248
    :cond_3
    move v11, v4

    move v12, v5

    .line 254
    .end local v4    # "startX":I
    .end local v5    # "startY":I
    .local v11, "startX":I
    .local v12, "startY":I
    :goto_1
    if-nez p7, :cond_4

    .line 255
    invoke-direct {p0}, Landroidx/core/view/NestedScrollingChildHelper;->getTempNestedScrollConsumed()[I

    move-result-object v4

    .line 256
    .end local p7    # "consumed":[I
    .local v4, "consumed":[I
    aput v2, v4, v2

    .line 257
    aput v2, v4, v1

    move-object v10, v4

    goto :goto_2

    .line 254
    .end local v4    # "consumed":[I
    .restart local p7    # "consumed":[I
    :cond_4
    move-object/from16 v10, p7

    .line 260
    .end local p7    # "consumed":[I
    .local v10, "consumed":[I
    :goto_2
    iget-object v4, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    move v5, p1

    move v6, p2

    move/from16 v7, p3

    move/from16 v8, p4

    invoke-static/range {v3 .. v10}, Landroidx/core/view/ViewParentCompat;->onNestedScroll(Landroid/view/ViewParent;Landroid/view/View;IIIII[I)V

    .line 263
    if-eqz v0, :cond_5

    .line 264
    iget-object v4, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v4, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 265
    aget v4, v0, v2

    sub-int/2addr v4, v11

    aput v4, v0, v2

    .line 266
    aget v2, v0, v1

    sub-int/2addr v2, v12

    aput v2, v0, v1

    .line 268
    :cond_5
    return v1

    .line 275
    .end local v3    # "parent":Landroid/view/ViewParent;
    .end local v10    # "consumed":[I
    .end local v11    # "startX":I
    .end local v12    # "startY":I
    .restart local p7    # "consumed":[I
    :cond_6
    :goto_3
    return v2
.end method

.method private getNestedScrollingParentForType(I)Landroid/view/ViewParent;
    .locals 1
    .param p1, "type"    # I

    .line 405
    packed-switch p1, :pswitch_data_0

    .line 411
    const/4 v0, 0x0

    return-object v0

    .line 409
    :pswitch_0
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mNestedScrollingParentNonTouch:Landroid/view/ViewParent;

    return-object v0

    .line 407
    :pswitch_1
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mNestedScrollingParentTouch:Landroid/view/ViewParent;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getTempNestedScrollConsumed()[I
    .locals 1

    .line 426
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mTempNestedScrollConsumed:[I

    if-nez v0, :cond_0

    .line 427
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mTempNestedScrollConsumed:[I

    .line 429
    :cond_0
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mTempNestedScrollConsumed:[I

    return-object v0
.end method

.method private setNestedScrollingParentForType(ILandroid/view/ViewParent;)V
    .locals 0
    .param p1, "type"    # I
    .param p2, "p"    # Landroid/view/ViewParent;

    .line 415
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 420
    :pswitch_0
    iput-object p2, p0, Landroidx/core/view/NestedScrollingChildHelper;->mNestedScrollingParentNonTouch:Landroid/view/ViewParent;

    goto :goto_0

    .line 417
    :pswitch_1
    iput-object p2, p0, Landroidx/core/view/NestedScrollingChildHelper;->mNestedScrollingParentTouch:Landroid/view/ViewParent;

    .line 418
    nop

    .line 423
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public dispatchNestedFling(FFZ)Z
    .locals 2
    .param p1, "velocityX"    # F
    .param p2, "velocityY"    # F
    .param p3, "consumed"    # Z

    .line 349
    invoke-virtual {p0}, Landroidx/core/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 350
    invoke-direct {p0, v1}, Landroidx/core/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v0

    .line 351
    .local v0, "parent":Landroid/view/ViewParent;
    if-eqz v0, :cond_0

    .line 352
    iget-object v1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v1, p1, p2, p3}, Landroidx/core/view/ViewParentCompat;->onNestedFling(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z

    move-result v1

    return v1

    .line 356
    .end local v0    # "parent":Landroid/view/ViewParent;
    :cond_0
    return v1
.end method

.method public dispatchNestedPreFling(FF)Z
    .locals 2
    .param p1, "velocityX"    # F
    .param p2, "velocityY"    # F

    .line 369
    invoke-virtual {p0}, Landroidx/core/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 370
    invoke-direct {p0, v1}, Landroidx/core/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v0

    .line 371
    .local v0, "parent":Landroid/view/ViewParent;
    if-eqz v0, :cond_0

    .line 372
    iget-object v1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v1, p1, p2}, Landroidx/core/view/ViewParentCompat;->onNestedPreFling(Landroid/view/ViewParent;Landroid/view/View;FF)Z

    move-result v1

    return v1

    .line 376
    .end local v0    # "parent":Landroid/view/ViewParent;
    :cond_0
    return v1
.end method

.method public dispatchNestedPreScroll(II[I[I)Z
    .locals 6
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "consumed"    # [I
    .param p4, "offsetInWindow"    # [I

    .line 289
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    .end local p1    # "dx":I
    .end local p2    # "dy":I
    .end local p3    # "consumed":[I
    .end local p4    # "offsetInWindow":[I
    .local v1, "dx":I
    .local v2, "dy":I
    .local v3, "consumed":[I
    .local v4, "offsetInWindow":[I
    invoke-virtual/range {v0 .. v5}, Landroidx/core/view/NestedScrollingChildHelper;->dispatchNestedPreScroll(II[I[II)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedPreScroll(II[I[II)Z
    .locals 10
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "consumed"    # [I
    .param p4, "offsetInWindow"    # [I
    .param p5, "type"    # I

    .line 303
    invoke-virtual {p0}, Landroidx/core/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    .line 304
    invoke-direct {p0, p5}, Landroidx/core/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v2

    .line 305
    .local v2, "parent":Landroid/view/ViewParent;
    if-nez v2, :cond_0

    .line 306
    return v1

    .line 309
    :cond_0
    const/4 v0, 0x1

    if-nez p1, :cond_3

    if-eqz p2, :cond_1

    goto :goto_0

    .line 331
    :cond_1
    if-eqz p4, :cond_2

    .line 332
    aput v1, p4, v1

    .line 333
    aput v1, p4, v0

    move v4, p1

    move v5, p2

    move v7, p5

    goto :goto_3

    .line 331
    :cond_2
    move v4, p1

    move v5, p2

    move v7, p5

    goto :goto_3

    .line 310
    :cond_3
    :goto_0
    const/4 v3, 0x0

    .line 311
    .local v3, "startX":I
    const/4 v4, 0x0

    .line 312
    .local v4, "startY":I
    if-eqz p4, :cond_4

    .line 313
    iget-object v5, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v5, p4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 314
    aget v3, p4, v1

    .line 315
    aget v4, p4, v0

    move v8, v3

    move v9, v4

    goto :goto_1

    .line 312
    :cond_4
    move v8, v3

    move v9, v4

    .line 318
    .end local v3    # "startX":I
    .end local v4    # "startY":I
    .local v8, "startX":I
    .local v9, "startY":I
    :goto_1
    if-nez p3, :cond_5

    .line 319
    invoke-direct {p0}, Landroidx/core/view/NestedScrollingChildHelper;->getTempNestedScrollConsumed()[I

    move-result-object p3

    move-object v6, p3

    goto :goto_2

    .line 318
    :cond_5
    move-object v6, p3

    .line 321
    .end local p3    # "consumed":[I
    .local v6, "consumed":[I
    :goto_2
    aput v1, v6, v1

    .line 322
    aput v1, v6, v0

    .line 323
    iget-object v3, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    move v4, p1

    move v5, p2

    move v7, p5

    .end local p1    # "dx":I
    .end local p2    # "dy":I
    .end local p5    # "type":I
    .local v4, "dx":I
    .local v5, "dy":I
    .local v7, "type":I
    invoke-static/range {v2 .. v7}, Landroidx/core/view/ViewParentCompat;->onNestedPreScroll(Landroid/view/ViewParent;Landroid/view/View;II[II)V

    .line 325
    if-eqz p4, :cond_6

    .line 326
    iget-object p1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {p1, p4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 327
    aget p1, p4, v1

    sub-int/2addr p1, v8

    aput p1, p4, v1

    .line 328
    aget p1, p4, v0

    sub-int/2addr p1, v9

    aput p1, p4, v0

    .line 330
    :cond_6
    aget p1, v6, v1

    if-nez p1, :cond_7

    aget p1, v6, v0

    if-eqz p1, :cond_8

    :cond_7
    move v1, v0

    :cond_8
    return v1

    .line 303
    .end local v2    # "parent":Landroid/view/ViewParent;
    .end local v4    # "dx":I
    .end local v5    # "dy":I
    .end local v6    # "consumed":[I
    .end local v7    # "type":I
    .end local v8    # "startX":I
    .end local v9    # "startY":I
    .restart local p1    # "dx":I
    .restart local p2    # "dy":I
    .restart local p3    # "consumed":[I
    .restart local p5    # "type":I
    :cond_9
    move v4, p1

    move v5, p2

    move v7, p5

    .line 336
    .end local p1    # "dx":I
    .end local p2    # "dy":I
    .end local p5    # "type":I
    .restart local v4    # "dx":I
    .restart local v5    # "dy":I
    .restart local v7    # "type":I
    :goto_3
    return v1
.end method

.method public dispatchNestedScroll(IIII[II[I)V
    .locals 0
    .param p1, "dxConsumed"    # I
    .param p2, "dyConsumed"    # I
    .param p3, "dxUnconsumed"    # I
    .param p4, "dyUnconsumed"    # I
    .param p5, "offsetInWindow"    # [I
    .param p6, "type"    # I
    .param p7, "consumed"    # [I

    .line 232
    invoke-direct/range {p0 .. p7}, Landroidx/core/view/NestedScrollingChildHelper;->dispatchNestedScrollInternal(IIII[II[I)Z

    .line 234
    return-void
.end method

.method public dispatchNestedScroll(IIII[I)Z
    .locals 8
    .param p1, "dxConsumed"    # I
    .param p2, "dyConsumed"    # I
    .param p3, "dxUnconsumed"    # I
    .param p4, "dyUnconsumed"    # I
    .param p5, "offsetInWindow"    # [I

    .line 205
    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    .end local p1    # "dxConsumed":I
    .end local p2    # "dyConsumed":I
    .end local p3    # "dxUnconsumed":I
    .end local p4    # "dyUnconsumed":I
    .end local p5    # "offsetInWindow":[I
    .local v1, "dxConsumed":I
    .local v2, "dyConsumed":I
    .local v3, "dxUnconsumed":I
    .local v4, "dyUnconsumed":I
    .local v5, "offsetInWindow":[I
    invoke-direct/range {v0 .. v7}, Landroidx/core/view/NestedScrollingChildHelper;->dispatchNestedScrollInternal(IIII[II[I)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedScroll(IIII[II)Z
    .locals 8
    .param p1, "dxConsumed"    # I
    .param p2, "dyConsumed"    # I
    .param p3, "dxUnconsumed"    # I
    .param p4, "dyUnconsumed"    # I
    .param p5, "offsetInWindow"    # [I
    .param p6, "type"    # I

    .line 219
    const/4 v7, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move v6, p6

    .end local p1    # "dxConsumed":I
    .end local p2    # "dyConsumed":I
    .end local p3    # "dxUnconsumed":I
    .end local p4    # "dyUnconsumed":I
    .end local p5    # "offsetInWindow":[I
    .end local p6    # "type":I
    .local v1, "dxConsumed":I
    .local v2, "dyConsumed":I
    .local v3, "dxUnconsumed":I
    .local v4, "dyUnconsumed":I
    .local v5, "offsetInWindow":[I
    .local v6, "type":I
    invoke-direct/range {v0 .. v7}, Landroidx/core/view/NestedScrollingChildHelper;->dispatchNestedScrollInternal(IIII[II[I)Z

    move-result p1

    return p1
.end method

.method public hasNestedScrollingParent()Z
    .locals 1

    .line 100
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/core/view/NestedScrollingChildHelper;->hasNestedScrollingParent(I)Z

    move-result v0

    return v0
.end method

.method public hasNestedScrollingParent(I)Z
    .locals 1
    .param p1, "type"    # I

    .line 114
    invoke-direct {p0, p1}, Landroidx/core/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isNestedScrollingEnabled()Z
    .locals 1

    .line 86
    iget-boolean v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mIsNestedScrollingEnabled:Z

    return v0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 388
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0}, Landroidx/core/view/ViewCompat;->stopNestedScroll(Landroid/view/View;)V

    .line 389
    return-void
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .locals 1
    .param p1, "child"    # Landroid/view/View;

    .line 401
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0}, Landroidx/core/view/ViewCompat;->stopNestedScroll(Landroid/view/View;)V

    .line 402
    return-void
.end method

.method public setNestedScrollingEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 70
    iget-boolean v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mIsNestedScrollingEnabled:Z

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0}, Landroidx/core/view/ViewCompat;->stopNestedScroll(Landroid/view/View;)V

    .line 73
    :cond_0
    iput-boolean p1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mIsNestedScrollingEnabled:Z

    .line 74
    return-void
.end method

.method public startNestedScroll(I)Z
    .locals 1
    .param p1, "axes"    # I

    .line 129
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/core/view/NestedScrollingChildHelper;->startNestedScroll(II)Z

    move-result v0

    return v0
.end method

.method public startNestedScroll(II)Z
    .locals 4
    .param p1, "axes"    # I
    .param p2, "type"    # I

    .line 146
    invoke-virtual {p0, p2}, Landroidx/core/view/NestedScrollingChildHelper;->hasNestedScrollingParent(I)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 148
    return v1

    .line 150
    :cond_0
    invoke-virtual {p0}, Landroidx/core/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 151
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 152
    .local v0, "p":Landroid/view/ViewParent;
    iget-object v2, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    .line 153
    .local v2, "child":Landroid/view/View;
    :goto_0
    if-eqz v0, :cond_3

    .line 154
    iget-object v3, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v2, v3, p1, p2}, Landroidx/core/view/ViewParentCompat;->onStartNestedScroll(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 155
    invoke-direct {p0, p2, v0}, Landroidx/core/view/NestedScrollingChildHelper;->setNestedScrollingParentForType(ILandroid/view/ViewParent;)V

    .line 156
    iget-object v3, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v2, v3, p1, p2}, Landroidx/core/view/ViewParentCompat;->onNestedScrollAccepted(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)V

    .line 157
    return v1

    .line 159
    :cond_1
    instance-of v3, v0, Landroid/view/View;

    if-eqz v3, :cond_2

    .line 160
    move-object v2, v0

    check-cast v2, Landroid/view/View;

    .line 162
    :cond_2
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_0

    .line 165
    .end local v0    # "p":Landroid/view/ViewParent;
    .end local v2    # "child":Landroid/view/View;
    :cond_3
    const/4 v0, 0x0

    return v0
.end method

.method public stopNestedScroll()V
    .locals 1

    .line 176
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/core/view/NestedScrollingChildHelper;->stopNestedScroll(I)V

    .line 177
    return-void
.end method

.method public stopNestedScroll(I)V
    .locals 2
    .param p1, "type"    # I

    .line 187
    invoke-direct {p0, p1}, Landroidx/core/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v0

    .line 188
    .local v0, "parent":Landroid/view/ViewParent;
    if-eqz v0, :cond_0

    .line 189
    iget-object v1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v1, p1}, Landroidx/core/view/ViewParentCompat;->onStopNestedScroll(Landroid/view/ViewParent;Landroid/view/View;I)V

    .line 190
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Landroidx/core/view/NestedScrollingChildHelper;->setNestedScrollingParentForType(ILandroid/view/ViewParent;)V

    .line 192
    :cond_0
    return-void
.end method
