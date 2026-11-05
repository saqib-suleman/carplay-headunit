.class final Landroid/support/v4/media/w;
.super Landroid/support/v4/media/session/g;


# instance fields
.field final synthetic kM:Landroid/support/v4/media/s;


# virtual methods
.method public final a(Landroid/support/v4/media/MediaMetadataCompat;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object v0, v0, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v1, p1}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Landroid/support/v4/media/MediaMetadataCompat;)Landroid/support/v4/media/MediaMetadataCompat;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final a(Landroid/support/v4/media/session/PlaybackStateCompat;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object v0, v0, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v1, p1}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Landroid/support/v4/media/session/PlaybackStateCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final bM()V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    const-string v1, "android.support.v4.media.controller.command.CONNECT"

    new-instance v2, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;

    iget-object v3, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v3}, Landroid/support/v4/media/s;->e(Landroid/support/v4/media/s;)Landroid/os/Handler;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;-><init>(Landroid/support/v4/media/w;Landroid/os/Handler;)V

    invoke-static {v0, v1, v2}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Ljava/lang/String;Landroid/os/ResultReceiver;)V

    return-void
.end method

.method public final onSessionDestroyed()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-virtual {v0}, Landroid/support/v4/media/s;->close()V

    return-void
.end method

.method public final onSessionEvent(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 3

    if-eqz p2, :cond_0

    const-class v0, Landroid/support/v4/media/as;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v1, "android.support.v4.media.session.event.ON_SEEK_COMPLETED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 v0, 0xe

    goto/16 :goto_0

    :sswitch_1
    const-string v1, "android.support.v4.media.session.event.ON_ALLOWED_COMMANDS_CHANGED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    goto/16 :goto_0

    :sswitch_2
    const-string v1, "android.support.v4.media.session.event.ON_SHUFFLE_MODE_CHANGED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 v0, 0x8

    goto/16 :goto_0

    :sswitch_3
    const-string v1, "android.support.v4.media.session.event.ON_PLAYLIST_CHANGED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x5

    goto/16 :goto_0

    :sswitch_4
    const-string v1, "android.support.v4.media.session.event.SET_CUSTOM_LAYOUT"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 v0, 0xa

    goto/16 :goto_0

    :sswitch_5
    const-string v1, "android.support.v4.media.session.event.ON_PLAYLIST_METADATA_CHANGED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x6

    goto :goto_0

    :sswitch_6
    const-string v1, "android.support.v4.media.session.event.SEND_CUSTOM_COMMAND"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 v0, 0x9

    goto :goto_0

    :sswitch_7
    const-string v1, "android.support.v4.media.session.event.ON_REPEAT_MODE_CHANGED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x7

    goto :goto_0

    :sswitch_8
    const-string v1, "android.support.v4.media.session.event.ON_ROUTES_INFO_CHANGED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x4

    goto :goto_0

    :sswitch_9
    const-string v1, "android.support.v4.media.session.event.ON_CURRENT_MEDIA_ITEM_CHANGED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    :sswitch_a
    const-string v1, "android.support.v4.media.session.event.ON_ERROR"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x3

    goto :goto_0

    :sswitch_b
    const-string v1, "android.support.v4.media.session.event.ON_PLAYER_STATE_CHANGED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :sswitch_c
    const-string v1, "android.support.v4.media.session.event.ON_PLAYBACK_INFO_CHANGED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 v0, 0xb

    goto :goto_0

    :sswitch_d
    const-string v1, "android.support.v4.media.session.event.ON_PLAYBACK_SPEED_CHANGED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 v0, 0xc

    goto :goto_0

    :sswitch_e
    const-string v1, "android.support.v4.media.session.event.ON_BUFFERING_STATE_CHANGED"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 v0, 0xd

    :cond_1
    :goto_0
    packed-switch v0, :pswitch_data_0

    return-void

    :pswitch_0
    const-string p1, "android.support.v4.media.argument.SEEK_POSITION"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    const-string p1, "android.support.v4.media.argument.PLAYBACK_STATE_COMPAT"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/support/v4/media/session/PlaybackStateCompat;

    if-nez p1, :cond_2

    return-void

    :cond_2
    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object v2, p2, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2, p1}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Landroid/support/v4/media/session/PlaybackStateCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p1}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p1

    new-instance p2, Landroid/support/v4/media/ae;

    invoke-direct {p2, p0, v0, v1}, Landroid/support/v4/media/ae;-><init>(Landroid/support/v4/media/w;J)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :pswitch_1
    const-string p1, "android.support.v4.media.argument.MEDIA_ITEM"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/ap;->j(Landroid/os/Bundle;)Landroid/support/v4/media/ap;

    move-result-object p1

    const-string v0, "android.support.v4.media.argument.BUFFERING_STATE"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    const-string v1, "android.support.v4.media.argument.PLAYBACK_STATE_COMPAT"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/support/v4/media/session/PlaybackStateCompat;

    if-eqz p1, :cond_4

    if-nez p2, :cond_3

    return-void

    :cond_3
    iget-object v1, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object v1, v1, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_2
    iget-object v2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v2, v0}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;I)I

    iget-object v2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v2, p2}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Landroid/support/v4/media/session/PlaybackStateCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p2

    new-instance v1, Landroid/support/v4/media/ad;

    invoke-direct {v1, p0, p1, v0}, Landroid/support/v4/media/ad;-><init>(Landroid/support/v4/media/w;Landroid/support/v4/media/ap;I)V

    invoke-interface {p2, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_1
    move-exception p1

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1

    :cond_4
    return-void

    :pswitch_2
    const-string p1, "android.support.v4.media.argument.PLAYBACK_STATE_COMPAT"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/support/v4/media/session/PlaybackStateCompat;

    if-nez p1, :cond_5

    return-void

    :cond_5
    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object v0, p2, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_4
    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2, p1}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Landroid/support/v4/media/session/PlaybackStateCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p2

    new-instance v0, Landroid/support/v4/media/ac;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/media/ac;-><init>(Landroid/support/v4/media/w;Landroid/support/v4/media/session/PlaybackStateCompat;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_2
    move-exception p1

    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p1

    :pswitch_3
    const-string p1, "android.support.v4.media.argument.PLAYBACK_INFO"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/q;->g(Landroid/os/Bundle;)Landroid/support/v4/media/q;

    move-result-object p1

    if-nez p1, :cond_6

    return-void

    :cond_6
    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object v0, p2, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_6
    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2, p1}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Landroid/support/v4/media/q;)Landroid/support/v4/media/q;

    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p2

    new-instance v0, Landroid/support/v4/media/ab;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/media/ab;-><init>(Landroid/support/v4/media/w;Landroid/support/v4/media/q;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_3
    move-exception p1

    :try_start_7
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    throw p1

    :pswitch_4
    const-string p1, "android.support.v4.media.argument.COMMAND_BUTTONS"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/aw;->c([Landroid/os/Parcelable;)Ljava/util/List;

    move-result-object p1

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p2

    new-instance v0, Landroid/support/v4/media/aa;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/media/aa;-><init>(Landroid/support/v4/media/w;Ljava/util/List;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :pswitch_5
    const-string p1, "android.support.v4.media.argument.CUSTOM_COMMAND"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    if-nez p1, :cond_7

    return-void

    :cond_7
    invoke-static {p1}, Landroid/support/v4/media/ay;->n(Landroid/os/Bundle;)Landroid/support/v4/media/ay;

    move-result-object p1

    const-string v0, "android.support.v4.media.argument.ARGUMENTS"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "android.support.v4.media.argument.RESULT_RECEIVER"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/os/ResultReceiver;

    iget-object v1, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v1}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroid/support/v4/media/z;

    invoke-direct {v2, p0, p1, v0, p2}, Landroid/support/v4/media/z;-><init>(Landroid/support/v4/media/w;Landroid/support/v4/media/ay;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :pswitch_6
    const-string p1, "android.support.v4.media.argument.SHUFFLE_MODE"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object v0, p2, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_8
    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2, p1}, Landroid/support/v4/media/s;->c(Landroid/support/v4/media/s;I)I

    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p2

    new-instance v0, Landroid/support/v4/media/y;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/media/y;-><init>(Landroid/support/v4/media/w;I)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_4
    move-exception p1

    :try_start_9
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    throw p1

    :pswitch_7
    const-string p1, "android.support.v4.media.argument.REPEAT_MODE"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object v0, p2, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_a
    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2, p1}, Landroid/support/v4/media/s;->b(Landroid/support/v4/media/s;I)I

    monitor-exit v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p2

    new-instance v0, Landroid/support/v4/media/am;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/media/am;-><init>(Landroid/support/v4/media/w;I)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_5
    move-exception p1

    :try_start_b
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    throw p1

    :pswitch_8
    const-string p1, "android.support.v4.media.argument.PLAYLIST_METADATA"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/aq;->k(Landroid/os/Bundle;)Landroid/support/v4/media/aq;

    move-result-object p1

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object v0, p2, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_c
    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2, p1}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Landroid/support/v4/media/aq;)Landroid/support/v4/media/aq;

    monitor-exit v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p2

    new-instance v0, Landroid/support/v4/media/al;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/media/al;-><init>(Landroid/support/v4/media/w;Landroid/support/v4/media/aq;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_6
    move-exception p1

    :try_start_d
    monitor-exit v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    throw p1

    :pswitch_9
    const-string p1, "android.support.v4.media.argument.PLAYLIST_METADATA"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/aq;->k(Landroid/os/Bundle;)Landroid/support/v4/media/aq;

    move-result-object p1

    const-string v0, "android.support.v4.media.argument.PLAYLIST"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object p2

    invoke-static {p2}, Landroid/support/v4/media/aw;->a([Landroid/os/Parcelable;)Ljava/util/List;

    move-result-object p2

    iget-object v0, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object v0, v0, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_e
    iget-object v1, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v1, p2}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Ljava/util/List;)Ljava/util/List;

    iget-object v1, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v1, p1}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Landroid/support/v4/media/aq;)Landroid/support/v4/media/aq;

    monitor-exit v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_7

    iget-object v0, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v0}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroid/support/v4/media/ak;

    invoke-direct {v1, p0, p2, p1}, Landroid/support/v4/media/ak;-><init>(Landroid/support/v4/media/w;Ljava/util/List;Landroid/support/v4/media/aq;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_7
    move-exception p1

    :try_start_f
    monitor-exit v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_7

    throw p1

    :pswitch_a
    const-string p1, "android.support.v4.media.argument.ROUTE_BUNDLE"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/aw;->b([Landroid/os/Parcelable;)Ljava/util/List;

    move-result-object p1

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p2

    new-instance v0, Landroid/support/v4/media/aj;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/media/aj;-><init>(Landroid/support/v4/media/w;Ljava/util/List;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :pswitch_b
    const-string p1, "android.support.v4.media.argument.ERROR_CODE"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    const-string v0, "android.support.v4.media.argument.EXTRAS"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p2

    iget-object v0, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v0}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroid/support/v4/media/ai;

    invoke-direct {v1, p0, p1, p2}, Landroid/support/v4/media/ai;-><init>(Landroid/support/v4/media/w;ILandroid/os/Bundle;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :pswitch_c
    const-string p1, "android.support.v4.media.argument.MEDIA_ITEM"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/ap;->j(Landroid/os/Bundle;)Landroid/support/v4/media/ap;

    move-result-object p1

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object v0, p2, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_10
    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2, p1}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Landroid/support/v4/media/ap;)Landroid/support/v4/media/ap;

    monitor-exit v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_8

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p2

    new-instance v0, Landroid/support/v4/media/ah;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/media/ah;-><init>(Landroid/support/v4/media/w;Landroid/support/v4/media/ap;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_8
    move-exception p1

    :try_start_11
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_8

    throw p1

    :pswitch_d
    const-string p1, "android.support.v4.media.argument.PLAYER_STATE"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    const-string v0, "android.support.v4.media.argument.PLAYBACK_STATE_COMPAT"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/support/v4/media/session/PlaybackStateCompat;

    if-nez p2, :cond_8

    return-void

    :cond_8
    iget-object v0, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object v0, v0, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_12
    iget-object v1, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v1, p1}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;I)I

    iget-object v1, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v1, p2}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Landroid/support/v4/media/session/PlaybackStateCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;

    monitor-exit v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_9

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p2

    new-instance v0, Landroid/support/v4/media/ag;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/media/ag;-><init>(Landroid/support/v4/media/w;I)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_9
    move-exception p1

    :try_start_13
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    throw p1

    :pswitch_e
    const-string p1, "android.support.v4.media.argument.ALLOWED_COMMANDS"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/az;->o(Landroid/os/Bundle;)Landroid/support/v4/media/az;

    move-result-object p1

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    iget-object p2, p2, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter p2

    :try_start_14
    iget-object v0, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {v0, p1}, Landroid/support/v4/media/s;->a(Landroid/support/v4/media/s;Landroid/support/v4/media/az;)Landroid/support/v4/media/az;

    monitor-exit p2
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_a

    iget-object p2, p0, Landroid/support/v4/media/w;->kM:Landroid/support/v4/media/s;

    invoke-static {p2}, Landroid/support/v4/media/s;->d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;

    move-result-object p2

    new-instance v0, Landroid/support/v4/media/af;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/media/af;-><init>(Landroid/support/v4/media/w;Landroid/support/v4/media/az;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_a
    move-exception p1

    :try_start_15
    monitor-exit p2
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_a

    throw p1

    return-void

    :sswitch_data_0
    .sparse-switch
        -0x7bcae3fc -> :sswitch_e
        -0x7ad14943 -> :sswitch_d
        -0x5eb3585e -> :sswitch_c
        -0x57afe373 -> :sswitch_b
        -0x3ce9341d -> :sswitch_a
        -0x24c97c72 -> :sswitch_9
        -0x57d366d -> :sswitch_8
        -0x3313129 -> :sswitch_7
        0xdb556b9 -> :sswitch_6
        0x124216cc -> :sswitch_5
        0x18606080 -> :sswitch_4
        0x300da84c -> :sswitch_3
        0x3570ac43 -> :sswitch_2
        0x6518bbd9 -> :sswitch_1
        0x6f922989 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
