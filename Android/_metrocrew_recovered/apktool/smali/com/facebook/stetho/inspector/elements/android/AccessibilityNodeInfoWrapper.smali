.class public final Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;
.super Ljava/lang/Object;
.source "AccessibilityNodeInfoWrapper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    return-void
.end method

.method public static createNodeInfoFromView(Landroid/view/View;)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    .locals 1
    .param p0, "view"    # Landroid/view/View;

    .line 29
    invoke-static {}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->obtain()Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    .line 30
    .local v0, "nodeInfo":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    invoke-static {p0, v0}, Landroidx/core/view/ViewCompat;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V

    .line 31
    return-object v0
.end method

.method public static getActions(Landroid/view/View;)Ljava/lang/String;
    .locals 8
    .param p0, "view"    # Landroid/view/View;

    .line 176
    const-string v0, ", "

    invoke-static {p0}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->createNodeInfoFromView(Landroid/view/View;)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v1

    .line 178
    .local v1, "node":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .local v2, "actionLabels":Ljava/lang/StringBuilder;
    move-object v3, v0

    .line 181
    .local v3, "separator":Ljava/lang/String;
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->getActionList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;

    .line 182
    .local v5, "action":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 183
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    :cond_0
    invoke-virtual {v5}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;->getId()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    .line 241
    invoke-virtual {v5}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;->getLabel()Ljava/lang/CharSequence;

    move-result-object v6

    goto/16 :goto_1

    .line 238
    :sswitch_0
    const-string/jumbo v6, "set-selection"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    goto/16 :goto_2

    .line 229
    :sswitch_1
    const-string v6, "cut"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    goto/16 :goto_2

    .line 235
    :sswitch_2
    const-string v6, "paste"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    goto/16 :goto_2

    .line 232
    :sswitch_3
    const-string v6, "copy"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    goto/16 :goto_2

    .line 226
    :sswitch_4
    const-string/jumbo v6, "scroll-backward"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    goto :goto_2

    .line 223
    :sswitch_5
    const-string/jumbo v6, "scroll-forward"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    goto :goto_2

    .line 220
    :sswitch_6
    const-string v6, "previous-html-element"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    goto :goto_2

    .line 217
    :sswitch_7
    const-string v6, "next-html-element"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    goto :goto_2

    .line 214
    :sswitch_8
    const-string v6, "previous-at-movement-granularity"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    goto :goto_2

    .line 211
    :sswitch_9
    const-string v6, "next-at-movement-granularity"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    goto :goto_2

    .line 208
    :sswitch_a
    const-string v6, "clear-accessibility-focus"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    goto :goto_2

    .line 205
    :sswitch_b
    const-string v6, "accessibility-focus"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    goto :goto_2

    .line 202
    :sswitch_c
    const-string v6, "long-click"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    goto :goto_2

    .line 199
    :sswitch_d
    const-string v6, "click"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    goto :goto_2

    .line 196
    :sswitch_e
    const-string v6, "clear-selection"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    goto :goto_2

    .line 193
    :sswitch_f
    const-string/jumbo v6, "select"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    goto :goto_2

    .line 190
    :sswitch_10
    const-string v6, "clear-focus"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    goto :goto_2

    .line 187
    :sswitch_11
    const-string v6, "focus"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    goto :goto_2

    .line 242
    .local v6, "label":Ljava/lang/CharSequence;
    :goto_1
    if-eqz v6, :cond_1

    .line 243
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 245
    :cond_1
    const-string/jumbo v7, "unknown"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .end local v5    # "action":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;
    .end local v6    # "label":Ljava/lang/CharSequence;
    :goto_2
    goto/16 :goto_0

    .line 251
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_3

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :cond_3
    const/4 v0, 0x0

    .line 253
    :goto_3
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 251
    return-object v0

    .line 253
    .end local v2    # "actionLabels":Ljava/lang/StringBuilder;
    .end local v3    # "separator":Ljava/lang/String;
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 254
    throw v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_11
        0x2 -> :sswitch_10
        0x4 -> :sswitch_f
        0x8 -> :sswitch_e
        0x10 -> :sswitch_d
        0x20 -> :sswitch_c
        0x40 -> :sswitch_b
        0x80 -> :sswitch_a
        0x100 -> :sswitch_9
        0x200 -> :sswitch_8
        0x400 -> :sswitch_7
        0x800 -> :sswitch_6
        0x1000 -> :sswitch_5
        0x2000 -> :sswitch_4
        0x4000 -> :sswitch_3
        0x8000 -> :sswitch_2
        0x10000 -> :sswitch_1
        0x20000 -> :sswitch_0
    .end sparse-switch
