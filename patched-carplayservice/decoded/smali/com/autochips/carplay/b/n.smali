.class final Lcom/autochips/carplay/b/n;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# instance fields
.field final synthetic sC:Lcom/autochips/carplay/b/m;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/b/m;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/b/n;->sC:Lcom/autochips/carplay/b/m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAudioFocusChange(I)V
    .locals 3

    const-string v0, "OutputAudioManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "onAudioFocusChangeListener focuschange "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/b/n;->sC:Lcom/autochips/carplay/b/m;

    iget-object v0, v0, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/b/s;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/autochips/carplay/b/n;->sC:Lcom/autochips/carplay/b/m;

    iget-object p1, p1, Lcom/autochips/carplay/b/m;->sw:Lcom/autochips/carplay/b/s;

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/b/s;->sendMessage(Landroid/os/Message;)V

    return-void
.end method
