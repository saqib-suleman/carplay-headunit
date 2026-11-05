.class final Landroid/support/v4/media/s;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v4/media/r;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation


# static fields
.field private static final DEBUG:Z

.field static final ks:Landroid/os/Bundle;


# instance fields
.field private kA:Landroid/support/v4/media/aq;

.field private kB:I

.field private kC:I

.field private kD:Landroid/support/v4/media/ap;

.field private kE:I

.field private kF:Landroid/support/v4/media/q;

.field private kG:Landroid/support/v4/media/az;

.field private kH:Landroid/support/v4/media/session/MediaControllerCompat;

.field private kI:Landroid/support/v4/media/w;

.field private kJ:Landroid/support/v4/media/session/PlaybackStateCompat;

.field private kK:Landroid/support/v4/media/MediaMetadataCompat;

.field private volatile kL:Z

.field private final kt:Landroid/support/v4/media/ba;

.field private final ku:Landroid/support/v4/media/p;

.field private final kv:Landroid/os/HandlerThread;

.field private kw:Landroid/support/v4/media/o;

.field private kx:Landroid/support/v4/media/MediaBrowserCompat;

.field private ky:Z

.field private kz:Ljava/util/List;

.field private final mCallbackExecutor:Ljava/util/concurrent/Executor;

.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field final mLock:Ljava/lang/Object;

.field private mRepeatMode:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "MC2ImplLegacy"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Landroid/support/v4/media/s;->DEBUG:Z

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sput-object v0, Landroid/support/v4/media/s;->ks:Landroid/os/Bundle;

    const-string v1, "android.support.v4.media.root_default_root"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic a(Landroid/support/v4/media/s;I)I
    .locals 0

    iput p1, p0, Landroid/support/v4/media/s;->kC:I

    return p1
.end method

.method static synthetic a(Landroid/support/v4/media/s;Landroid/support/v4/media/MediaMetadataCompat;)Landroid/support/v4/media/MediaMetadataCompat;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/s;->kK:Landroid/support/v4/media/MediaMetadataCompat;

    return-object p1
.end method

.method static synthetic a(Landroid/support/v4/media/s;Landroid/support/v4/media/ap;)Landroid/support/v4/media/ap;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/s;->kD:Landroid/support/v4/media/ap;

    return-object p1
.end method

.method static synthetic a(Landroid/support/v4/media/s;Landroid/support/v4/media/aq;)Landroid/support/v4/media/aq;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/s;->kA:Landroid/support/v4/media/aq;

    return-object p1
.end method

.method static synthetic a(Landroid/support/v4/media/s;Landroid/support/v4/media/az;)Landroid/support/v4/media/az;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/s;->kG:Landroid/support/v4/media/az;

    return-object p1
.end method

.method static synthetic a(Landroid/support/v4/media/s;)Landroid/support/v4/media/o;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/s;->kw:Landroid/support/v4/media/o;

    return-object p0
.end method

.method static synthetic a(Landroid/support/v4/media/s;Landroid/support/v4/media/q;)Landroid/support/v4/media/q;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/s;->kF:Landroid/support/v4/media/q;

    return-object p1
.end method

.method static synthetic a(Landroid/support/v4/media/s;Landroid/support/v4/media/session/PlaybackStateCompat;)Landroid/support/v4/media/session/PlaybackStateCompat;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/s;->kJ:Landroid/support/v4/media/session/PlaybackStateCompat;

    return-object p1
.end method

.method static synthetic a(Landroid/support/v4/media/s;Ljava/util/List;)Ljava/util/List;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/s;->kz:Ljava/util/List;

    return-object p1
.end method

