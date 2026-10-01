.class Lcom/trimline/metrocrew/MainActivity$10;
.super Landroid/os/Handler;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/MainActivity;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/MainActivity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 370
    iput-object p1, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "msg"
        }
    .end annotation

    .line 373
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 412
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    .line 414
    .local v0, "preadBuf":[B
    new-instance v2, Ljava/lang/String;

    iget v3, p1, Landroid/os/Message;->arg1:I

    invoke-direct {v2, v0, v1, v3}, Ljava/lang/String;-><init>([BII)V

    .line 415
    .local v2, "preadMessage":Ljava/lang/String;
    const-string v1, "Printer Data Recieved"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    const-string v1, "\n"

    invoke-virtual {v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 417
    .local v1, "pread":[Ljava/lang/String;
    goto/16 :goto_0

    .line 405
    .end local v0    # "preadBuf":[B
    .end local v1    # "pread":[Ljava/lang/String;
    .end local v2    # "preadMessage":Ljava/lang/String;
    :pswitch_2
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v3, "Printer Disconnected"

    invoke-static {v0, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 406
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    iget-object v0, v0, Lcom/trimline/metrocrew/MainActivity;->printer:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 407
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    iget-object v0, v0, Lcom/trimline/metrocrew/MainActivity;->printer:Landroid/widget/CheckBox;

    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 408
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    iget-object v0, v0, Lcom/trimline/metrocrew/MainActivity;->printer:Landroid/widget/CheckBox;

    const/high16 v1, -0x10000

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 409
    goto/16 :goto_0

    .line 398
    :pswitch_3
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Printer connected"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 399
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    iget-object v0, v0, Lcom/trimline/metrocrew/MainActivity;->printer:Landroid/widget/CheckBox;

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 400
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    iget-object v0, v0, Lcom/trimline/metrocrew/MainActivity;->printer:Landroid/widget/CheckBox;

    const-string v1, "Printer Connected"

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 401
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    iget-object v0, v0, Lcom/trimline/metrocrew/MainActivity;->printer:Landroid/widget/CheckBox;

    const v1, -0xff0100

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 402
    goto :goto_0

    .line 427
    :pswitch_4
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 428
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    const-string v3, "toast"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 429
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 420
    :pswitch_5
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "device_name"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/trimline/metrocrew/MainActivity;->access$102(Lcom/trimline/metrocrew/MainActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 421
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 422
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Connected to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/trimline/metrocrew/MainActivity$10;->this$0:Lcom/trimline/metrocrew/MainActivity;

    .line 423
    invoke-static {v3}, Lcom/trimline/metrocrew/MainActivity;->access$100(Lcom/trimline/metrocrew/MainActivity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 422
    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 423
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 391
    :pswitch_6
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    .line 393
    .local v0, "writeBuf":[B
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    .line 395
    .local v1, "writeMessage":Ljava/lang/String;
    nop

    .line 433
    .end local v0    # "writeBuf":[B
    .end local v1    # "writeMessage":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
