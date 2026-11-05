.class final Landroid/support/v4/media/am;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic kP:Landroid/support/v4/media/w;

.field final synthetic lh:I


# direct methods
.method constructor <init>(Landroid/support/v4/media/w;I)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/am;->kP:Landroid/support/v4/media/w;

    iput p2, p0, Landroid/support/v4/media/am;->lh:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/am;->kP:Landroid/support/v4/media/w;

    iget-object v0, v0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v0}, Landroid/support/v4/media/s;->b(Landroid/support/v4/media/s;)Landroid/support/v4/media/p;

    iget-object v0, p0, Landroid/support/v4/media/am;->kP:Landroid/support/v4/media/w;

    iget-object v0, v0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v0}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;)Landroid/support/v4/media/o;

    return-void
.end method
