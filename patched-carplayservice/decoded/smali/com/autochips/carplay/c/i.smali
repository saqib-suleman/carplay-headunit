.class public final Lcom/autochips/carplay/c/i;
.super Ljava/lang/Object;


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private ve:Landroid/net/wifi/WifiManager;

.field private vi:Lcom/autochips/carplay/c/j;


# direct methods
.method constructor <init>(Landroid/net/wifi/WifiManager;Lcom/autochips/carplay/c/j;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/autochips/carplay/c/i;->ve:Landroid/net/wifi/WifiManager;

    iput-object p2, p0, Lcom/autochips/carplay/c/i;->vi:Lcom/autochips/carplay/c/j;

    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/autochips/carplay/c/i;->mHandler:Landroid/os/Handler;

    return-void
.end method
