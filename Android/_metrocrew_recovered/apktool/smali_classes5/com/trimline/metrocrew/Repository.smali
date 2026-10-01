.class public Lcom/trimline/metrocrew/Repository;
.super Ljava/lang/Object;
.source "Repository.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private d:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TD;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dao"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;)V"
        }
    .end annotation

    .line 6
    .local p0, "this":Lcom/trimline/metrocrew/Repository;, "Lcom/trimline/metrocrew/Repository<TD;>;"
    .local p1, "dao":Ljava/lang/Object;, "TD;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput-object p1, p0, Lcom/trimline/metrocrew/Repository;->d:Ljava/lang/Object;

    .line 8
    return-void
.end method
