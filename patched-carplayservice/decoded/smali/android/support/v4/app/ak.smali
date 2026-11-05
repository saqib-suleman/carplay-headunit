.class public final Landroid/support/v4/app/ak;
.super Ljava/lang/Object;


# instance fields
.field private final iW:Ljava/util/List;

.field private final iX:Ljava/util/List;

.field private final iY:Ljava/util/List;


# direct methods
.method constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/app/ak;->iW:Ljava/util/List;

    iput-object p2, p0, Landroid/support/v4/app/ak;->iX:Ljava/util/List;

    iput-object p3, p0, Landroid/support/v4/app/ak;->iY:Ljava/util/List;

    return-void
.end method


# virtual methods
.method final bG()Ljava/util/List;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/ak;->iY:Ljava/util/List;

    return-object v0
.end method

.method final getChildNonConfigs()Ljava/util/List;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/ak;->iX:Ljava/util/List;

    return-object v0
.end method

.method final getFragments()Ljava/util/List;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/ak;->iW:Ljava/util/List;

    return-object v0
.end method
