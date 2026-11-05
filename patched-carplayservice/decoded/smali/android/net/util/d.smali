.class final Landroid/net/util/d;
.super Landroid/content/BroadcastReceiver;


# instance fields
.field final synthetic gu:Landroid/net/util/c;


# direct methods
.method constructor <init>(Landroid/net/util/c;)V
    .locals 0

    iput-object p1, p0, Landroid/net/util/d;->gu:Landroid/net/util/c;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    iget-object p1, p0, Landroid/net/util/d;->gu:Landroid/net/util/c;

    invoke-virtual {p1}, Landroid/net/util/c;->reevaluate()V

    return-void
.end method
