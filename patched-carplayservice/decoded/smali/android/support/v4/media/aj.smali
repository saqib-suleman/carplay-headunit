.class final Landroid/support/v4/media/aj;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic kP:Landroid/support/v4/media/w;

.field final synthetic le:Ljava/util/List;


# direct methods
.method constructor <init>(Landroid/support/v4/media/w;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/aj;->kP:Landroid/support/v4/media/w;

    iput-object p2, p0, Landroid/support/v4/media/aj;->le:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/aj;->kP:Landroid/support/v4/media/w;

    iget-object v0, v0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v0}, Landroid/support/v4/media/s;->b(Landroid/support/v4/media/s;)Landroid/support/v4/media/p;

    iget-object v0, p0, Landroid/support/v4/media/aj;->kP:Landroid/support/v4/media/w;

    iget-object v0, v0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v0}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;)Landroid/support/v4/media/o;

    return-void
.end method
