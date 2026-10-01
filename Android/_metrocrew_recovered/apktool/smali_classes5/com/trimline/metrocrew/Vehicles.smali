.class public Lcom/trimline/metrocrew/Vehicles;
.super Ljava/lang/Object;
.source "Vehicles.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/Vehicles$autocomplete;,
        Lcom/trimline/metrocrew/Vehicles$Model;,
        Lcom/trimline/metrocrew/Vehicles$Repository;,
        Lcom/trimline/metrocrew/Vehicles$dao;,
        Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;
    }
.end annotation


# instance fields
.field public Arrears:D

.field public Code:Ljava/lang/String;

.field public Daily_Contribution:Ljava/lang/Double;

.field public Fleet_No:Ljava/lang/String;

.field public Id_Number:Ljava/lang/String;

.field public Penalty:D

.field public Start_Date:Ljava/lang/String;

.field public Vehicle_Number:Ljava/lang/String;

.field public vehicle_type:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles;->Code:Ljava/lang/String;

    return-object v0
.end method
