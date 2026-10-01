.class public Lcom/trimline/metrocrew/agent;
.super Ljava/lang/Object;
.source "agent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/agent$Model;,
        Lcom/trimline/metrocrew/agent$Repository;,
        Lcom/trimline/metrocrew/agent$dao;
    }
.end annotation


# instance fields
.field public Account:Ljava/lang/String;

.field public Account_type:I

.field public Agent_Code:Ljava/lang/String;

.field public Balance:D

.field public Constituency:Ljava/lang/String;

.field public Customer_ID_No:Ljava/lang/String;

.field public Mobile_No:Ljava/lang/String;

.field public Name:Ljava/lang/String;

.field public Password:Ljava/lang/String;

.field public Status:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
