.class final Landroid/support/v4/app/au;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic jA:Landroid/support/v4/c/a;

.field final synthetic jB:Ljava/lang/Object;

.field final synthetic jC:Landroid/support/v4/app/av;

.field final synthetic jD:Ljava/util/ArrayList;

.field final synthetic jE:Landroid/graphics/Rect;

.field final synthetic jo:Ljava/lang/Object;

.field final synthetic jp:Landroid/support/v4/app/bb;

.field final synthetic jq:Landroid/view/View;

.field final synthetic jr:Landroid/support/v4/app/Fragment;

.field final synthetic js:Ljava/util/ArrayList;

.field final synthetic jv:Landroid/support/v4/app/Fragment;

.field final synthetic jw:Z


# direct methods
.method constructor <init>(Landroid/support/v4/app/bb;Landroid/support/v4/c/a;Ljava/lang/Object;Landroid/support/v4/app/av;Ljava/util/ArrayList;Landroid/view/View;Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLjava/util/ArrayList;Ljava/lang/Object;Landroid/graphics/Rect;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/au;->jp:Landroid/support/v4/app/bb;

    iput-object p2, p0, Landroid/support/v4/app/au;->jA:Landroid/support/v4/c/a;

    iput-object p3, p0, Landroid/support/v4/app/au;->jB:Ljava/lang/Object;

    iput-object p4, p0, Landroid/support/v4/app/au;->jC:Landroid/support/v4/app/av;

    iput-object p5, p0, Landroid/support/v4/app/au;->js:Ljava/util/ArrayList;

    iput-object p6, p0, Landroid/support/v4/app/au;->jq:Landroid/view/View;

    iput-object p7, p0, Landroid/support/v4/app/au;->jr:Landroid/support/v4/app/Fragment;

    iput-object p8, p0, Landroid/support/v4/app/au;->jv:Landroid/support/v4/app/Fragment;

    iput-boolean p9, p0, Landroid/support/v4/app/au;->jw:Z

    iput-object p10, p0, Landroid/support/v4/app/au;->jD:Ljava/util/ArrayList;

    iput-object p11, p0, Landroid/support/v4/app/au;->jo:Ljava/lang/Object;

    iput-object p12, p0, Landroid/support/v4/app/au;->jE:Landroid/graphics/Rect;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget-object v0, p0, Landroid/support/v4/app/au;->jp:Landroid/support/v4/app/bb;

    iget-object v1, p0, Landroid/support/v4/app/au;->jA:Landroid/support/v4/c/a;

    iget-object v2, p0, Landroid/support/v4/app/au;->jB:Ljava/lang/Object;

    iget-object v3, p0, Landroid/support/v4/app/au;->jC:Landroid/support/v4/app/av;

    invoke-static {v0, v1, v2, v3}, Landroid/support/v4/app/aq;->c(Landroid/support/v4/app/bb;Landroid/support/v4/c/a;Ljava/lang/Object;Landroid/support/v4/app/av;)Landroid/support/v4/c/a;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Landroid/support/v4/app/au;->js:Ljava/util/ArrayList;

    invoke-virtual {v0}, Landroid/support/v4/c/a;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v1, p0, Landroid/support/v4/app/au;->js:Ljava/util/ArrayList;

    iget-object v2, p0, Landroid/support/v4/app/au;->jq:Landroid/view/View;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    iget-object v1, p0, Landroid/support/v4/app/au;->jr:Landroid/support/v4/app/Fragment;

    iget-object v2, p0, Landroid/support/v4/app/au;->jv:Landroid/support/v4/app/Fragment;

    iget-boolean v3, p0, Landroid/support/v4/app/au;->jw:Z

    invoke-static {v1, v2, v3, v0}, Landroid/support/v4/app/aq;->b(Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLandroid/support/v4/c/a;)V

    iget-object v1, p0, Landroid/support/v4/app/au;->jB:Ljava/lang/Object;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/support/v4/app/au;->jp:Landroid/support/v4/app/bb;

    iget-object v2, p0, Landroid/support/v4/app/au;->jB:Ljava/lang/Object;

    iget-object v3, p0, Landroid/support/v4/app/au;->jD:Ljava/util/ArrayList;

    iget-object v4, p0, Landroid/support/v4/app/au;->js:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, v3, v4}, Landroid/support/v4/app/bb;->a(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    iget-object v1, p0, Landroid/support/v4/app/au;->jC:Landroid/support/v4/app/av;

    iget-object v2, p0, Landroid/support/v4/app/au;->jo:Ljava/lang/Object;

    iget-boolean v3, p0, Landroid/support/v4/app/au;->jw:Z

    invoke-static {v0, v1, v2, v3}, Landroid/support/v4/app/aq;->b(Landroid/support/v4/c/a;Landroid/support/v4/app/av;Ljava/lang/Object;Z)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Landroid/support/v4/app/au;->jE:Landroid/graphics/Rect;

    invoke-static {v0, v1}, Landroid/support/v4/app/bb;->a(Landroid/view/View;Landroid/graphics/Rect;)V

    :cond_1
    return-void
.end method
