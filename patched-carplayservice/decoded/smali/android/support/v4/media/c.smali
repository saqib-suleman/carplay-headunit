.class final Landroid/support/v4/media/c;
.super Ljava/lang/Object;


# instance fields
.field private ki:Landroid/media/AudioAttributes;


# direct methods
.method private constructor <init>(Landroid/media/AudioAttributes;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/c;->ki:Landroid/media/AudioAttributes;

    return-void
.end method

.method public static a(Landroid/media/AudioAttributes;)Landroid/support/v4/media/c;
    .locals 1

    if-eqz p0, :cond_0

    new-instance v0, Landroid/support/v4/media/c;

    invoke-direct {v0, p0}, Landroid/support/v4/media/c;-><init>(Landroid/media/AudioAttributes;)V

    return-object v0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "AudioAttributesApi21.Wrapper cannot wrap null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final bL()Landroid/media/AudioAttributes;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/c;->ki:Landroid/media/AudioAttributes;

    return-object v0
.end method
