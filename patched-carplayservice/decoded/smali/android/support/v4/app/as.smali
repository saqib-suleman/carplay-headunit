.class final Landroid/support/v4/app/as;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic jn:Ljava/util/ArrayList;

.field final synthetic jo:Ljava/lang/Object;

.field final synthetic jp:Landroid/support/v4/app/bb;

.field final synthetic jq:Landroid/view/View;

.field final synthetic jr:Landroid/support/v4/app/Fragment;

.field final synthetic js:Ljava/util/ArrayList;

.field final synthetic jt:Ljava/util/ArrayList;

.field final synthetic ju:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Landroid/support/v4/app/bb;Landroid/view/View;Landroid/support/v4/app/Fragment;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/as;->jo:Ljava/lang/Object;

    iput-object p2, p0, Landroid/support/v4/app/as;->jp:Landroid/support/v4/app/bb;

    iput-object p3, p0, Landroid/support/v4/app/as;->jq:Landroid/view/View;

    iput-object p4, p0, Landroid/support/v4/app/as;->jr:Landroid/support/v4/app/Fragment;

    iput-object p5, p0, Landroid/support/v4/app/as;->js:Ljava/util/ArrayList;

    iput-object p6, p0, Landroid/support/v4/app/as;->jt:Ljava/util/ArrayList;

    iput-object p7, p0, Landroid/support/v4/app/as;->jn:Ljava/util/ArrayList;

    iput-object p8, p0, Landroid/support/v4/app/as;->ju:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget-object v0, p0, Landroid/support/v4/app/as;->jo:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/as;->jp:Landroid/support/v4/app/bb;

    iget-object v1, p0, Landroid/support/v4/app/as;->jo:Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v4/app/as;->jq:Landroid/view/View;

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/bb;->c(Ljava/lang/Object;Landroid/view/View;)V

    iget-object v0, p0, Landroid/support/v4/app/as;->jp:Landroid/support/v4/app/bb;

    iget-object v1, p0, Landroid/support/v4/app/as;->jo:Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v4/app/as;->jr:Landroid/support/v4/app/Fragment;

    iget-object v3, p0, Landroid/support/v4/app/as;->js:Ljava/util/ArrayList;

    iget-object v4, p0, Landroid/support/v4/app/as;->jq:Landroid/view/View;

    invoke-static {v0, v1, v2, v3, v4}, Landroid/support/v4/app/aq;->b(Landroid/support/v4/app/bb;Ljava/lang/Object;Landroid/support/v4/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/as;->jt:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/as;->jn:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/app/as;->ju:Ljava/lang/Object;

    if-eqz v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Landroid/support/v4/app/as;->jq:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Landroid/support/v4/app/as;->jp:Landroid/support/v4/app/bb;

    iget-object v2, p0, Landroid/support/v4/app/as;->ju:Ljava/lang/Object;

    iget-object v3, p0, Landroid/support/v4/app/as;->jn:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, v3, v0}, Landroid/support/v4/app/bb;->b(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/as;->jn:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Landroid/support/v4/app/as;->jn:Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/support/v4/app/as;->jq:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    return-void
.end method
