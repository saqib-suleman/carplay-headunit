.class final Lcom/autochips/carplay/service/n;
.super Landroid/os/Handler;


# instance fields
.field final synthetic uk:Lcom/autochips/carplay/service/CarplayService;

.field private ul:I

.field private final um:Landroid/app/UiModeManager;

.field private final un:Landroid/view/WindowManager;


# direct methods
.method constructor <init>(Lcom/autochips/carplay/service/CarplayService;Landroid/os/Looper;)V
    .locals 1

    iput-object p1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const/4 p2, 0x0

    iput p2, p0, Lcom/autochips/carplay/service/n;->ul:I

    invoke-static {p1}, Lcom/autochips/carplay/service/CarplayService;->d(Lcom/autochips/carplay/service/CarplayService;)Landroid/content/Context;

    move-result-object p2

    const-string v0, "uimode"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/app/UiModeManager;

    iput-object p2, p0, Lcom/autochips/carplay/service/n;->um:Landroid/app/UiModeManager;

    invoke-static {p1}, Lcom/autochips/carplay/service/CarplayService;->d(Lcom/autochips/carplay/service/CarplayService;)Landroid/content/Context;

    move-result-object p1

    const-string p2, "window"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    iput-object p1, p0, Lcom/autochips/carplay/service/n;->un:Landroid/view/WindowManager;

    return-void
.end method

