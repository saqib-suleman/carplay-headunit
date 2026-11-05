.class public Lcom/autochips/carplay/wired/CarplayUsbNcmJni;
.super Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "carplay_wired_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static native cleanupNative()V
.end method

.method static native getUpStateNative(Ljava/lang/String;)Z
.end method

.method static native initNative()Z
.end method

.method static native setUpStateNative(Ljava/lang/String;Z)Z
.end method
