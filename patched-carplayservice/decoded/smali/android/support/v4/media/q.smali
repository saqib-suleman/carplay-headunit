.class public final Landroid/support/v4/media/q;
.super Ljava/lang/Object;


# instance fields
.field private final ko:I

.field private final kp:I

.field private final kq:I

.field private final kr:Landroid/support/v4/media/a;

.field private final mPlaybackType:I


# direct methods
.method private constructor <init>(ILandroid/support/v4/media/a;III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroid/support/v4/media/q;->mPlaybackType:I

    iput-object p2, p0, Landroid/support/v4/media/q;->kr:Landroid/support/v4/media/a;

    iput p3, p0, Landroid/support/v4/media/q;->ko:I

    iput p4, p0, Landroid/support/v4/media/q;->kp:I

    iput p5, p0, Landroid/support/v4/media/q;->kq:I

    return-void
.end method

.method static g(Landroid/os/Bundle;)Landroid/support/v4/media/q;
    .locals 7

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "android.media.audio_info.playback_type"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v0, "android.media.audio_info.control_type"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string v0, "android.media.audio_info.max_volume"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    const-string v0, "android.media.audio_info.current_volume"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    const-string v0, "android.media.audio_info.audio_attrs"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p0

    invoke-static {p0}, Landroid/support/v4/media/a;->b(Landroid/os/Bundle;)Landroid/support/v4/media/a;

    move-result-object v3

    new-instance p0, Landroid/support/v4/media/q;

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Landroid/support/v4/media/q;-><init>(ILandroid/support/v4/media/a;III)V

    return-object p0
.end method
