.class public Lcom/trimline/metrocrew/Printer$Receipts;
.super Ljava/lang/Object;
.source "Printer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Printer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Receipts"
.end annotation


# instance fields
.field public Count:I

.field public Name:Ljava/lang/String;

.field public No:Ljava/lang/String;

.field public Total:Ljava/lang/Double;

.field public date:Ljava/lang/String;

.field public receipt:Ljava/lang/String;

.field public user:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$Receipts;->date:Ljava/lang/String;

    return-object v0
.end method
