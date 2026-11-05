.class final Landroid/net/dhcp/r;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic dB:Landroid/net/dhcp/b;


# direct methods
.method constructor <init>(Landroid/net/dhcp/b;)V
    .locals 0

    iput-object p1, p0, Landroid/net/dhcp/r;->dB:Landroid/net/dhcp/b;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public final processMessage(Landroid/os/Message;)Z
    .locals 1

    iget p1, p1, Landroid/os/Message;->what:I

    const v0, 0x30001

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Landroid/net/dhcp/r;->dB:Landroid/net/dhcp/b;

    invoke-static {p1}, Landroid/net/dhcp/b;->d(Landroid/net/dhcp/b;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroid/net/dhcp/r;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/r;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->e(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/net/dhcp/b;->transitionTo(Lcom/android/internal/util/IState;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Landroid/net/dhcp/r;->dB:Landroid/net/dhcp/b;

    iget-object v0, p0, Landroid/net/dhcp/r;->dB:Landroid/net/dhcp/b;

    invoke-static {v0}, Landroid/net/dhcp/b;->f(Landroid/net/dhcp/b;)Lcom/android/internal/util/State;

    move-result-object v0

    goto :goto_0

    :goto_1
    const/4 p1, 0x1

    return p1
.end method
