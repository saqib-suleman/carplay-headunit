.class final Landroid/net/a/e;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/android/server/net/NetlinkTracker$Callback;


# instance fields
.field final synthetic eX:Landroid/net/a/d;


# direct methods
.method constructor <init>(Landroid/net/a/d;)V
    .locals 0

    iput-object p1, p0, Landroid/net/a/e;->eX:Landroid/net/a/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final update()V
    .locals 2

    iget-object v0, p0, Landroid/net/a/e;->eX:Landroid/net/a/d;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Landroid/net/a/d;->sendMessage(I)V

    return-void
.end method
