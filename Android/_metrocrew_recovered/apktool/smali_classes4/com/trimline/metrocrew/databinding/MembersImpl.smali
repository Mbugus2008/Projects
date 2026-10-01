.class public Lcom/trimline/metrocrew/databinding/MembersImpl;
.super Lcom/trimline/metrocrew/databinding/Members;
.source "MembersImpl.java"


# static fields
.field private static final sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

.field private static final sViewsWithIds:Landroid/util/SparseIntArray;


# instance fields
.field private NameeditandroidTextAttrChanged:Landroidx/databinding/InverseBindingListener;

.field private ideditandroidTextAttrChanged:Landroidx/databinding/InverseBindingListener;

.field private mDirtyFlags:J

.field private final mboundView0:Landroidx/constraintlayout/widget/ConstraintLayout;

.field private final mboundView1:Landroid/widget/TextView;

.field private phoneeditandroidTextAttrChanged:Landroidx/databinding/InverseBindingListener;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 15
    const/4 v0, 0x0

    sput-object v0, Lcom/trimline/metrocrew/databinding/MembersImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    .line 16
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    sput-object v0, Lcom/trimline/metrocrew/databinding/MembersImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    .line 17
    sget-object v0, Lcom/trimline/metrocrew/databinding/MembersImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const v1, 0x7f0a006e

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 18
    sget-object v0, Lcom/trimline/metrocrew/databinding/MembersImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const v1, 0x7f0a0175

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 19
    sget-object v0, Lcom/trimline/metrocrew/databinding/MembersImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const v1, 0x7f0a000d

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 20
    sget-object v0, Lcom/trimline/metrocrew/databinding/MembersImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const v1, 0x7f0a01a7

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 21
    sget-object v0, Lcom/trimline/metrocrew/databinding/MembersImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const v1, 0x7f0a0009

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 22
    sget-object v0, Lcom/trimline/metrocrew/databinding/MembersImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const v1, 0x7f0a01c3

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 23
    sget-object v0, Lcom/trimline/metrocrew/databinding/MembersImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const v1, 0x7f0a00f6

    const/16 v2, 0xb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 24
    sget-object v0, Lcom/trimline/metrocrew/databinding/MembersImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const v1, 0x7f0a00f7

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;)V
    .locals 3
    .param p1, "bindingComponent"    # Landroidx/databinding/DataBindingComponent;
    .param p2, "root"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "bindingComponent",
            "root"
        }
    .end annotation

    .line 109
    sget-object v0, Lcom/trimline/metrocrew/databinding/MembersImpl;->sIncludes:Landroidx/databinding/ViewDataBinding$IncludedLayouts;

    sget-object v1, Lcom/trimline/metrocrew/databinding/MembersImpl;->sViewsWithIds:Landroid/util/SparseIntArray;

    const/16 v2, 0xd

    invoke-static {p1, p2, v2, v0, v1}, Lcom/trimline/metrocrew/databinding/MembersImpl;->mapBindings(Landroidx/databinding/DataBindingComponent;Landroid/view/View;ILandroidx/databinding/ViewDataBinding$IncludedLayouts;Landroid/util/SparseIntArray;)[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/trimline/metrocrew/databinding/MembersImpl;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;[Ljava/lang/Object;)V

    .line 110
    return-void
.end method

.method private constructor <init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;[Ljava/lang/Object;)V
    .locals 15
    .param p1, "bindingComponent"    # Landroidx/databinding/DataBindingComponent;
    .param p2, "root"    # Landroid/view/View;
    .param p3, "bindings"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bindingComponent",
            "root",
            "bindings"
        }
    .end annotation

    .line 112
    const/16 v0, 0x9

    aget-object v0, p3, v0

    move-object v4, v0

    check-cast v4, Landroid/widget/TextView;

    const/4 v0, 0x7

    aget-object v0, p3, v0

    move-object v5, v0

    check-cast v5, Landroid/widget/TextView;

    const/4 v0, 0x2

    aget-object v0, p3, v0

    move-object v6, v0

    check-cast v6, Landroid/widget/EditText;

    const/4 v0, 0x5

    aget-object v0, p3, v0

    move-object v7, v0

    check-cast v7, Landroidx/cardview/widget/CardView;

    const/16 v0, 0xb

    aget-object v0, p3, v0

    move-object v8, v0

    check-cast v8, Landroidx/constraintlayout/widget/Guideline;

    const/16 v0, 0xc

    aget-object v0, p3, v0

    move-object v9, v0

    check-cast v9, Landroidx/constraintlayout/widget/Guideline;

    const/4 v0, 0x4

    aget-object v0, p3, v0

    move-object v10, v0

    check-cast v10, Landroid/widget/EditText;

    const/4 v0, 0x6

    aget-object v0, p3, v0

    move-object v11, v0

    check-cast v11, Landroid/widget/TextView;

    const/16 v0, 0x8

    aget-object v0, p3, v0

    move-object v12, v0

    check-cast v12, Landroid/widget/TextView;

    const/4 v0, 0x3

    aget-object v0, p3, v0

    move-object v13, v0

    check-cast v13, Landroid/widget/EditText;

    const/16 v0, 0xa

    aget-object v0, p3, v0

    move-object v14, v0

    check-cast v14, Landroid/widget/Button;

    const/4 v3, 0x0

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct/range {v0 .. v14}, Lcom/trimline/metrocrew/databinding/Members;-><init>(Ljava/lang/Object;Landroid/view/View;ILandroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/EditText;Landroidx/cardview/widget/CardView;Landroidx/constraintlayout/widget/Guideline;Landroidx/constraintlayout/widget/Guideline;Landroid/widget/EditText;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/EditText;Landroid/widget/Button;)V

    .line 35
    new-instance v1, Lcom/trimline/metrocrew/databinding/MembersImpl$1;

    invoke-direct {v1, p0}, Lcom/trimline/metrocrew/databinding/MembersImpl$1;-><init>(Lcom/trimline/metrocrew/databinding/MembersImpl;)V

    iput-object v1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->NameeditandroidTextAttrChanged:Landroidx/databinding/InverseBindingListener;

    .line 59
    new-instance v1, Lcom/trimline/metrocrew/databinding/MembersImpl$2;

    invoke-direct {v1, p0}, Lcom/trimline/metrocrew/databinding/MembersImpl$2;-><init>(Lcom/trimline/metrocrew/databinding/MembersImpl;)V

    iput-object v1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->ideditandroidTextAttrChanged:Landroidx/databinding/InverseBindingListener;

    .line 83
    new-instance v1, Lcom/trimline/metrocrew/databinding/MembersImpl$3;

    invoke-direct {v1, p0}, Lcom/trimline/metrocrew/databinding/MembersImpl$3;-><init>(Lcom/trimline/metrocrew/databinding/MembersImpl;)V

    iput-object v1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->phoneeditandroidTextAttrChanged:Landroidx/databinding/InverseBindingListener;

    .line 231
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mDirtyFlags:J

    .line 125
    iget-object v1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->Nameedit:Landroid/widget/EditText;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    .line 126
    iget-object v1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->idedit:Landroid/widget/EditText;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    .line 127
    const/4 v1, 0x0

    aget-object v1, p3, v1

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object v1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mboundView0:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 128
    iget-object v1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mboundView0:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v1, v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->setTag(Ljava/lang/Object;)V

    .line 129
    const/4 v1, 0x1

    aget-object v1, p3, v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mboundView1:Landroid/widget/TextView;

    .line 130
    iget-object v1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mboundView1:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 131
    iget-object v1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->phoneedit:Landroid/widget/EditText;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    .line 132
    move-object/from16 v2, p2

    invoke-virtual {p0, v2}, Lcom/trimline/metrocrew/databinding/MembersImpl;->setRootTag(Landroid/view/View;)V

    .line 134
    invoke-virtual {p0}, Lcom/trimline/metrocrew/databinding/MembersImpl;->invalidateAll()V

    .line 135
    return-void
