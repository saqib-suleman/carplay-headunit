.class final Landroid/support/v4/media/z;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic kP:Landroid/support/v4/media/w;

.field final synthetic kS:Landroid/support/v4/media/ay;

.field final synthetic kT:Landroid/os/Bundle;

.field final synthetic kU:Landroid/os/ResultReceiver;


# direct methods
.method constructor <init>(Landroid/support/v4/media/w;Landroid/support/v4/media/ay;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/z;->kP:Landroid/support/v4/media/w;

    iput-object p2, p0, Landroid/support/v4/media/z;->kS:Landroid/support/v4/media/ay;

    iput-object p3, p0, Landroid/support/v4/media/z;->kT:Landroid/os/Bundle;

    iput-object p4, p0, Landroid/support/v4/media/z;->kU:Landroid/os/ResultReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/z;->kP:Landroid/support/v4/media/w;

    iget-object v0, v0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v0}, Landroid/support/v4/media/s;->b(Landroid/support/v4/media/s;)Landroid/support/v4/media/p;

    iget-object v0, p0, Landroid/support/v4/media/z;->kP:Landroid/support/v4/media/w;

    iget-object v0, v0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v0}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;)Landroid/support/v4/media/o;

    return-void
.end method
