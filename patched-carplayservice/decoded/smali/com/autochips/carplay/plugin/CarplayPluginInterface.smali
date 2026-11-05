.class public Lcom/autochips/carplay/plugin/CarplayPluginInterface;
.super Ljava/lang/Object;


# instance fields
.field private mCarplayPluginJniCallbacks:Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "carplay_plugin_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    invoke-static {}, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->classInitNative()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;

    invoke-direct {v0}, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;-><init>()V

    iput-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->mCarplayPluginJniCallbacks:Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;

    return-void
.end method

.method static native classInitNative()V
.end method


# virtual methods
.method public cleanup()V
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->mCarplayPluginJniCallbacks:Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/plugin/CarplayPluginInterface;->mCarplayPluginJniCallbacks:Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;

    invoke-virtual {v0}, Lcom/autochips/carplay/plugin/CarplayPluginJniCallbacks;->cleanup()V

    :cond_0
    return-void
.end method

.method native cleanupNative()V
.end method

.method native forceKeyFrameNative()I
.end method

.method native initNative()Z
.end method

.method native requestSiriActionNative(I)I
.end method

.method native requestUINative(Ljava/lang/String;)I
.end method

.method native sendChangeModeRequestNative(IIIIIIIIIIIZ)I
.end method

.method native setBluetoothAddressNative(Ljava/lang/String;)I
.end method

.method native setDeviceIDNative(Ljava/lang/String;)I
.end method

.method native setIAP2StateNative(Z)I
.end method

.method native setLimitedUINative(Z)I
.end method

.method native setNightModeNative(Z)I
.end method

.method native setOemIconLabelNative(Ljava/lang/String;)I
.end method

.method native setScreenSizeNative(II)I
.end method

.method native setVideoResolutionNative(II)I
.end method

.method native shutdownCarplayNative()I
.end method

.method native startupCarplayNative()I
.end method

.method native updateKnobNative(ZZZIII)I
.end method

.method native updateMediaBuottnNative(I)I
.end method

.method native updateTelephonyNative(I)I
.end method

.method native updateTouchScreenNative(ZII)I
.end method
