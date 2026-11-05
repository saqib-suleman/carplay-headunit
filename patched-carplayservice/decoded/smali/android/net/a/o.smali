.class final Landroid/net/a/o;
.super Lcom/android/internal/util/State;


# instance fields
.field final synthetic eX:Landroid/net/a/d;

.field private fp:Landroid/net/a/a;

.field private fq:Z


# direct methods
.method constructor <init>(Landroid/net/a/d;)V
    .locals 0

    iput-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method

.method private ai()Landroid/net/a/a;
    .locals 4

    :try_start_0
    new-instance v0, Landroid/net/a/a;

    iget-object v1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-virtual {v1}, Landroid/net/a/d;->getHandler()Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v2}, Landroid/net/a/d;->x(Landroid/net/a/d;)Landroid/net/util/b;

    move-result-object v2

    iget-object v3, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v3}, Landroid/net/a/d;->F(Landroid/net/a/d;)Landroid/util/LocalLog;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Landroid/net/a/a;-><init>(Landroid/os/Handler;Landroid/net/util/b;Landroid/util/LocalLog;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return-object v0
.end method

.method private aj()V
    .locals 1

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->G(Landroid/net/a/d;)Lcom/android/internal/util/WakeupMessage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/util/WakeupMessage;->cancel()V

    iget-boolean v0, p0, Landroid/net/a/o;->fq:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    iget-object v0, v0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    invoke-virtual {v0}, Landroid/net/a/i;->af()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/net/a/o;->fq:Z

    :cond_0
    return-void
.end method

.method private synthetic ak()V
    .locals 2

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->a(Landroid/net/a/d;)Landroid/net/util/SharedLog;

    move-result-object v0

    const-string v1, "OBSERVED AvoidBadWifi changed"

    invoke-virtual {v0, v1}, Landroid/net/util/SharedLog;->log(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic lambda$npATqXJ7wdGR7zOohQKkeKE3vyY(Landroid/net/a/o;)V
    .locals 0

    invoke-direct {p0}, Landroid/net/a/o;->ak()V

    return-void
.end method


# virtual methods
.method public final enter()V
    .locals 5

    new-instance v0, Landroid/net/apf/d;

    invoke-direct {v0}, Landroid/net/apf/d;-><init>()V

    iget-object v1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v1}, Landroid/net/a/d;->p(Landroid/net/a/d;)Landroid/net/a/n;

    move-result-object v1

    iget-object v1, v1, Landroid/net/a/n;->av:Landroid/net/apf/a;

    iput-object v1, v0, Landroid/net/apf/d;->aR:Landroid/net/apf/a;

    iget-object v1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v1}, Landroid/net/a/d;->v(Landroid/net/a/d;)Z

    move-result v1

    iput-boolean v1, v0, Landroid/net/apf/d;->aS:Z

    iget-object v1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v1}, Landroid/net/a/d;->w(Landroid/net/a/d;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x112001a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    iput-boolean v1, v0, Landroid/net/apf/d;->aT:Z

    iget-object v1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v1}, Landroid/net/a/d;->w(Landroid/net/a/d;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x107000c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v1

    iput-object v1, v0, Landroid/net/apf/d;->aU:[I

    iget-object v1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    iget-object v2, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v2}, Landroid/net/a/d;->w(Landroid/net/a/d;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v3}, Landroid/net/a/d;->x(Landroid/net/a/d;)Landroid/net/util/b;

    move-result-object v3

    iget-object v4, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    iget-object v4, v4, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    invoke-static {v2, v0, v3, v4}, Landroid/net/apf/ApfFilter;->a(Landroid/content/Context;Landroid/net/apf/d;Landroid/net/util/b;Landroid/net/a/i;)Landroid/net/apf/ApfFilter;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/net/a/d;->a(Landroid/net/a/d;Landroid/net/apf/ApfFilter;)Landroid/net/apf/ApfFilter;

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->y(Landroid/net/a/d;)Landroid/net/apf/ApfFilter;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    iget-object v0, v0, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    iget-object v1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v1}, Landroid/net/a/d;->v(Landroid/net/a/d;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/net/a/i;->c(Z)V

    :cond_0
    invoke-direct {p0}, Landroid/net/a/o;->ai()Landroid/net/a/a;

    move-result-object v0

    iput-object v0, p0, Landroid/net/a/o;->fp:Landroid/net/a/a;

    iget-object v0, p0, Landroid/net/a/o;->fp:Landroid/net/a/a;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/net/a/o;->fp:Landroid/net/a/a;

    iget-object v1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v1}, Landroid/net/a/d;->p(Landroid/net/a/d;)Landroid/net/a/n;

    move-result-object v1

    iget-object v1, v1, Landroid/net/a/n;->en:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/net/a/a;->start(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->p(Landroid/net/a/d;)Landroid/net/a/n;

    move-result-object v0

    iget-boolean v0, v0, Landroid/net/a/n;->fg:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->z(Landroid/net/a/d;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    const/4 v1, 0x5

    :goto_0
    invoke-static {v0, v1}, Landroid/net/a/d;->a(Landroid/net/a/d;I)V

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    iget-object v1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v1}, Landroid/net/a/d;->s(Landroid/net/a/d;)Lcom/android/internal/util/State;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/a/d;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void

    :cond_2
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->p(Landroid/net/a/d;)Landroid/net/a/n;

    move-result-object v0

    iget-boolean v0, v0, Landroid/net/a/n;->ff:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->A(Landroid/net/a/d;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    const/4 v1, 0x4

    goto :goto_0

    :cond_3
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->p(Landroid/net/a/d;)Landroid/net/a/n;

    move-result-object v0

    iget-object v0, v0, Landroid/net/a/n;->fk:Landroid/net/a/k;

    if-eqz v0, :cond_4

    iget-object v1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v1, v0}, Landroid/net/a/d;->a(Landroid/net/a/d;Landroid/net/a/k;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    const/4 v1, 0x7

    goto :goto_0

    :cond_4
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->p(Landroid/net/a/d;)Landroid/net/a/n;

    move-result-object v0

    iget-boolean v0, v0, Landroid/net/a/n;->fh:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    new-instance v1, Landroid/net/util/c;

    iget-object v2, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v2}, Landroid/net/a/d;->w(Landroid/net/a/d;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-virtual {v3}, Landroid/net/a/d;->getHandler()Landroid/os/Handler;

    move-result-object v3

    new-instance v4, Landroid/net/a/-$$Lambda$o$npATqXJ7wdGR7zOohQKkeKE3vyY;

    invoke-direct {v4, p0}, Landroid/net/a/-$$Lambda$o$npATqXJ7wdGR7zOohQKkeKE3vyY;-><init>(Landroid/net/a/o;)V

    invoke-direct {v1, v2, v3, v4}, Landroid/net/util/c;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/Runnable;)V

    invoke-static {v0, v1}, Landroid/net/a/d;->a(Landroid/net/a/d;Landroid/net/util/c;)Landroid/net/util/c;

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->B(Landroid/net/a/d;)Landroid/net/util/c;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/util/c;->start()V

    :cond_5
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->p(Landroid/net/a/d;)Landroid/net/a/n;

    move-result-object v0

    iget-boolean v0, v0, Landroid/net/a/n;->fi:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->C(Landroid/net/a/d;)Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    const/4 v1, 0x6

    goto :goto_0

    :cond_6
    return-void
.end method

.method public final exit()V
    .locals 4

    invoke-direct {p0}, Landroid/net/a/o;->aj()V

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->D(Landroid/net/a/d;)Landroid/net/a/v;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->D(Landroid/net/a/d;)Landroid/net/a/v;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/a/v;->stop()V

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->E(Landroid/net/a/d;)Landroid/net/a/v;

    :cond_0
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->B(Landroid/net/a/d;)Landroid/net/util/c;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->B(Landroid/net/a/d;)Landroid/net/util/c;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/util/c;->shutdown()V

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0, v1}, Landroid/net/a/d;->a(Landroid/net/a/d;Landroid/net/util/c;)Landroid/net/util/c;

    :cond_1
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->l(Landroid/net/a/d;)Landroid/net/dhcp/b;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->l(Landroid/net/a/d;)Landroid/net/dhcp/b;

    move-result-object v0

    const v2, 0x30002

    invoke-virtual {v0, v2}, Landroid/net/dhcp/b;->sendMessage(I)V

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->l(Landroid/net/a/d;)Landroid/net/dhcp/b;

    move-result-object v0

    const-string v2, "DhcpClient"

    const-string v3, "doQuit"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Landroid/net/dhcp/b;->quit()V

    :cond_2
    iget-object v0, p0, Landroid/net/a/o;->fp:Landroid/net/a/a;

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/net/a/o;->fp:Landroid/net/a/a;

    invoke-virtual {v0}, Landroid/net/a/a;->stop()V

    iput-object v1, p0, Landroid/net/a/o;->fp:Landroid/net/a/a;

    :cond_3
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->y(Landroid/net/a/d;)Landroid/net/apf/ApfFilter;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->y(Landroid/net/a/d;)Landroid/net/apf/ApfFilter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/apf/ApfFilter;->shutdown()V

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0, v1}, Landroid/net/a/d;->a(Landroid/net/a/d;Landroid/net/apf/ApfFilter;)Landroid/net/apf/ApfFilter;

    :cond_4
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->f(Landroid/net/a/d;)V

    return-void
