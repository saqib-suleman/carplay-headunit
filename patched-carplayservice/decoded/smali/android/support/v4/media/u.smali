.class final Landroid/support/v4/media/u;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic kM:Landroid/support/v4/media/s;

.field final synthetic kN:Landroid/support/v4/media/az;


# direct methods
.method constructor <init>(Landroid/support/v4/media/s;Landroid/support/v4/media/az;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/u;->kM:Landroid/support/v4/media/s;

    iput-object p2, p0, Landroid/support/v4/media/u;->kN:Landroid/support/v4/media/az;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/u;->kM:Landroid/support/v4/media/s;

    invoke-static {v0}, Landroid/support/v4/media/s;->b(Landroid/support/v4/media/s;)Landroid/support/v4/media/p;

    iget-object v0, p0, Landroid/support/v4/media/u;->kM:Landroid/support/v4/media/s;

    invoke-static {v0}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;)Landroid/support/v4/media/o;

    return-void
.end method
