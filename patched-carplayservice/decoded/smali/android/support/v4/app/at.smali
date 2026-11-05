.class final Landroid/support/v4/app/at;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic jp:Landroid/support/v4/app/bb;

.field final synthetic jr:Landroid/support/v4/app/Fragment;

.field final synthetic jv:Landroid/support/v4/app/Fragment;

.field final synthetic jw:Z

.field final synthetic jx:Landroid/support/v4/c/a;

.field final synthetic jy:Landroid/view/View;

.field final synthetic jz:Landroid/graphics/Rect;


# direct methods
.method constructor <init>(Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLandroid/support/v4/c/a;Landroid/view/View;Landroid/support/v4/app/bb;Landroid/graphics/Rect;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/at;->jr:Landroid/support/v4/app/Fragment;

    iput-object p2, p0, Landroid/support/v4/app/at;->jv:Landroid/support/v4/app/Fragment;

    iput-boolean p3, p0, Landroid/support/v4/app/at;->jw:Z

    iput-object p4, p0, Landroid/support/v4/app/at;->jx:Landroid/support/v4/c/a;

    iput-object p5, p0, Landroid/support/v4/app/at;->jy:Landroid/view/View;

    iput-object p6, p0, Landroid/support/v4/app/at;->jp:Landroid/support/v4/app/bb;

    iput-object p7, p0, Landroid/support/v4/app/at;->jz:Landroid/graphics/Rect;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/app/at;->jr:Landroid/support/v4/app/Fragment;

    iget-object v1, p0, Landroid/support/v4/app/at;->jv:Landroid/support/v4/app/Fragment;

    iget-boolean v2, p0, Landroid/support/v4/app/at;->jw:Z

    iget-object v3, p0, Landroid/support/v4/app/at;->jx:Landroid/support/v4/c/a;

    invoke-static {v0, v1, v2, v3}, Landroid/support/v4/app/aq;->b(Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLandroid/support/v4/c/a;)V

    iget-object v0, p0, Landroid/support/v4/app/at;->jy:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/at;->jy:Landroid/view/View;

    iget-object v1, p0, Landroid/support/v4/app/at;->jz:Landroid/graphics/Rect;

    invoke-static {v0, v1}, Landroid/support/v4/app/bb;->a(Landroid/view/View;Landroid/graphics/Rect;)V

    :cond_0
    return-void
.end method
