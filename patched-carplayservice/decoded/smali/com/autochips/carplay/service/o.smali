.class final Lcom/autochips/carplay/service/o;
.super Lcom/autochips/carplay/ICarplay$Stub;


# instance fields
.field private tl:Lcom/autochips/carplay/service/CarplayService;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/service/CarplayService;)V
    .locals 0

    invoke-direct {p0}, Lcom/autochips/carplay/ICarplay$Stub;-><init>()V

    iput-object p1, p0, Lcom/autochips/carplay/service/o;->tl:Lcom/autochips/carplay/service/CarplayService;

    return-void
.end method

.method private eb()Lcom/autochips/carplay/service/CarplayService;
    .locals 1

    iget-object v0, p0, Lcom/autochips/carplay/service/o;->tl:Lcom/autochips/carplay/service/CarplayService;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/o;->tl:Lcom/autochips/carplay/service/CarplayService;

    invoke-virtual {v0}, Lcom/autochips/carplay/service/CarplayService;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/o;->tl:Lcom/autochips/carplay/service/CarplayService;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public final cleanup()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/carplay/service/o;->tl:Lcom/autochips/carplay/service/CarplayService;

    return-void
.end method

.method public final disable(I)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->disable(I)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final dump(Ljava/io/FileDescriptor;[Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    new-instance v0, Ljava/io/PrintWriter;

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v2, :cond_0

    :try_start_2
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    const-string p2, "CarplayServiceBinder"

    const-string v0, "close FileOutputStream"

    invoke-virtual {p1}, Ljava/io/IOException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-static {p2, v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void

    :cond_0
    :try_start_3
    invoke-virtual {v2, p1, v0, p2}, Lcom/autochips/carplay/service/CarplayService;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    return-void

    :catchall_0
    move-exception p1

    move-object v0, v1

    goto :goto_1

    :catch_1
    move-exception p1

    move-object v0, v1

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_1

    :catch_2
    move-exception p1

    :goto_0
    :try_start_5
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const-string p2, "CarplayServiceBinder"

    const-string v1, "exception writing date to file"

    invoke-static {p2, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v0, :cond_1

    :try_start_6
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    :cond_1
    return-void

    :goto_1
    if-eqz v0, :cond_2

    :try_start_7
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    goto :goto_2

    :catch_3
    move-exception p2

    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    invoke-virtual {p2}, Ljava/io/IOException;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    const-string v0, "CarplayServiceBinder"

    const-string v1, "close FileOutputStream"

    invoke-static {v0, v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_2
    throw p1
.end method

.method public final enable(I)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->enable(I)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final enableNoAutoSwitch(I)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->enableNoAutoSwitch(I)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final getAppState()Lcom/autochips/carplay/CarplayAppState;
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/autochips/carplay/service/CarplayService;->getAppState()Lcom/autochips/carplay/CarplayAppState;

    move-result-object v0

    return-object v0
.end method

.method public final getConnectedDevices()Ljava/util/List;
    .locals 2

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/autochips/carplay/service/CarplayService;->getConnectedDevices()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final getConnectionState(Lcom/autochips/carplay/CarplayDevice;)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->getConnectionState(Lcom/autochips/carplay/CarplayDevice;)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final getCurrentCalls()Ljava/util/List;
    .locals 2

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/autochips/carplay/service/CarplayService;->getCurrentCalls()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final getEnableState()I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/CarplayService;->getEnableState()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final getLastUIState(Lcom/autochips/carplay/CarplayDevice;)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->getLastUIState(Lcom/autochips/carplay/CarplayDevice;)I

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public final getRemoteName(Lcom/autochips/carplay/CarplayDevice;)Ljava/lang/String;
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->getRemoteName(Lcom/autochips/carplay/CarplayDevice;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public final getResourceState()Lcom/autochips/carplay/CarplayResourceState;
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/autochips/carplay/service/CarplayService;->getResourceState()Lcom/autochips/carplay/CarplayResourceState;

    move-result-object v0

    return-object v0
.end method

.method public final getStreamState(Lcom/autochips/carplay/CarplayDevice;II)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Lcom/autochips/carplay/service/CarplayService;->getStreamState(Lcom/autochips/carplay/CarplayDevice;II)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public final isEnabled()Z
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/autochips/carplay/service/CarplayService;->isEnabled()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final registerCallback(Landroid/os/IBinder;Lcom/autochips/carplay/ICarplayCallback;I)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Lcom/autochips/carplay/service/CarplayService;->registerCallback(Landroid/os/IBinder;Lcom/autochips/carplay/ICarplayCallback;I)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final requestDeviceUI(ILjava/lang/String;)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/autochips/carplay/service/CarplayService;->requestDeviceUI(ILjava/lang/String;)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final requestSiri(I)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->requestSiri(I)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final setAudioEnable(Z)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->setAudioEnable(Z)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final setNightMode(Z)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->setNightMode(Z)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final setOemIconLabel(Ljava/lang/String;)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->setOemIconLabel(Ljava/lang/String;)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final setScreenSize(II)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/autochips/carplay/service/CarplayService;->setScreenSize(II)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final setVideoResolution(II)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/autochips/carplay/service/CarplayService;->setVideoResolution(II)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final startVideo(Landroid/view/Surface;)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->startVideo(Landroid/view/Surface;)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final stopVideo(Z)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->stopVideo(Z)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final unregisterCallback(I)V
    .locals 2

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/autochips/carplay/service/CarplayService;->o(II)V

    :cond_0
    return-void
.end method

.method public final updateKnob(ZZZIII)I
    .locals 7

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/autochips/carplay/service/CarplayService;->updateKnob(ZZZIII)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final updateMedia(I)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->updateMedia(I)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final updateTelehony(I)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lcom/autochips/carplay/service/CarplayService;->updateTelehony(I)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method public final updateTouchScreen(ZII)I
    .locals 1

    invoke-direct {p0}, Lcom/autochips/carplay/service/o;->eb()Lcom/autochips/carplay/service/CarplayService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Lcom/autochips/carplay/service/CarplayService;->updateTouchScreen(ZII)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, -0x1

    return p1
.end method