.method static synthetic a(Landroid/support/v4/media/s;Ljava/lang/String;Landroid/os/ResultReceiver;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/s;->a(Ljava/lang/String;Landroid/os/ResultReceiver;)V

    return-void
.end method

.method private a(Ljava/lang/String;Landroid/os/ResultReceiver;)V
    .locals 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Landroid/support/v4/media/s;->kH:Landroid/support/v4/media/session/MediaControllerCompat;

    iget-object v3, p0, Landroid/support/v4/media/s;->kI:Landroid/support/v4/media/w;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v1, "android.support.v4.media.argument.ICONTROLLER_CALLBACK"

    invoke-virtual {v3}, Landroid/support/v4/media/w;->bU()Landroid/support/v4/media/session/a;

    move-result-object v3

    invoke-interface {v3}, Landroid/support/v4/media/session/a;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v0, v1, v3}, Landroid/support/v4/app/f;->a(Landroid/os/Bundle;Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v1, "android.support.v4.media.argument.PACKAGE_NAME"

    iget-object v3, p0, Landroid/support/v4/media/s;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "android.support.v4.media.argument.UID"

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "android.support.v4.media.argument.PID"

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v2, p1, v0, p2}, Landroid/support/v4/media/session/MediaControllerCompat;->sendCommand(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method static synthetic b(Landroid/support/v4/media/s;I)I
    .locals 0

    iput p1, p0, Landroid/support/v4/media/s;->mRepeatMode:I

    return p1
.end method

.method static synthetic b(Landroid/support/v4/media/s;)Landroid/support/v4/media/p;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/s;->ku:Landroid/support/v4/media/p;

    return-object p0
.end method

.method static synthetic c(Landroid/support/v4/media/s;I)I
    .locals 0

    iput p1, p0, Landroid/support/v4/media/s;->kB:I

    return p1
.end method

.method static synthetic c(Landroid/support/v4/media/s;)Landroid/os/HandlerThread;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/s;->kv:Landroid/os/HandlerThread;

    return-object p0
.end method

.method static synthetic d(Landroid/support/v4/media/s;I)I
    .locals 0

    iput p1, p0, Landroid/support/v4/media/s;->kE:I

    return p1
.end method

.method static synthetic d(Landroid/support/v4/media/s;)Ljava/util/concurrent/Executor;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/s;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    return-object p0
.end method

.method static synthetic e(Landroid/support/v4/media/s;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/s;->mHandler:Landroid/os/Handler;

    return-object p0
.end method


# virtual methods
.method public final close()V
    .locals 4

    sget-boolean v0, Landroid/support/v4/media/s;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MC2ImplLegacy"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "release from "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Landroid/support/v4/media/s;->kt:Landroid/support/v4/media/ba;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Landroid/support/v4/media/s;->ky:Z

    if-eqz v1, :cond_1

    monitor-exit v0

    return-void

    :cond_1
    iget-object v1, p0, Landroid/support/v4/media/s;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x12

    if-lt v1, v3, :cond_2

    iget-object v1, p0, Landroid/support/v4/media/s;->kv:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->quitSafely()Z

    goto :goto_0

    :cond_2
    iget-object v1, p0, Landroid/support/v4/media/s;->kv:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->quit()Z

    :goto_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v4/media/s;->ky:Z

    const-string v1, "android.support.v4.media.controller.command.DISCONNECT"

    invoke-direct {p0, v1, v2}, Landroid/support/v4/media/s;->a(Ljava/lang/String;Landroid/os/ResultReceiver;)V

    iget-object v1, p0, Landroid/support/v4/media/s;->kH:Landroid/support/v4/media/session/MediaControllerCompat;

    if-eqz v1, :cond_3

    iget-object v1, p0, Landroid/support/v4/media/s;->kH:Landroid/support/v4/media/session/MediaControllerCompat;

    iget-object v3, p0, Landroid/support/v4/media/s;->kI:Landroid/support/v4/media/w;

    invoke-virtual {v1, v3}, Landroid/support/v4/media/session/MediaControllerCompat;->a(Landroid/support/v4/media/session/g;)V

    :cond_3
    iget-object v1, p0, Landroid/support/v4/media/s;->kx:Landroid/support/v4/media/MediaBrowserCompat;

    if-eqz v1, :cond_4

    iput-object v2, p0, Landroid/support/v4/media/s;->kx:Landroid/support/v4/media/MediaBrowserCompat;

    :cond_4
    iget-object v1, p0, Landroid/support/v4/media/s;->kH:Landroid/support/v4/media/session/MediaControllerCompat;

    if-eqz v1, :cond_5

    iget-object v1, p0, Landroid/support/v4/media/s;->kH:Landroid/support/v4/media/session/MediaControllerCompat;

    iget-object v3, p0, Landroid/support/v4/media/s;->kI:Landroid/support/v4/media/w;

    invoke-virtual {v1, v3}, Landroid/support/v4/media/session/MediaControllerCompat;->a(Landroid/support/v4/media/session/g;)V

    iput-object v2, p0, Landroid/support/v4/media/s;->kH:Landroid/support/v4/media/session/MediaControllerCompat;

    :cond_5
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v4/media/s;->kL:Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Landroid/support/v4/media/s;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/t;

    invoke-direct {v1, p0}, Landroid/support/v4/media/t;-><init>(Landroid/support/v4/media/s;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method final h(Landroid/os/Bundle;)V
    .locals 13

    const-class v0, Landroid/support/v4/media/as;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    const-string v0, "android.support.v4.media.argument.ALLOWED_COMMANDS"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/media/az;->o(Landroid/os/Bundle;)Landroid/support/v4/media/az;

    move-result-object v0

    const-string v1, "android.support.v4.media.argument.PLAYER_STATE"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "android.support.v4.media.argument.MEDIA_ITEM"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v4/media/ap;->j(Landroid/os/Bundle;)Landroid/support/v4/media/ap;

    move-result-object v2

    const-string v3, "android.support.v4.media.argument.BUFFERING_STATE"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    const-string v4, "android.support.v4.media.argument.PLAYBACK_STATE_COMPAT"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/support/v4/media/session/PlaybackStateCompat;

    const-string v5, "android.support.v4.media.argument.REPEAT_MODE"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    const-string v6, "android.support.v4.media.argument.SHUFFLE_MODE"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    const-string v7, "android.support.v4.media.argument.PLAYLIST"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v7

    invoke-static {v7}, Landroid/support/v4/media/aw;->a([Landroid/os/Parcelable;)Ljava/util/List;

    move-result-object v7

    const-string v8, "android.support.v4.media.argument.PLAYBACK_INFO"

    invoke-virtual {p1, v8}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v8

    invoke-static {v8}, Landroid/support/v4/media/q;->g(Landroid/os/Bundle;)Landroid/support/v4/media/q;

    move-result-object v8

    const-string v9, "android.support.v4.media.argument.PLAYLIST_METADATA"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/media/aq;->k(Landroid/os/Bundle;)Landroid/support/v4/media/aq;

    move-result-object p1

    sget-boolean v9, Landroid/support/v4/media/s;->DEBUG:Z

    if-eqz v9, :cond_0

    const-string v9, "MC2ImplLegacy"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "onConnectedNotLocked token="

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v11, p0, Landroid/support/v4/media/s;->kt:Landroid/support/v4/media/ba;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v11, ", allowedCommands="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    const/4 v9, 0x0

    :try_start_0
    iget-object v10, p0, Landroid/support/v4/media/s;->mLock:Ljava/lang/Object;

    monitor-enter v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 v11, 0x1

    :try_start_1
    iget-boolean v12, p0, Landroid/support/v4/media/s;->ky:Z

    if-eqz v12, :cond_1

    monitor-exit v10

    return-void

    :cond_1
    iget-boolean v12, p0, Landroid/support/v4/media/s;->kL:Z

    if-eqz v12, :cond_2

    const-string p1, "MC2ImplLegacy"

    const-string v0, "Cannot be notified about the connection result many times. Probably a bug or malicious app."

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    monitor-exit v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-virtual {p0}, Landroid/support/v4/media/s;->close()V

    return-void

    :catchall_0
    move-exception p1

    move v9, v11

    goto :goto_0

    :cond_2
    :try_start_3
    iput-object v0, p0, Landroid/support/v4/media/s;->kG:Landroid/support/v4/media/az;

    iput v1, p0, Landroid/support/v4/media/s;->kC:I

    iput-object v2, p0, Landroid/support/v4/media/s;->kD:Landroid/support/v4/media/ap;

    iput v3, p0, Landroid/support/v4/media/s;->kE:I

    iput-object v4, p0, Landroid/support/v4/media/s;->kJ:Landroid/support/v4/media/session/PlaybackStateCompat;

    iput v5, p0, Landroid/support/v4/media/s;->mRepeatMode:I

    iput v6, p0, Landroid/support/v4/media/s;->kB:I

    iput-object v7, p0, Landroid/support/v4/media/s;->kz:Ljava/util/List;

    iput-object p1, p0, Landroid/support/v4/media/s;->kA:Landroid/support/v4/media/aq;

    iput-boolean v11, p0, Landroid/support/v4/media/s;->kL:Z

    iput-object v8, p0, Landroid/support/v4/media/s;->kF:Landroid/support/v4/media/q;

    monitor-exit v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    iget-object p1, p0, Landroid/support/v4/media/s;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/u;

    invoke-direct {v1, p0, v0}, Landroid/support/v4/media/u;-><init>(Landroid/support/v4/media/s;Landroid/support/v4/media/az;)V

    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    return-void

    :catchall_1
    move-exception p1

    :goto_0
    :try_start_5
    monitor-exit v10
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catchall_2
    move-exception p1

    if-eqz v9, :cond_3

    invoke-virtual {p0}, Landroid/support/v4/media/s;->close()V

    :cond_3
    throw p1
.end method
