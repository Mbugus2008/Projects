.class public Lcom/trimline/metrocrew/Receipts;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "Receipts.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/Receipts$autocomplete;,
        Lcom/trimline/metrocrew/Receipts$getloans;
    }
.end annotation


# instance fields
.field LAUNCH_SECOND_ACTIVITY:I

.field adapter:Lcom/trimline/metrocrew/Member$autocomplete;

.field add:Landroid/widget/Button;

.field addmember:Landroid/widget/ImageButton;

.field amount:Landroid/widget/EditText;

.field balances:Landroid/widget/TextView;

.field cancel:Landroid/widget/Button;

.field lmodel:Lcom/trimline/metrocrew/loan$Model;

.field loanspinner:Landroid/widget/Spinner;

.field member:Lcom/trimline/metrocrew/Member;

.field memberno:Landroid/widget/AutoCompleteTextView;

.field model:Lcom/trimline/metrocrew/Member$Model;

.field private p:Lcom/trimline/metrocrew/Printer$printer;

.field paymentmodes:Landroid/widget/Spinner;

.field pmodel:Lcom/trimline/metrocrew/payment_modes$Model;

.field print:Landroid/widget/Button;

.field recordCount:Landroid/widget/TextView;

.field theader:Lcom/trimline/metrocrew/theader;

.field theaderModel:Lcom/trimline/metrocrew/theader$Model;

.field tmodel:Lcom/trimline/metrocrew/types$Model;

.field total:Landroid/widget/TextView;

.field transactionList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation
.end field

.field trmodel:Lcom/trimline/metrocrew/transaction$Model;

.field ttypes:Landroid/widget/Spinner;

.field vehicle:Landroid/widget/AutoCompleteTextView;

.field vmodel:Lcom/trimline/metrocrew/Vehicles$Model;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 53
    new-instance v0, Lcom/trimline/metrocrew/Printer$printer;

    invoke-direct {v0}, Lcom/trimline/metrocrew/Printer$printer;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->p:Lcom/trimline/metrocrew/Printer$printer;

    .line 58
    const/4 v0, 0x1

    iput v0, p0, Lcom/trimline/metrocrew/Receipts;->LAUNCH_SECOND_ACTIVITY:I

    return-void
.end method

.method static synthetic lambda$onClick$0(Lcom/trimline/metrocrew/transaction;)D
    .locals 2
    .param p0, "a"    # Lcom/trimline/metrocrew/transaction;

    .line 364
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method createNewHeader()V
    .locals 4

    .line 294
    new-instance v0, Lcom/trimline/metrocrew/theader;

    invoke-direct {v0}, Lcom/trimline/metrocrew/theader;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    .line 295
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    .line 296
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    const-string v1, "Cash"

    iput-object v1, v0, Lcom/trimline/metrocrew/theader;->PayMode:Ljava/lang/String;

    .line 297
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    sget-object v1, Lcom/trimline/metrocrew/agent$Model;->CurrentAgent:Lcom/trimline/metrocrew/agent;

    iget-object v1, v1, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    iput-object v1, v0, Lcom/trimline/metrocrew/theader;->Cashier:Ljava/lang/String;

    .line 298
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    new-instance v1, Ljava/sql/Date;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/sql/Date;-><init>(J)V

    iput-object v1, v0, Lcom/trimline/metrocrew/theader;->Date:Ljava/sql/Date;

    .line 299
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    new-instance v1, Ljava/sql/Date;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/sql/Date;-><init>(J)V

    iput-object v1, v0, Lcom/trimline/metrocrew/theader;->Created_Date_Time:Ljava/sql/Date;

    .line 300
    return-void
.end method

