.class public Lcom/trimline/metrocrew/payment_modes;
.super Ljava/lang/Object;
.source "payment_modes.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/payment_modes$Model;,
        Lcom/trimline/metrocrew/payment_modes$Repository;,
        Lcom/trimline/metrocrew/payment_modes$dao;
    }
.end annotation


# instance fields
.field public Code:Ljava/lang/String;

.field public Name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes;->Name:Ljava/lang/String;

    return-object v0
.end method
