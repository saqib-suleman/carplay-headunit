.class public final synthetic Landroid/net/util/-$$Lambda$c$pf5lAh682b8zL7WCiMaKMpWCRjc;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Landroid/net/util/c;

.field private final synthetic f$1:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroid/net/util/c;Ljava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/net/util/-$$Lambda$c$pf5lAh682b8zL7WCiMaKMpWCRjc;->f$0:Landroid/net/util/c;

    iput-object p2, p0, Landroid/net/util/-$$Lambda$c$pf5lAh682b8zL7WCiMaKMpWCRjc;->f$1:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Landroid/net/util/-$$Lambda$c$pf5lAh682b8zL7WCiMaKMpWCRjc;->f$0:Landroid/net/util/c;

    iget-object v1, p0, Landroid/net/util/-$$Lambda$c$pf5lAh682b8zL7WCiMaKMpWCRjc;->f$1:Ljava/lang/Runnable;

    invoke-static {v0, v1}, Landroid/net/util/c;->lambda$pf5lAh682b8zL7WCiMaKMpWCRjc(Landroid/net/util/c;Ljava/lang/Runnable;)V

    return-void
.end method