.method public getmember(Lcom/trimline/metrocrew/Member;)V
    .locals 4
    .param p1, "member"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "member"
        }
    .end annotation

    .line 255
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    iget-object v1, p1, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 256
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v1, p1, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    iput-object v1, v0, Lcom/trimline/metrocrew/theader;->Account_No:Ljava/lang/String;

    .line 257
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v1, p1, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    iput-object v1, v0, Lcom/trimline/metrocrew/theader;->Name:Ljava/lang/String;

    .line 258
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v1, p1, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    iput-object v1, v0, Lcom/trimline/metrocrew/theader;->Received_From:Ljava/lang/String;

    .line 259
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theaderModel:Lcom/trimline/metrocrew/theader$Model;

    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/theader$Model;->updateHeader(Lcom/trimline/metrocrew/theader;)V

    .line 260
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 261
    .local v0, "s":Ljava/lang/StringBuilder;
    iget-object v1, p1, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Name        : <b>%s</b><br/>"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    iget-wide v1, p1, Lcom/trimline/metrocrew/Member;->Outstanding_Balance:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Loans       : <b>%,.2f</b><br/>"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    iget-wide v1, p1, Lcom/trimline/metrocrew/Member;->Current_Shares:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Deposits    : <b>%,.2f</b><br/>"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    iget-wide v1, p1, Lcom/trimline/metrocrew/Member;->Shares_Retained:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Shares      : <b>%,.2f</b><br/>"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    iget-wide v1, p1, Lcom/trimline/metrocrew/Member;->Registration_Fee_Paid:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Registration: <b>%,.2f</b><br/>"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    iget-wide v1, p1, Lcom/trimline/metrocrew/Member;->Current_Savings:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Savings     : <b>%,.2f</b>"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts;->balances:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 269
    nop

    .line 270
    new-instance v1, Lcom/trimline/metrocrew/Receipts$getloans;

    iget-object v2, p1, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    invoke-direct {v1, p0, v2}, Lcom/trimline/metrocrew/Receipts$getloans;-><init>(Lcom/trimline/metrocrew/Receipts;Ljava/lang/String;)V

    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v1, v2, v3}, Lcom/trimline/metrocrew/Receipts$getloans;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 273
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "requestCode",
            "resultCode",
            "data"
        }
    .end annotation

    .line 276
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 278
    iget v0, p0, Lcom/trimline/metrocrew/Receipts;->LAUNCH_SECOND_ACTIVITY:I

    if-ne p1, v0, :cond_1

    .line 279
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 281
    const-string v0, "member"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/Member;

    .line 282
    .local v0, "m":Lcom/trimline/metrocrew/Member;
    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v1, v0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Mm"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts;->model:Lcom/trimline/metrocrew/Member$Model;

    invoke-virtual {v1, v0}, Lcom/trimline/metrocrew/Member$Model;->insert(Lcom/trimline/metrocrew/Member;)V

    .line 284
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts;->adapter:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-virtual {v1, v0}, Lcom/trimline/metrocrew/Member$autocomplete;->add(Ljava/lang/Object;)V

    .line 285
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts;->adapter:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-virtual {v1}, Lcom/trimline/metrocrew/Member$autocomplete;->notifyDataSetChanged()V

    .line 286
    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->getmember(Lcom/trimline/metrocrew/Member;)V

    .line 288
    .end local v0    # "m":Lcom/trimline/metrocrew/Member;
    :cond_0
    nop

    .line 292
    :cond_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 304
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const-string v1, ""

    sparse-switch v0, :sswitch_data_0

    goto/16 :goto_0

    .line 404
    :sswitch_0
    new-instance v0, Lcom/trimline/metrocrew/Member;

    invoke-direct {v0}, Lcom/trimline/metrocrew/Member;-><init>()V

    .line 405
    .local v0, "m":Lcom/trimline/metrocrew/Member;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/trimline/metrocrew/add_edit_member;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 406
    .local v1, "inte":Landroid/content/Intent;
    const-string v2, "member"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 407
    iget v2, p0, Lcom/trimline/metrocrew/Receipts;->LAUNCH_SECOND_ACTIVITY:I

    invoke-virtual {p0, v1, v2}, Lcom/trimline/metrocrew/Receipts;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 363
    .end local v0    # "m":Lcom/trimline/metrocrew/Member;
    .end local v1    # "inte":Landroid/content/Intent;
    :sswitch_1
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v2, v2, Lcom/trimline/metrocrew/transaction$Model;->transline:Ljava/util/List;

    iput-object v2, v0, Lcom/trimline/metrocrew/theader;->tlines:Ljava/util/List;

    .line 364
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v2, v2, Lcom/trimline/metrocrew/transaction$Model;->transline:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v2

    new-instance v3, Lcom/trimline/metrocrew/Receipts$$ExternalSyntheticLambda0;

    invoke-direct {v3}, Lcom/trimline/metrocrew/Receipts$$ExternalSyntheticLambda0;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->mapToDouble(Ljava/util/function/ToDoubleFunction;)Ljava/util/stream/DoubleStream;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/stream/DoubleStream;->sum()D

    move-result-wide v2

    double-to-float v2, v2

    iput v2, v0, Lcom/trimline/metrocrew/theader;->Amount_Recieved:F

    .line 365
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget v0, v0, Lcom/trimline/metrocrew/theader;->Amount_Recieved:F

    const/4 v2, 0x0

    cmpg-float v0, v0, v2

    const/4 v2, 0x0

    if-gtz v0, :cond_0

    .line 367
    const-string v0, "No Transaction to print"

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 368
    return-void

    .line 371
    :cond_0
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v3, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v3, v3, Lcom/trimline/metrocrew/transaction$Model;->transline:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/stream/Stream;->count()J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v0, Lcom/trimline/metrocrew/theader;->From_Entry_No:I

    .line 372
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theaderModel:Lcom/trimline/metrocrew/theader$Model;

    iget-object v3, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v0, v3}, Lcom/trimline/metrocrew/theader$Model;->insert(Lcom/trimline/metrocrew/theader;)V

    .line 373
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v3, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v3, v3, Lcom/trimline/metrocrew/transaction$Model;->transline:Ljava/util/List;

    invoke-virtual {v0, v3}, Lcom/trimline/metrocrew/transaction$Model;->insert(Ljava/util/List;)V

    .line 374
    invoke-virtual {p0}, Lcom/trimline/metrocrew/Receipts;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f0800be

    invoke-static {v0, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 375
    .local v0, "b":Landroid/graphics/Bitmap;
    iget-object v3, p0, Lcom/trimline/metrocrew/Receipts;->p:Lcom/trimline/metrocrew/Printer$printer;

    iget-object v4, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v3, v0, v4}, Lcom/trimline/metrocrew/Printer$printer;->printcollection(Landroid/graphics/Bitmap;Lcom/trimline/metrocrew/theader;)V

    .line 376
    iget-object v3, p0, Lcom/trimline/metrocrew/Receipts;->paymentmodes:Landroid/widget/Spinner;

    invoke-virtual {v3, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 377
    iget-object v3, p0, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v3}, Landroid/widget/AutoCompleteTextView;->clearListSelection()V

    .line 378
    iget-object v3, p0, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v3, v1, v2}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;Z)V

    .line 379
    iget-object v3, p0, Lcom/trimline/metrocrew/Receipts;->balances:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 380
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts;->ttypes:Landroid/widget/Spinner;

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 381
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lcom/trimline/metrocrew/transaction$Model;->transline:Ljava/util/List;

    .line 382
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v1, v1, Lcom/trimline/metrocrew/transaction$Model;->translines:Landroidx/lifecycle/MutableLiveData;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v2, v2, Lcom/trimline/metrocrew/transaction$Model;->transline:Ljava/util/List;

    invoke-virtual {v1, v2}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    .line 384
    invoke-virtual {p0}, Lcom/trimline/metrocrew/Receipts;->createNewHeader()V

    .line 385
    new-instance v1, Lcom/trimline/metrocrew/Receipts$8;

    invoke-direct {v1, p0}, Lcom/trimline/metrocrew/Receipts$8;-><init>(Lcom/trimline/metrocrew/Receipts;)V

    .line 391
    .local v1, "myRunnable5":Ljava/lang/Runnable;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 393
    new-instance v2, Lcom/trimline/metrocrew/Receipts$9;

    invoke-direct {v2, p0}, Lcom/trimline/metrocrew/Receipts$9;-><init>(Lcom/trimline/metrocrew/Receipts;)V

    .line 399
    .local v2, "lines":Ljava/lang/Runnable;
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 401
    .end local v0    # "b":Landroid/graphics/Bitmap;
    .end local v1    # "myRunnable5":Ljava/lang/Runnable;
    .end local v2    # "lines":Ljava/lang/Runnable;
    goto/16 :goto_0

    .line 306
    :sswitch_2
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->vehicle:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v2}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/trimline/metrocrew/theader;->Group_Name:Ljava/lang/String;

    .line 307
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v0, v0, Lcom/trimline/metrocrew/theader;->PayMode:Ljava/lang/String;

    const/4 v2, 0x1

    if-nez v0, :cond_1

    .line 308
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->paymentmodes:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->performClick()Z

    .line 309
    invoke-virtual {p0}, Lcom/trimline/metrocrew/Receipts;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Payment Mode is blank"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 310
    return-void

    .line 312
    :cond_1
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 313
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    const-string v1, "Please enter member no"

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setError(Ljava/lang/CharSequence;)V

    .line 314
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->requestFocus()Z

    .line 315
    return-void

    .line 317
    :cond_2
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->amount:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 318
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->amount:Landroid/widget/EditText;

    const-string v1, "Please enter amount"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 319
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->amount:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 320
    return-void

    .line 322
    :cond_3
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->amount:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmpg-double v0, v3, v5

    if-gtz v0, :cond_4

    .line 323
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->amount:Landroid/widget/EditText;

    const-string v1, "Please enter valid amount"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 324
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->amount:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 325
    return-void

    .line 327
    :cond_4
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    if-nez v0, :cond_5

    .line 328
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->ttypes:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->performClick()Z

    .line 329
    invoke-virtual {p0}, Lcom/trimline/metrocrew/Receipts;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Transaction type is blank"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 330
    return-void

    .line 332
    :cond_5
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v3, "loan"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 333
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction;->Loan_No:Ljava/lang/String;

    if-nez v0, :cond_6

    .line 334
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->loanspinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->performClick()Z

    .line 335
    invoke-virtual {p0}, Lcom/trimline/metrocrew/Receipts;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Loan No is blank"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 336
    return-void

    .line 340
    :cond_6
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v2, v2, Lcom/trimline/metrocrew/theader;->PayMode:Ljava/lang/String;

    iput-object v2, v0, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    .line 342
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v2, v2, Lcom/trimline/metrocrew/theader;->Account_No:Ljava/lang/String;

    iput-object v2, v0, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    .line 343
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->amount:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v2

    iput-object v2, v0, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    .line 344
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v2, v2, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    iput-object v2, v0, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    .line 345
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    const-string v2, "MEMBER"

    iput-object v2, v0, Lcom/trimline/metrocrew/transaction;->Type:Ljava/lang/String;

    .line 350
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v2, v2, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    invoke-virtual {v0, v2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "single"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction$Model;->transline:Ljava/util/List;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v2, v2, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 352
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v2, v2, Lcom/trimline/metrocrew/transaction$Model;->transline:Ljava/util/List;

    invoke-virtual {v0, v2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "single2"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 353
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction$Model;->translines:Landroidx/lifecycle/MutableLiveData;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v2, v2, Lcom/trimline/metrocrew/transaction$Model;->transline:Ljava/util/List;

    invoke-virtual {v0, v2}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    .line 355
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->amount:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 356
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    new-instance v1, Lcom/trimline/metrocrew/transaction;

    invoke-direct {v1}, Lcom/trimline/metrocrew/transaction;-><init>()V

    iput-object v1, v0, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    .line 359
    nop

    .line 411
    :goto_0
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0a0001 -> :sswitch_2
        0x7f0a000f -> :sswitch_1
        0x7f0a0056 -> :sswitch_0
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 62
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 63
    const v0, 0x7f0d0020

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->setContentView(I)V

    .line 64
    invoke-static {p0}, Landroidx/lifecycle/ViewModelProviders;->of(Landroidx/fragment/app/FragmentActivity;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object v0

    const-class v1, Lcom/trimline/metrocrew/Member$Model;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/Member$Model;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->model:Lcom/trimline/metrocrew/Member$Model;

    .line 65
    invoke-static {p0}, Landroidx/lifecycle/ViewModelProviders;->of(Landroidx/fragment/app/FragmentActivity;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object v0

    const-class v1, Lcom/trimline/metrocrew/types$Model;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/types$Model;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->tmodel:Lcom/trimline/metrocrew/types$Model;

    .line 66
    invoke-static {p0}, Landroidx/lifecycle/ViewModelProviders;->of(Landroidx/fragment/app/FragmentActivity;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object v0

    const-class v1, Lcom/trimline/metrocrew/loan$Model;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/loan$Model;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->lmodel:Lcom/trimline/metrocrew/loan$Model;

    .line 67
    invoke-static {p0}, Landroidx/lifecycle/ViewModelProviders;->of(Landroidx/fragment/app/FragmentActivity;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object v0

    const-class v1, Lcom/trimline/metrocrew/payment_modes$Model;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/payment_modes$Model;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->pmodel:Lcom/trimline/metrocrew/payment_modes$Model;

    .line 68
    invoke-static {p0}, Landroidx/lifecycle/ViewModelProviders;->of(Landroidx/fragment/app/FragmentActivity;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object v0

    const-class v1, Lcom/trimline/metrocrew/transaction$Model;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/transaction$Model;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    .line 69
    invoke-static {p0}, Landroidx/lifecycle/ViewModelProviders;->of(Landroidx/fragment/app/FragmentActivity;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object v0

    const-class v1, Lcom/trimline/metrocrew/theader$Model;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/theader$Model;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->theaderModel:Lcom/trimline/metrocrew/theader$Model;

    .line 70
    invoke-static {p0}, Landroidx/lifecycle/ViewModelProviders;->of(Landroidx/fragment/app/FragmentActivity;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object v0

    const-class v1, Lcom/trimline/metrocrew/Vehicles$Model;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/Vehicles$Model;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->vmodel:Lcom/trimline/metrocrew/Vehicles$Model;

    .line 71
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    sget-object v1, Lcom/trimline/metrocrew/agent$Model;->CurrentAgent:Lcom/trimline/metrocrew/agent;

    invoke-virtual {v0, v1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Logged in user"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    invoke-virtual {p0}, Lcom/trimline/metrocrew/Receipts;->createNewHeader()V

    .line 74
    const v0, 0x7f0a01b5

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->recordCount:Landroid/widget/TextView;

    .line 75
    const v0, 0x7f0a006e

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->balances:Landroid/widget/TextView;

    .line 76
    const v0, 0x7f0a0246

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->ttypes:Landroid/widget/Spinner;

    .line 77
    const v0, 0x7f0a000a

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->loanspinner:Landroid/widget/Spinner;

    .line 78
    const v0, 0x7f0a01a3

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->paymentmodes:Landroid/widget/Spinner;

    .line 79
    const v0, 0x7f0a01b3

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    .line 80
    const v0, 0x7f0a024f

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->vehicle:Landroid/widget/AutoCompleteTextView;

    .line 82
    const v0, 0x7f0a0001

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->add:Landroid/widget/Button;

    .line 83
    const v0, 0x7f0a000f

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->print:Landroid/widget/Button;

    .line 84
    const v0, 0x7f0a0006

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->cancel:Landroid/widget/Button;

    .line 85
    const v0, 0x7f0a0056

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->addmember:Landroid/widget/ImageButton;

    .line 87
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->add:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->print:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->cancel:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts;->addmember:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    const v0, 0x7f0a005d

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->amount:Landroid/widget/EditText;

    .line 95
    const v0, 0x7f0a0238

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts;->total:Landroid/widget/TextView;

    .line 97
    const v0, 0x7f0a0244

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Receipts;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 98
    .local v0, "recyclerView":Landroidx/recyclerview/widget/RecyclerView;
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v1, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 99
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 101
    new-instance v1, Lcom/trimline/metrocrew/transaction$TransAdapter;

    new-instance v2, Lcom/trimline/metrocrew/Receipts$1;

    invoke-direct {v2, p0}, Lcom/trimline/metrocrew/Receipts$1;-><init>(Lcom/trimline/metrocrew/Receipts;)V

    invoke-direct {v1, v2}, Lcom/trimline/metrocrew/transaction$TransAdapter;-><init>(Lcom/trimline/metrocrew/DeleteListener;)V

    .line 110
    .local v1, "adapter":Lcom/trimline/metrocrew/transaction$TransAdapter;
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 112
    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    invoke-virtual {v2}, Lcom/trimline/metrocrew/transaction$Model;->gettransactions()Landroidx/lifecycle/LiveData;

    move-result-object v2

    new-instance v3, Lcom/trimline/metrocrew/Receipts$2;

    invoke-direct {v3, p0, v1}, Lcom/trimline/metrocrew/Receipts$2;-><init>(Lcom/trimline/metrocrew/Receipts;Lcom/trimline/metrocrew/transaction$TransAdapter;)V

    invoke-virtual {v2, p0, v3}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 133
    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    new-instance v3, Lcom/trimline/metrocrew/Receipts$3;

    invoke-direct {v3, p0}, Lcom/trimline/metrocrew/Receipts$3;-><init>(Lcom/trimline/metrocrew/Receipts;)V

    invoke-virtual {v2, v3}, Landroid/widget/AutoCompleteTextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 150
    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    new-instance v3, Lcom/trimline/metrocrew/Receipts$4;

    invoke-direct {v3, p0}, Lcom/trimline/metrocrew/Receipts$4;-><init>(Lcom/trimline/metrocrew/Receipts;)V

    invoke-virtual {v2, v3}, Landroid/widget/AutoCompleteTextView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 169
    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->ttypes:Landroid/widget/Spinner;

    new-instance v3, Lcom/trimline/metrocrew/Receipts$5;

    invoke-direct {v3, p0}, Lcom/trimline/metrocrew/Receipts$5;-><init>(Lcom/trimline/metrocrew/Receipts;)V

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 185
    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->paymentmodes:Landroid/widget/Spinner;

    new-instance v3, Lcom/trimline/metrocrew/Receipts$6;

    invoke-direct {v3, p0}, Lcom/trimline/metrocrew/Receipts$6;-><init>(Lcom/trimline/metrocrew/Receipts;)V

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 199
    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts;->loanspinner:Landroid/widget/Spinner;

    new-instance v3, Lcom/trimline/metrocrew/Receipts$7;

    invoke-direct {v3, p0}, Lcom/trimline/metrocrew/Receipts$7;-><init>(Lcom/trimline/metrocrew/Receipts;)V

    invoke-virtual {v2, v3}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 210
    nop

    .line 211
    new-instance v2, Lcom/trimline/metrocrew/Receipts$autocomplete;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/trimline/metrocrew/Receipts$autocomplete;-><init>(Lcom/trimline/metrocrew/Receipts;Lcom/trimline/metrocrew/Receipts$1;)V

    sget-object v3, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Void;

    invoke-virtual {v2, v3, v4}, Lcom/trimline/metrocrew/Receipts$autocomplete;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 251
    return-void
.end method