.end method


# virtual methods
.method protected executeBindings()V
    .locals 13

    .line 185
    const-wide/16 v0, 0x0

    .line 186
    .local v0, "dirtyFlags":J
    monitor-enter p0

    .line 187
    :try_start_0
    iget-wide v2, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mDirtyFlags:J

    move-wide v0, v2

    .line 188
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mDirtyFlags:J

    .line 189
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 190
    const/4 v4, 0x0

    .line 191
    .local v4, "dName":Ljava/lang/String;
    const/4 v5, 0x0

    .line 192
    .local v5, "dPhoneNo":Ljava/lang/String;
    const/4 v6, 0x0

    .line 193
    .local v6, "dIDNo":Ljava/lang/String;
    const/4 v7, 0x0

    .line 194
    .local v7, "dNo":Ljava/lang/String;
    iget-object v8, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mD:Lcom/trimline/metrocrew/Member;

    .line 196
    .local v8, "d":Lcom/trimline/metrocrew/Member;
    const-wide/16 v9, 0x3

    and-long v11, v0, v9

    cmp-long v11, v11, v2

    if-eqz v11, :cond_0

    .line 200
    if-eqz v8, :cond_0

    .line 202
    iget-object v4, v8, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    .line 204
    iget-object v5, v8, Lcom/trimline/metrocrew/Member;->Phone_No:Ljava/lang/String;

    .line 206
    iget-object v6, v8, Lcom/trimline/metrocrew/Member;->ID_No:Ljava/lang/String;

    .line 208
    iget-object v7, v8, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    .line 212
    :cond_0
    and-long/2addr v9, v0

    cmp-long v9, v9, v2

    if-eqz v9, :cond_1

    .line 215
    iget-object v9, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->Nameedit:Landroid/widget/EditText;

    invoke-static {v9, v4}, Landroidx/databinding/adapters/TextViewBindingAdapter;->setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 216
    iget-object v9, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->idedit:Landroid/widget/EditText;

    invoke-static {v9, v6}, Landroidx/databinding/adapters/TextViewBindingAdapter;->setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 217
    iget-object v9, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mboundView1:Landroid/widget/TextView;

    invoke-static {v9, v7}, Landroidx/databinding/adapters/TextViewBindingAdapter;->setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 218
    iget-object v9, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->phoneedit:Landroid/widget/EditText;

    invoke-static {v9, v5}, Landroidx/databinding/adapters/TextViewBindingAdapter;->setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    .line 220
    :cond_1
    const-wide/16 v9, 0x2

    and-long/2addr v9, v0

    cmp-long v2, v9, v2

    if-eqz v2, :cond_2

    .line 223
    iget-object v2, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->Nameedit:Landroid/widget/EditText;

    const/4 v3, 0x0

    move-object v9, v3

    check-cast v9, Landroidx/databinding/adapters/TextViewBindingAdapter$BeforeTextChanged;

    move-object v9, v3

    check-cast v9, Landroidx/databinding/adapters/TextViewBindingAdapter$OnTextChanged;

    move-object v9, v3

    check-cast v9, Landroidx/databinding/adapters/TextViewBindingAdapter$AfterTextChanged;

    iget-object v9, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->NameeditandroidTextAttrChanged:Landroidx/databinding/InverseBindingListener;

    invoke-static {v2, v3, v3, v3, v9}, Landroidx/databinding/adapters/TextViewBindingAdapter;->setTextWatcher(Landroid/widget/TextView;Landroidx/databinding/adapters/TextViewBindingAdapter$BeforeTextChanged;Landroidx/databinding/adapters/TextViewBindingAdapter$OnTextChanged;Landroidx/databinding/adapters/TextViewBindingAdapter$AfterTextChanged;Landroidx/databinding/InverseBindingListener;)V

    .line 224
    iget-object v2, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->idedit:Landroid/widget/EditText;

    iget-object v9, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->ideditandroidTextAttrChanged:Landroidx/databinding/InverseBindingListener;

    invoke-static {v2, v3, v3, v3, v9}, Landroidx/databinding/adapters/TextViewBindingAdapter;->setTextWatcher(Landroid/widget/TextView;Landroidx/databinding/adapters/TextViewBindingAdapter$BeforeTextChanged;Landroidx/databinding/adapters/TextViewBindingAdapter$OnTextChanged;Landroidx/databinding/adapters/TextViewBindingAdapter$AfterTextChanged;Landroidx/databinding/InverseBindingListener;)V

    .line 225
    iget-object v2, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->phoneedit:Landroid/widget/EditText;

    iget-object v9, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->phoneeditandroidTextAttrChanged:Landroidx/databinding/InverseBindingListener;

    invoke-static {v2, v3, v3, v3, v9}, Landroidx/databinding/adapters/TextViewBindingAdapter;->setTextWatcher(Landroid/widget/TextView;Landroidx/databinding/adapters/TextViewBindingAdapter$BeforeTextChanged;Landroidx/databinding/adapters/TextViewBindingAdapter$OnTextChanged;Landroidx/databinding/adapters/TextViewBindingAdapter$AfterTextChanged;Landroidx/databinding/InverseBindingListener;)V

    .line 227
    :cond_2
    return-void

    .line 189
    .end local v4    # "dName":Ljava/lang/String;
    .end local v5    # "dPhoneNo":Ljava/lang/String;
    .end local v6    # "dIDNo":Ljava/lang/String;
    .end local v7    # "dNo":Ljava/lang/String;
    .end local v8    # "d":Lcom/trimline/metrocrew/Member;
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public hasPendingBindings()Z
    .locals 4

    .line 147
    monitor-enter p0

    .line 148
    :try_start_0
    iget-wide v0, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 149
    monitor-exit p0

    const/4 v0, 0x1

    return v0

    .line 151
    :cond_0
    monitor-exit p0

    .line 152
    const/4 v0, 0x0

    return v0

    .line 151
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public invalidateAll()V
    .locals 2

    .line 139
    monitor-enter p0

    .line 140
    const-wide/16 v0, 0x2

    :try_start_0
    iput-wide v0, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mDirtyFlags:J

    .line 141
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    invoke-virtual {p0}, Lcom/trimline/metrocrew/databinding/MembersImpl;->requestRebind()V

    .line 143
    return-void

    .line 141
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected onFieldChange(ILjava/lang/Object;I)Z
    .locals 1
    .param p1, "localFieldId"    # I
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldId"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "localFieldId",
            "object",
            "fieldId"
        }
    .end annotation

    .line 178
    nop

    .line 180
    const/4 v0, 0x0

    return v0
