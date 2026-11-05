.class final Landroid/support/v4/view/o;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# instance fields
.field final synthetic mY:Landroid/support/v4/view/l;


# direct methods
.method constructor <init>(Landroid/support/v4/view/l;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/view/o;->mY:Landroid/support/v4/view/l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 0

    invoke-static {p2}, Landroid/support/v4/view/x;->n(Ljava/lang/Object;)Landroid/support/v4/view/x;

    move-result-object p1

    iget-object p2, p0, Landroid/support/v4/view/o;->mY:Landroid/support/v4/view/l;

    invoke-interface {p2, p1}, Landroid/support/v4/view/l;->b(Landroid/support/v4/view/x;)Landroid/support/v4/view/x;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/view/x;->c(Landroid/support/v4/view/x;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowInsets;

    return-object p1
.end method
