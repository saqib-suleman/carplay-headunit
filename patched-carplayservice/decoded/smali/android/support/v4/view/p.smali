.class final Landroid/support/v4/view/p;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Landroid/support/v4/view/s;

    check-cast p2, Landroid/support/v4/view/s;

    iget p1, p1, Landroid/support/v4/view/s;->position:I

    iget p2, p2, Landroid/support/v4/view/s;->position:I

    sub-int/2addr p1, p2

    return p1
.end method
