.class final Lcom/autochips/carplay/a/f;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/location/LocationListener;


# instance fields
.field final synthetic rM:Lcom/autochips/carplay/a/e;


# direct methods
.method private constructor <init>(Lcom/autochips/carplay/a/e;)V
    .locals 0

    iput-object p1, p0, Lcom/autochips/carplay/a/f;->rM:Lcom/autochips/carplay/a/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/carplay/a/e;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/autochips/carplay/a/f;-><init>(Lcom/autochips/carplay/a/e;)V

    return-void
.end method


# virtual methods
.method public final onLocationChanged(Landroid/location/Location;)V
    .locals 0

    return-void
.end method

.method public final onProviderDisabled(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public final onProviderEnabled(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public final onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0

    const-string p1, "iAPLocation"

    const-string p2, "onStatusChanged Deprecated"

    invoke-static {p1, p2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
