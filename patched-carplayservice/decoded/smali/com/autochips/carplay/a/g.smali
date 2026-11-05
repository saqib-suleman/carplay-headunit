.class final Lcom/autochips/carplay/a/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/location/OnNmeaMessageListener;


# instance fields
.field final synthetic rM:Lcom/autochips/carplay/a/e;

.field private rN:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/a/e;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/a/g;->rM:Lcom/autochips/carplay/a/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/a/e;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/a/g;-><init>(Lcom/autochips/carplay/a/e;)V

    return-void
.end method


# virtual methods
.method public final onNmeaMessage(Ljava/lang/String;J)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/a/g;->rN:Ljava/lang/String;

    iget-object p2, p0, Lcom/autochips/carplay/a/g;->rM:Lcom/autochips/carplay/a/e;

    const/4 p3, 0x3

    invoke-virtual {p2, p3}, Lcom/autochips/carplay/a/e;->obtainMessage(I)Landroid/os/Message;

    move-result-object p2

    iput-object p1, p2, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/a/g;->rM:Lcom/autochips/carplay/a/e;

    invoke-virtual {p1, p2}, Lcom/autochips/carplay/a/e;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
