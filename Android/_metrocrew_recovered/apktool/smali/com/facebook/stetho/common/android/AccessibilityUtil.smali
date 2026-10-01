.class public final Lcom/facebook/stetho/common/android/AccessibilityUtil;
.super Ljava/lang/Object;
.source "AccessibilityUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public static hasFocusableAncestor(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z
    .locals 5
    .param p0, "node"    # Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    .param p1, "view"    # Landroid/view/View;

    .line 233
    const/4 v0, 0x0

    if-eqz p0, :cond_5

    if-nez p1, :cond_0

    goto :goto_0

    .line 237
    :cond_0
    invoke-static {p1}, Landroidx/core/view/ViewCompat;->getParentForAccessibility(Landroid/view/View;)Landroid/view/ViewParent;

    move-result-object v1

    .line 238
    .local v1, "parentView":Landroid/view/ViewParent;
    instance-of v2, v1, Landroid/view/View;

    if-nez v2, :cond_1

    .line 239
    return v0

    .line 242
    :cond_1
    invoke-static {}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->obtain()Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v2

    .line 244
    .local v2, "parentNode":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    :try_start_0
    move-object v3, v1

    check-cast v3, Landroid/view/View;

    invoke-static {v3, v2}, Landroidx/core/view/ViewCompat;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 245
    if-nez v2, :cond_2

    .line 246
    nop

    .line 257
    invoke-virtual {v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 246
    return v0

    .line 249
    :cond_2
    :try_start_1
    move-object v3, v1

    check-cast v3, Landroid/view/View;

    invoke-static {v2, v3}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isAccessibilityFocusable(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v4, 0x1

    if-eqz v3, :cond_3

    .line 250
    nop

    .line 257
    invoke-virtual {v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 250
    return v4

    .line 253
    :cond_3
    :try_start_2
    move-object v3, v1

    check-cast v3, Landroid/view/View;

    invoke-static {v2, v3}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->hasFocusableAncestor(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v3, :cond_4

    .line 254
    nop

    .line 257
    invoke-virtual {v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 254
    return v4

    .line 257
    :cond_4
    invoke-virtual {v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 258
    nop

    .line 259
    return v0

    .line 257
    :catchall_0
    move-exception v0

    invoke-virtual {v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 258
    throw v0

    .line 234
    .end local v1    # "parentView":Landroid/view/ViewParent;
    .end local v2    # "parentNode":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    :cond_5
    :goto_0
    return v0
.end method

.method public static hasNonActionableSpeakingDescendants(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z
    .locals 7
    .param p0, "node"    # Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    .param p1, "view"    # Landroid/view/View;

    .line 95
    const/4 v0, 0x0

    if-eqz p0, :cond_5

    if-eqz p1, :cond_5

    instance-of v1, p1, Landroid/view/ViewGroup;

    if-nez v1, :cond_0

    goto :goto_2

    .line 99
    :cond_0
    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup;

    .line 100
    .local v1, "viewGroup":Landroid/view/ViewGroup;
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    .local v3, "count":I
    :goto_0
    if-ge v2, v3, :cond_4

    .line 101
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 103
    .local v4, "childView":Landroid/view/View;
    if-nez v4, :cond_1

    .line 104
    goto :goto_1

    .line 107
    :cond_1
    invoke-static {}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->obtain()Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v5

    .line 109
    .local v5, "childNode":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    :try_start_0
    invoke-static {v4, v5}, Landroidx/core/view/ViewCompat;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V

    .line 111
    invoke-static {v5, v4}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isAccessibilityFocusable(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v6, :cond_2

    .line 119
    invoke-virtual {v5}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    goto :goto_1

    .line 115
    :cond_2
    :try_start_1
    invoke-static {v5, v4}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isSpeakingNode(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v6, :cond_3

    .line 116
    nop

    .line 119
    invoke-virtual {v5}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 116
    const/4 v0, 0x1

    return v0

    .line 119
    :cond_3
    invoke-virtual {v5}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 120
    nop

    .line 100
    .end local v4    # "childView":Landroid/view/View;
    .end local v5    # "childNode":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 119
    .restart local v4    # "childView":Landroid/view/View;
    .restart local v5    # "childNode":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    :catchall_0
    move-exception v0

    invoke-virtual {v5}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 120
    throw v0

    .line 123
    .end local v2    # "i":I
    .end local v3    # "count":I
    .end local v4    # "childView":Landroid/view/View;
    .end local v5    # "childNode":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    :cond_4
    return v0

    .line 96
    .end local v1    # "viewGroup":Landroid/view/ViewGroup;
    :cond_5
    :goto_2
    return v0
.end method

.method public static hasText(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)Z
    .locals 2
    .param p0, "node"    # Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    .line 42
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 43
    return v0

    .line 46
    :cond_0
    invoke-virtual {p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0
.end method

.method public static isAccessibilityFocusable(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z
    .locals 3
    .param p0, "node"    # Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    .param p1, "view"    # Landroid/view/View;

    .line 137
    const/4 v0, 0x0

    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto :goto_0

    .line 142
    :cond_0
    invoke-virtual {p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->isVisibleToUser()Z

    move-result v1

    if-nez v1, :cond_1

    .line 143
    return v0

    .line 147
    :cond_1
    invoke-static {p0}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isActionableForAccessibility(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    .line 148
    return v2

    .line 152
    :cond_2
    invoke-static {p0, p1}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isTopLevelScrollItem(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {p0, p1}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isSpeakingNode(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_3

    move v0, v2

    :cond_3
    return v0

    .line 138
    :cond_4
    :goto_0
    return v0
.end method

.method public static isActionableForAccessibility(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)Z
    .locals 4
    .param p0, "node"    # Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    .line 207
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 208
    return v0

    .line 211
    :cond_0
    invoke-virtual {p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->isClickable()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_4

    invoke-virtual {p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->isLongClickable()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->isFocusable()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 215
    :cond_1
    invoke-virtual {p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->getActionList()Ljava/util/List;

    move-result-object v1

    .line 216
    .local v1, "actionList":Ljava/util/List;
    nop

    .line 217
    const/16 v3, 0x10

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 218
    const/16 v3, 0x20

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 219
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_2
    move v0, v2

    .line 216
    :cond_3
    return v0

    .line 212
    .end local v1    # "actionList":Ljava/util/List;
    :cond_4
    :goto_0
    return v2
.end method

.method public static isSpeakingNode(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z
    .locals 3
    .param p0, "node"    # Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    .param p1, "view"    # Landroid/view/View;

    .line 61
    const/4 v0, 0x0

    if-eqz p0, :cond_6

    if-nez p1, :cond_0

    goto :goto_1

    .line 65
    :cond_0
    invoke-virtual {p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->isVisibleToUser()Z

    move-result v1

    if-nez v1, :cond_1

    .line 66
    return v0

    .line 69
    :cond_1
    invoke-static {p1}, Landroidx/core/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v1

    .line 70
    .local v1, "important":I
    const/4 v2, 0x4

    if-eq v1, v2, :cond_5

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 72
    invoke-virtual {p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->getChildCount()I

    move-result v2

    if-gtz v2, :cond_2

    goto :goto_0

    .line 76
    :cond_2
    invoke-virtual {p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->isCheckable()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {p0}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->hasText(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {p0, p1}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->hasNonActionableSpeakingDescendants(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    const/4 v0, 0x1

    :cond_4
    return v0

    .line 73
    :cond_5
    :goto_0
    return v0

    .line 62
    .end local v1    # "important":I
    :cond_6
    :goto_1
    return v0
.end method

.method public static isTopLevelScrollItem(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z
    .locals 5
    .param p0, "node"    # Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    .param p1, "view"    # Landroid/view/View;

    .line 166
    const/4 v0, 0x0

    if-eqz p0, :cond_8

    if-nez p1, :cond_0

    goto :goto_1

    .line 170
    :cond_0
    invoke-static {p1}, Landroidx/core/view/ViewCompat;->getParentForAccessibility(Landroid/view/View;)Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 171
    .local v1, "parent":Landroid/view/View;
    if-nez v1, :cond_1

    .line 172
    return v0

    .line 175
    :cond_1
    invoke-virtual {p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->isScrollable()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    .line 176
    return v3

    .line 179
    :cond_2
    invoke-virtual {p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->getActionList()Ljava/util/List;

    move-result-object v2

    .line 180
    .local v2, "actionList":Ljava/util/List;
    const/16 v4, 0x1000

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 181
    const/16 v4, 0x2000

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_0

    .line 187
    :cond_3
    instance-of v4, v1, Landroid/widget/Spinner;

    if-eqz v4, :cond_4

    .line 188
    return v0

    .line 191
    :cond_4
    instance-of v4, v1, Landroid/widget/AdapterView;

    if-nez v4, :cond_5

    instance-of v4, v1, Landroid/widget/ScrollView;

    if-nez v4, :cond_5

    instance-of v4, v1, Landroid/widget/HorizontalScrollView;

    if-eqz v4, :cond_6

    :cond_5
    move v0, v3

    :cond_6
    return v0

    .line 182
    :cond_7
    :goto_0
    return v3

    .line 167
    .end local v1    # "parent":Landroid/view/View;
    .end local v2    # "actionList":Ljava/util/List;
    :cond_8
    :goto_1
    return v0
.end method
