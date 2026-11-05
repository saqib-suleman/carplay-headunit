.class public final Landroid/support/v4/media/o;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation


# instance fields
.field private final kn:Landroid/support/v4/media/r;


# virtual methods
.method public final close()V
    .locals 1

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/media/o;->kn:Landroid/support/v4/media/r;

    invoke-interface {v0}, Landroid/support/v4/media/r;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method
