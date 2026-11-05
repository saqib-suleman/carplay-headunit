.class final Landroid/support/v4/media/session/h;
.super Landroid/os/Handler;


# instance fields
.field final synthetic lQ:Landroid/support/v4/media/session/g;

.field mRegistered:Z


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 2

    iget-boolean v0, p0, Landroid/support/v4/media/session/h;->mRegistered:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    return-void

    :pswitch_1
    iget-object p1, p0, Landroid/support/v4/media/session/h;->lQ:Landroid/support/v4/media/session/g;

    invoke-virtual {p1}, Landroid/support/v4/media/session/g;->bM()V

    return-void

    :pswitch_2
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    return-void

    :pswitch_3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    return-void

    :pswitch_4
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    return-void

    :pswitch_5
    iget-object p1, p0, Landroid/support/v4/media/session/h;->lQ:Landroid/support/v4/media/session/g;

    invoke-virtual {p1}, Landroid/support/v4/media/session/g;->onSessionDestroyed()V

    return-void

    :pswitch_6
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    return-void

    :pswitch_7
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    return-void

    :pswitch_8
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    return-void

    :pswitch_9
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    return-void

    :pswitch_a
    iget-object v0, p0, Landroid/support/v4/media/session/h;->lQ:Landroid/support/v4/media/session/g;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/support/v4/media/MediaMetadataCompat;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/session/g;->a(Landroid/support/v4/media/MediaMetadataCompat;)V

    return-void

    :pswitch_b
    iget-object v0, p0, Landroid/support/v4/media/session/h;->lQ:Landroid/support/v4/media/session/g;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/support/v4/media/session/PlaybackStateCompat;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/session/g;->a(Landroid/support/v4/media/session/PlaybackStateCompat;)V

    return-void

    :pswitch_c
    iget-object v0, p0, Landroid/support/v4/media/session/h;->lQ:Landroid/support/v4/media/session/g;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/media/session/g;->onSessionEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
