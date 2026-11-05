.class public Landroid/support/v4/media/as;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation


# instance fields
.field private final lw:Landroid/support/v4/media/av;


# virtual methods
.method public close()V
    .locals 1

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/media/as;->lw:Landroid/support/v4/media/av;

    invoke-interface {v0}, Landroid/support/v4/media/av;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method
