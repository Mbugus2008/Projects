.class public Landroidx/wear/widget/drawer/WearableActionDrawerView;
.super Landroidx/wear/widget/drawer/WearableDrawerView;
.source "WearableActionDrawerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;,
        Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionItemViewHolder;,
        Landroidx/wear/widget/drawer/WearableActionDrawerView$TitleViewHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "WearableActionDrawer"


# instance fields
.field final mActionList:Landroidx/recyclerview/widget/RecyclerView;

.field final mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field final mBottomPadding:I

.field final mFirstItemTopPadding:I

.field final mIconRightMargin:I

.field final mLastItemBottomPadding:I

.field final mLeftPadding:I

.field private mMenu:Landroid/view/Menu;

.field private mOnMenuItemClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

.field private final mPeekActionIcon:Landroid/widget/ImageView;

.field private final mPeekExpandIcon:Landroid/widget/ImageView;

.field final mRightPadding:I

.field private final mShowOverflowInPeek:Z

.field mTitle:Ljava/lang/CharSequence;

.field final mTopPadding:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 99
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 104
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 107
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 108
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .line 112
    invoke-direct/range {p0 .. p4}, Landroidx/wear/widget/drawer/WearableDrawerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 114
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->setLockedWhenClosed(Z)V

    .line 116
    const/4 v8, 0x0

    .line 117
    .local v8, "showOverflowInPeek":Z
    const/4 v9, 0x0

    .line 118
    .local v9, "menuRes":I
    const/4 v10, 0x0

    if-eqz p2, :cond_0

    .line 119
    sget-object v3, Landroidx/wear/R$styleable;->WearableActionDrawerView:[I

    invoke-virtual {p1, p2, v3, p3, v10}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 122
    .local v5, "typedArray":Landroid/content/res/TypedArray;
    sget-object v3, Landroidx/wear/R$styleable;->WearableActionDrawerView:[I

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move v6, p3

    invoke-static/range {v1 .. v7}, Landroidx/core/view/ViewCompat;->saveAttributeDataForStyleable(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 127
    :try_start_0
    sget v3, Landroidx/wear/R$styleable;->WearableActionDrawerView_drawerTitle:I

    invoke-virtual {v5, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mTitle:Ljava/lang/CharSequence;

    .line 128
    sget v3, Landroidx/wear/R$styleable;->WearableActionDrawerView_showOverflowInPeek:I

    invoke-virtual {v5, v3, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    move v8, v3

    .line 130
    sget v3, Landroidx/wear/R$styleable;->WearableActionDrawerView_actionMenu:I

    .line 131
    invoke-virtual {v5, v3, v10}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v9, v3

    .line 133
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    .line 134
    goto :goto_0

    .line 133
    :catchall_0
    move-exception v0

    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    .line 134
    throw v0

    .line 137
    .end local v5    # "typedArray":Landroid/content/res/TypedArray;
    :cond_0
    :goto_0
    nop

    .line 138
    const-string v3, "accessibility"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/accessibility/AccessibilityManager;

    .line 139
    .local v3, "accessibilityManager":Landroid/view/accessibility/AccessibilityManager;
    if-nez v8, :cond_2

    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    :cond_1
    move v0, v10

    :cond_2
    :goto_1
    iput-boolean v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mShowOverflowInPeek:Z

    .line 141
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mShowOverflowInPeek:Z

    if-nez v0, :cond_3

    .line 142
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 143
    .local v0, "layoutInflater":Landroid/view/LayoutInflater;
    sget v4, Landroidx/wear/R$layout;->ws_action_drawer_peek_view:I

    .line 144
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->getPeekContainer()Landroid/view/ViewGroup;

    move-result-object v5

    .line 143
    invoke-virtual {v0, v4, v5, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 145
    .local v4, "peekView":Landroid/view/View;
    invoke-virtual {p0, v4}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->setPeekContent(Landroid/view/View;)V

    .line 146
    sget v5, Landroidx/wear/R$id;->ws_action_drawer_peek_action_icon:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mPeekActionIcon:Landroid/widget/ImageView;

    .line 147
    sget v5, Landroidx/wear/R$id;->ws_action_drawer_expand_icon:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mPeekExpandIcon:Landroid/widget/ImageView;

    .line 148
    .end local v0    # "layoutInflater":Landroid/view/LayoutInflater;
    .end local v4    # "peekView":Landroid/view/View;
    goto :goto_2

    .line 149
    :cond_3
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mPeekActionIcon:Landroid/widget/ImageView;

    .line 150
    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mPeekExpandIcon:Landroid/widget/ImageView;

    .line 151
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->getPeekContainer()Landroid/view/ViewGroup;

    move-result-object v0

    sget v4, Landroidx/wear/R$string;->ws_action_drawer_content_description:I

    .line 152
    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 151
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 155
    :goto_2
    if-eqz v9, :cond_4

    .line 158
    new-instance v0, Landroid/view/MenuInflater;

    invoke-direct {v0, p1}, Landroid/view/MenuInflater;-><init>(Landroid/content/Context;)V

    .line 159
    .local v0, "inflater":Landroid/view/MenuInflater;
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->getMenu()Landroid/view/Menu;

    move-result-object v4

    invoke-virtual {v0, v9, v4}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 162
    .end local v0    # "inflater":Landroid/view/MenuInflater;
    :cond_4
    invoke-static {p1}, Landroidx/wear/internal/widget/ResourcesUtil;->getScreenWidthPx(Landroid/content/Context;)I

    move-result v0

    .line 163
    .local v0, "screenWidthPx":I
    invoke-static {p1}, Landroidx/wear/internal/widget/ResourcesUtil;->getScreenHeightPx(Landroid/content/Context;)I

    move-result v4

    .line 165
    .local v4, "screenHeightPx":I
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 166
    .local v5, "res":Landroid/content/res/Resources;
    sget v6, Landroidx/wear/R$dimen;->ws_action_drawer_item_top_padding:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    iput v6, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mTopPadding:I

    .line 167
    sget v6, Landroidx/wear/R$dimen;->ws_action_drawer_item_bottom_padding:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    iput v6, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mBottomPadding:I

    .line 168
    sget v6, Landroidx/wear/R$fraction;->ws_action_drawer_item_left_padding:I

    .line 169
    invoke-static {p1, v0, v6}, Landroidx/wear/internal/widget/ResourcesUtil;->getFractionOfScreenPx(Landroid/content/Context;II)I

    move-result v6

    iput v6, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mLeftPadding:I

    .line 171
    sget v6, Landroidx/wear/R$fraction;->ws_action_drawer_item_right_padding:I

    .line 172
    invoke-static {p1, v0, v6}, Landroidx/wear/internal/widget/ResourcesUtil;->getFractionOfScreenPx(Landroid/content/Context;II)I

    move-result v6

    iput v6, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mRightPadding:I

    .line 175
    sget v6, Landroidx/wear/R$fraction;->ws_action_drawer_item_first_item_top_padding:I

    .line 176
    invoke-static {p1, v4, v6}, Landroidx/wear/internal/widget/ResourcesUtil;->getFractionOfScreenPx(Landroid/content/Context;II)I

    move-result v6

    iput v6, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mFirstItemTopPadding:I

    .line 179
    sget v6, Landroidx/wear/R$fraction;->ws_action_drawer_item_last_item_bottom_padding:I

    .line 180
    invoke-static {p1, v4, v6}, Landroidx/wear/internal/widget/ResourcesUtil;->getFractionOfScreenPx(Landroid/content/Context;II)I

    move-result v6

    iput v6, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mLastItemBottomPadding:I

    .line 184
    sget v6, Landroidx/wear/R$dimen;->ws_action_drawer_item_icon_right_margin:I

    .line 185
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    iput v6, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mIconRightMargin:I

    .line 187
    new-instance v6, Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {v6, p1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionList:Landroidx/recyclerview/widget/RecyclerView;

    .line 188
    iget-object v6, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionList:Landroidx/recyclerview/widget/RecyclerView;

    sget v7, Landroidx/wear/R$id;->action_list:I

    invoke-virtual {v6, v7}, Landroidx/recyclerview/widget/RecyclerView;->setId(I)V

    .line 189
    iget-object v6, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionList:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v7, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v7, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, v7}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 190
    new-instance v6, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;

    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->getMenu()Landroid/view/Menu;

    move-result-object v7

    invoke-direct {v6, p0, v7}, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;-><init>(Landroidx/wear/widget/drawer/WearableActionDrawerView;Landroid/view/Menu;)V

    iput-object v6, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 194
    iget-object v6, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionList:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v6}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->setDrawerContent(Landroid/view/View;)V

    .line 195
    return-void
.end method

.method private setContentIfFirstCall()V
    .locals 2

    .line 209
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionList:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    if-nez v0, :cond_0

    .line 210
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionList:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 212
    :cond_0
    return-void
.end method


# virtual methods
.method public canScrollHorizontally(I)Z
    .locals 1
    .param p1, "direction"    # I

    .line 218
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->isOpened()Z

    move-result v0

    return v0
.end method

.method public getMenu()Landroid/view/Menu;
    .locals 3

    .line 321
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mMenu:Landroid/view/Menu;

    if-nez v0, :cond_0

    .line 322
    new-instance v0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;

    .line 323
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;

    invoke-direct {v2, p0}, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;-><init>(Landroidx/wear/widget/drawer/WearableActionDrawerView;)V

    invoke-direct {v0, v1, v2}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu;-><init>(Landroid/content/Context;Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mMenu:Landroid/view/Menu;

    .line 373
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mMenu:Landroid/view/Menu;

    return-object v0
.end method

.method hasTitle()Z
    .locals 1

    .line 263
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mTitle:Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onDrawerOpened()V
    .locals 3

    .line 199
    invoke-direct {p0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->setContentIfFirstCall()V

    .line 200
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 201
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionList:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 202
    .local v0, "holder":Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    if-eqz v0, :cond_0

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 203
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 206
    .end local v0    # "holder":Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    :cond_0
    return-void
.end method

.method onMenuItemClicked(I)V
    .locals 2
    .param p1, "position"    # I

    .line 267
    if-ltz p1, :cond_1

    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->getMenu()Landroid/view/Menu;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/Menu;->size()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 268
    nop

    .line 269
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->getMenu()Landroid/view/Menu;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v0

    check-cast v0, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;

    .line 270
    .local v0, "menuItem":Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;->invoke()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 271
    return-void

    .line 274
    :cond_0
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mOnMenuItemClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    if-eqz v1, :cond_1

    .line 275
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mOnMenuItemClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    invoke-interface {v1, v0}, Landroid/view/MenuItem$OnMenuItemClickListener;->onMenuItemClick(Landroid/view/MenuItem;)Z

    .line 278
    .end local v0    # "menuItem":Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuItem;
    :cond_1
    return-void
.end method

.method public onPeekContainerClicked(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 223
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mShowOverflowInPeek:Z

    if-eqz v0, :cond_0

    .line 224
    invoke-super {p0, p1}, Landroidx/wear/widget/drawer/WearableDrawerView;->onPeekContainerClicked(Landroid/view/View;)V

    goto :goto_0

    .line 226
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->onMenuItemClicked(I)V

    .line 228
    :goto_0
    return-void
.end method

.method preferGravity()I
    .locals 1

    .line 232
    const/16 v0, 0x50

    return v0
.end method

.method public setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 239
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mOnMenuItemClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 240
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .line 247
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mTitle:Ljava/lang/CharSequence;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 248
    return-void

    .line 251
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mTitle:Ljava/lang/CharSequence;

    .line 252
    .local v0, "oldTitle":Ljava/lang/CharSequence;
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mTitle:Ljava/lang/CharSequence;

    .line 253
    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 254
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemInserted(I)V

    goto :goto_0

    .line 255
    :cond_1
    if-nez p1, :cond_2

    .line 256
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    goto :goto_0

    .line 258
    :cond_2
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 260
    :goto_0
    return-void
.end method

.method updatePeekIcons()V
    .locals 6

    .line 281
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mPeekActionIcon:Landroid/widget/ImageView;

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mPeekExpandIcon:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    goto :goto_1

    .line 285
    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->getMenu()Landroid/view/Menu;

    move-result-object v0

    .line 286
    .local v0, "menu":Landroid/view/Menu;
    invoke-interface {v0}, Landroid/view/Menu;->size()I

    move-result v1

    .line 289
    .local v1, "numberOfActions":I
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-le v1, v2, :cond_1

    .line 290
    iget-object v4, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionList:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v4}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->setDrawerContent(Landroid/view/View;)V

    .line 291
    iget-object v4, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mPeekExpandIcon:Landroid/widget/ImageView;

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 293
    :cond_1
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->setDrawerContent(Landroid/view/View;)V

    .line 294
    iget-object v4, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mPeekExpandIcon:Landroid/widget/ImageView;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 297
    :goto_0
    if-lt v1, v2, :cond_3

    .line 298
    invoke-interface {v0, v3}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 302
    .local v2, "firstActionDrawable":Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_2

    .line 303
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 304
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 307
    :cond_2
    iget-object v4, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mPeekActionIcon:Landroid/widget/ImageView;

    invoke-virtual {v4, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 308
    iget-object v4, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mPeekActionIcon:Landroid/widget/ImageView;

    invoke-interface {v0, v3}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 310
    .end local v2    # "firstActionDrawable":Landroid/graphics/drawable/Drawable;
    :cond_3
    return-void

    .line 282
    .end local v0    # "menu":Landroid/view/Menu;
    .end local v1    # "numberOfActions":I
    :cond_4
    :goto_1
    return-void
.end method
