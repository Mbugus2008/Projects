.class public Lcom/trimline/metrocrew/Member;
.super Ljava/lang/Object;
.source "Member.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/Member$autocomplete;,
        Lcom/trimline/metrocrew/Member$Model;,
        Lcom/trimline/metrocrew/Member$Repository;,
        Lcom/trimline/metrocrew/Member$dao;
    }
.end annotation


# instance fields
.field public Current_Savings:D

.field public Current_Shares:D

.field public ID_No:Ljava/lang/String;

.field public Key:Ljava/lang/String;

.field public Name:Ljava/lang/String;

.field public No:Ljava/lang/String;

.field public Outstanding_Balance:D

.field public Phone_No:Ljava/lang/String;

.field public Registration_Fee_Paid:D

.field public Shares_Retained:D

.field public loans:[Lcom/trimline/metrocrew/loan;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
