.class final Landroid/net/a/z;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/net/a/y;


# instance fields
.field final synthetic fE:Landroid/os/PowerManager$WakeLock;


# direct methods
.method constructor <init>(Landroid/os/PowerManager$WakeLock;)V
    .locals 0

    iput-object p1, p0, Landroid/net/a/z;->fE:Landroid/os/PowerManager$WakeLock;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final ao()V
    .locals 3

    iget-object v0, p0, Landroid/net/a/z;->fE:Landroid/os/PowerManager$WakeLock;

    const-wide/16 v1, 0xdac

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    return-void
.end method
