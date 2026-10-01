.class Landroidx/wear/widget/drawer/WearableActionDrawerMenu;
.super Ljava/lang/Object;
.source "WearableActionDrawerMenu.java"

# interfaces
.implements Landroid/view/Menu;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;,
        Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mItemChangedListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;

.field final mItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field final mListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItems:Ljava/util/List;

    .line 44
    new-instance v0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$1;

    invoke-direct {v0, p0}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$1;-><init>(Landroidx/wear/widget/drawer/WearableActionDrawerMenu;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItemChangedListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;

    .line 57
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mContext:Landroid/content/Context;

    .line 58
    iput-object p2, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;

    .line 59
    return-void
.end method

.method private findItemIndex(I)I
    .locals 4
    .param p1, "id"    # I

    .line 125
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItems:Ljava/util/List;

    .line 126
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 127
    .local v1, "itemCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 128
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;

    invoke-virtual {v3}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->getItemId()I

    move-result v3

    if-ne v3, p1, :cond_0

    .line 129
    return v2

    .line 127
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 133
    .end local v2    # "i":I
    :cond_1
    const/4 v2, -0x1

    return v2
.end method


# virtual methods
.method public add(I)Landroid/view/MenuItem;
    .locals 1
    .param p1, "titleRes"    # I

    .line 68
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0, p1}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public add(IIII)Landroid/view/MenuItem;
    .locals 1
    .param p1, "groupId"    # I
    .param p2, "itemId"    # I
    .param p3, "order"    # I
    .param p4, "titleRes"    # I

    .line 73
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;
    .locals 3
    .param p1, "groupId"    # I
    .param p2, "itemId"    # I
    .param p3, "order"    # I
    .param p4, "title"    # Ljava/lang/CharSequence;

    .line 78
    new-instance v0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mContext:Landroid/content/Context;

    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItemChangedListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;

    invoke-direct {v0, v1, p2, p4, v2}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;-><init>(Landroid/content/Context;ILjava/lang/CharSequence;Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem$MenuItemChangedListener;)V

    .line 80
    .local v0, "item":Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItems:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;

    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItems:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;->menuItemAdded(I)V

    .line 82
    return-object v0
.end method

.method public add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .locals 1
    .param p1, "title"    # Ljava/lang/CharSequence;

    .line 63
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0, p1}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public addIntentOptions(IIILandroid/content/ComponentName;[Landroid/content/Intent;Landroid/content/Intent;I[Landroid/view/MenuItem;)I
    .locals 2
    .param p1, "groupId"    # I
    .param p2, "itemId"    # I
    .param p3, "order"    # I
    .param p4, "caller"    # Landroid/content/ComponentName;
    .param p5, "specifics"    # [Landroid/content/Intent;
    .param p6, "intent"    # Landroid/content/Intent;
    .param p7, "flags"    # I
    .param p8, "outSpecificItems"    # [Landroid/view/MenuItem;

    .line 171
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "addIntentOptions is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addSubMenu(I)Landroid/view/SubMenu;
    .locals 2
    .param p1, "titleRes"    # I

    .line 148
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "addSubMenu is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addSubMenu(IIII)Landroid/view/SubMenu;
    .locals 2
    .param p1, "groupId"    # I
    .param p2, "itemId"    # I
    .param p3, "order"    # I
    .param p4, "titleRes"    # I

    .line 158
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "addSubMenu is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;
    .locals 2
    .param p1, "groupId"    # I
    .param p2, "itemId"    # I
    .param p3, "order"    # I
    .param p4, "title"    # Ljava/lang/CharSequence;

    .line 153
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "addSubMenu is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addSubMenu(Ljava/lang/CharSequence;)Landroid/view/SubMenu;
    .locals 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .line 143
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "addSubMenu is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clear()V
    .locals 1

    .line 87
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 88
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;

    invoke-interface {v0}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;->menuChanged()V

    .line 89
    return-void
.end method

.method public close()V
    .locals 2

    .line 138
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "close is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public findItem(I)Landroid/view/MenuItem;
    .locals 2
    .param p1, "id"    # I

    .line 103
    invoke-direct {p0, p1}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->findItemIndex(I)I

    move-result v0

    .line 104
    .local v0, "index":I
    if-ltz v0, :cond_1

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 107
    :cond_0
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItems:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/MenuItem;

    return-object v1

    .line 105
    :cond_1
    :goto_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getItem(I)Landroid/view/MenuItem;
    .locals 1
    .param p1, "index"    # I

    .line 118
    if-ltz p1, :cond_1

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 121
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    return-object v0

    .line 119
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public hasVisibleItems()Z
    .locals 1

    .line 195
    const/4 v0, 0x0

    return v0
.end method

.method public isShortcutKey(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .line 205
    const/4 v0, 0x0

    return v0
.end method

.method public performIdentifierAction(II)Z
    .locals 2
    .param p1, "id"    # I
    .param p2, "flags"    # I

    .line 210
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "performIdentifierAction is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public performShortcut(ILandroid/view/KeyEvent;I)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;
    .param p3, "flags"    # I

    .line 200
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "performShortcut is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeGroup(I)V
    .locals 0
    .param p1, "groupId"    # I

    .line 176
    return-void
.end method

.method public removeItem(I)V
    .locals 2
    .param p1, "id"    # I

    .line 93
    invoke-direct {p0, p1}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->findItemIndex(I)I

    move-result v0

    .line 94
    .local v0, "index":I
    if-ltz v0, :cond_1

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 97
    :cond_0
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItems:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 98
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mListener:Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;

    invoke-interface {v1, v0}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;->menuItemRemoved(I)V

    .line 99
    return-void

    .line 95
    :cond_1
    :goto_0
    return-void
.end method

.method public setGroupCheckable(IZZ)V
    .locals 2
    .param p1, "group"    # I
    .param p2, "checkable"    # Z
    .param p3, "exclusive"    # Z

    .line 180
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "setGroupCheckable is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setGroupEnabled(IZ)V
    .locals 2
    .param p1, "group"    # I
    .param p2, "enabled"    # Z

    .line 190
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "setGroupEnabled is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setGroupVisible(IZ)V
    .locals 2
    .param p1, "group"    # I
    .param p2, "visible"    # Z

    .line 185
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "setGroupVisible is not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setQwertyMode(Z)V
    .locals 0
    .param p1, "isQwerty"    # Z

    .line 215
    return-void
.end method

.method public size()I
    .locals 1

    .line 112
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;->mItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