.end method

.method public setD(Lcom/trimline/metrocrew/Member;)V
    .locals 4
    .param p1, "D"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "D"
        }
    .end annotation

    .line 168
    iput-object p1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mD:Lcom/trimline/metrocrew/Member;

    .line 169
    monitor-enter p0

    .line 170
    :try_start_0
    iget-wide v0, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mDirtyFlags:J

    const-wide/16 v2, 0x1

    or-long/2addr v0, v2

    iput-wide v0, p0, Lcom/trimline/metrocrew/databinding/MembersImpl;->mDirtyFlags:J

    .line 171
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/databinding/MembersImpl;->notifyPropertyChanged(I)V

    .line 173
    invoke-super {p0}, Lcom/trimline/metrocrew/databinding/Members;->requestRebind()V

    .line 174
    return-void

    .line 171
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public setVariable(ILjava/lang/Object;)Z
    .locals 2
    .param p1, "variableId"    # I
    .param p2, "variable"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "variableId",
            "variable"
        }
    .end annotation

    .line 157
    const/4 v0, 0x1

    .line 158
    .local v0, "variableSet":Z
    const/4 v1, 0x1

    if-ne v1, p1, :cond_0

    .line 159
    move-object v1, p2

    check-cast v1, Lcom/trimline/metrocrew/Member;

    invoke-virtual {p0, v1}, Lcom/trimline/metrocrew/databinding/MembersImpl;->setD(Lcom/trimline/metrocrew/Member;)V

    goto :goto_0

    .line 162
    :cond_0
    const/4 v0, 0x0

    .line 164
    :goto_0
    return v0
.end method
