.class public Lcom/autochips/carplay/av/StreamController;
.super Ljava/lang/Object;


# static fields
.field private static final DBG:Z = true

.field private static final STREAM_ACTION_ADD:I = 0x0

.field private static final STREAM_ACTION_DEL:I = 0x1

.field private static final STREAM_ACTION_ERR:I = 0x2

.field private static final STREAM_ERROR_NOENT:I = 0x3

.field private static final STREAM_ERROR_PLAYBACK:I = 0x4

.field private static final STREAM_ERROR_RECORD:I = 0x5

.field private static final STREAM_ERROR_UNKNOWN:I = 0x6

.field private static final TAG:Ljava/lang/String; = "StreamController"


# instance fields
.field private mEventHandler:Lcom/autochips/carplay/av/c;

.field private mNativeContext:J

.field private mOnErrorListener:Lcom/autochips/carplay/av/d;

.field private mOnStreamListener:Lcom/autochips/carplay/av/e;

.field private mStreamAction:Lcom/autochips/carplay/av/f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "carplay_av_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    invoke-static {}, Lcom/autochips/carplay/av/StreamController;->native_init()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/autochips/carplay/av/c;

    invoke-direct {v1, p0, p0, v0}, Lcom/autochips/carplay/av/c;-><init>(Lcom/autochips/carplay/av/StreamController;Lcom/autochips/carplay/av/StreamController;Landroid/os/Looper;)V

    :goto_0
    iput-object v1, p0, Lcom/autochips/carplay/av/StreamController;->mEventHandler:Lcom/autochips/carplay/av/c;

    goto :goto_1

    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Lcom/autochips/carplay/av/c;

    invoke-direct {v1, p0, p0, v0}, Lcom/autochips/carplay/av/c;-><init>(Lcom/autochips/carplay/av/StreamController;Lcom/autochips/carplay/av/StreamController;Landroid/os/Looper;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/av/StreamController;->mEventHandler:Lcom/autochips/carplay/av/c;

    :goto_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {p0, v0, p1}, Lcom/autochips/carplay/av/StreamController;->native_setup(Ljava/lang/Object;I)V

    const-string p1, "StreamController"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "StreamController create: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static synthetic access$000(Lcom/autochips/carplay/av/StreamController;)J
    .locals 2

    iget-wide v0, p0, Lcom/autochips/carplay/av/StreamController;->mNativeContext:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/f;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/av/StreamController;->mStreamAction:Lcom/autochips/carplay/av/f;

    return-object p0
.end method

.method static synthetic access$200(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/e;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/av/StreamController;->mOnStreamListener:Lcom/autochips/carplay/av/e;

    return-object p0
.end method

.method static synthetic access$300(Lcom/autochips/carplay/av/StreamController;)Lcom/autochips/carplay/av/d;
    .locals 0

    iget-object p0, p0, Lcom/autochips/carplay/av/StreamController;->mOnErrorListener:Lcom/autochips/carplay/av/d;

    return-object p0
.end method

.method private final native native_finalize()V
.end method

.method private static final native native_init()V
.end method

.method private final native native_release()V
.end method

.method private final native native_setup(Ljava/lang/Object;I)V
.end method

.method private static postEventFromNative(Ljava/lang/Object;IIILjava/lang/Object;)V
    .locals 1

    check-cast p0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/autochips/carplay/av/StreamController;

    if-nez p0, :cond_0

    const-string p0, "StreamController"

    new-instance p4, Ljava/lang/StringBuilder;

    const-string v0, "postEventFromNative: null sc! what = "

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", arg1 = "

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", arg2 = "

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/autochips/carplay/av/StreamController;->mEventHandler:Lcom/autochips/carplay/av/c;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/autochips/carplay/av/StreamController;->mEventHandler:Lcom/autochips/carplay/av/c;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/autochips/carplay/av/c;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    iget-object p0, p0, Lcom/autochips/carplay/av/StreamController;->mEventHandler:Lcom/autochips/carplay/av/c;

    invoke-virtual {p0, p1}, Lcom/autochips/carplay/av/c;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 2

    const-string v0, "StreamController"

    const-string v1, "finalize() native_finalize called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/autochips/carplay/av/StreamController;->native_finalize()V

    const-string v0, "StreamController"

    const-string v1, "finalize() native_finalize finished"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public release()V
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/av/StreamController;->native_release()V

    return-void
.end method

.method public setOnErrorListener(Lcom/autochips/carplay/av/d;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/av/StreamController;->mOnErrorListener:Lcom/autochips/carplay/av/d;

    return-void
.end method

.method public setOnStreamListener(Lcom/autochips/carplay/av/e;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/av/StreamController;->mOnStreamListener:Lcom/autochips/carplay/av/e;

    return-void
.end method

.method public setStreamAction(Lcom/autochips/carplay/av/f;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/av/StreamController;->mStreamAction:Lcom/autochips/carplay/av/f;

    return-void
.end method