.end method

.method public final processMessage(Landroid/os/Message;)Z
    .locals 5

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    packed-switch v0, :pswitch_data_3

    return v1

    :pswitch_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/net/LinkAddress;

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->n(Landroid/net/a/d;)Landroid/net/a/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/net/a/c;->a(Landroid/net/LinkAddress;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->l(Landroid/net/a/d;)Landroid/net/dhcp/b;

    move-result-object p1

    const v0, 0x30009

    goto/16 :goto_1

    :cond_0
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    const-string v0, "Failed to set IPv4 address."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Landroid/net/a/d;->a(Landroid/net/a/d;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    sget-object v0, Landroid/net/LinkProperties$ProvisioningChange;->LOST_PROVISIONING:Landroid/net/LinkProperties$ProvisioningChange;

    new-instance v1, Landroid/net/LinkProperties;

    iget-object v3, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v3}, Landroid/net/a/d;->u(Landroid/net/a/d;)Landroid/net/LinkProperties;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/net/LinkProperties;-><init>(Landroid/net/LinkProperties;)V

    invoke-static {p1, v0, v1}, Landroid/net/a/d;->a(Landroid/net/a/d;Landroid/net/LinkProperties$ProvisioningChange;Landroid/net/LinkProperties;)V

    goto/16 :goto_2

    :pswitch_1
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->n(Landroid/net/a/d;)Landroid/net/a/c;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/a/c;->W()Z

    goto/16 :goto_3

    :pswitch_2
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    const-string v0, "Unexpected CMD_ON_QUIT."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Landroid/net/a/d;->a(Landroid/net/a/d;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->o(Landroid/net/a/d;)Landroid/net/dhcp/b;

    goto/16 :goto_3

    :pswitch_3
    invoke-direct {p0}, Landroid/net/a/o;->aj()V

    iget v0, p1, Landroid/os/Message;->arg1:I

    packed-switch v0, :pswitch_data_4

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    const-string v3, "Unknown CMD_POST_DHCP_ACTION status: %s"

    new-array v4, v2, [Ljava/lang/Object;

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v1

    invoke-static {v0, v3, v4}, Landroid/net/a/d;->a(Landroid/net/a/d;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_3

    :pswitch_4
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->I(Landroid/net/a/d;)V

    goto/16 :goto_3

    :pswitch_5
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/net/DhcpResults;

    invoke-static {v0, p1}, Landroid/net/a/d;->a(Landroid/net/a/d;Landroid/net/DhcpResults;)V

    goto/16 :goto_3

    :pswitch_6
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->p(Landroid/net/a/d;)Landroid/net/a/n;

    move-result-object p1

    iget p1, p1, Landroid/net/a/n;->fj:I

    if-lez p1, :cond_1

    iget-boolean p1, p0, Landroid/net/a/o;->fq:Z

    if-nez p1, :cond_4

    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    iget-object p1, p1, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    invoke-virtual {p1}, Landroid/net/a/i;->ae()V

    iput-boolean v2, p0, Landroid/net/a/o;->fq:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->p(Landroid/net/a/d;)Landroid/net/a/n;

    move-result-object p1

    iget p1, p1, Landroid/net/a/n;->fj:I

    int-to-long v3, p1

    add-long/2addr v0, v3

    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->G(Landroid/net/a/d;)Lcom/android/internal/util/WakeupMessage;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Lcom/android/internal/util/WakeupMessage;->schedule(J)V

    goto/16 :goto_3

    :cond_1
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Landroid/net/a/d;->sendMessage(I)V

    goto/16 :goto_3

    :pswitch_7
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->y(Landroid/net/a/d;)Landroid/net/apf/ApfFilter;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->y(Landroid/net/a/d;)Landroid/net/apf/ApfFilter;

    move-result-object v0

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, [B

    invoke-virtual {v0, p1}, Landroid/net/apf/ApfFilter;->a([B)V

    :cond_2
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->H(Landroid/net/a/d;)Landroid/os/ConditionVariable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/ConditionVariable;->open()V

    goto/16 :goto_3

    :pswitch_8
    invoke-direct {p0}, Landroid/net/a/o;->aj()V

    goto/16 :goto_3

    :pswitch_9
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, p1}, Landroid/net/a/d;->b(Landroid/net/a/d;Z)Z

    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->y(Landroid/net/a/d;)Landroid/net/apf/ApfFilter;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->y(Landroid/net/a/d;)Landroid/net/apf/ApfFilter;

    move-result-object p1

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->v(Landroid/net/a/d;)Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/net/apf/ApfFilter;->b(Z)V

    goto/16 :goto_3

    :cond_3
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    iget-object p1, p1, Landroid/net/a/d;->mCallback:Landroid/net/a/i;

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->v(Landroid/net/a/d;)Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/net/a/i;->c(Z)V

    goto :goto_3

    :pswitch_a
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/net/ProxyInfo;

    invoke-static {v0, p1}, Landroid/net/a/d;->a(Landroid/net/a/d;Landroid/net/ProxyInfo;)Landroid/net/ProxyInfo;

    goto :goto_0

    :pswitch_b
    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/net/a/d;->a(Landroid/net/a/d;Ljava/lang/String;)Ljava/lang/String;

    :goto_0
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1, v2}, Landroid/net/a/d;->a(Landroid/net/a/d;Z)Z

    goto :goto_3

    :pswitch_c
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1, v2}, Landroid/net/a/d;->a(Landroid/net/a/d;Z)Z

    move-result p1

    if-nez p1, :cond_4

    goto :goto_2

    :pswitch_d
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->l(Landroid/net/a/d;)Landroid/net/dhcp/b;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->l(Landroid/net/a/d;)Landroid/net/dhcp/b;

    move-result-object p1

    const v0, 0x30006

    :goto_1
    invoke-virtual {p1, v0}, Landroid/net/dhcp/b;->sendMessage(I)V

    goto :goto_3

    :pswitch_e
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->D(Landroid/net/a/d;)Landroid/net/a/v;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->D(Landroid/net/a/d;)Landroid/net/a/v;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/a/v;->an()V

    goto :goto_3

    :pswitch_f
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    const-string v0, "ALERT: START received in StartedState. Please fix caller."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Landroid/net/a/d;->a(Landroid/net/a/d;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_3

    :goto_2
    :pswitch_10
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {v0}, Landroid/net/a/d;->s(Landroid/net/a/d;)Lcom/android/internal/util/State;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/a/d;->transitionTo(Lcom/android/internal/util/IState;)V

    :cond_4
    :goto_3
    iget-object p1, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-static {p1}, Landroid/net/a/d;->k(Landroid/net/a/d;)Landroid/net/a/m;

    move-result-object p1

    iget-object v0, p0, Landroid/net/a/o;->eX:Landroid/net/a/d;

    invoke-virtual {v0}, Landroid/net/a/d;->getCurrentState()Lcom/android/internal/util/IState;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/net/a/m;->a(Lcom/android/internal/util/State;Lcom/android/internal/util/IState;)V

    return v2

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xb
        :pswitch_8
        :pswitch_7
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x30003
        :pswitch_6
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x30007
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method
