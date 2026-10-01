.class public final Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;
.super Ljava/lang/Object;
.source "WearableActionDrawerMenu.java"

# interfaces
.implements Landroid/view/MenuItem;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/drawer/WearableActionDrawerMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "WearableActionDrawerMenuItem"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;
    }
.end annotation


# instance fields
.field private mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

.field private final mContext:Landroid/content/Context;

.field private mIconDrawable:Landroid/graphics/drawable/Drawable;

.field private final mId:I

.field private final mItemChangedListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;

.field private mTitle:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Landroid/content/Context;ILjava/lang/CharSequence;Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # I
    .param p3, "title"    # Ljava/lang/CharSequence;
    .param p4, "listener"    # Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;

    .line 239
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 240
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mContext:Landroid/content/Context;

    .line 241
    iput p2, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mId:I

    .line 242
    iput-object p3, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mTitle:Ljava/lang/CharSequence;

    .line 243
    iput-object p4, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mItemChangedListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;

    .line 244
    return-void
.end method


# virtual methods
.method public collapseActionView()Z
    .locals 2

    .line 447
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "collapseActionView is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public expandActionView()Z
    .locals 2

    .line 442
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "expandActionView is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getActionProvider()Landroid/view/ActionProvider;
    .locals 1

    .line 437
    const/4 v0, 0x0

    return-object v0
.end method

.method public getActionView()Landroid/view/View;
    .locals 1

    .line 427
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAlphabeticShortcut()C
    .locals 1

    .line 347
    const/4 v0, 0x0

    return v0
.end method

.method public getGroupId()I
    .locals 1

    .line 297
    const/4 v0, 0x0

    return v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 286
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getIntent()Landroid/content/Intent;
    .locals 1

    .line 322
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId()I
    .locals 1

    .line 248
    iget v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mId:I

    return v0
.end method

.method public getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .locals 1

    .line 402
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNumericShortcut()C
    .locals 1

    .line 337
    const/4 v0, 0x0

    return v0
.end method

.method public getOrder()I
    .locals 1

    .line 302
    const/4 v0, 0x0

    return v0
.end method

.method public getSubMenu()Landroid/view/SubMenu;
    .locals 1

    .line 397
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 1

    .line 267
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitleCondensed()Ljava/lang/CharSequence;
    .locals 1

    .line 312
    const/4 v0, 0x0

    return-object v0
.end method

.method public hasSubMenu()Z
    .locals 1

    .line 392
    const/4 v0, 0x0

    return v0
.end method

.method invoke()Z
    .locals 1

    .line 466
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    invoke-interface {v0, p0}, Landroid/view/MenuItem$OnMenuItemClickListener;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isActionViewExpanded()Z
    .locals 2

    .line 452
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "isActionViewExpanded is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isCheckable()Z
    .locals 1

    .line 357
    const/4 v0, 0x0

    return v0
.end method

.method public isChecked()Z
    .locals 1

    .line 367
    const/4 v0, 0x0

    return v0
.end method

.method public isEnabled()Z
    .locals 1

    .line 387
    const/4 v0, 0x0

    return v0
.end method

.method public isVisible()Z
    .locals 1

    .line 377
    const/4 v0, 0x0

    return v0
.end method

.method public setActionProvider(Landroid/view/ActionProvider;)Landroid/view/MenuItem;
    .locals 2
    .param p1, "actionProvider"    # Landroid/view/ActionProvider;

    .line 432
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "setActionProvider is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setActionView(I)Landroid/view/MenuItem;
    .locals 2
    .param p1, "resId"    # I

    .line 422
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "setActionView is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setActionView(Landroid/view/View;)Landroid/view/MenuItem;
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 417
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "setActionView is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAlphabeticShortcut(C)Landroid/view/MenuItem;
    .locals 0
    .param p1, "alphaChar"    # C

    .line 342
    return-object p0
.end method

.method public setCheckable(Z)Landroid/view/MenuItem;
    .locals 0
    .param p1, "checkable"    # Z

    .line 352
    return-object p0
.end method

.method public setChecked(Z)Landroid/view/MenuItem;
    .locals 0
    .param p1, "checked"    # Z

    .line 362
    return-object p0
.end method

.method public setEnabled(Z)Landroid/view/MenuItem;
    .locals 0
    .param p1, "enabled"    # Z

    .line 382
    return-object p0
.end method

.method public setIcon(I)Landroid/view/MenuItem;
    .locals 1
    .param p1, "iconRes"    # I

    .line 281
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;
    .locals 1
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .line 272
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 273
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mItemChangedListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;

    if-eqz v0, :cond_0

    .line 274
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mItemChangedListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;

    invoke-interface {v0, p0}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;->itemChanged(Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;)V

    .line 276
    :cond_0
    return-object p0
.end method

.method public setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .line 317
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "setIntent is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setNumericShortcut(C)Landroid/view/MenuItem;
    .locals 0
    .param p1, "numericChar"    # C

    .line 332
    return-object p0
.end method

.method public setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;
    .locals 2
    .param p1, "listener"    # Landroid/view/MenuItem$OnActionExpandListener;

    .line 457
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "setOnActionExpandListener is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;
    .locals 0
    .param p1, "menuItemClickListener"    # Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 291
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 292
    return-object p0
.end method

.method public setShortcut(CC)Landroid/view/MenuItem;
    .locals 2
    .param p1, "numericChar"    # C
    .param p2, "alphaChar"    # C

    .line 327
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "setShortcut is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setShowAsAction(I)V
    .locals 2
    .param p1, "actionEnum"    # I

    .line 407
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "setShowAsAction is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setShowAsActionFlags(I)Landroid/view/MenuItem;
    .locals 2
    .param p1, "actionEnum"    # I

    .line 412
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "setShowAsActionFlags is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setTitle(I)Landroid/view/MenuItem;
    .locals 1
    .param p1, "title"    # I

    .line 262
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .locals 1
    .param p1, "title"    # Ljava/lang/CharSequence;

    .line 253
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mTitle:Ljava/lang/CharSequence;

    .line 254
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mItemChangedListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;

    if-eqz v0, :cond_0

    .line 255
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->mItemChangedListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;

    invoke-interface {v0, p0}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;->itemChanged(Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;)V

    .line 257
    :cond_0
    return-object p0
.end method

.method public setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .locals 0
    .param p1, "title"    # Ljava/lang/CharSequence;

    .line 307
    return-object p0
.end method

.method public setVisible(Z)Landroid/view/MenuItem;
    .locals 0
    .param p1, "visible"    # Z

    .line 372
    return-object p0
.end method