.end method

.method public static getDescription(Landroid/view/View;)Ljava/lang/CharSequence;
    .locals 17
    .param p0, "view"    # Landroid/view/View;

    .line 259
    move-object/from16 v1, p0

    const-string v0, ", "

    invoke-static {v1}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->createNodeInfoFromView(Landroid/view/View;)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v2

    .line 261
    .local v2, "node":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    :try_start_0
    invoke-virtual {v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v3

    .line 262
    .local v3, "contentDescription":Ljava/lang/CharSequence;
    invoke-virtual {v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    .line 264
    .local v4, "nodeText":Ljava/lang/CharSequence;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    .line 265
    .local v5, "hasNodeText":Z
    :goto_0
    instance-of v6, v1, Landroid/widget/EditText;

    .line 268
    .local v6, "isEditText":Z
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v7, :cond_2

    if-eqz v6, :cond_1

    if-nez v5, :cond_2

    .line 269
    :cond_1
    nop

    .line 309
    invoke-virtual {v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 269
    return-object v3

    .line 272
    :cond_2
    if-eqz v5, :cond_3

    .line 273
    nop

    .line 309
    invoke-virtual {v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 273
    return-object v4

    .line 278
    :cond_3
    :try_start_1
    instance-of v7, v1, Landroid/view/ViewGroup;

    const/4 v8, 0x0

    if-eqz v7, :cond_9

    .line 279
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 280
    .local v7, "concatChildDescription":Ljava/lang/StringBuilder;
    move-object v9, v0

    .line 281
    .local v9, "separator":Ljava/lang/String;
    move-object v10, v1

    check-cast v10, Landroid/view/ViewGroup;

    .line 283
    .local v10, "viewGroup":Landroid/view/ViewGroup;
    const/4 v11, 0x0

    .local v11, "i":I
    invoke-virtual {v10}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v12

    .local v12, "count":I
    :goto_1
    if-ge v11, v12, :cond_7

    .line 284
    invoke-virtual {v10, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    .line 286
    .local v13, "child":Landroid/view/View;
    invoke-static {}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->obtain()Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v14

    .line 287
    .local v14, "childNodeInfo":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    invoke-static {v13, v14}, Landroidx/core/view/ViewCompat;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V

    .line 289
    const/4 v15, 0x0

    .line 290
    .local v15, "childNodeDescription":Ljava/lang/CharSequence;
    invoke-static {v14, v13}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isSpeakingNode(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v16

    if-eqz v16, :cond_4

    .line 291
    invoke-static {v14, v13}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isAccessibilityFocusable(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v16

    if-nez v16, :cond_4

    .line 292
    invoke-static {v13}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->getDescription(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object v16

    move-object/from16 v15, v16

    .line 295
    :cond_4
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v16

    if-nez v16, :cond_6

    .line 296
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v16

    if-lez v16, :cond_5

    .line 297
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    :cond_5
    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 301
    :cond_6
    invoke-virtual {v14}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 283
    .end local v13    # "child":Landroid/view/View;
    .end local v14    # "childNodeInfo":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    .end local v15    # "childNodeDescription":Ljava/lang/CharSequence;
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 304
    .end local v11    # "i":I
    .end local v12    # "count":I
    :cond_7
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_8

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 309
    :cond_8
    invoke-virtual {v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 304
    return-object v8

    .line 307
    .end local v7    # "concatChildDescription":Ljava/lang/StringBuilder;
    .end local v9    # "separator":Ljava/lang/String;
    .end local v10    # "viewGroup":Landroid/view/ViewGroup;
    :cond_9
    nop

    .line 309
    invoke-virtual {v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 307
    return-object v8

    .line 309
    .end local v3    # "contentDescription":Ljava/lang/CharSequence;
    .end local v4    # "nodeText":Ljava/lang/CharSequence;
    .end local v5    # "hasNodeText":Z
    .end local v6    # "isEditText":Z
    :catchall_0
    move-exception v0

    invoke-virtual {v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 310
    throw v0
.end method

.method public static getFocusableReasons(Landroid/view/View;)Ljava/lang/String;
    .locals 5
    .param p0, "view"    # Landroid/view/View;

    .line 133
    invoke-static {p0}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->createNodeInfoFromView(Landroid/view/View;)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    .line 135
    .local v0, "node":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    :try_start_0
    invoke-static {v0}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->hasText(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)Z

    move-result v1

    .line 136
    .local v1, "hasText":Z
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->isCheckable()Z

    move-result v2

    .line 137
    .local v2, "isCheckable":Z
    nop

    .line 138
    invoke-static {v0, p0}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->hasNonActionableSpeakingDescendants(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v3

    .line 140
    .local v3, "hasNonActionableSpeakingDescendants":Z
    invoke-static {v0}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isActionableForAccessibility(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 141
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->getChildCount()I

    move-result v4

    if-gtz v4, :cond_0

    .line 142
    const-string v4, "View is actionable and has no children."
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 142
    return-object v4

    .line 143
    :cond_0
    if-eqz v1, :cond_1

    .line 144
    :try_start_1
    const-string v4, "View is actionable and has a description."
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 170
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 144
    return-object v4

    .line 145
    :cond_1
    if-eqz v2, :cond_2

    .line 146
    :try_start_2
    const-string v4, "View is actionable and checkable."
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 170
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 146
    return-object v4

    .line 147
    :cond_2
    if-eqz v3, :cond_3

    .line 148
    :try_start_3
    const-string v4, "View is actionable and has non-actionable descendants with descriptions."
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 170
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 148
    return-object v4

    .line 152
    :cond_3
    :try_start_4
    invoke-static {v0, p0}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isTopLevelScrollItem(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 153
    if-eqz v1, :cond_4

    .line 154
    const-string v4, "View is a direct child of a scrollable container and has a description."
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 170
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 154
    return-object v4

    .line 155
    :cond_4
    if-eqz v2, :cond_5

    .line 156
    :try_start_5
    const-string v4, "View is a direct child of a scrollable container and is checkable."
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 170
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 156
    return-object v4

    .line 157
    :cond_5
    if-eqz v3, :cond_6

    .line 158
    :try_start_6
    const-string v4, "View is a direct child of a scrollable container and has non-actionable descendants with descriptions."
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 170
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 158
    return-object v4

    .line 164
    :cond_6
    if-eqz v1, :cond_7

    .line 165
    :try_start_7
    const-string v4, "View has a description and is not actionable, but has no actionable ancestor."
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 170
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 165
    return-object v4

    .line 168
    :cond_7
    nop

    .line 170
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 168
    const/4 v4, 0x0

    return-object v4

    .line 170
    .end local v1    # "hasText":Z
    .end local v2    # "isCheckable":Z
    .end local v3    # "hasNonActionableSpeakingDescendants":Z
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 171
    throw v1
.end method

.method public static getIgnored(Landroid/view/View;)Z
    .locals 6
    .param p0, "view"    # Landroid/view/View;

    .line 43
    invoke-static {p0}, Landroidx/core/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v0

    .line 44
    .local v0, "important":I
    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v1, :cond_8

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    goto :goto_1

    .line 50
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .line 51
    .local v3, "parent":Landroid/view/ViewParent;
    :goto_0
    instance-of v4, v3, Landroid/view/View;

    if-eqz v4, :cond_2

    .line 52
    move-object v4, v3

    check-cast v4, Landroid/view/View;

    invoke-static {v4}, Landroidx/core/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v4

    if-ne v4, v1, :cond_1

    .line 54
    return v2

    .line 56
    :cond_1
    invoke-interface {v3}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    goto :goto_0

    .line 59
    :cond_2
    invoke-static {p0}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->createNodeInfoFromView(Landroid/view/View;)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v1

    .line 61
    .local v1, "node":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    :try_start_0
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->isVisibleToUser()Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_3

    .line 62
    nop

    .line 87
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 62
    return v2

    .line 65
    :cond_3
    :try_start_1
    invoke-static {v1, p0}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isAccessibilityFocusable(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_6

    .line 66
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->getChildCount()I

    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-gtz v4, :cond_4

    .line 69
    nop

    .line 87
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 69
    return v5

    .line 70
    :cond_4
    :try_start_2
    invoke-static {v1, p0}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isSpeakingNode(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v4, :cond_5

    .line 72
    nop

    .line 87
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 72
    return v5

    .line 76
    :cond_5
    nop

    .line 87
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 76
    return v2

    .line 81
    :cond_6
    :try_start_3
    invoke-static {v1, p0}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->hasFocusableAncestor(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v4

    if-nez v4, :cond_7

    invoke-static {v1}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->hasText(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)Z

    move-result v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v4, :cond_7

    .line 82
    nop

    .line 87
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 82
    return v5

    .line 85
    :cond_7
    nop

    .line 87
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 85
    return v2

    .line 87
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 88
    throw v2

    .line 46
    .end local v1    # "node":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    .end local v3    # "parent":Landroid/view/ViewParent;
    :cond_8
    :goto_1
    return v2
.end method

.method public static getIgnoredReasons(Landroid/view/View;)Ljava/lang/String;
    .locals 4
    .param p0, "view"    # Landroid/view/View;

    .line 92
    invoke-static {p0}, Landroidx/core/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v0

    .line 94
    .local v0, "important":I
    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 95
    const-string v1, "View has importantForAccessibility set to \'NO\'."

    return-object v1

    .line 98
    :cond_0
    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 99
    const-string v1, "View has importantForAccessibility set to \'NO_HIDE_DESCENDANTS\'."

    return-object v1

    .line 102
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .line 103
    .local v2, "parent":Landroid/view/ViewParent;
    :goto_0
    instance-of v3, v2, Landroid/view/View;

    if-eqz v3, :cond_3

    .line 104
    move-object v3, v2

    check-cast v3, Landroid/view/View;

    invoke-static {v3}, Landroidx/core/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v3

    if-ne v3, v1, :cond_2

    .line 106
    const-string v1, "An ancestor View has importantForAccessibility set to \'NO_HIDE_DESCENDANTS\'."

    return-object v1

    .line 108
    :cond_2
    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    goto :goto_0

    .line 111
    :cond_3
    invoke-static {p0}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->createNodeInfoFromView(Landroid/view/View;)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v1

    .line 113
    .local v1, "node":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    :try_start_0
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->isVisibleToUser()Z

    move-result v3

    if-nez v3, :cond_4

    .line 114
    const-string v3, "View is not visible."
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 114
    return-object v3

    .line 117
    :cond_4
    :try_start_1
    invoke-static {v1, p0}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->isAccessibilityFocusable(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 118
    const-string v3, "View is actionable, but has no description."
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 127
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 118
    return-object v3

    .line 121
    :cond_5
    :try_start_2
    invoke-static {v1}, Lcom/facebook/stetho/common/android/AccessibilityUtil;->hasText(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 122
    const-string v3, "View is not actionable, and an ancestor View has co-opted its description."
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 127
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 122
    return-object v3

    .line 125
    :cond_6
    :try_start_3
    const-string v3, "View is not actionable and has no description."
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 127
    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 125
    return-object v3

    .line 127
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 128
    throw v3
.end method

.method public static getIsAccessibilityFocused(Landroid/view/View;)Z
    .locals 2
    .param p0, "view"    # Landroid/view/View;

    .line 35
    invoke-static {p0}, Lcom/facebook/stetho/inspector/elements/android/AccessibilityNodeInfoWrapper;->createNodeInfoFromView(Landroid/view/View;)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    move-result-object v0

    .line 36
    .local v0, "node":Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->isAccessibilityFocused()Z

    move-result v1

    .line 37
    .local v1, "isAccessibilityFocused":Z
    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->recycle()V

    .line 39
    return v1
.end method