.method private ak(I)V
    .locals 5

    const-string v0, "CarplayService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendRequestAccessoryUI, url="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v0}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/autochips/carplay/ICarplayCallback;

    :try_start_0
    invoke-interface {v1, p1}, Lcom/autochips/carplay/ICarplayCallback;->onRequestAccessoryUI(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "CarplayService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "sendRequestAccessoryUI: remote exception -- "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private b(IILandroid/os/Parcel;)V
    .locals 12

    const-string v0, "CarplayService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendAudioInfo, streamId="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", audioType="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/autochips/carplay/CarplayAudioInfo;

    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v3

    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v4

    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v5

    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v7

    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v8

    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v9

    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v10

    invoke-virtual {p3}, Landroid/os/Parcel;->readInt()I

    move-result v11

    move-object v2, v0

    invoke-direct/range {v2 .. v11}, Lcom/autochips/carplay/CarplayAudioInfo;-><init>(IIIIIIIII)V

    iget-object p3, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {p3}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/autochips/carplay/ICarplayCallback;

    :try_start_0
    invoke-interface {v1, p1, p2, v0}, Lcom/autochips/carplay/ICarplayCallback;->onAudioInfo(IILcom/autochips/carplay/CarplayAudioInfo;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "CarplayService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "sendStreamStateChanged: remote exception -- "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {p3}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private b(Lcom/autochips/carplay/CarplayAppState;)V
    .locals 5

    const-string v0, "CarplayService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendAppStateChanged, appState="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v0}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/autochips/carplay/ICarplayCallback;

    :try_start_0
    invoke-interface {v1, p1}, Lcom/autochips/carplay/ICarplayCallback;->onAppStateChanged(Lcom/autochips/carplay/CarplayAppState;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "CarplayService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "sendAppStateChanged: remote exception -- "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private b(Lcom/autochips/carplay/CarplayCall;)V
    .locals 5

    const-string v0, "CarplayService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendCallStateChanged, call="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v0}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/autochips/carplay/ICarplayCallback;

    :try_start_0
    invoke-interface {v1, p1}, Lcom/autochips/carplay/ICarplayCallback;->onCallStateChanged(Lcom/autochips/carplay/CarplayCall;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "CarplayService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "sendCallStateChanged: remote exception -- "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private b(Lcom/autochips/carplay/CarplayDevice;I)V
    .locals 5

    const-string v0, "CarplayService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendConnectionStateChanged, CarplayDevice="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v0}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/autochips/carplay/ICarplayCallback;

    :try_start_0
    invoke-interface {v1, p1, p2}, Lcom/autochips/carplay/ICarplayCallback;->onConnectionStateChanged(Lcom/autochips/carplay/CarplayDevice;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "CarplayService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "sendConnectionStateChanged: remote exception -- "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private b(Lcom/autochips/carplay/CarplayResourceState;)V
    .locals 5

    const-string v0, "CarplayService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendResourceStateChanged, resourceState="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v0}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/autochips/carplay/ICarplayCallback;

    :try_start_0
    invoke-interface {v1, p1}, Lcom/autochips/carplay/ICarplayCallback;->onResourceStateChanged(Lcom/autochips/carplay/CarplayResourceState;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "CarplayService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "sendResourceStateChanged: remote exception -- "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private ea()V
    .locals 5

    const-string v0, "CarplayService"

    const-string v1, "handleCarplayConnected"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/service/CarplayService;->dY()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v0}, Lcom/autochips/carplay/service/CarplayService;->j(Lcom/autochips/carplay/service/CarplayService;)Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-static {}, Lcom/autochips/carplay/service/CarplayService;->dY()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v3}, Lcom/autochips/carplay/service/CarplayService;->i(Lcom/autochips/carplay/service/CarplayService;)Landroid/os/UserHandle;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationHiddenSettingAsUser(Ljava/lang/String;Landroid/os/UserHandle;)Z

    move-result v0

    const-string v2, "CarplayService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "getApplicationHiddenSettingAsUser: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_0

    const-string v0, "CarplayService"

    const-string v2, "setApplicantionHiddenSetting false +++ "

    invoke-static {v0, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v0}, Lcom/autochips/carplay/service/CarplayService;->j(Lcom/autochips/carplay/service/CarplayService;)Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-static {}, Lcom/autochips/carplay/service/CarplayService;->dY()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v3}, Lcom/autochips/carplay/service/CarplayService;->i(Lcom/autochips/carplay/service/CarplayService;)Landroid/os/UserHandle;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3}, Landroid/content/pm/PackageManager;->setApplicationHiddenSettingAsUser(Ljava/lang/String;ZLandroid/os/UserHandle;)Z

    const-string v0, "CarplayService"

    const-string v2, "setApplicantionHiddenSetting false --- "

    invoke-static {v0, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-static {}, Lcom/autochips/carplay/service/CarplayService;->dZ()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Landroid/content/Intent;

    invoke-static {}, Lcom/autochips/carplay/service/CarplayService;->dZ()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v2}, Lcom/autochips/carplay/service/CarplayService;->d(Lcom/autochips/carplay/service/CarplayService;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->resolveSystemService(Landroid/content/pm/PackageManager;I)Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    if-nez v2, :cond_1

    const-string v2, "CarplayService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Fail to startService to: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v2}, Lcom/autochips/carplay/service/CarplayService;->d(Lcom/autochips/carplay/service/CarplayService;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_2

    const-string v0, "CarplayService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "start service: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/autochips/carplay/service/CarplayService;->dZ()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ok!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    iput v1, p0, Lcom/autochips/carplay/service/n;->ul:I

    return-void

    :cond_2
    iget-object v0, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v0}, Lcom/autochips/carplay/service/CarplayService;->k(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/n;

    move-result-object v0

    const/16 v1, 0x16

    invoke-virtual {v0, v1}, Lcom/autochips/carplay/service/n;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v1}, Lcom/autochips/carplay/service/CarplayService;->k(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/n;

    move-result-object v1

    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v0, v2, v3}, Lcom/autochips/carplay/service/n;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void

    :cond_3
    const-string v0, "CarplayService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CARPLAY_CLIENT_ACTION_NAME: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/autochips/carplay/service/CarplayService;->dZ()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private f(III)V
    .locals 5

    const-string v0, "CarplayService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendStreamStateChanged, streamId="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", audioType="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", streamState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v0}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/autochips/carplay/ICarplayCallback;

    :try_start_0
    invoke-interface {v1, p1, p2, p3}, Lcom/autochips/carplay/ICarplayCallback;->onStreamStateChanged(III)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "CarplayService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "sendStreamStateChanged: remote exception -- "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private q(II)V
    .locals 5

    const-string v0, "CarplayService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendEnableStateChanged, prevState="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", newState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v0}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/autochips/carplay/ICarplayCallback;

    :try_start_0
    invoke-interface {v1, p1, p2}, Lcom/autochips/carplay/ICarplayCallback;->onEnableStateChanged(II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "CarplayService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "onEnableStateChanged: remote exception -- "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 5

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x16

    const/16 v2, 0x14

    if-eq v0, v1, :cond_b

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    const/4 v2, 0x2

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_1

    const-string v0, "CarplayService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "ClientHandler.handleMessage ignoring msg="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :pswitch_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget v1, p1, Landroid/os/Message;->arg2:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/os/Parcel;

    invoke-direct {p0, v0, v1, p1}, Lcom/autochips/carplay/service/n;->b(IILandroid/os/Parcel;)V

    return-void

    :pswitch_1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/CarplayCall;

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/n;->b(Lcom/autochips/carplay/CarplayCall;)V

    return-void

    :pswitch_2
    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/n;->ak(I)V

    return-void

    :pswitch_3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/CarplayResourceState;

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/n;->b(Lcom/autochips/carplay/CarplayResourceState;)V

    return-void

    :pswitch_4
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/CarplayAppState;

    invoke-direct {p0, p1}, Lcom/autochips/carplay/service/n;->b(Lcom/autochips/carplay/CarplayAppState;)V

    return-void

    :pswitch_5
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget v1, p1, Landroid/os/Message;->arg2:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v2, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v2}, Lcom/autochips/carplay/service/CarplayService;->h(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/z;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-virtual {v2}, Lcom/autochips/carplay/service/CarplayService;->getConnectedDevices()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v4}, Lcom/autochips/carplay/service/CarplayService;->h(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/z;

    move-result-object v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v4}, Lcom/autochips/carplay/service/CarplayService;->h(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/z;

    move-result-object v4

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/autochips/carplay/CarplayDevice;

    invoke-virtual {v4, v2}, Lcom/autochips/carplay/service/z;->b(Lcom/autochips/carplay/CarplayDevice;)Lcom/autochips/carplay/service/aa;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2, v0, v1, p1}, Lcom/autochips/carplay/service/aa;->h(III)V

    :cond_0
    invoke-direct {p0, v0, v1, p1}, Lcom/autochips/carplay/service/n;->f(III)V

    return-void

    :pswitch_6
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/autochips/carplay/CarplayDevice;

    iget p1, p1, Landroid/os/Message;->arg1:I

    if-eqz v0, :cond_1

    if-ne v2, p1, :cond_1

    invoke-direct {p0}, Lcom/autochips/carplay/service/n;->ea()V

    goto :goto_0

    :cond_1
    if-eqz v0, :cond_2

    if-nez p1, :cond_2

    invoke-static {}, Lcom/autochips/carplay/service/CarplayService;->dX()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v1}, Lcom/autochips/carplay/service/CarplayService;->d(Lcom/autochips/carplay/service/CarplayService;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "Apple Carplay Disconnected"

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-virtual {v1}, Lcom/autochips/carplay/service/CarplayService;->getConnectedDevices()Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v2}, Lcom/autochips/carplay/service/CarplayService;->g(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/a;

    move-result-object v2

    if-eqz v2, :cond_4

    if-eqz v1, :cond_3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_4

    :cond_3
    iget-object v1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v1}, Lcom/autochips/carplay/service/CarplayService;->g(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/a;

    move-result-object v1

    const/16 v2, 0x46

    invoke-virtual {v1, v2}, Lcom/autochips/carplay/service/a;->sendMessage(I)V

    :cond_4
    invoke-direct {p0, v0, p1}, Lcom/autochips/carplay/service/n;->b(Lcom/autochips/carplay/CarplayDevice;I)V

    return-void

    :pswitch_7
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-direct {p0, v0, p1}, Lcom/autochips/carplay/service/n;->q(II)V

    if-ne p1, v2, :cond_c

    iget-object p1, p0, Lcom/autochips/carplay/service/n;->um:Landroid/app/UiModeManager;

    invoke-virtual {p1}, Landroid/app/UiModeManager;->getNightMode()I

    move-result p1

    if-ne p1, v2, :cond_5

    move v3, v1

    :cond_5
    iget-object p1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-virtual {p1, v3}, Lcom/autochips/carplay/service/CarplayService;->setNightMode(Z)I

    invoke-static {}, Lcom/autochips/carplay/service/CarplayService;->dW()Z

    move-result p1

    if-eqz p1, :cond_6

    new-instance p1, Landroid/util/DisplayMetrics;

    invoke-direct {p1}, Landroid/util/DisplayMetrics;-><init>()V

    iget-object v0, p0, Lcom/autochips/carplay/service/n;->un:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    iget-object v0, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    iget v2, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v0, v2, p1}, Lcom/autochips/carplay/service/CarplayService;->setVideoResolution(II)I

    :cond_6
    const-string p1, "CarplayService"

    const-string v0, "handleCarplayEnabled"

    invoke-static {p1, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/autochips/carplay/service/CarplayService;->dY()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_7

    iget-object p1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {p1}, Lcom/autochips/carplay/service/CarplayService;->j(Lcom/autochips/carplay/service/CarplayService;)Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-static {}, Lcom/autochips/carplay/service/CarplayService;->dY()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v2}, Lcom/autochips/carplay/service/CarplayService;->i(Lcom/autochips/carplay/service/CarplayService;)Landroid/os/UserHandle;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/content/pm/PackageManager;->getApplicationHiddenSettingAsUser(Ljava/lang/String;Landroid/os/UserHandle;)Z

    move-result p1

    const-string v0, "CarplayService"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "getApplicationHiddenSettingAsUser: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p1, :cond_7

    const-string p1, "CarplayService"

    const-string v0, "setApplicantionHiddenSetting true +++ "

    invoke-static {p1, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {p1}, Lcom/autochips/carplay/service/CarplayService;->j(Lcom/autochips/carplay/service/CarplayService;)Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-static {}, Lcom/autochips/carplay/service/CarplayService;->dY()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v2}, Lcom/autochips/carplay/service/CarplayService;->i(Lcom/autochips/carplay/service/CarplayService;)Landroid/os/UserHandle;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/pm/PackageManager;->setApplicationHiddenSettingAsUser(Ljava/lang/String;ZLandroid/os/UserHandle;)Z

    const-string p1, "CarplayService"

    const-string v0, "setApplicantionHiddenSetting true --- "

    invoke-static {p1, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    return-void

    :pswitch_8
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    if-ne p1, v1, :cond_9

    iget-object p1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {p1}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c

    const-string p1, "CarplayService"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "carplay client death, do error handler: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {p1}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {p1}, Lcom/autochips/carplay/service/CarplayService;->f(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/g;

    move-result-object p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {p1}, Lcom/autochips/carplay/service/CarplayService;->f(Lcom/autochips/carplay/service/CarplayService;)Lcom/autochips/carplay/service/g;

    move-result-object p1

    invoke-virtual {p1}, Lcom/autochips/carplay/service/g;->dE()Lcom/autochips/carplay/service/ad;

    move-result-object p1

    if-eqz p1, :cond_8

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Lcom/autochips/carplay/service/ad;->an(I)V

    :cond_8
    return-void

    :cond_9
    iget-object p1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {p1}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_9
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/autochips/carplay/ICarplayCallback;

    iget-object v1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v1}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {p1}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result p1

    if-le p1, v2, :cond_a

    const-string p1, "CarplayService"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Too many carplay callbacks: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v1}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_a
    iget-object p1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {p1}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result p1

    const/16 v0, 0xa

    if-le p1, v0, :cond_c

    const-string p1, "CarplayService"

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Too many carplay callbacks: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-static {v1}, Lcom/autochips/carplay/service/CarplayService;->e(Lcom/autochips/carplay/service/CarplayService;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_b
    iget-object p1, p0, Lcom/autochips/carplay/service/n;->uk:Lcom/autochips/carplay/service/CarplayService;

    invoke-virtual {p1}, Lcom/autochips/carplay/service/CarplayService;->getConnectedDevices()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_c

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-eqz p1, :cond_c

    iget p1, p0, Lcom/autochips/carplay/service/n;->ul:I

    add-int/lit8 v0, p1, 0x1

    iput v0, p0, Lcom/autochips/carplay/service/n;->ul:I

    if-ge p1, v2, :cond_c

    invoke-direct {p0}, Lcom/autochips/carplay/service/n;->ea()V

    :cond_c
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xa
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
