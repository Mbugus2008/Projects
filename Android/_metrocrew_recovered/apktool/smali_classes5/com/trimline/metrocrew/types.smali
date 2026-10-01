.class public Lcom/trimline/metrocrew/types;
.super Ljava/lang/Object;
.source "types.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/types$Model;,
        Lcom/trimline/metrocrew/types$Repository;,
        Lcom/trimline/metrocrew/types$dao;
    }
.end annotation


# instance fields
.field public Account:Ljava/lang/String;

.field public Active:Ljava/lang/Boolean;

.field public Code:Ljava/lang/String;

.field public Name:Ljava/lang/String;

.field public Order:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/trimline/metrocrew/types;->Name:Ljava/lang/String;

    return-object v0
.end method
