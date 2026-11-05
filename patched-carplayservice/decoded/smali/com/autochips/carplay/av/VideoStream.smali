.class public Lcom/autochips/carplay/av/VideoStream;
.super Ljava/lang/Object;


# static fields
.field private static final DBG:Z = true

.field private static final TAG:Ljava/lang/String; = "VideoStream"


# instance fields
.field private mNativeContext:J

.field private mNativeSurfaceTexture:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "carplay_av_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    invoke-static {}, Lcom/autochips/carplay/av/VideoStream;->native_init()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0}, Lcom/autochips/carplay/av/VideoStream;->native_setup()V

    return-void
.end method

.method private final native native_dump(I)V
.end method

.method private final native native_finalize()V
.end method

.method private static final native native_init()V
.end method

.method private final native native_release()V
.end method

.method private final native native_setSurface(Landroid/view/Surface;)I
.end method

.method private final native native_setup()V
.end method

.method private final native native_start()I
.end method

.method private final native native_stop()I
.end method


# virtual methods
.method protected finalize()V
    .locals 2

    const-string v0, "VideoStream"

    const-string v1, "finalize() native_finalize called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/autochips/carplay/av/VideoStream;->native_finalize()V

    const-string v0, "VideoStream"

    const-string v1, "finalize() native_finalize finished"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public release()V
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/av/VideoStream;->native_release()V

    return-void
.end method

.method public setSurface(Landroid/view/Surface;)I
    .locals 4

    iget-wide v0, p0, Lcom/autochips/carplay/av/VideoStream;->mNativeContext:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 p1, -0x2

    const-string v0, "VideoStream"

    const-string v1, "native VideoStream went away"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return p1

    :cond_0
    invoke-direct {p0, p1}, Lcom/autochips/carplay/av/VideoStream;->native_setSurface(Landroid/view/Surface;)I

    move-result p1

    return p1
.end method

.method public start()I
    .locals 4

    iget-wide v0, p0, Lcom/autochips/carplay/av/VideoStream;->mNativeContext:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, -0x2

    const-string v1, "VideoStream"

    const-string v2, "native VideoStream went away"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_0
    invoke-direct {p0}, Lcom/autochips/carplay/av/VideoStream;->native_start()I

    move-result v0

    return v0
.end method

.method public stop()I
    .locals 4

    iget-wide v0, p0, Lcom/autochips/carplay/av/VideoStream;->mNativeContext:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, -0x2

    const-string v1, "VideoStream"

    const-string v2, "native VideoStream went away"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_0
    invoke-direct {p0}, Lcom/autochips/carplay/av/VideoStream;->native_stop()I

    move-result v0

    return v0
.end method
