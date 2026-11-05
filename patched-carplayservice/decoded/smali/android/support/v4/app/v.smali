.class final Landroid/support/v4/app/v;
.super Landroid/support/v4/app/u;

# interfaces
.implements Landroid/view/LayoutInflater$Factory2;


# static fields
.field static DEBUG:Z

.field static iC:Ljava/lang/reflect/Field;

.field static final iE:Landroid/view/animation/Interpolator;

.field static final iF:Landroid/view/animation/Interpolator;

.field static final iG:Landroid/view/animation/Interpolator;

.field static final iH:Landroid/view/animation/Interpolator;


# instance fields
.field hQ:Landroid/support/v4/app/t;

.field iA:Landroid/support/v4/app/Fragment;

.field iB:Landroid/support/v4/app/Fragment;

.field iD:Landroid/support/v4/app/ak;

.field iz:Landroid/support/v4/app/r;

.field mActive:Landroid/util/SparseArray;

.field final mAdded:Ljava/util/ArrayList;

.field mAvailBackStackIndices:Ljava/util/ArrayList;

.field mBackStack:Ljava/util/ArrayList;

.field mBackStackChangeListeners:Ljava/util/ArrayList;

.field mBackStackIndices:Ljava/util/ArrayList;

.field mCreatedMenus:Ljava/util/ArrayList;

.field mCurState:I

.field mDestroyed:Z

.field mExecCommit:Ljava/lang/Runnable;

.field mExecutingActions:Z

.field mHavePendingDeferredStart:Z

.field private final mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

.field mNeedMenuInvalidate:Z

.field mNextFragmentIndex:I

.field mNoTransactionsBecause:Ljava/lang/String;

.field mPendingActions:Ljava/util/ArrayList;

.field mPostponedTransactions:Ljava/util/ArrayList;

.field mStateArray:Landroid/util/SparseArray;

.field mStateBundle:Landroid/os/Bundle;

.field mStateSaved:Z

.field mStopped:Z

.field mTmpAddedFragments:Ljava/util/ArrayList;

.field mTmpIsPop:Ljava/util/ArrayList;

.field mTmpRecords:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x0

    sput-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    const/4 v0, 0x0

    sput-object v0, Landroid/support/v4/app/v;->iC:Ljava/lang/reflect/Field;

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v1, 0x40200000    # 2.5f

    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    sput-object v0, Landroid/support/v4/app/v;->iE:Landroid/view/animation/Interpolator;

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v2, 0x3fc00000    # 1.5f

    invoke-direct {v0, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    sput-object v0, Landroid/support/v4/app/v;->iF:Landroid/view/animation/Interpolator;

    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0, v1}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    sput-object v0, Landroid/support/v4/app/v;->iG:Landroid/view/animation/Interpolator;

    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0, v2}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    sput-object v0, Landroid/support/v4/app/v;->iH:Landroid/view/animation/Interpolator;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/support/v4/app/u;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/app/v;->mNextFragmentIndex:I

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    iput v0, p0, Landroid/support/v4/app/v;->mCurState:I

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/app/v;->mStateBundle:Landroid/os/Bundle;

    iput-object v0, p0, Landroid/support/v4/app/v;->mStateArray:Landroid/util/SparseArray;

    new-instance v0, Landroid/support/v4/app/w;

    invoke-direct {v0, p0}, Landroid/support/v4/app/w;-><init>(Landroid/support/v4/app/v;)V

    iput-object v0, p0, Landroid/support/v4/app/v;->mExecCommit:Ljava/lang/Runnable;

    return-void
.end method

.method private a(Ljava/util/ArrayList;Ljava/util/ArrayList;IILandroid/support/v4/c/c;)I
    .locals 7

    add-int/lit8 v0, p4, -0x1

    move v1, p4

    :goto_0
    if-lt v0, p3, :cond_5

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/c;

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v2}, Landroid/support/v4/app/c;->isPostponed()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, p1, v4, p4}, Landroid/support/v4/app/c;->interactsWith(Ljava/util/ArrayList;II)Z

    move-result v4

    if-nez v4, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    move v4, v5

    :goto_1
    if-eqz v4, :cond_4

    iget-object v4, p0, Landroid/support/v4/app/v;->mPostponedTransactions:Ljava/util/ArrayList;

    if-nez v4, :cond_1

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Landroid/support/v4/app/v;->mPostponedTransactions:Ljava/util/ArrayList;

    :cond_1
    new-instance v4, Landroid/support/v4/app/aj;

    invoke-direct {v4, v2, v3}, Landroid/support/v4/app/aj;-><init>(Landroid/support/v4/app/c;Z)V

    iget-object v6, p0, Landroid/support/v4/app/v;->mPostponedTransactions:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v4}, Landroid/support/v4/app/c;->a(Landroid/support/v4/app/l;)V

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Landroid/support/v4/app/c;->executeOps()V

    goto :goto_2

    :cond_2
    invoke-virtual {v2, v5}, Landroid/support/v4/app/c;->executePopOps(Z)V

    :goto_2
    add-int/lit8 v1, v1, -0x1

    if-eq v0, v1, :cond_3

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {p1, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_3
    invoke-direct {p0, p5}, Landroid/support/v4/app/v;->b(Landroid/support/v4/c/c;)V

    :cond_4
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_5
    return v1
.end method

.method private static a(FF)Landroid/support/v4/app/ae;
    .locals 1

    new-instance v0, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v0, p0, p1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    sget-object p0, Landroid/support/v4/app/v;->iF:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, p0}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 p0, 0xdc

    invoke-virtual {v0, p0, p1}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    new-instance p0, Landroid/support/v4/app/ae;

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1}, Landroid/support/v4/app/ae;-><init>(Landroid/view/animation/Animation;B)V

    return-object p0
.end method

.method private static a(FFFF)Landroid/support/v4/app/ae;
    .locals 12

    new-instance v0, Landroid/view/animation/AnimationSet;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    new-instance v11, Landroid/view/animation/ScaleAnimation;

    const/4 v7, 0x1

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v9, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    move-object v2, v11

    move v3, p0

    move v4, p1

    move v5, p0

    move v6, p1

    invoke-direct/range {v2 .. v10}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    sget-object p0, Landroid/support/v4/app/v;->iE:Landroid/view/animation/Interpolator;

    invoke-virtual {v11, p0}, Landroid/view/animation/ScaleAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 p0, 0xdc

    invoke-virtual {v11, p0, p1}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    invoke-virtual {v0, v11}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    new-instance v2, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v2, p2, p3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    sget-object p2, Landroid/support/v4/app/v;->iF:Landroid/view/animation/Interpolator;

    invoke-virtual {v2, p2}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    invoke-virtual {v2, p0, p1}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    invoke-virtual {v0, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    new-instance p0, Landroid/support/v4/app/ae;

    invoke-direct {p0, v0, v1}, Landroid/support/v4/app/ae;-><init>(Landroid/view/animation/Animation;B)V

    return-object p0
.end method

.method private a(Landroid/support/v4/app/Fragment;IZI)Landroid/support/v4/app/ae;
    .locals 5

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getNextAnim()I

    move-result p1

    invoke-static {}, Landroid/support/v4/app/Fragment;->ba()Landroid/view/animation/Animation;

    invoke-static {}, Landroid/support/v4/app/Fragment;->bb()Landroid/animation/Animator;

    const/4 v0, 0x1

    if-eqz p1, :cond_3

    iget-object v1, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v1}, Landroid/support/v4/app/t;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "anim"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    :try_start_0
    iget-object v3, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v3}, Landroid/support/v4/app/t;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, p1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v3

    if-eqz v3, :cond_0

    new-instance v4, Landroid/support/v4/app/ae;

    invoke-direct {v4, v3, v2}, Landroid/support/v4/app/ae;-><init>(Landroid/view/animation/Animation;B)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    :cond_0
    move v3, v0

    goto :goto_1

    :catch_0
    move-exception v3

    goto :goto_0

    :catch_1
    move-exception p1

    throw p1

    :cond_1
    :goto_0
    move v3, v2

    :goto_1
    if-nez v3, :cond_3

    :try_start_1
    iget-object v3, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v3}, Landroid/support/v4/app/t;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, p1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object v3

    if-eqz v3, :cond_3

    new-instance v4, Landroid/support/v4/app/ae;

    invoke-direct {v4, v3, v2}, Landroid/support/v4/app/ae;-><init>(Landroid/animation/Animator;B)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    return-object v4

    :catch_2
    move-exception v3

    if-nez v1, :cond_2

    iget-object v1, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v1}, Landroid/support/v4/app/t;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p1

    if-eqz p1, :cond_3

    new-instance p2, Landroid/support/v4/app/ae;

    invoke-direct {p2, p1, v2}, Landroid/support/v4/app/ae;-><init>(Landroid/view/animation/Animation;B)V

    return-object p2

    :cond_2
    throw v3

    :cond_3
    const/4 p1, 0x0

    if-nez p2, :cond_4

    return-object p1

    :cond_4
    const/4 v1, -0x1

    const/16 v2, 0x1001

    if-eq p2, v2, :cond_9

    const/16 v0, 0x1003

    if-eq p2, v0, :cond_7

    const/16 v0, 0x2002

    if-eq p2, v0, :cond_5

    goto :goto_4

    :cond_5
    if-eqz p3, :cond_6

    const/4 p2, 0x3

    :goto_2
    move v1, p2

    goto :goto_4

    :cond_6
    const/4 p2, 0x4

    goto :goto_2

    :cond_7
    if-eqz p3, :cond_8

    const/4 p2, 0x5

    goto :goto_2

    :cond_8
    const/4 p2, 0x6

    goto :goto_2

    :cond_9
    if-eqz p3, :cond_a

    :goto_3
    move v1, v0

    goto :goto_4

    :cond_a
    const/4 v0, 0x2

    goto :goto_3

    :goto_4
    if-gez v1, :cond_b

    return-object p1

    :cond_b
    const p2, 0x3f79999a    # 0.975f

    const/4 p3, 0x0

    const/high16 v0, 0x3f800000    # 1.0f

    packed-switch v1, :pswitch_data_0

    if-nez p4, :cond_c

    iget-object p2, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {p2}, Landroid/support/v4/app/t;->onHasWindowAnimations()Z

    move-result p2

    if-eqz p2, :cond_c

    iget-object p2, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {p2}, Landroid/support/v4/app/t;->onGetWindowAnimations()I

    move-result p4

    goto :goto_5

    :pswitch_0
    invoke-static {v0, p3}, Landroid/support/v4/app/v;->a(FF)Landroid/support/v4/app/ae;

    move-result-object p1

    return-object p1

    :pswitch_1
    invoke-static {p3, v0}, Landroid/support/v4/app/v;->a(FF)Landroid/support/v4/app/ae;

    move-result-object p1

    return-object p1

    :pswitch_2
    const p1, 0x3f89999a    # 1.075f

    invoke-static {v0, p1, v0, p3}, Landroid/support/v4/app/v;->a(FFFF)Landroid/support/v4/app/ae;

    move-result-object p1

    return-object p1

    :pswitch_3
    invoke-static {p2, v0, p3, v0}, Landroid/support/v4/app/v;->a(FFFF)Landroid/support/v4/app/ae;

    move-result-object p1

    return-object p1

    :pswitch_4
    invoke-static {v0, p2, v0, p3}, Landroid/support/v4/app/v;->a(FFFF)Landroid/support/v4/app/ae;

    move-result-object p1

    return-object p1

    :pswitch_5
    const/high16 p1, 0x3f900000    # 1.125f

    invoke-static {p1, v0, p3, v0}, Landroid/support/v4/app/v;->a(FFFF)Landroid/support/v4/app/ae;

    move-result-object p1

    return-object p1

    :cond_c
    :goto_5
    if-nez p4, :cond_d

    :cond_d
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static a(Landroid/view/animation/Animation;)Landroid/view/animation/Animation$AnimationListener;
    .locals 2

    :try_start_0
    sget-object v0, Landroid/support/v4/app/v;->iC:Ljava/lang/reflect/Field;

    if-nez v0, :cond_0

    const-class v0, Landroid/view/animation/Animation;

    const-string v1, "mListener"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Landroid/support/v4/app/v;->iC:Ljava/lang/reflect/Field;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    :cond_0
    sget-object v0, Landroid/support/v4/app/v;->iC:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/animation/Animation$AnimationListener;
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v0, "FragmentManager"

    const-string v1, "Cannot access Animation\'s mListener field"

    goto :goto_0

    :catch_1
    move-exception p0

    const-string v0, "FragmentManager"

    const-string v1, "No field with the name mListener is found in Animation class"

    :goto_0
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method private a(ILandroid/support/v4/app/c;)V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_2

    sget-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "FragmentManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Setting back stack index "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    :goto_0
    if-ge v0, p1, :cond_5

    iget-object v1, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    if-nez v1, :cond_3

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    :cond_3
    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_4

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Adding available back stack index "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    iget-object v1, p0, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    sget-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v0, :cond_6

    const-string v0, "FragmentManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Adding back stack index "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " with "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    iget-object p1, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private a(Landroid/support/v4/app/Fragment;Landroid/content/Context;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1, p2}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;Landroid/content/Context;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private a(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1, p2}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private a(Landroid/support/v4/app/Fragment;Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1, p2, p3}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;Landroid/view/View;Landroid/os/Bundle;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static a(Landroid/support/v4/app/ak;)V
    .locals 3

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/app/ak;->getFragments()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/support/v4/app/Fragment;->mRetaining:Z

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Landroid/support/v4/app/ak;->getChildNonConfigs()Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_2

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/ak;

    invoke-static {v0}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/ak;)V

    goto :goto_1

    :cond_2
    return-void
.end method

.method static synthetic a(Landroid/support/v4/app/v;Landroid/support/v4/app/c;ZZZ)V
    .locals 7

    if-eqz p2, :cond_0

    invoke-virtual {p1, p4}, Landroid/support/v4/app/c;->executePopOps(Z)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/app/c;->executeOps()V

    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    const/4 v6, 0x1

    invoke-direct {v1, v6}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz p3, :cond_1

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Landroid/support/v4/app/aq;->a(Landroid/support/v4/app/v;Ljava/util/ArrayList;Ljava/util/ArrayList;IIZ)V

    :cond_1
    if-eqz p4, :cond_2

    iget p2, p0, Landroid/support/v4/app/v;->mCurState:I

    invoke-virtual {p0, p2, v6}, Landroid/support/v4/app/v;->moveToState(IZ)V

    :cond_2
    iget-object p2, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    if-eqz p2, :cond_6

    iget-object p2, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {p2}, Landroid/util/SparseArray;->size()I

    move-result p2

    const/4 p3, 0x0

    move v0, p3

    :goto_1
    if-ge v0, p2, :cond_6

    iget-object v1, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_5

    iget-object v2, v1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v2, :cond_5

    iget-boolean v2, v1, Landroid/support/v4/app/Fragment;->mIsNewlyAdded:Z

    if-eqz v2, :cond_5

    iget v2, v1, Landroid/support/v4/app/Fragment;->mContainerId:I

    invoke-virtual {p1, v2}, Landroid/support/v4/app/c;->interactsWith(I)Z

    move-result v2

    if-eqz v2, :cond_5

    iget v2, v1, Landroid/support/v4/app/Fragment;->hW:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_3

    iget-object v2, v1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iget v4, v1, Landroid/support/v4/app/Fragment;->hW:F

    invoke-virtual {v2, v4}, Landroid/view/View;->setAlpha(F)V

    :cond_3
    if-eqz p4, :cond_4

    iput v3, v1, Landroid/support/v4/app/Fragment;->hW:F

    goto :goto_2

    :cond_4
    const/high16 v2, -0x40800000    # -1.0f

    iput v2, v1, Landroid/support/v4/app/Fragment;->hW:F

    iput-boolean p3, v1, Landroid/support/v4/app/Fragment;->mIsNewlyAdded:Z

    :cond_5
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_6
    return-void
.end method

.method private static a(Landroid/support/v4/c/c;)V
    .locals 5

    invoke-virtual {p0}, Landroid/support/v4/c/c;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p0, v1}, Landroid/support/v4/c/c;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/Fragment;

    iget-boolean v3, v2, Landroid/support/v4/app/Fragment;->mAdded:Z

    if-nez v3, :cond_0

    iget-object v3, v2, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getAlpha()F

    move-result v4

    iput v4, v2, Landroid/support/v4/app/Fragment;->hW:F

    const/4 v2, 0x0

    invoke-virtual {v3, v2}, Landroid/view/View;->setAlpha(F)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static a(Landroid/view/View;Landroid/support/v4/app/ae;)V
    .locals 5

    if-eqz p0, :cond_8

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p0, :cond_6

    if-nez p1, :cond_1

    goto :goto_3

    :cond_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v2, v3, :cond_6

    invoke-virtual {p0}, Landroid/view/View;->getLayerType()I

    move-result v2

    if-nez v2, :cond_6

    invoke-static {p0}, Landroid/support/v4/view/n;->k(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_6

    iget-object v2, p1, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    instance-of v2, v2, Landroid/view/animation/AlphaAnimation;

    if-eqz v2, :cond_2

    :goto_0
    move v2, v1

    goto :goto_2

    :cond_2
    iget-object v2, p1, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    instance-of v2, v2, Landroid/view/animation/AnimationSet;

    if-eqz v2, :cond_5

    iget-object v2, p1, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    check-cast v2, Landroid/view/animation/AnimationSet;

    invoke-virtual {v2}, Landroid/view/animation/AnimationSet;->getAnimations()Ljava/util/List;

    move-result-object v2

    move v3, v0

    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_4

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Landroid/view/animation/AlphaAnimation;

    if-eqz v4, :cond_3

    goto :goto_0

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_4
    move v2, v0

    goto :goto_2

    :cond_5
    iget-object v2, p1, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    invoke-static {v2}, Landroid/support/v4/app/v;->modifiesAlpha(Landroid/animation/Animator;)Z

    move-result v2

    :goto_2
    if-eqz v2, :cond_6

    move v0, v1

    :cond_6
    :goto_3
    if-eqz v0, :cond_8

    iget-object v0, p1, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    if-eqz v0, :cond_7

    iget-object p1, p1, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    new-instance v0, Landroid/support/v4/app/af;

    invoke-direct {v0, p0}, Landroid/support/v4/app/af;-><init>(Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void

    :cond_7
    iget-object v0, p1, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    invoke-static {v0}, Landroid/support/v4/app/v;->a(Landroid/view/animation/Animation;)Landroid/view/animation/Animation$AnimationListener;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    iget-object p1, p1, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    new-instance v1, Landroid/support/v4/app/ab;

    invoke-direct {v1, p0, v0}, Landroid/support/v4/app/ab;-><init>(Landroid/view/View;Landroid/view/animation/Animation$AnimationListener;)V

    invoke-virtual {p1, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    :cond_8
    return-void
.end method

.method private a(Ljava/lang/RuntimeException;)V
    .locals 4

    const-string v0, "FragmentManager"

    invoke-virtual {p1}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "FragmentManager"

    const-string v1, "Activity state:"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Landroid/support/v4/c/g;

    const-string v1, "FragmentManager"

    invoke-direct {v0, v1}, Landroid/support/v4/c/g;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    iget-object v0, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    const-string v3, "  "

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v0, v3, v1, v2}, Landroid/support/v4/app/t;->a(Ljava/lang/String;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "FragmentManager"

    const-string v2, "Failed dumping state"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_0
    :try_start_1
    const-string v0, "  "

    const/4 v3, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {p0, v0, v3, v1, v2}, Landroid/support/v4/app/v;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :goto_0
    throw p1
.end method

.method private a(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 7

    iget-object v0, p0, Landroid/support/v4/app/v;->mPostponedTransactions:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mPostponedTransactions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    move v2, v0

    move v0, v1

    :goto_1
    if-ge v0, v2, :cond_5

    iget-object v3, p0, Landroid/support/v4/app/v;->mPostponedTransactions:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/app/aj;

    const/4 v4, -0x1

    if-eqz p1, :cond_1

    invoke-static {v3}, Landroid/support/v4/app/aj;->a(Landroid/support/v4/app/aj;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-static {v3}, Landroid/support/v4/app/aj;->b(Landroid/support/v4/app/aj;)Landroid/support/v4/app/c;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    if-eq v5, v4, :cond_1

    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_1

    :goto_2
    invoke-virtual {v3}, Landroid/support/v4/app/aj;->cancelTransaction()V

    goto :goto_3

    :cond_1
    invoke-virtual {v3}, Landroid/support/v4/app/aj;->isReady()Z

    move-result v5

    if-nez v5, :cond_2

    if-eqz p1, :cond_4

    invoke-static {v3}, Landroid/support/v4/app/aj;->b(Landroid/support/v4/app/aj;)Landroid/support/v4/app/c;

    move-result-object v5

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v5, p1, v1, v6}, Landroid/support/v4/app/c;->interactsWith(Ljava/util/ArrayList;II)Z

    move-result v5

    if-eqz v5, :cond_4

    :cond_2
    iget-object v5, p0, Landroid/support/v4/app/v;->mPostponedTransactions:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 v0, v0, -0x1

    add-int/lit8 v2, v2, -0x1

    if-eqz p1, :cond_3

    invoke-static {v3}, Landroid/support/v4/app/aj;->a(Landroid/support/v4/app/aj;)Z

    move-result v5

    if-nez v5, :cond_3

    invoke-static {v3}, Landroid/support/v4/app/aj;->b(Landroid/support/v4/app/aj;)Landroid/support/v4/app/c;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    if-eq v5, v4, :cond_3

    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {v3}, Landroid/support/v4/app/aj;->completeTransaction()V

    :cond_4
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_5
    return-void
.end method

.method private a(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V
    .locals 15

    move-object v7, p0

    move-object/from16 v0, p1

    move-object/from16 v8, p2

    move/from16 v9, p3

    move/from16 v10, p4

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/c;

    iget-boolean v11, v1, Landroid/support/v4/app/c;->mReorderingAllowed:Z

    iget-object v1, v7, Landroid/support/v4/app/v;->mTmpAddedFragments:Ljava/util/ArrayList;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v7, Landroid/support/v4/app/v;->mTmpAddedFragments:Ljava/util/ArrayList;

    goto :goto_0

    :cond_0
    iget-object v1, v7, Landroid/support/v4/app/v;->mTmpAddedFragments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    :goto_0
    iget-object v1, v7, Landroid/support/v4/app/v;->mTmpAddedFragments:Ljava/util/ArrayList;

    iget-object v2, v7, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object v1, v7, Landroid/support/v4/app/v;->iB:Landroid/support/v4/app/Fragment;

    const/4 v2, 0x0

    move-object v3, v1

    move v12, v2

    move v1, v9

    :goto_1
    const/4 v13, 0x1

    if-ge v1, v10, :cond_4

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v4/app/c;

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_1

    iget-object v5, v7, Landroid/support/v4/app/v;->mTmpAddedFragments:Ljava/util/ArrayList;

    invoke-virtual {v4, v5, v3}, Landroid/support/v4/app/c;->a(Ljava/util/ArrayList;Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    goto :goto_2

    :cond_1
    iget-object v5, v7, Landroid/support/v4/app/v;->mTmpAddedFragments:Ljava/util/ArrayList;

    invoke-virtual {v4, v5, v3}, Landroid/support/v4/app/c;->b(Ljava/util/ArrayList;Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    :goto_2
    if-nez v12, :cond_3

    iget-boolean v4, v4, Landroid/support/v4/app/c;->mAddToBackStack:Z

    if-eqz v4, :cond_2

    goto :goto_3

    :cond_2
    move v12, v2

    goto :goto_4

    :cond_3
    :goto_3
    move v12, v13

    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    iget-object v1, v7, Landroid/support/v4/app/v;->mTmpAddedFragments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    if-nez v11, :cond_5

    const/4 v6, 0x0

    move-object v1, v7

    move-object v2, v0

    move-object v3, v8

    move v4, v9

    move v5, v10

    invoke-static/range {v1 .. v6}, Landroid/support/v4/app/aq;->a(Landroid/support/v4/app/v;Ljava/util/ArrayList;Ljava/util/ArrayList;IIZ)V

    :cond_5
    invoke-static/range {p1 .. p4}, Landroid/support/v4/app/v;->b(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    if-eqz v11, :cond_6

    new-instance v14, Landroid/support/v4/c/c;

    invoke-direct {v14}, Landroid/support/v4/c/c;-><init>()V

    invoke-direct {v7, v14}, Landroid/support/v4/app/v;->b(Landroid/support/v4/c/c;)V

    move-object v1, v7

    move-object v2, v0

    move-object v3, v8

    move v4, v9

    move v5, v10

    move-object v6, v14

    invoke-direct/range {v1 .. v6}, Landroid/support/v4/app/v;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;IILandroid/support/v4/c/c;)I

    move-result v1

    invoke-static {v14}, Landroid/support/v4/app/v;->a(Landroid/support/v4/c/c;)V

    move v5, v1

    goto :goto_5

    :cond_6
    move v5, v10

    :goto_5
    if-eq v5, v9, :cond_7

    if-eqz v11, :cond_7

    const/4 v6, 0x1

    move-object v1, v7

    move-object v2, v0

    move-object v3, v8

    move v4, v9

    invoke-static/range {v1 .. v6}, Landroid/support/v4/app/aq;->a(Landroid/support/v4/app/v;Ljava/util/ArrayList;Ljava/util/ArrayList;IIZ)V

    iget v1, v7, Landroid/support/v4/app/v;->mCurState:I

    invoke-virtual {v7, v1, v13}, Landroid/support/v4/app/v;->moveToState(IZ)V

    :cond_7
    :goto_6
    if-ge v9, v10, :cond_b

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/c;

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_a

    iget v2, v1, Landroid/support/v4/app/c;->mIndex:I

    if-ltz v2, :cond_a

    iget v2, v1, Landroid/support/v4/app/c;->mIndex:I

    monitor-enter p0

    :try_start_0
    iget-object v3, v7, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object v3, v7, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    if-nez v3, :cond_8

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v7, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    :cond_8
    sget-boolean v3, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v3, :cond_9

    const-string v3, "FragmentManager"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Freeing back stack index "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    iget-object v3, v7, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v2, -0x1

    iput v2, v1, Landroid/support/v4/app/c;->mIndex:I

    goto :goto_7

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_a
    :goto_7
    invoke-virtual {v1}, Landroid/support/v4/app/c;->runOnCommitRunnables()V

    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    :cond_b
    if-eqz v12, :cond_c

    invoke-direct {v7}, Landroid/support/v4/app/v;->reportBackStackChanged()V

    :cond_c
    return-void
.end method

.method private b(Landroid/os/Bundle;Ljava/lang/String;)Landroid/support/v4/app/Fragment;
    .locals 4

    const/4 v0, -0x1

    invoke-virtual {p1, p2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    if-nez v0, :cond_1

    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Fragment no longer exists for key "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ": index "

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Landroid/support/v4/app/v;->a(Ljava/lang/RuntimeException;)V

    :cond_1
    return-object v0
.end method

.method private b(Landroid/support/v4/app/Fragment;Landroid/content/Context;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1, p2}, Landroid/support/v4/app/v;->b(Landroid/support/v4/app/Fragment;Landroid/content/Context;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private b(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1, p2}, Landroid/support/v4/app/v;->b(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method static synthetic b(Landroid/support/v4/app/v;)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/app/v;->bA()V

    return-void
.end method

.method private b(Landroid/support/v4/c/c;)V
    .locals 10

    iget v0, p0, Landroid/support/v4/app/v;->mCurState:I

    if-gtz v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Landroid/support/v4/app/v;->mCurState:I

    const/4 v1, 0x4

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v8, v2

    :goto_0
    if-ge v8, v1, :cond_2

    iget-object v2, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Landroid/support/v4/app/Fragment;

    iget v2, v9, Landroid/support/v4/app/Fragment;->mState:I

    if-ge v2, v0, :cond_1

    invoke-virtual {v9}, Landroid/support/v4/app/Fragment;->getNextAnim()I

    move-result v5

    invoke-virtual {v9}, Landroid/support/v4/app/Fragment;->getNextTransition()I

    move-result v6

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, v9

    move v4, v0

    invoke-virtual/range {v2 .. v7}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IIIZ)V

    iget-object v2, v9, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v2, :cond_1

    iget-boolean v2, v9, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-nez v2, :cond_1

    iget-boolean v2, v9, Landroid/support/v4/app/Fragment;->mIsNewlyAdded:Z

    if-eqz v2, :cond_1

    invoke-virtual {p1, v9}, Landroid/support/v4/c/c;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private b(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 4

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p2, :cond_6

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v0, v1, :cond_6

    invoke-direct {p0, p1, p2}, Landroid/support/v4/app/v;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v1, v0, :cond_4

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/app/c;

    iget-boolean v3, v3, Landroid/support/v4/app/c;->mReorderingAllowed:Z

    if-nez v3, :cond_3

    if-eq v2, v1, :cond_1

    invoke-direct {p0, p1, p2, v2, v1}, Landroid/support/v4/app/v;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    :cond_1
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_2

    :goto_1
    if-ge v2, v0, :cond_2

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/app/c;

    iget-boolean v3, v3, Landroid/support/v4/app/c;->mReorderingAllowed:Z

    if-nez v3, :cond_2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    invoke-direct {p0, p1, p2, v1, v2}, Landroid/support/v4/app/v;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    add-int/lit8 v1, v2, -0x1

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    if-eq v2, v0, :cond_5

    invoke-direct {p0, p1, p2, v2, v0}, Landroid/support/v4/app/v;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    :cond_5
    return-void

    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Internal error with the back stack records"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_7
    return-void
.end method

.method private static b(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V
    .locals 3

    :goto_0
    if-ge p2, p3, :cond_2

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/c;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/c;->bumpBackStackNesting(I)V

    add-int/lit8 v1, p3, -0x1

    if-ne p2, v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v0, v2}, Landroid/support/v4/app/c;->executePopOps(Z)V

    goto :goto_2

    :cond_1
    invoke-virtual {v0, v2}, Landroid/support/v4/app/c;->bumpBackStackNesting(I)V

    invoke-virtual {v0}, Landroid/support/v4/app/c;->executeOps()V

    :goto_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private bA()V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mPostponedTransactions:Ljava/util/ArrayList;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->mPostponedTransactions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iget-object v3, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    if-eqz v3, :cond_1

    iget-object v3, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v3, v2, :cond_1

    move v1, v2

    :cond_1
    if-nez v0, :cond_2

    if-eqz v1, :cond_3

    :cond_2
    iget-object v0, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v0}, Landroid/support/v4/app/t;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/v;->mExecCommit:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v0}, Landroid/support/v4/app/t;->getHandler()Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/v;->mExecCommit:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_3
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private bB()V
    .locals 2

    iget-boolean v0, p0, Landroid/support/v4/app/v;->mExecutingActions:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    if-eqz v0, :cond_2

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v1}, Landroid/support/v4/app/t;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/v;->mTmpRecords:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/v;->mTmpRecords:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/v;->mTmpIsPop:Ljava/util/ArrayList;

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mExecutingActions:Z

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    invoke-direct {p0, v1, v1}, Landroid/support/v4/app/v;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mExecutingActions:Z

    return-void

    :catchall_0
    move-exception v1

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mExecutingActions:Z

    throw v1

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Must be called from main thread of fragment host"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Fragment host has been destroyed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "FragmentManager is already executing transactions"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private bC()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mExecutingActions:Z

    iget-object v0, p0, Landroid/support/v4/app/v;->mTmpIsPop:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Landroid/support/v4/app/v;->mTmpRecords:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method private bD()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->mPostponedTransactions:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    :goto_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mPostponedTransactions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->mPostponedTransactions:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/aj;

    invoke-virtual {v0}, Landroid/support/v4/app/aj;->completeTransaction()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private bF()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    iget-object v1, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    iget-object v2, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->delete(I)V

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private by()Z
    .locals 5

    invoke-virtual {p0}, Landroid/support/v4/app/v;->execPendingActions()Z

    invoke-direct {p0}, Landroid/support/v4/app/v;->bB()V

    iget-object v0, p0, Landroid/support/v4/app/v;->iB:Landroid/support/v4/app/Fragment;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iB:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/app/u;->popBackStackImmediate()Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mTmpRecords:Ljava/util/ArrayList;

    iget-object v2, p0, Landroid/support/v4/app/v;->mTmpIsPop:Ljava/util/ArrayList;

    iget-object v3, p0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    const/4 v4, 0x0

    if-nez v3, :cond_1

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr v3, v1

    if-gez v3, :cond_2

    goto :goto_0

    :cond_2
    iget-object v4, p0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v4, v1

    :goto_0
    if-eqz v4, :cond_3

    iput-boolean v1, p0, Landroid/support/v4/app/v;->mExecutingActions:Z

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mTmpRecords:Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/support/v4/app/v;->mTmpIsPop:Ljava/util/ArrayList;

    invoke-direct {p0, v0, v1}, Landroid/support/v4/app/v;->b(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Landroid/support/v4/app/v;->bC()V

    goto :goto_1

    :catchall_0
    move-exception v0

    invoke-direct {p0}, Landroid/support/v4/app/v;->bC()V

    throw v0

    :cond_3
    :goto_1
    invoke-direct {p0}, Landroid/support/v4/app/v;->doPendingDeferredStart()V

    invoke-direct {p0}, Landroid/support/v4/app/v;->bF()V

    return v4
.end method

.method private bz()V
    .locals 3

    invoke-virtual {p0}, Landroid/support/v4/app/v;->isStateSaved()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/v;->mNoTransactionsBecause:Ljava/lang/String;

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can not perform this action inside of "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Landroid/support/v4/app/v;->mNoTransactionsBecause:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can not perform this action after onSaveInstanceState"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private c(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1, p2}, Landroid/support/v4/app/v;->c(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private c(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v2, v1

    :goto_0
    if-ge v1, v0, :cond_1

    iget-object v3, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/app/ai;

    invoke-interface {v3, p1, p2}, Landroid/support/v4/app/ai;->generateOps(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v3

    or-int/2addr v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    iget-object p1, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {p1}, Landroid/support/v4/app/t;->getHandler()Landroid/os/Handler;

    move-result-object p1

    iget-object p2, p0, Landroid/support/v4/app/v;->mExecCommit:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    monitor-exit p0

    return v2

    :cond_2
    :goto_1
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private d(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1, p2}, Landroid/support/v4/app/v;->d(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private doPendingDeferredStart()V
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/app/v;->mHavePendingDeferredStart:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mHavePendingDeferredStart:Z

    invoke-direct {p0}, Landroid/support/v4/app/v;->startPendingDeferredFragments()V

    :cond_0
    return-void
.end method

.method private e(Landroid/support/v4/app/Fragment;)V
    .locals 6

    iget v2, p0, Landroid/support/v4/app/v;->mCurState:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IIIZ)V

    return-void
.end method

.method public static i(Landroid/support/v4/app/Fragment;)V
    .locals 3

    sget-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "FragmentManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "hide: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-boolean v0, p0, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mHidden:Z

    iget-boolean v1, p0, Landroid/support/v4/app/Fragment;->mHiddenChanged:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mHiddenChanged:Z

    :cond_1
    return-void
.end method

.method public static j(Landroid/support/v4/app/Fragment;)V
    .locals 3

    sget-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "FragmentManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "show: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-boolean v0, p0, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mHidden:Z

    iget-boolean v0, p0, Landroid/support/v4/app/Fragment;->mHiddenChanged:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mHiddenChanged:Z

    :cond_1
    return-void
.end method

.method private m(Landroid/support/v4/app/Fragment;)V
    .locals 2

    iget-object v0, p1, Landroid/support/v4/app/Fragment;->hU:Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mStateArray:Landroid/util/SparseArray;

    if-nez v0, :cond_1

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/v;->mStateArray:Landroid/util/SparseArray;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/v;->mStateArray:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    :goto_0
    iget-object v0, p1, Landroid/support/v4/app/Fragment;->hU:Landroid/view/View;

    iget-object v1, p0, Landroid/support/v4/app/v;->mStateArray:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    iget-object v0, p0, Landroid/support/v4/app/v;->mStateArray:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-lez v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/app/v;->mStateArray:Landroid/util/SparseArray;

    iput-object v0, p1, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    const/4 p1, 0x0

    iput-object p1, p0, Landroid/support/v4/app/v;->mStateArray:Landroid/util/SparseArray;

    :cond_2
    return-void
.end method

.method private static modifiesAlpha(Landroid/animation/Animator;)Z
    .locals 5

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p0, Landroid/animation/ValueAnimator;

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    check-cast p0, Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getValues()[Landroid/animation/PropertyValuesHolder;

    move-result-object p0

    move v1, v0

    :goto_0
    array-length v3, p0

    if-ge v1, v3, :cond_4

    const-string v3, "alpha"

    aget-object v4, p0, v1

    invoke-virtual {v4}, Landroid/animation/PropertyValuesHolder;->getPropertyName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    return v2

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    instance-of v1, p0, Landroid/animation/AnimatorSet;

    if-eqz v1, :cond_4

    check-cast p0, Landroid/animation/AnimatorSet;

    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    move-result-object p0

    move v1, v0

    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_4

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/animation/Animator;

    invoke-static {v3}, Landroid/support/v4/app/v;->modifiesAlpha(Landroid/animation/Animator;)Z

    move-result v3

    if-eqz v3, :cond_3

    return v2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    return v0
.end method

.method private o(Landroid/support/v4/app/Fragment;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1}, Landroid/support/v4/app/v;->o(Landroid/support/v4/app/Fragment;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private p(Landroid/support/v4/app/Fragment;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1}, Landroid/support/v4/app/v;->p(Landroid/support/v4/app/Fragment;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private q(Landroid/support/v4/app/Fragment;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1}, Landroid/support/v4/app/v;->q(Landroid/support/v4/app/Fragment;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private r(Landroid/support/v4/app/Fragment;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1}, Landroid/support/v4/app/v;->r(Landroid/support/v4/app/Fragment;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private reportBackStackChanged()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->mBackStackChangeListeners:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/support/v4/app/v;->mBackStackChangeListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Landroid/support/v4/app/v;->mBackStackChangeListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static reverseTransit(I)I
    .locals 3

    const/16 v0, 0x2002

    const/16 v1, 0x1003

    const/16 v2, 0x1001

    if-eq p0, v2, :cond_2

    if-eq p0, v1, :cond_1

    if-eq p0, v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    move v0, v2

    return v0

    :cond_1
    move v0, v1

    :cond_2
    return v0
.end method

.method private s(I)Landroid/support/v4/app/Fragment;
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_0

    iget v2, v1, Landroid/support/v4/app/Fragment;->mFragmentId:I

    if-ne v2, p1, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_1
    if-ltz v0, :cond_3

    iget-object v1, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_2

    iget v2, v1, Landroid/support/v4/app/Fragment;->mFragmentId:I

    if-ne v2, p1, :cond_2

    return-object v1

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method private s(Landroid/support/v4/app/Fragment;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1}, Landroid/support/v4/app/v;->s(Landroid/support/v4/app/Fragment;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private saveNonConfig()V
    .locals 10

    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    move v2, v0

    move-object v3, v1

    move-object v4, v3

    move-object v5, v4

    :goto_0
    iget-object v6, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v6}, Landroid/util/SparseArray;->size()I

    move-result v6

    if-ge v2, v6, :cond_9

    iget-object v6, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v6, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/app/Fragment;

    if-eqz v6, :cond_7

    iget-boolean v7, v6, Landroid/support/v4/app/Fragment;->mRetainInstance:Z

    if-eqz v7, :cond_2

    if-nez v3, :cond_0

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v7, v6, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    if-eqz v7, :cond_1

    iget-object v7, v6, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    iget v7, v7, Landroid/support/v4/app/Fragment;->mIndex:I

    goto :goto_1

    :cond_1
    const/4 v7, -0x1

    :goto_1
    iput v7, v6, Landroid/support/v4/app/Fragment;->mTargetIndex:I

    sget-boolean v7, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v7, :cond_2

    const-string v7, "FragmentManager"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "retainNonConfig: keeping retained "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-object v7, v6, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v7, :cond_3

    iget-object v7, v6, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-direct {v7}, Landroid/support/v4/app/v;->saveNonConfig()V

    iget-object v7, v6, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    iget-object v7, v7, Landroid/support/v4/app/v;->iD:Landroid/support/v4/app/ak;

    goto :goto_2

    :cond_3
    iget-object v7, v6, Landroid/support/v4/app/Fragment;->hS:Landroid/support/v4/app/ak;

    :goto_2
    if-nez v4, :cond_4

    if-eqz v7, :cond_4

    new-instance v4, Ljava/util/ArrayList;

    iget-object v8, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    move-result v8

    invoke-direct {v4, v8}, Ljava/util/ArrayList;-><init>(I)V

    move v8, v0

    :goto_3
    if-ge v8, v2, :cond_4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    :cond_4
    if-eqz v4, :cond_5

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5
    if-nez v5, :cond_6

    iget-object v7, v6, Landroid/support/v4/app/Fragment;->am:Landroid/arch/lifecycle/x;

    if-eqz v7, :cond_6

    new-instance v5, Ljava/util/ArrayList;

    iget-object v7, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->size()I

    move-result v7

    invoke-direct {v5, v7}, Ljava/util/ArrayList;-><init>(I)V

    move v7, v0

    :goto_4
    if-ge v7, v2, :cond_6

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    :cond_6
    if-eqz v5, :cond_7

    iget-object v6, v6, Landroid/support/v4/app/Fragment;->am:Landroid/arch/lifecycle/x;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_8
    move-object v3, v1

    move-object v4, v3

    move-object v5, v4

    :cond_9
    if-nez v3, :cond_a

    if-nez v4, :cond_a

    if-nez v5, :cond_a

    iput-object v1, p0, Landroid/support/v4/app/v;->iD:Landroid/support/v4/app/ak;

    return-void

    :cond_a
    new-instance v0, Landroid/support/v4/app/ak;

    invoke-direct {v0, v3, v4, v5}, Landroid/support/v4/app/ak;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    iput-object v0, p0, Landroid/support/v4/app/v;->iD:Landroid/support/v4/app/ak;

    return-void
.end method

.method private startPendingDeferredFragments()V
    .locals 9

    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    iget-object v2, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Landroid/support/v4/app/Fragment;

    if-eqz v4, :cond_2

    iget-boolean v2, v4, Landroid/support/v4/app/Fragment;->mDeferStart:Z

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Landroid/support/v4/app/v;->mExecutingActions:Z

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v4/app/v;->mHavePendingDeferredStart:Z

    goto :goto_1

    :cond_1
    iput-boolean v0, v4, Landroid/support/v4/app/Fragment;->mDeferStart:Z

    iget v5, p0, Landroid/support/v4/app/v;->mCurState:I

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, p0

    invoke-virtual/range {v3 .. v8}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IIIZ)V

    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method private t(I)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v0, p0, Landroid/support/v4/app/v;->mExecutingActions:Z

    invoke-virtual {p0, p1, v1}, Landroid/support/v4/app/v;->moveToState(IZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iput-boolean v1, p0, Landroid/support/v4/app/v;->mExecutingActions:Z

    invoke-virtual {p0}, Landroid/support/v4/app/v;->execPendingActions()Z

    return-void

    :catchall_0
    move-exception p1

    iput-boolean v1, p0, Landroid/support/v4/app/v;->mExecutingActions:Z

    throw p1
.end method

.method private t(Landroid/support/v4/app/Fragment;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1}, Landroid/support/v4/app/v;->t(Landroid/support/v4/app/Fragment;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method private u(Landroid/support/v4/app/Fragment;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    instance-of v1, v0, Landroid/support/v4/app/v;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/v;

    invoke-direct {v0, p1}, Landroid/support/v4/app/v;->u(Landroid/support/v4/app/Fragment;)V

    :cond_0
    iget-object p1, p0, Landroid/support/v4/app/v;->mLifecycleCallbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public final a(Landroid/support/v4/app/c;)I
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Adding back stack index "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " with "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v1, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    monitor-exit p0

    return v0

    :cond_2
    :goto_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    if-nez v0, :cond_3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    :cond_3
    iget-object v0, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_4

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Setting back stack index "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    iget-object v1, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method final a(Landroid/os/Parcelable;Landroid/support/v4/app/ak;)V
    .locals 17

    move-object/from16 v0, p0

    if-nez p1, :cond_0

    return-void

    :cond_0
    move-object/from16 v1, p1

    check-cast v1, Landroid/support/v4/app/FragmentManagerState;

    iget-object v3, v1, Landroid/support/v4/app/FragmentManagerState;->iZ:[Landroid/support/v4/app/FragmentState;

    if-nez v3, :cond_1

    return-void

    :cond_1
    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz p2, :cond_7

    invoke-virtual/range {p2 .. p2}, Landroid/support/v4/app/ak;->getFragments()Ljava/util/List;

    move-result-object v5

    invoke-virtual/range {p2 .. p2}, Landroid/support/v4/app/ak;->getChildNonConfigs()Ljava/util/List;

    move-result-object v6

    invoke-virtual/range {p2 .. p2}, Landroid/support/v4/app/ak;->bG()Ljava/util/List;

    move-result-object v7

    if-eqz v5, :cond_2

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    goto :goto_0

    :cond_2
    move v8, v4

    :goto_0
    move v9, v4

    :goto_1
    if-ge v9, v8, :cond_8

    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/support/v4/app/Fragment;

    sget-boolean v11, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v11, :cond_3

    const-string v11, "FragmentManager"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "restoreAllState: re-attaching retained "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    move v11, v4

    :goto_2
    iget-object v12, v1, Landroid/support/v4/app/FragmentManagerState;->iZ:[Landroid/support/v4/app/FragmentState;

    array-length v12, v12

    if-ge v11, v12, :cond_4

    iget-object v12, v1, Landroid/support/v4/app/FragmentManagerState;->iZ:[Landroid/support/v4/app/FragmentState;

    aget-object v12, v12, v11

    iget v12, v12, Landroid/support/v4/app/FragmentState;->mIndex:I

    iget v13, v10, Landroid/support/v4/app/Fragment;->mIndex:I

    if-eq v12, v13, :cond_4

    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    :cond_4
    iget-object v12, v1, Landroid/support/v4/app/FragmentManagerState;->iZ:[Landroid/support/v4/app/FragmentState;

    array-length v12, v12

    if-ne v11, v12, :cond_5

    new-instance v12, Ljava/lang/IllegalStateException;

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "Could not find active fragment with index "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v14, v10, Landroid/support/v4/app/Fragment;->mIndex:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v12}, Landroid/support/v4/app/v;->a(Ljava/lang/RuntimeException;)V

    :cond_5
    iget-object v12, v1, Landroid/support/v4/app/FragmentManagerState;->iZ:[Landroid/support/v4/app/FragmentState;

    aget-object v11, v12, v11

    iput-object v10, v11, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iput-object v3, v10, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    iput v4, v10, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    iput-boolean v4, v10, Landroid/support/v4/app/Fragment;->mInLayout:Z

    iput-boolean v4, v10, Landroid/support/v4/app/Fragment;->mAdded:Z

    iput-object v3, v10, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    iget-object v12, v11, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    if-eqz v12, :cond_6

    iget-object v12, v11, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    iget-object v13, v0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v13}, Landroid/support/v4/app/t;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    iget-object v12, v11, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    const-string v13, "android:view_state"

    invoke-virtual {v12, v13}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v12

    iput-object v12, v10, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    iget-object v11, v11, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    iput-object v11, v10, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    :cond_6
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_1

    :cond_7
    move-object v6, v3

    move-object v7, v6

    :cond_8
    new-instance v5, Landroid/util/SparseArray;

    iget-object v8, v1, Landroid/support/v4/app/FragmentManagerState;->iZ:[Landroid/support/v4/app/FragmentState;

    array-length v8, v8

    invoke-direct {v5, v8}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v5, v0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    move v5, v4

    :goto_3
    iget-object v8, v1, Landroid/support/v4/app/FragmentManagerState;->iZ:[Landroid/support/v4/app/FragmentState;

    array-length v8, v8

    const/4 v9, 0x1

    if-ge v5, v8, :cond_11

    iget-object v8, v1, Landroid/support/v4/app/FragmentManagerState;->iZ:[Landroid/support/v4/app/FragmentState;

    aget-object v8, v8, v5

    if-eqz v8, :cond_10

    if-eqz v6, :cond_9

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v10

    if-ge v5, v10, :cond_9

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/support/v4/app/ak;

    goto :goto_4

    :cond_9
    move-object v10, v3

    :goto_4
    if-eqz v7, :cond_a

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v11

    if-ge v5, v11, :cond_a

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/arch/lifecycle/x;

    goto :goto_5

    :cond_a
    move-object v11, v3

    :goto_5
    iget-object v12, v0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    iget-object v13, v0, Landroid/support/v4/app/v;->iz:Landroid/support/v4/app/r;

    iget-object v14, v0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v15, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    if-nez v15, :cond_e

    invoke-virtual {v12}, Landroid/support/v4/app/t;->getContext()Landroid/content/Context;

    move-result-object v15

    iget-object v4, v8, Landroid/support/v4/app/FragmentState;->mArguments:Landroid/os/Bundle;

    if-eqz v4, :cond_b

    iget-object v4, v8, Landroid/support/v4/app/FragmentState;->mArguments:Landroid/os/Bundle;

    invoke-virtual {v15}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    :cond_b
    if-eqz v13, :cond_c

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->mClassName:Ljava/lang/String;

    iget-object v4, v8, Landroid/support/v4/app/FragmentState;->mArguments:Landroid/os/Bundle;

    invoke-virtual {v13, v15, v3, v4}, Landroid/support/v4/app/r;->a(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    :goto_6
    iput-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    goto :goto_7

    :cond_c
    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->mClassName:Ljava/lang/String;

    iget-object v4, v8, Landroid/support/v4/app/FragmentState;->mArguments:Landroid/os/Bundle;

    invoke-static {v15, v3, v4}, Landroid/support/v4/app/Fragment;->a(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    goto :goto_6

    :goto_7
    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    if-eqz v3, :cond_d

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual {v15}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iget-object v4, v8, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    iput-object v4, v3, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    :cond_d
    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iget v4, v8, Landroid/support/v4/app/FragmentState;->mIndex:I

    invoke-virtual {v3, v4, v14}, Landroid/support/v4/app/Fragment;->a(ILandroid/support/v4/app/Fragment;)V

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iget-boolean v4, v8, Landroid/support/v4/app/FragmentState;->mFromLayout:Z

    iput-boolean v4, v3, Landroid/support/v4/app/Fragment;->mFromLayout:Z

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iput-boolean v9, v3, Landroid/support/v4/app/Fragment;->mRestored:Z

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iget v4, v8, Landroid/support/v4/app/FragmentState;->mFragmentId:I

    iput v4, v3, Landroid/support/v4/app/Fragment;->mFragmentId:I

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iget v4, v8, Landroid/support/v4/app/FragmentState;->mContainerId:I

    iput v4, v3, Landroid/support/v4/app/Fragment;->mContainerId:I

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iget-object v4, v8, Landroid/support/v4/app/FragmentState;->mTag:Ljava/lang/String;

    iput-object v4, v3, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iget-boolean v4, v8, Landroid/support/v4/app/FragmentState;->mRetainInstance:Z

    iput-boolean v4, v3, Landroid/support/v4/app/Fragment;->mRetainInstance:Z

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iget-boolean v4, v8, Landroid/support/v4/app/FragmentState;->mDetached:Z

    iput-boolean v4, v3, Landroid/support/v4/app/Fragment;->mDetached:Z

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iget-boolean v4, v8, Landroid/support/v4/app/FragmentState;->mHidden:Z

    iput-boolean v4, v3, Landroid/support/v4/app/Fragment;->mHidden:Z

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iget-object v4, v12, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    iput-object v4, v3, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    sget-boolean v3, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v3, :cond_e

    const-string v3, "FragmentManager"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v9, "Instantiated fragment "

    invoke-direct {v4, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_e
    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iput-object v10, v3, Landroid/support/v4/app/Fragment;->hS:Landroid/support/v4/app/ak;

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    iput-object v11, v3, Landroid/support/v4/app/Fragment;->am:Landroid/arch/lifecycle/x;

    iget-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    sget-boolean v4, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v4, :cond_f

    const-string v4, "FragmentManager"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "restoreAllState: active #"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ": "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v4, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_f
    iget-object v4, v0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    iget v9, v3, Landroid/support/v4/app/Fragment;->mIndex:I

    invoke-virtual {v4, v9, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    const/4 v3, 0x0

    iput-object v3, v8, Landroid/support/v4/app/FragmentState;->jb:Landroid/support/v4/app/Fragment;

    :cond_10
    add-int/lit8 v5, v5, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    goto/16 :goto_3

    :cond_11
    if-eqz p2, :cond_14

    invoke-virtual/range {p2 .. p2}, Landroid/support/v4/app/ak;->getFragments()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_12

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    goto :goto_8

    :cond_12
    const/4 v4, 0x0

    :goto_8
    const/4 v3, 0x0

    :goto_9
    if-ge v3, v4, :cond_14

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v4/app/Fragment;

    iget v6, v5, Landroid/support/v4/app/Fragment;->mTargetIndex:I

    if-ltz v6, :cond_13

    iget-object v6, v0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    iget v7, v5, Landroid/support/v4/app/Fragment;->mTargetIndex:I

    invoke-virtual {v6, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/app/Fragment;

    iput-object v6, v5, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    iget-object v6, v5, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    if-nez v6, :cond_13

    const-string v6, "FragmentManager"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Re-attaching retained fragment "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v8, " target no longer exists: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v5, Landroid/support/v4/app/Fragment;->mTargetIndex:I

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_13
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    :cond_14
    iget-object v2, v0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iget-object v2, v1, Landroid/support/v4/app/FragmentManagerState;->mAdded:[I

    if-eqz v2, :cond_18

    const/4 v2, 0x0

    :goto_a
    iget-object v3, v1, Landroid/support/v4/app/FragmentManagerState;->mAdded:[I

    array-length v3, v3

    if-ge v2, v3, :cond_18

    iget-object v3, v0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    iget-object v4, v1, Landroid/support/v4/app/FragmentManagerState;->mAdded:[I

    aget v4, v4, v2

    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/app/Fragment;

    if-nez v3, :cond_15

    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "No instantiated fragment for index #"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v1, Landroid/support/v4/app/FragmentManagerState;->mAdded:[I

    aget v6, v6, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v4}, Landroid/support/v4/app/v;->a(Ljava/lang/RuntimeException;)V

    :cond_15
    iput-boolean v9, v3, Landroid/support/v4/app/Fragment;->mAdded:Z

    sget-boolean v4, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v4, :cond_16

    const-string v4, "FragmentManager"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "restoreAllState: added #"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_16
    iget-object v4, v0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_17

    iget-object v4, v0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    monitor-enter v4

    :try_start_0
    iget-object v5, v0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :catchall_0
    move-exception v0

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_17
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already added!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_18
    iget-object v2, v1, Landroid/support/v4/app/FragmentManagerState;->ja:[Landroid/support/v4/app/BackStackState;

    if-eqz v2, :cond_1b

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, v1, Landroid/support/v4/app/FragmentManagerState;->ja:[Landroid/support/v4/app/BackStackState;

    array-length v3, v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, v0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    const/4 v2, 0x0

    :goto_b
    iget-object v3, v1, Landroid/support/v4/app/FragmentManagerState;->ja:[Landroid/support/v4/app/BackStackState;

    array-length v3, v3

    if-ge v2, v3, :cond_1c

    iget-object v3, v1, Landroid/support/v4/app/FragmentManagerState;->ja:[Landroid/support/v4/app/BackStackState;

    aget-object v3, v3, v2

    invoke-virtual {v3, v0}, Landroid/support/v4/app/BackStackState;->a(Landroid/support/v4/app/v;)Landroid/support/v4/app/c;

    move-result-object v3

    sget-boolean v4, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v4, :cond_19

    const-string v4, "FragmentManager"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "restoreAllState: back stack #"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " (index "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v3, Landroid/support/v4/app/c;->mIndex:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v4, Landroid/support/v4/c/g;

    const-string v5, "FragmentManager"

    invoke-direct {v4, v5}, Landroid/support/v4/c/g;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/io/PrintWriter;

    invoke-direct {v5, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    const-string v4, "  "

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v5, v6}, Landroid/support/v4/app/c;->dump(Ljava/lang/String;Ljava/io/PrintWriter;Z)V

    invoke-virtual {v5}, Ljava/io/PrintWriter;->close()V

    goto :goto_c

    :cond_19
    const/4 v6, 0x0

    :goto_c
    iget-object v4, v0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget v4, v3, Landroid/support/v4/app/c;->mIndex:I

    if-ltz v4, :cond_1a

    iget v4, v3, Landroid/support/v4/app/c;->mIndex:I

    invoke-direct {v0, v4, v3}, Landroid/support/v4/app/v;->a(ILandroid/support/v4/app/c;)V

    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    :cond_1b
    const/4 v2, 0x0

    iput-object v2, v0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    :cond_1c
    iget v2, v1, Landroid/support/v4/app/FragmentManagerState;->mPrimaryNavActiveIndex:I

    if-ltz v2, :cond_1d

    iget-object v2, v0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    iget v3, v1, Landroid/support/v4/app/FragmentManagerState;->mPrimaryNavActiveIndex:I

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/Fragment;

    iput-object v2, v0, Landroid/support/v4/app/v;->iB:Landroid/support/v4/app/Fragment;

    :cond_1d
    iget v1, v1, Landroid/support/v4/app/FragmentManagerState;->mNextFragmentIndex:I

    iput v1, v0, Landroid/support/v4/app/v;->mNextFragmentIndex:I

    return-void
.end method

.method final a(Landroid/support/v4/app/Fragment;IIIZ)V
    .locals 16

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    iget-boolean v0, v8, Landroid/support/v4/app/Fragment;->mAdded:Z

    const/4 v9, 0x1

    if-eqz v0, :cond_1

    iget-boolean v0, v8, Landroid/support/v4/app/Fragment;->mDetached:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move/from16 v0, p2

    goto :goto_1

    :cond_1
    :goto_0
    move/from16 v0, p2

    if-le v0, v9, :cond_2

    move v0, v9

    :cond_2
    :goto_1
    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mRemoving:Z

    if-eqz v1, :cond_4

    iget v1, v8, Landroid/support/v4/app/Fragment;->mState:I

    if-le v0, v1, :cond_4

    iget v0, v8, Landroid/support/v4/app/Fragment;->mState:I

    if-nez v0, :cond_3

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->isInBackStack()Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v9

    goto :goto_2

    :cond_3
    iget v0, v8, Landroid/support/v4/app/Fragment;->mState:I

    :cond_4
    :goto_2
    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mDeferStart:Z

    const/4 v10, 0x4

    const/4 v11, 0x3

    if-eqz v1, :cond_5

    iget v1, v8, Landroid/support/v4/app/Fragment;->mState:I

    if-ge v1, v10, :cond_5

    if-le v0, v11, :cond_5

    move v0, v11

    :cond_5
    iget v1, v8, Landroid/support/v4/app/Fragment;->mState:I

    const/4 v12, -0x1

    const/4 v13, 0x2

    const/4 v14, 0x0

    const/4 v15, 0x0

    if-gt v1, v0, :cond_29

    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mFromLayout:Z

    if-eqz v1, :cond_6

    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mInLayout:Z

    if-nez v1, :cond_6

    return-void

    :cond_6
    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->bp()Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_7

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->getAnimator()Landroid/animation/Animator;

    move-result-object v1

    if-eqz v1, :cond_8

    :cond_7
    invoke-virtual {v8, v15}, Landroid/support/v4/app/Fragment;->b(Landroid/view/View;)V

    invoke-virtual {v8, v15}, Landroid/support/v4/app/Fragment;->a(Landroid/animation/Animator;)V

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->getStateAfterAnimating()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object v1, v7

    move-object v2, v8

    invoke-virtual/range {v1 .. v6}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IIIZ)V

    :cond_8
    iget v1, v8, Landroid/support/v4/app/Fragment;->mState:I

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_15

    :pswitch_0
    if-lez v0, :cond_15

    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_9

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "moveto CREATED: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    if-eqz v1, :cond_c

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    iget-object v2, v7, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v2}, Landroid/support/v4/app/t;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    const-string v2, "android:view_state"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v1

    iput-object v1, v8, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    const-string v2, "android:target_state"

    invoke-direct {v7, v1, v2}, Landroid/support/v4/app/v;->b(Landroid/os/Bundle;Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    iput-object v1, v8, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_a

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    const-string v2, "android:target_req_state"

    invoke-virtual {v1, v2, v14}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, v8, Landroid/support/v4/app/Fragment;->mTargetRequestCode:I

    :cond_a
    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hN:Ljava/lang/Boolean;

    if-eqz v1, :cond_b

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hN:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v8, Landroid/support/v4/app/Fragment;->mUserVisibleHint:Z

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hN:Ljava/lang/Boolean;

    goto :goto_3

    :cond_b
    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    const-string v2, "android:user_visible_hint"

    invoke-virtual {v1, v2, v9}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v8, Landroid/support/v4/app/Fragment;->mUserVisibleHint:Z

    :goto_3
    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mUserVisibleHint:Z

    if-nez v1, :cond_c

    iput-boolean v9, v8, Landroid/support/v4/app/Fragment;->mDeferStart:Z

    if-le v0, v11, :cond_c

    move v0, v11

    :cond_c
    iget-object v1, v7, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    iput-object v1, v8, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    iget-object v1, v7, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iput-object v1, v8, Landroid/support/v4/app/Fragment;->hT:Landroid/support/v4/app/Fragment;

    iget-object v1, v7, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_d

    iget-object v1, v7, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    iget-object v1, v1, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    goto :goto_4

    :cond_d
    iget-object v1, v7, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    iget-object v1, v1, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    :goto_4
    iput-object v1, v8, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_f

    iget-object v1, v7, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    iget-object v2, v8, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    iget v2, v2, Landroid/support/v4/app/Fragment;->mIndex:I

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, v8, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    if-ne v1, v2, :cond_e

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    iget v1, v1, Landroid/support/v4/app/Fragment;->mState:I

    if-gtz v1, :cond_f

    iget-object v2, v8, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object v1, v7

    invoke-virtual/range {v1 .. v6}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IIIZ)V

    goto :goto_5

    :cond_e
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " declared target fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v8, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " that does not belong to this FragmentManager!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_f
    :goto_5
    iget-object v1, v7, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v1}, Landroid/support/v4/app/t;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v7, v8, v1}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;Landroid/content/Context;)V

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    iput-boolean v9, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    if-nez v1, :cond_10

    move-object v1, v15

    goto :goto_6

    :cond_10
    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v1}, Landroid/support/v4/app/t;->getActivity()Landroid/app/Activity;

    move-result-object v1

    :goto_6
    if-eqz v1, :cond_11

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    iput-boolean v9, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    :cond_11
    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    if-eqz v1, :cond_14

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hT:Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_12

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hT:Landroid/support/v4/app/Fragment;

    invoke-static {}, Landroid/support/v4/app/Fragment;->aZ()V

    :cond_12
    iget-object v1, v7, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v1}, Landroid/support/v4/app/t;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v7, v8, v1}, Landroid/support/v4/app/v;->b(Landroid/support/v4/app/Fragment;Landroid/content/Context;)V

    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mIsCreated:Z

    if-nez v1, :cond_13

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-direct {v7, v8, v1}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual {v8, v1}, Landroid/support/v4/app/Fragment;->performCreate(Landroid/os/Bundle;)V

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-direct {v7, v8, v1}, Landroid/support/v4/app/v;->b(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V

    goto :goto_7

    :cond_13
    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual {v8, v1}, Landroid/support/v4/app/Fragment;->a(Landroid/os/Bundle;)V

    iput v9, v8, Landroid/support/v4/app/Fragment;->mState:I

    :goto_7
    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mRetaining:Z

    goto :goto_8

    :cond_14
    new-instance v0, Landroid/support/v4/app/SuperNotCalledException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onAttach()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/app/SuperNotCalledException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_15
    :goto_8
    :pswitch_1
    move v1, v0

    iget-boolean v0, v8, Landroid/support/v4/app/Fragment;->mFromLayout:Z

    const/16 v2, 0x8

    if-eqz v0, :cond_18

    iget-boolean v0, v8, Landroid/support/v4/app/Fragment;->mPerformedCreateView:Z

    if-nez v0, :cond_18

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->aX()Landroid/view/LayoutInflater;

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->bk()V

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v0, :cond_17

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iput-object v0, v8, Landroid/support/v4/app/Fragment;->hU:Landroid/view/View;

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v0, v14}, Landroid/view/View;->setSaveFromParentEnabled(Z)V

    iget-boolean v0, v8, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-eqz v0, :cond_16

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_16
    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-static {}, Landroid/support/v4/app/Fragment;->bc()V

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iget-object v3, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-direct {v7, v8, v0, v3}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;Landroid/view/View;Landroid/os/Bundle;)V

    goto :goto_9

    :cond_17
    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hU:Landroid/view/View;

    :cond_18
    :goto_9
    if-le v1, v9, :cond_24

    sget-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v0, :cond_19

    const-string v0, "FragmentManager"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "moveto ACTIVITY_CREATED: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_19
    iget-boolean v0, v8, Landroid/support/v4/app/Fragment;->mFromLayout:Z

    if-nez v0, :cond_22

    iget v0, v8, Landroid/support/v4/app/Fragment;->mContainerId:I

    if-eqz v0, :cond_1c

    iget v0, v8, Landroid/support/v4/app/Fragment;->mContainerId:I

    if-ne v0, v12, :cond_1a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Cannot create fragment "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " for a container view with no id"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-direct {v7, v0}, Landroid/support/v4/app/v;->a(Ljava/lang/RuntimeException;)V

    :cond_1a
    iget-object v0, v7, Landroid/support/v4/app/v;->iz:Landroid/support/v4/app/r;

    iget v3, v8, Landroid/support/v4/app/Fragment;->mContainerId:I

    invoke-virtual {v0, v3}, Landroid/support/v4/app/r;->onFindViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/view/ViewGroup;

    if-nez v3, :cond_1d

    iget-boolean v0, v8, Landroid/support/v4/app/Fragment;->mRestored:Z

    if-nez v0, :cond_1d

    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v4, v8, Landroid/support/v4/app/Fragment;->mContainerId:I

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    :cond_1b
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Fragment "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " not attached to a context."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    const-string v0, "unknown"

    :goto_a
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "No view found for id 0x"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v6, v8, Landroid/support/v4/app/Fragment;->mContainerId:I

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ") for fragment "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-direct {v7, v4}, Landroid/support/v4/app/v;->a(Ljava/lang/RuntimeException;)V

    goto :goto_b

    :cond_1c
    move-object v3, v15

    :cond_1d
    :goto_b
    iput-object v3, v8, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->aX()Landroid/view/LayoutInflater;

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->bk()V

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v0, :cond_21

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iput-object v0, v8, Landroid/support/v4/app/Fragment;->hU:Landroid/view/View;

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v0, v14}, Landroid/view/View;->setSaveFromParentEnabled(Z)V

    if-eqz v3, :cond_1e

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_1e
    iget-boolean v0, v8, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-eqz v0, :cond_1f

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_1f
    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-static {}, Landroid/support/v4/app/Fragment;->bc()V

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iget-object v2, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-direct {v7, v8, v0, v2}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;Landroid/view/View;Landroid/os/Bundle;)V

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_20

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    if-eqz v0, :cond_20

    goto :goto_c

    :cond_20
    move v9, v14

    :goto_c
    iput-boolean v9, v8, Landroid/support/v4/app/Fragment;->mIsNewlyAdded:Z

    goto :goto_d

    :cond_21
    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hU:Landroid/view/View;

    :cond_22
    :goto_d
    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->bl()V

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-direct {v7, v8, v0}, Landroid/support/v4/app/v;->c(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v0, :cond_23

    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->aT()V

    :cond_23
    iput-object v15, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    :cond_24
    move v0, v1

    :pswitch_2
    if-le v0, v13, :cond_25

    iput v11, v8, Landroid/support/v4/app/Fragment;->mState:I

    :cond_25
    :pswitch_3
    if-le v0, v11, :cond_27

    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_26

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "moveto STARTED: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_26
    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->performStart()V

    invoke-direct/range {p0 .. p1}, Landroid/support/v4/app/v;->o(Landroid/support/v4/app/Fragment;)V

    :cond_27
    :pswitch_4
    if-le v0, v10, :cond_48

    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_28

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "moveto RESUMED: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_28
    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->performResume()V

    invoke-direct/range {p0 .. p1}, Landroid/support/v4/app/v;->p(Landroid/support/v4/app/Fragment;)V

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    goto/16 :goto_15

    :cond_29
    iget v1, v8, Landroid/support/v4/app/Fragment;->mState:I

    if-le v1, v0, :cond_48

    iget v1, v8, Landroid/support/v4/app/Fragment;->mState:I

    packed-switch v1, :pswitch_data_1

    goto/16 :goto_15

    :pswitch_5
    const/4 v1, 0x5

    if-ge v0, v1, :cond_2b

    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_2a

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "movefrom RESUMED: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2a
    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->performPause()V

    invoke-direct/range {p0 .. p1}, Landroid/support/v4/app/v;->q(Landroid/support/v4/app/Fragment;)V

    :cond_2b
    :pswitch_6
    if-ge v0, v10, :cond_2f

    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_2c

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "movefrom STARTED: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2c
    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hX:Landroid/arch/lifecycle/h;

    sget-object v2, Landroid/arch/lifecycle/Lifecycle$Event;->ON_STOP:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-virtual {v1, v2}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/Lifecycle$Event;)V

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v1, :cond_2d

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v1}, Landroid/support/v4/app/v;->dispatchStop()V

    :cond_2d
    iput v11, v8, Landroid/support/v4/app/Fragment;->mState:I

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    iput-boolean v9, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    if-eqz v1, :cond_2e

    invoke-direct/range {p0 .. p1}, Landroid/support/v4/app/v;->r(Landroid/support/v4/app/Fragment;)V

    goto :goto_e

    :cond_2e
    new-instance v0, Landroid/support/v4/app/SuperNotCalledException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onStop()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/app/SuperNotCalledException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2f
    :goto_e
    :pswitch_7
    if-ge v0, v11, :cond_32

    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_30

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "movefrom STOPPED: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_30
    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v1, :cond_31

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-direct {v1, v13}, Landroid/support/v4/app/v;->t(I)V

    :cond_31
    iput v13, v8, Landroid/support/v4/app/Fragment;->mState:I

    :cond_32
    :pswitch_8
    if-ge v0, v13, :cond_39

    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_33

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "movefrom ACTIVITY_CREATED: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_33
    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v1, :cond_34

    iget-object v1, v7, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v1}, Landroid/support/v4/app/t;->br()Z

    move-result v1

    if-eqz v1, :cond_34

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    if-nez v1, :cond_34

    invoke-direct/range {p0 .. p1}, Landroid/support/v4/app/v;->m(Landroid/support/v4/app/Fragment;)V

    :cond_34
    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->performDestroyView()V

    invoke-direct/range {p0 .. p1}, Landroid/support/v4/app/v;->s(Landroid/support/v4/app/Fragment;)V

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v1, :cond_38

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    if-eqz v1, :cond_38

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    iget-object v2, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    iget v1, v7, Landroid/support/v4/app/v;->mCurState:I

    const/4 v2, 0x0

    if-lez v1, :cond_35

    iget-boolean v1, v7, Landroid/support/v4/app/v;->mDestroyed:Z

    if-nez v1, :cond_35

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_35

    iget v1, v8, Landroid/support/v4/app/Fragment;->hW:F

    cmpl-float v1, v1, v2

    if-ltz v1, :cond_35

    move/from16 v1, p3

    move/from16 v3, p4

    invoke-direct {v7, v8, v1, v14, v3}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IZI)Landroid/support/v4/app/ae;

    move-result-object v1

    goto :goto_f

    :cond_35
    move-object v1, v15

    :goto_f
    iput v2, v8, Landroid/support/v4/app/Fragment;->hW:F

    if-eqz v1, :cond_37

    iget-object v2, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iget-object v3, v8, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    invoke-virtual {v8, v0}, Landroid/support/v4/app/Fragment;->setStateAfterAnimating(I)V

    iget-object v4, v1, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    if-eqz v4, :cond_36

    new-instance v4, Landroid/support/v4/app/ag;

    iget-object v5, v1, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    invoke-direct {v4, v5, v3, v2}, Landroid/support/v4/app/ag;-><init>(Landroid/view/animation/Animation;Landroid/view/ViewGroup;Landroid/view/View;)V

    iget-object v5, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v8, v5}, Landroid/support/v4/app/Fragment;->b(Landroid/view/View;)V

    invoke-static {v4}, Landroid/support/v4/app/v;->a(Landroid/view/animation/Animation;)Landroid/view/animation/Animation$AnimationListener;

    move-result-object v5

    new-instance v6, Landroid/support/v4/app/x;

    invoke-direct {v6, v7, v5, v3, v8}, Landroid/support/v4/app/x;-><init>(Landroid/support/v4/app/v;Landroid/view/animation/Animation$AnimationListener;Landroid/view/ViewGroup;Landroid/support/v4/app/Fragment;)V

    invoke-virtual {v4, v6}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    invoke-static {v2, v1}, Landroid/support/v4/app/v;->a(Landroid/view/View;Landroid/support/v4/app/ae;)V

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_10

    :cond_36
    iget-object v4, v1, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    iget-object v5, v1, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    invoke-virtual {v8, v5}, Landroid/support/v4/app/Fragment;->a(Landroid/animation/Animator;)V

    new-instance v5, Landroid/support/v4/app/z;

    invoke-direct {v5, v7, v3, v2, v8}, Landroid/support/v4/app/z;-><init>(Landroid/support/v4/app/v;Landroid/view/ViewGroup;Landroid/view/View;Landroid/support/v4/app/Fragment;)V

    invoke-virtual {v4, v5}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v2, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v4, v2}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    iget-object v2, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-static {v2, v1}, Landroid/support/v4/app/v;->a(Landroid/view/View;Landroid/support/v4/app/ae;)V

    invoke-virtual {v4}, Landroid/animation/Animator;->start()V

    :cond_37
    :goto_10
    iget-object v1, v8, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    iget-object v2, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_38
    iput-object v15, v8, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hZ:Landroid/arch/lifecycle/g;

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->ia:Landroid/arch/lifecycle/p;

    invoke-virtual {v1, v15}, Landroid/arch/lifecycle/p;->setValue(Ljava/lang/Object;)V

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hU:Landroid/view/View;

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mInLayout:Z

    :cond_39
    :pswitch_9
    if-gtz v0, :cond_48

    iget-boolean v1, v7, Landroid/support/v4/app/v;->mDestroyed:Z

    if-eqz v1, :cond_3b

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->bp()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_3a

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->bp()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v8, v15}, Landroid/support/v4/app/Fragment;->b(Landroid/view/View;)V

    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    goto :goto_11

    :cond_3a
    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->getAnimator()Landroid/animation/Animator;

    move-result-object v1

    if-eqz v1, :cond_3b

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->getAnimator()Landroid/animation/Animator;

    move-result-object v1

    invoke-virtual {v8, v15}, Landroid/support/v4/app/Fragment;->a(Landroid/animation/Animator;)V

    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    :cond_3b
    :goto_11
    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->bp()Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_47

    invoke-virtual/range {p1 .. p1}, Landroid/support/v4/app/Fragment;->getAnimator()Landroid/animation/Animator;

    move-result-object v1

    if-eqz v1, :cond_3c

    goto/16 :goto_14

    :cond_3c
    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_3d

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "movefrom CREATED: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3d
    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mRetaining:Z

    if-nez v1, :cond_41

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hX:Landroid/arch/lifecycle/h;

    sget-object v2, Landroid/arch/lifecycle/Lifecycle$Event;->ON_DESTROY:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-virtual {v1, v2}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/Lifecycle$Event;)V

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v1, :cond_3e

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v1}, Landroid/support/v4/app/v;->dispatchDestroy()V

    :cond_3e
    iput v14, v8, Landroid/support/v4/app/Fragment;->mState:I

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mIsCreated:Z

    iput-boolean v9, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->am:Landroid/arch/lifecycle/x;

    if-eqz v1, :cond_3f

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    iget-object v1, v1, Landroid/support/v4/app/t;->hP:Landroid/support/v4/app/v;

    iget-boolean v1, v1, Landroid/support/v4/app/v;->mStateSaved:Z

    if-nez v1, :cond_3f

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->am:Landroid/arch/lifecycle/x;

    invoke-virtual {v1}, Landroid/arch/lifecycle/x;->clear()V

    :cond_3f
    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    if-eqz v1, :cond_40

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-direct/range {p0 .. p1}, Landroid/support/v4/app/v;->t(Landroid/support/v4/app/Fragment;)V

    goto :goto_12

    :cond_40
    new-instance v0, Landroid/support/v4/app/SuperNotCalledException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onDestroy()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/app/SuperNotCalledException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_41
    iput v14, v8, Landroid/support/v4/app/Fragment;->mState:I

    :goto_12
    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    iput-boolean v9, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->mLayoutInflater:Landroid/view/LayoutInflater;

    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mCalled:Z

    if-eqz v1, :cond_46

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v1, :cond_43

    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mRetaining:Z

    if-eqz v1, :cond_42

    iget-object v1, v8, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v1}, Landroid/support/v4/app/v;->dispatchDestroy()V

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    goto :goto_13

    :cond_42
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Child FragmentManager of "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " was not  destroyed and this fragment is not retaining instance"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_43
    :goto_13
    invoke-direct/range {p0 .. p1}, Landroid/support/v4/app/v;->u(Landroid/support/v4/app/Fragment;)V

    if-nez p5, :cond_48

    iget-boolean v1, v8, Landroid/support/v4/app/Fragment;->mRetaining:Z

    if-nez v1, :cond_45

    iget v1, v8, Landroid/support/v4/app/Fragment;->mIndex:I

    if-ltz v1, :cond_48

    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_44

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Freeing fragment index "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_44
    iget-object v1, v7, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    iget v2, v8, Landroid/support/v4/app/Fragment;->mIndex:I

    invoke-virtual {v1, v2, v15}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iput v12, v8, Landroid/support/v4/app/Fragment;->mIndex:I

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->mWho:Ljava/lang/String;

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mAdded:Z

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mRemoving:Z

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mFromLayout:Z

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mInLayout:Z

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mRestored:Z

    iput v14, v8, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    iput v14, v8, Landroid/support/v4/app/Fragment;->mFragmentId:I

    iput v14, v8, Landroid/support/v4/app/Fragment;->mContainerId:I

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mHidden:Z

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mDetached:Z

    iput-boolean v14, v8, Landroid/support/v4/app/Fragment;->mRetaining:Z

    goto :goto_15

    :cond_45
    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hT:Landroid/support/v4/app/Fragment;

    iput-object v15, v8, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    goto :goto_15

    :cond_46
    new-instance v0, Landroid/support/v4/app/SuperNotCalledException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onDetach()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/app/SuperNotCalledException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_47
    :goto_14
    invoke-virtual {v8, v0}, Landroid/support/v4/app/Fragment;->setStateAfterAnimating(I)V

    goto :goto_16

    :cond_48
    :goto_15
    move v9, v0

    :goto_16
    iget v0, v8, Landroid/support/v4/app/Fragment;->mState:I

    if-eq v0, v9, :cond_49

    const-string v0, "FragmentManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "moveToState: Fragment state for "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " not updated inline; expected state "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " found "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v8, Landroid/support/v4/app/Fragment;->mState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iput v9, v8, Landroid/support/v4/app/Fragment;->mState:I

    :cond_49
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch
.end method

.method public final a(Landroid/support/v4/app/Fragment;Z)V
    .locals 3

    sget-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "FragmentManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "add: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {p0, p1}, Landroid/support/v4/app/v;->g(Landroid/support/v4/app/Fragment;)V

    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mDetached:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    iput-boolean v0, p1, Landroid/support/v4/app/Fragment;->mAdded:Z

    const/4 v1, 0x0

    iput-boolean v1, p1, Landroid/support/v4/app/Fragment;->mRemoving:Z

    iget-object v2, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-nez v2, :cond_1

    iput-boolean v1, p1, Landroid/support/v4/app/Fragment;->mHiddenChanged:Z

    :cond_1
    iget-boolean v1, p1, Landroid/support/v4/app/Fragment;->mHasMenu:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p1, Landroid/support/v4/app/Fragment;->mMenuVisible:Z

    if-eqz v1, :cond_2

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mNeedMenuInvalidate:Z

    :cond_2
    if-eqz p2, :cond_4

    invoke-direct {p0, p1}, Landroid/support/v4/app/v;->e(Landroid/support/v4/app/Fragment;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_3
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Fragment already added: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_4
    return-void
.end method

.method public final a(Landroid/support/v4/app/ai;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/app/v;->bz()V

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Landroid/support/v4/app/v;->mDestroyed:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Landroid/support/v4/app/v;->bA()V

    monitor-exit p0

    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Activity has been destroyed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public final a(Landroid/support/v4/app/t;Landroid/support/v4/app/r;Landroid/support/v4/app/Fragment;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    if-nez v0, :cond_0

    iput-object p1, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    iput-object p2, p0, Landroid/support/v4/app/v;->iz:Landroid/support/v4/app/r;

    iput-object p3, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Already attached"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method final bE()Landroid/support/v4/app/ak;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/v;->iD:Landroid/support/v4/app/ak;

    invoke-static {v0}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/ak;)V

    iget-object v0, p0, Landroid/support/v4/app/v;->iD:Landroid/support/v4/app/ak;

    return-object v0
.end method

.method public final bw()V
    .locals 1

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Landroid/support/v4/app/v;->t(I)V

    return-void
.end method

.method public final bx()Landroid/support/v4/app/ap;
    .locals 1

    new-instance v0, Landroid/support/v4/app/c;

    invoke-direct {v0, p0}, Landroid/support/v4/app/c;-><init>(Landroid/support/v4/app/v;)V

    return-object v0
.end method

.method public final dispatchActivityCreated()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mStateSaved:Z

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mStopped:Z

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Landroid/support/v4/app/v;->t(I)V

    return-void
.end method

.method public final dispatchConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_0

    invoke-virtual {v1, p1}, Landroid/support/v4/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v2, v1, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v2, :cond_0

    iget-object v1, v1, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v1, p1}, Landroid/support/v4/app/v;->dispatchConfigurationChanged(Landroid/content/res/Configuration;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final dispatchContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 5

    iget v0, p0, Landroid/support/v4/app/v;->mCurState:I

    const/4 v1, 0x0

    if-gtz v0, :cond_0

    return v1

    :cond_0
    move v0, v1

    :goto_0
    iget-object v2, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    iget-object v2, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/Fragment;

    if-eqz v2, :cond_2

    iget-boolean v3, v2, Landroid/support/v4/app/Fragment;->mHidden:Z

    const/4 v4, 0x1

    if-nez v3, :cond_1

    iget-object v3, v2, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v3, :cond_1

    iget-object v2, v2, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v2, p1}, Landroid/support/v4/app/v;->dispatchContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    if-eqz v2, :cond_1

    move v2, v4

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    if-eqz v2, :cond_2

    return v4

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method public final dispatchCreate()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mStateSaved:Z

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mStopped:Z

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroid/support/v4/app/v;->t(I)V

    return-void
.end method

.method public final dispatchCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)Z
    .locals 8

    iget v0, p0, Landroid/support/v4/app/v;->mCurState:I

    const/4 v1, 0x0

    if-gtz v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    move-object v2, v0

    move v0, v1

    move v3, v0

    :goto_0
    iget-object v4, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_6

    iget-object v4, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v4/app/Fragment;

    const/4 v5, 0x1

    if-eqz v4, :cond_5

    iget-boolean v6, v4, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-nez v6, :cond_2

    iget-boolean v6, v4, Landroid/support/v4/app/Fragment;->mHasMenu:Z

    if-eqz v6, :cond_1

    iget-boolean v6, v4, Landroid/support/v4/app/Fragment;->mMenuVisible:Z

    if-eqz v6, :cond_1

    move v6, v5

    goto :goto_1

    :cond_1
    move v6, v1

    :goto_1
    iget-object v7, v4, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v7, :cond_3

    iget-object v7, v4, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v7, p1, p2}, Landroid/support/v4/app/v;->dispatchCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)Z

    move-result v7

    or-int/2addr v6, v7

    goto :goto_2

    :cond_2
    move v6, v1

    :cond_3
    :goto_2
    if-eqz v6, :cond_5

    if-nez v2, :cond_4

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :cond_4
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v3, v5

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_6
    iget-object p1, p0, Landroid/support/v4/app/v;->mCreatedMenus:Ljava/util/ArrayList;

    if-eqz p1, :cond_9

    :goto_3
    iget-object p1, p0, Landroid/support/v4/app/v;->mCreatedMenus:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v1, p1, :cond_9

    iget-object p1, p0, Landroid/support/v4/app/v;->mCreatedMenus:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/app/Fragment;

    if-eqz v2, :cond_7

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    :cond_7
    invoke-static {}, Landroid/support/v4/app/Fragment;->onDestroyOptionsMenu()V

    :cond_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_9
    iput-object v2, p0, Landroid/support/v4/app/v;->mCreatedMenus:Ljava/util/ArrayList;

    return v3
.end method

.method public final dispatchDestroy()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mDestroyed:Z

    invoke-virtual {p0}, Landroid/support/v4/app/v;->execPendingActions()Z

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v4/app/v;->t(I)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    iput-object v0, p0, Landroid/support/v4/app/v;->iz:Landroid/support/v4/app/r;

    iput-object v0, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    return-void
.end method

.method public final dispatchDestroyView()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroid/support/v4/app/v;->t(I)V

    return-void
.end method

.method public final dispatchLowMemory()V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->onLowMemory()V

    iget-object v2, v1, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v2, :cond_0

    iget-object v1, v1, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v1}, Landroid/support/v4/app/v;->dispatchLowMemory()V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final dispatchMultiWindowModeChanged(Z)V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_0

    iget-object v2, v1, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v2, :cond_0

    iget-object v1, v1, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v1, p1}, Landroid/support/v4/app/v;->dispatchMultiWindowModeChanged(Z)V

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final dispatchOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5

    iget v0, p0, Landroid/support/v4/app/v;->mCurState:I

    const/4 v1, 0x0

    if-gtz v0, :cond_0

    return v1

    :cond_0
    move v0, v1

    :goto_0
    iget-object v2, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    iget-object v2, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/Fragment;

    if-eqz v2, :cond_2

    iget-boolean v3, v2, Landroid/support/v4/app/Fragment;->mHidden:Z

    const/4 v4, 0x1

    if-nez v3, :cond_1

    iget-object v3, v2, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v3, :cond_1

    iget-object v2, v2, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v2, p1}, Landroid/support/v4/app/v;->dispatchOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    if-eqz v2, :cond_1

    move v2, v4

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    if-eqz v2, :cond_2

    return v4

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method public final dispatchOptionsMenuClosed(Landroid/view/Menu;)V
    .locals 3

    iget v0, p0, Landroid/support/v4/app/v;->mCurState:I

    if-gtz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_1

    iget-boolean v2, v1, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-nez v2, :cond_1

    iget-object v2, v1, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v2, :cond_1

    iget-object v1, v1, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v1, p1}, Landroid/support/v4/app/v;->dispatchOptionsMenuClosed(Landroid/view/Menu;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public final dispatchPause()V
    .locals 1

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Landroid/support/v4/app/v;->t(I)V

    return-void
.end method

.method public final dispatchPictureInPictureModeChanged(Z)V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_0

    iget-object v2, v1, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v2, :cond_0

    iget-object v1, v1, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v1, p1}, Landroid/support/v4/app/v;->dispatchPictureInPictureModeChanged(Z)V

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final dispatchPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 7

    iget v0, p0, Landroid/support/v4/app/v;->mCurState:I

    const/4 v1, 0x0

    if-gtz v0, :cond_0

    return v1

    :cond_0
    move v0, v1

    move v2, v0

    :goto_0
    iget-object v3, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_5

    iget-object v3, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/app/Fragment;

    const/4 v4, 0x1

    if-eqz v3, :cond_4

    iget-boolean v5, v3, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-nez v5, :cond_3

    iget-boolean v5, v3, Landroid/support/v4/app/Fragment;->mHasMenu:Z

    if-eqz v5, :cond_1

    iget-boolean v5, v3, Landroid/support/v4/app/Fragment;->mMenuVisible:Z

    if-eqz v5, :cond_1

    move v5, v4

    goto :goto_1

    :cond_1
    move v5, v1

    :goto_1
    iget-object v6, v3, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v6, :cond_2

    iget-object v3, v3, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v3, p1}, Landroid/support/v4/app/v;->dispatchPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v3

    or-int/2addr v3, v5

    goto :goto_2

    :cond_2
    move v3, v5

    goto :goto_2

    :cond_3
    move v3, v1

    :goto_2
    if-eqz v3, :cond_4

    move v2, v4

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    return v2
.end method

.method public final dispatchResume()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mStateSaved:Z

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mStopped:Z

    const/4 v0, 0x5

    invoke-direct {p0, v0}, Landroid/support/v4/app/v;->t(I)V

    return-void
.end method

.method public final dispatchStart()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mStateSaved:Z

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mStopped:Z

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Landroid/support/v4/app/v;->t(I)V

    return-void
.end method

.method public final dispatchStop()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mStopped:Z

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Landroid/support/v4/app/v;->t(I)V

    return-void
.end method

.method public final dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    const/4 v2, 0x0

    if-eqz v1, :cond_d

    iget-object v1, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-lez v1, :cond_d

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, "Active Fragments in "

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, ":"

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_d

    iget-object v4, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v4/app/Fragment;

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "  #"

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(I)V

    const-string v5, ": "

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    if-eqz v4, :cond_c

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mFragmentId=#"

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v5, v4, Landroid/support/v4/app/Fragment;->mFragmentId:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, " mContainerId=#"

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v5, v4, Landroid/support/v4/app/Fragment;->mContainerId:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, " mTag="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mState="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v5, v4, Landroid/support/v4/app/Fragment;->mState:I

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(I)V

    const-string v5, " mIndex="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v5, v4, Landroid/support/v4/app/Fragment;->mIndex:I

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(I)V

    const-string v5, " mWho="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mWho:Ljava/lang/String;

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, " mBackStackNesting="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v5, v4, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(I)V

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mAdded="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v5, v4, Landroid/support/v4/app/Fragment;->mAdded:Z

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Z)V

    const-string v5, " mRemoving="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v5, v4, Landroid/support/v4/app/Fragment;->mRemoving:Z

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Z)V

    const-string v5, " mFromLayout="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v5, v4, Landroid/support/v4/app/Fragment;->mFromLayout:Z

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Z)V

    const-string v5, " mInLayout="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v5, v4, Landroid/support/v4/app/Fragment;->mInLayout:Z

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Z)V

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mHidden="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v5, v4, Landroid/support/v4/app/Fragment;->mHidden:Z

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Z)V

    const-string v5, " mDetached="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v5, v4, Landroid/support/v4/app/Fragment;->mDetached:Z

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Z)V

    const-string v5, " mMenuVisible="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v5, v4, Landroid/support/v4/app/Fragment;->mMenuVisible:Z

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Z)V

    const-string v5, " mHasMenu="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v5, v4, Landroid/support/v4/app/Fragment;->mHasMenu:Z

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Z)V

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mRetainInstance="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v5, v4, Landroid/support/v4/app/Fragment;->mRetainInstance:Z

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Z)V

    const-string v5, " mRetaining="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v5, v4, Landroid/support/v4/app/Fragment;->mRetaining:Z

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Z)V

    const-string v5, " mUserVisibleHint="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v5, v4, Landroid/support/v4/app/Fragment;->mUserVisibleHint:Z

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Z)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    if-eqz v5, :cond_0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mFragmentManager="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_0
    iget-object v5, v4, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    if-eqz v5, :cond_1

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mHost="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_1
    iget-object v5, v4, Landroid/support/v4/app/Fragment;->hT:Landroid/support/v4/app/Fragment;

    if-eqz v5, :cond_2

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mParentFragment="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->hT:Landroid/support/v4/app/Fragment;

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_2
    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mArguments:Landroid/os/Bundle;

    if-eqz v5, :cond_3

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mArguments="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mArguments:Landroid/os/Bundle;

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_3
    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    if-eqz v5, :cond_4

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mSavedFragmentState="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_4
    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    if-eqz v5, :cond_5

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mSavedViewState="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_5
    iget-object v5, v4, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    if-eqz v5, :cond_6

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mTarget="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    const-string v5, " mTargetRequestCode="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v5, v4, Landroid/support/v4/app/Fragment;->mTargetRequestCode:I

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(I)V

    :cond_6
    invoke-virtual {v4}, Landroid/support/v4/app/Fragment;->getNextAnim()I

    move-result v5

    if-eqz v5, :cond_7

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mNextAnim="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {v4}, Landroid/support/v4/app/Fragment;->getNextAnim()I

    move-result v5

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(I)V

    :cond_7
    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    if-eqz v5, :cond_8

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mContainer="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_8
    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v5, :cond_9

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mView="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_9
    iget-object v5, v4, Landroid/support/v4/app/Fragment;->hU:Landroid/view/View;

    if-eqz v5, :cond_a

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mInnerView="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_a
    invoke-virtual {v4}, Landroid/support/v4/app/Fragment;->bp()Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_b

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mAnimatingAway="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {v4}, Landroid/support/v4/app/Fragment;->bp()Landroid/view/View;

    move-result-object v5

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mStateAfterAnimating="

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {v4}, Landroid/support/v4/app/Fragment;->getStateAfterAnimating()I

    move-result v5

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(I)V

    :cond_b
    invoke-static {v4}, Landroid/support/v4/app/bf;->c(Landroid/arch/lifecycle/g;)Landroid/support/v4/app/bf;

    move-result-object v5

    invoke-virtual {v5, v0, p3}, Landroid/support/v4/app/bf;->a(Ljava/lang/String;Ljava/io/PrintWriter;)V

    iget-object v5, v4, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v5, :cond_c

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Child "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, v4, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object v4, v4, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, p2, p3, p4}, Landroid/support/v4/app/v;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    :cond_c
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_d
    iget-object p2, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_e

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p4, "Added Fragments:"

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    move p4, v2

    :goto_1
    if-ge p4, p2, :cond_e

    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, "  #"

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(I)V

    const-string v3, ": "

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    add-int/lit8 p4, p4, 0x1

    goto :goto_1

    :cond_e
    iget-object p2, p0, Landroid/support/v4/app/v;->mCreatedMenus:Ljava/util/ArrayList;

    if-eqz p2, :cond_f

    iget-object p2, p0, Landroid/support/v4/app/v;->mCreatedMenus:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_f

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p4, "Fragments Created Menus:"

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    move p4, v2

    :goto_2
    if-ge p4, p2, :cond_f

    iget-object v1, p0, Landroid/support/v4/app/v;->mCreatedMenus:Ljava/util/ArrayList;

    invoke-virtual {v1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, "  #"

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(I)V

    const-string v3, ": "

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    add-int/lit8 p4, p4, 0x1

    goto :goto_2

    :cond_f
    iget-object p2, p0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    if-eqz p2, :cond_10

    iget-object p2, p0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_10

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p4, "Back Stack:"

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    move p4, v2

    :goto_3
    if-ge p4, p2, :cond_10

    iget-object v1, p0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    invoke-virtual {v1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/c;

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, "  #"

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(I)V

    const-string v3, ": "

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/support/v4/app/c;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {v1, v0, p3}, Landroid/support/v4/app/c;->a(Ljava/lang/String;Ljava/io/PrintWriter;)V

    add-int/lit8 p4, p4, 0x1

    goto :goto_3

    :cond_10
    monitor-enter p0

    :try_start_0
    iget-object p2, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    if-eqz p2, :cond_11

    iget-object p2, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_11

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p4, "Back Stack Indices:"

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    move p4, v2

    :goto_4
    if-ge p4, p2, :cond_11

    iget-object v0, p0, Landroid/support/v4/app/v;->mBackStackIndices:Ljava/util/ArrayList;

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/c;

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v1, "  #"

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(I)V

    const-string v1, ": "

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    add-int/lit8 p4, p4, 0x1

    goto :goto_4

    :cond_11
    iget-object p2, p0, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    if-eqz p2, :cond_12

    iget-object p2, p0, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_12

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "mAvailBackStackIndices: "

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object p2, p0, Landroid/support/v4/app/v;->mAvailBackStackIndices:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :cond_12
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p2, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    if-eqz p2, :cond_13

    iget-object p2, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_13

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p4, "Pending Actions:"

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :goto_5
    if-ge v2, p2, :cond_13

    iget-object p4, p0, Landroid/support/v4/app/v;->mPendingActions:Ljava/util/ArrayList;

    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroid/support/v4/app/ai;

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "  #"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, ": "

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_13
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "FragmentManager misc state:"

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "  mHost="

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object p2, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "  mContainer="

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object p2, p0, Landroid/support/v4/app/v;->iz:Landroid/support/v4/app/r;

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    iget-object p2, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz p2, :cond_14

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "  mParent="

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object p2, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    :cond_14
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "  mCurState="

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget p2, p0, Landroid/support/v4/app/v;->mCurState:I

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(I)V

    const-string p2, " mStateSaved="

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean p2, p0, Landroid/support/v4/app/v;->mStateSaved:Z

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Z)V

    const-string p2, " mStopped="

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean p2, p0, Landroid/support/v4/app/v;->mStopped:Z

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Z)V

    const-string p2, " mDestroyed="

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean p2, p0, Landroid/support/v4/app/v;->mDestroyed:Z

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Z)V

    iget-boolean p2, p0, Landroid/support/v4/app/v;->mNeedMenuInvalidate:Z

    if-eqz p2, :cond_15

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "  mNeedMenuInvalidate="

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean p2, p0, Landroid/support/v4/app/v;->mNeedMenuInvalidate:Z

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Z)V

    :cond_15
    iget-object p2, p0, Landroid/support/v4/app/v;->mNoTransactionsBecause:Ljava/lang/String;

    if-eqz p2, :cond_16

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p1, "  mNoTransactionsBecause="

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object p1, p0, Landroid/support/v4/app/v;->mNoTransactionsBecause:Ljava/lang/String;

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :cond_16
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final execPendingActions()Z
    .locals 4

    invoke-direct {p0}, Landroid/support/v4/app/v;->bB()V

    const/4 v0, 0x1

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Landroid/support/v4/app/v;->mTmpRecords:Ljava/util/ArrayList;

    iget-object v3, p0, Landroid/support/v4/app/v;->mTmpIsPop:Ljava/util/ArrayList;

    invoke-direct {p0, v2, v3}, Landroid/support/v4/app/v;->c(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v2

    if-eqz v2, :cond_0

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mExecutingActions:Z

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/app/v;->mTmpRecords:Ljava/util/ArrayList;

    iget-object v2, p0, Landroid/support/v4/app/v;->mTmpIsPop:Ljava/util/ArrayList;

    invoke-direct {p0, v1, v2}, Landroid/support/v4/app/v;->b(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Landroid/support/v4/app/v;->bC()V

    move v1, v0

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-direct {p0}, Landroid/support/v4/app/v;->bC()V

    throw v0

    :cond_0
    invoke-direct {p0}, Landroid/support/v4/app/v;->doPendingDeferredStart()V

    invoke-direct {p0}, Landroid/support/v4/app/v;->bF()V

    return v1
.end method

.method public final executePendingTransactions()Z
    .locals 1

    invoke-virtual {p0}, Landroid/support/v4/app/v;->execPendingActions()Z

    move-result v0

    invoke-direct {p0}, Landroid/support/v4/app/v;->bD()V

    return v0
.end method

.method final f(Landroid/support/v4/app/Fragment;)V
    .locals 10

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget v0, p0, Landroid/support/v4/app/v;->mCurState:I

    iget-boolean v1, p1, Landroid/support/v4/app/Fragment;->mRemoving:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->isInBackStack()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_0

    :cond_1
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_2
    :goto_0
    move v6, v0

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getNextTransition()I

    move-result v7

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getNextTransitionStyle()I

    move-result v8

    const/4 v9, 0x0

    move-object v4, p0

    move-object v5, p1

    invoke-virtual/range {v4 .. v9}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IIIZ)V

    iget-object v0, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v0, :cond_9

    iget-object v0, p1, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    iget-object v1, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    const/4 v4, 0x0

    if-eqz v0, :cond_5

    if-nez v1, :cond_3

    goto :goto_2

    :cond_3
    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    sub-int/2addr v1, v2

    :goto_1
    if-ltz v1, :cond_5

    iget-object v5, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v4/app/Fragment;

    iget-object v6, v5, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    if-ne v6, v0, :cond_4

    iget-object v6, v5, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v6, :cond_4

    move-object v4, v5

    goto :goto_2

    :cond_4
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    :cond_5
    :goto_2
    if-eqz v4, :cond_6

    iget-object v0, v4, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iget-object v1, p1, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v0

    iget-object v4, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v4

    if-ge v4, v0, :cond_6

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->removeViewAt(I)V

    iget-object v4, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1, v4, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    :cond_6
    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mIsNewlyAdded:Z

    if-eqz v0, :cond_9

    iget-object v0, p1, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    if-eqz v0, :cond_9

    iget v0, p1, Landroid/support/v4/app/Fragment;->hW:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_7

    iget-object v0, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iget v4, p1, Landroid/support/v4/app/Fragment;->hW:F

    invoke-virtual {v0, v4}, Landroid/view/View;->setAlpha(F)V

    :cond_7
    iput v1, p1, Landroid/support/v4/app/Fragment;->hW:F

    iput-boolean v3, p1, Landroid/support/v4/app/Fragment;->mIsNewlyAdded:Z

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getNextTransition()I

    move-result v0

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getNextTransitionStyle()I

    move-result v1

    invoke-direct {p0, p1, v0, v2, v1}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IZI)Landroid/support/v4/app/ae;

    move-result-object v0

    if-eqz v0, :cond_9

    iget-object v1, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-static {v1, v0}, Landroid/support/v4/app/v;->a(Landroid/view/View;Landroid/support/v4/app/ae;)V

    iget-object v1, v0, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    if-eqz v1, :cond_8

    iget-object v1, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iget-object v0, v0, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_3

    :cond_8
    iget-object v1, v0, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    iget-object v4, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    iget-object v0, v0, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    :cond_9
    :goto_3
    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mHiddenChanged:Z

    if-eqz v0, :cond_11

    iget-object v0, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v0, :cond_f

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getNextTransition()I

    move-result v0

    iget-boolean v1, p1, Landroid/support/v4/app/Fragment;->mHidden:Z

    xor-int/2addr v1, v2

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getNextTransitionStyle()I

    move-result v4

    invoke-direct {p0, p1, v0, v1, v4}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IZI)Landroid/support/v4/app/ae;

    move-result-object v0

    if-eqz v0, :cond_c

    iget-object v1, v0, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    if-eqz v1, :cond_c

    iget-object v1, v0, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    iget-object v4, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    iget-boolean v1, p1, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-eqz v1, :cond_b

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->isHideReplaced()Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-virtual {p1, v3}, Landroid/support/v4/app/Fragment;->setHideReplaced(Z)V

    goto :goto_4

    :cond_a
    iget-object v1, p1, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    iget-object v4, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    iget-object v5, v0, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    new-instance v6, Landroid/support/v4/app/aa;

    invoke-direct {v6, p0, v1, v4, p1}, Landroid/support/v4/app/aa;-><init>(Landroid/support/v4/app/v;Landroid/view/ViewGroup;Landroid/view/View;Landroid/support/v4/app/Fragment;)V

    invoke-virtual {v5, v6}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_4

    :cond_b
    iget-object v1, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    :goto_4
    iget-object v1, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-static {v1, v0}, Landroid/support/v4/app/v;->a(Landroid/view/View;Landroid/support/v4/app/ae;)V

    iget-object v0, v0, Landroid/support/v4/app/ae;->animator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    goto :goto_6

    :cond_c
    if-eqz v0, :cond_d

    iget-object v1, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-static {v1, v0}, Landroid/support/v4/app/v;->a(Landroid/view/View;Landroid/support/v4/app/ae;)V

    iget-object v1, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iget-object v4, v0, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    invoke-virtual {v1, v4}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, v0, Landroid/support/v4/app/ae;->iQ:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->start()V

    :cond_d
    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-eqz v0, :cond_e

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->isHideReplaced()Z

    move-result v0

    if-nez v0, :cond_e

    const/16 v0, 0x8

    goto :goto_5

    :cond_e
    move v0, v3

    :goto_5
    iget-object v1, p1, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->isHideReplaced()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p1, v3}, Landroid/support/v4/app/Fragment;->setHideReplaced(Z)V

    :cond_f
    :goto_6
    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mAdded:Z

    if-eqz v0, :cond_10

    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mHasMenu:Z

    if-eqz v0, :cond_10

    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mMenuVisible:Z

    if-eqz v0, :cond_10

    iput-boolean v2, p0, Landroid/support/v4/app/v;->mNeedMenuInvalidate:Z

    :cond_10
    iput-boolean v3, p1, Landroid/support/v4/app/Fragment;->mHiddenChanged:Z

    iget-boolean p1, p1, Landroid/support/v4/app/Fragment;->mHidden:Z

    invoke-static {}, Landroid/support/v4/app/Fragment;->aU()V

    :cond_11
    return-void
.end method

.method final g(Landroid/support/v4/app/Fragment;)V
    .locals 3

    iget v0, p1, Landroid/support/v4/app/Fragment;->mIndex:I

    if-ltz v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Landroid/support/v4/app/v;->mNextFragmentIndex:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Landroid/support/v4/app/v;->mNextFragmentIndex:I

    iget-object v1, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/app/Fragment;->a(ILandroid/support/v4/app/Fragment;)V

    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    if-nez v0, :cond_1

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    iget v1, p1, Landroid/support/v4/app/Fragment;->mIndex:I

    invoke-virtual {v0, v1, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v0, :cond_2

    const-string v0, "FragmentManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Allocated fragment index "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-void
.end method

.method public final getFragments()Ljava/util/List;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public final h(Landroid/support/v4/app/Fragment;)V
    .locals 3

    sget-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "FragmentManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "remove: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " nesting="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p1, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->isInBackStack()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    iget-boolean v2, p1, Landroid/support/v4/app/Fragment;->mDetached:Z

    if-eqz v2, :cond_1

    if-eqz v0, :cond_3

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v2, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mHasMenu:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mMenuVisible:Z

    if-eqz v0, :cond_2

    iput-boolean v1, p0, Landroid/support/v4/app/v;->mNeedMenuInvalidate:Z

    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p1, Landroid/support/v4/app/Fragment;->mAdded:Z

    iput-boolean v1, p1, Landroid/support/v4/app/Fragment;->mRemoving:Z

    :cond_3
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final isStateSaved()Z
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/app/v;->mStateSaved:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Landroid/support/v4/app/v;->mStopped:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public final k(Landroid/support/v4/app/Fragment;)V
    .locals 4

    sget-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "FragmentManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "detach: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mDetached:Z

    if-nez v0, :cond_3

    const/4 v0, 0x1

    iput-boolean v0, p1, Landroid/support/v4/app/Fragment;->mDetached:Z

    iget-boolean v1, p1, Landroid/support/v4/app/Fragment;->mAdded:Z

    if-eqz v1, :cond_3

    sget-boolean v1, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "FragmentManager"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "remove from detach: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-boolean v1, p1, Landroid/support/v4/app/Fragment;->mHasMenu:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p1, Landroid/support/v4/app/Fragment;->mMenuVisible:Z

    if-eqz v1, :cond_2

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mNeedMenuInvalidate:Z

    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p1, Landroid/support/v4/app/Fragment;->mAdded:Z

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_3
    return-void
.end method

.method public final l(Landroid/support/v4/app/Fragment;)V
    .locals 3

    sget-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "FragmentManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "attach: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mDetached:Z

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    iput-boolean v0, p1, Landroid/support/v4/app/Fragment;->mDetached:Z

    iget-boolean v0, p1, Landroid/support/v4/app/Fragment;->mAdded:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "FragmentManager"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "add from attach: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x1

    iput-boolean v0, p1, Landroid/support/v4/app/Fragment;->mAdded:Z

    iget-boolean v1, p1, Landroid/support/v4/app/Fragment;->mHasMenu:Z

    if-eqz v1, :cond_3

    iget-boolean p1, p1, Landroid/support/v4/app/Fragment;->mMenuVisible:Z

    if-eqz p1, :cond_3

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mNeedMenuInvalidate:Z

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment already added: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    return-void
.end method

.method final moveToState(IZ)V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    if-nez v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "No activity"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    if-nez p2, :cond_2

    iget p2, p0, Landroid/support/v4/app/v;->mCurState:I

    if-ne p1, p2, :cond_2

    return-void

    :cond_2
    iput p1, p0, Landroid/support/v4/app/v;->mCurState:I

    iget-object p1, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    if-eqz p1, :cond_7

    iget-object p1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 p2, 0x0

    move v0, p2

    :goto_1
    if-ge v0, p1, :cond_3

    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    invoke-virtual {p0, v1}, Landroid/support/v4/app/v;->f(Landroid/support/v4/app/Fragment;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    iget-object p1, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result p1

    move v0, p2

    :goto_2
    if-ge v0, p1, :cond_6

    iget-object v1, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_5

    iget-boolean v2, v1, Landroid/support/v4/app/Fragment;->mRemoving:Z

    if-nez v2, :cond_4

    iget-boolean v2, v1, Landroid/support/v4/app/Fragment;->mDetached:Z

    if-eqz v2, :cond_5

    :cond_4
    iget-boolean v2, v1, Landroid/support/v4/app/Fragment;->mIsNewlyAdded:Z

    if-nez v2, :cond_5

    invoke-virtual {p0, v1}, Landroid/support/v4/app/v;->f(Landroid/support/v4/app/Fragment;)V

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_6
    invoke-direct {p0}, Landroid/support/v4/app/v;->startPendingDeferredFragments()V

    iget-boolean p1, p0, Landroid/support/v4/app/v;->mNeedMenuInvalidate:Z

    if-eqz p1, :cond_7

    iget-object p1, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    if-eqz p1, :cond_7

    iget p1, p0, Landroid/support/v4/app/v;->mCurState:I

    const/4 v0, 0x5

    if-ne p1, v0, :cond_7

    iget-object p1, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {p1}, Landroid/support/v4/app/t;->bs()V

    iput-boolean p2, p0, Landroid/support/v4/app/v;->mNeedMenuInvalidate:Z

    :cond_7
    return-void
.end method

.method public final n(Landroid/support/v4/app/Fragment;)V
    .locals 3

    if-eqz p1, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    iget v1, p1, Landroid/support/v4/app/Fragment;->mIndex:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_0

    iget-object v0, p1, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    if-eqz v0, :cond_1

    iget-object v0, p1, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    if-ne v0, p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not an active fragment of FragmentManager "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    iput-object p1, p0, Landroid/support/v4/app/v;->iB:Landroid/support/v4/app/Fragment;

    return-void
.end method

.method public final noteStateNotSaved()V
    .locals 4

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/app/v;->iD:Landroid/support/v4/app/ak;

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mStateSaved:Z

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mStopped:Z

    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_0
    if-ge v0, v1, :cond_1

    iget-object v2, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/Fragment;

    if-eqz v2, :cond_0

    iget-object v3, v2, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v3, :cond_0

    iget-object v2, v2, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v2}, Landroid/support/v4/app/v;->noteStateNotSaved()V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 13

    move-object v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    const-string v3, "fragment"

    move-object v4, p2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_0

    return-object v4

    :cond_0
    const-string v3, "class"

    invoke-interface {v2, v4, v3}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v5, Landroid/support/v4/app/ah;->Fragment:[I

    invoke-virtual {v1, v2, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v5

    const/4 v6, 0x0

    if-nez v3, :cond_1

    invoke-virtual {v5, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    :cond_1
    move-object v7, v3

    const/4 v3, -0x1

    const/4 v8, 0x1

    invoke-virtual {v5, v8, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v9

    const/4 v10, 0x2

    invoke-virtual {v5, v10}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    iget-object v5, v0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v5}, Landroid/support/v4/app/t;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v7}, Landroid/support/v4/app/Fragment;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    return-object v4

    :cond_2
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v6

    :cond_3
    if-ne v6, v3, :cond_5

    if-ne v9, v3, :cond_5

    if-eqz v10, :cond_4

    goto :goto_0

    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface/range {p4 .. p4}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": Must specify unique android:id, android:tag, or have a parent with an id for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    :goto_0
    if-eq v9, v3, :cond_6

    invoke-direct {v0, v9}, Landroid/support/v4/app/v;->s(I)Landroid/support/v4/app/Fragment;

    move-result-object v5

    goto :goto_1

    :cond_6
    move-object v5, v4

    :goto_1
    if-nez v5, :cond_7

    if-eqz v10, :cond_7

    invoke-virtual {v0, v10}, Landroid/support/v4/app/v;->s(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v5

    :cond_7
    if-nez v5, :cond_8

    if-eq v6, v3, :cond_8

    invoke-direct {v0, v6}, Landroid/support/v4/app/v;->s(I)Landroid/support/v4/app/Fragment;

    move-result-object v5

    :cond_8
    sget-boolean v3, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v3, :cond_9

    const-string v3, "FragmentManager"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "onCreateView: id=0x"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v9}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, " fname="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, " existing="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v3, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    if-nez v5, :cond_b

    iget-object v2, v0, Landroid/support/v4/app/v;->iz:Landroid/support/v4/app/r;

    invoke-virtual {v2, v1, v7, v4}, Landroid/support/v4/app/r;->a(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    iput-boolean v8, v1, Landroid/support/v4/app/Fragment;->mFromLayout:Z

    if-eqz v9, :cond_a

    move v2, v9

    goto :goto_2

    :cond_a
    move v2, v6

    :goto_2
    iput v2, v1, Landroid/support/v4/app/Fragment;->mFragmentId:I

    iput v6, v1, Landroid/support/v4/app/Fragment;->mContainerId:I

    iput-object v10, v1, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    iput-boolean v8, v1, Landroid/support/v4/app/Fragment;->mInLayout:Z

    iput-object v0, v1, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    iget-object v2, v0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    iput-object v2, v1, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    iget-object v2, v1, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual {v1}, Landroid/support/v4/app/Fragment;->aY()V

    invoke-virtual {v0, v1, v8}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;Z)V

    move-object v6, v1

    goto :goto_3

    :cond_b
    iget-boolean v1, v5, Landroid/support/v4/app/Fragment;->mInLayout:Z

    if-nez v1, :cond_11

    iput-boolean v8, v5, Landroid/support/v4/app/Fragment;->mInLayout:Z

    iget-object v1, v0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    iput-object v1, v5, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    iget-boolean v1, v5, Landroid/support/v4/app/Fragment;->mRetaining:Z

    if-nez v1, :cond_c

    iget-object v1, v5, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual {v5}, Landroid/support/v4/app/Fragment;->aY()V

    :cond_c
    move-object v6, v5

    :goto_3
    iget v1, v0, Landroid/support/v4/app/v;->mCurState:I

    if-gtz v1, :cond_d

    iget-boolean v1, v6, Landroid/support/v4/app/Fragment;->mFromLayout:Z

    if-eqz v1, :cond_d

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, v6

    invoke-virtual/range {v0 .. v5}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IIIZ)V

    goto :goto_4

    :cond_d
    invoke-direct {v0, v6}, Landroid/support/v4/app/v;->e(Landroid/support/v4/app/Fragment;)V

    :goto_4
    iget-object v0, v6, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v0, :cond_10

    if-eqz v9, :cond_e

    iget-object v0, v6, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v0, v9}, Landroid/view/View;->setId(I)V

    :cond_e
    iget-object v0, v6, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_f

    iget-object v0, v6, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v0, v10}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :cond_f
    iget-object v0, v6, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    return-object v0

    :cond_10
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " did not create a view."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface/range {p4 .. p4}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": Duplicate id 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", tag "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", or parent id 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " with another fragment for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v4/app/v;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public final popBackStackImmediate()Z
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/app/v;->bz()V

    invoke-direct {p0}, Landroid/support/v4/app/v;->by()Z

    move-result v0

    return v0
.end method

.method public final r(Ljava/lang/String;)Landroid/support/v4/app/Fragment;
    .locals 4

    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    if-eqz p1, :cond_3

    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_3

    iget-object v2, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/Fragment;

    if-eqz v2, :cond_2

    iget-object v3, v2, Landroid/support/v4/app/Fragment;->mWho:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    :cond_0
    iget-object v3, v2, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v3, :cond_1

    iget-object v2, v2, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v2, p1}, Landroid/support/v4/app/v;->r(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    goto :goto_1

    :cond_1
    move-object v2, v1

    :goto_1
    if-eqz v2, :cond_2

    return-object v2

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_3
    return-object v1
.end method

.method public final s(Ljava/lang/String;)Landroid/support/v4/app/Fragment;
    .locals 3

    if-eqz p1, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    iget-object v1, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_0

    iget-object v2, v1, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    if-eqz v0, :cond_3

    if-eqz p1, :cond_3

    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_1
    if-ltz v0, :cond_3

    iget-object v1, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_2

    iget-object v2, v1, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    return-object v1

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method final saveAllState()Landroid/os/Parcelable;
    .locals 14

    invoke-direct {p0}, Landroid/support/v4/app/v;->bD()V

    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    :goto_0
    move v2, v1

    :goto_1
    const/4 v3, 0x0

    if-ge v2, v0, :cond_4

    iget-object v4, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Landroid/support/v4/app/Fragment;

    if-eqz v6, :cond_3

    invoke-virtual {v6}, Landroid/support/v4/app/Fragment;->bp()Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v6}, Landroid/support/v4/app/Fragment;->getStateAfterAnimating()I

    move-result v7

    invoke-virtual {v6}, Landroid/support/v4/app/Fragment;->bp()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-virtual {v5}, Landroid/view/animation/Animation;->cancel()V

    invoke-virtual {v4}, Landroid/view/View;->clearAnimation()V

    :cond_1
    invoke-virtual {v6, v3}, Landroid/support/v4/app/Fragment;->b(Landroid/view/View;)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v5, p0

    invoke-virtual/range {v5 .. v10}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/Fragment;IIIZ)V

    goto :goto_2

    :cond_2
    invoke-virtual {v6}, Landroid/support/v4/app/Fragment;->getAnimator()Landroid/animation/Animator;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {v6}, Landroid/support/v4/app/Fragment;->getAnimator()Landroid/animation/Animator;

    move-result-object v3

    invoke-virtual {v3}, Landroid/animation/Animator;->end()V

    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Landroid/support/v4/app/v;->execPendingActions()Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/v;->mStateSaved:Z

    iput-object v3, p0, Landroid/support/v4/app/v;->iD:Landroid/support/v4/app/ak;

    iget-object v2, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    if-eqz v2, :cond_20

    iget-object v2, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-gtz v2, :cond_5

    return-object v3

    :cond_5
    iget-object v2, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    new-array v4, v2, [Landroid/support/v4/app/FragmentState;

    move v5, v1

    move v6, v5

    :goto_3
    if-ge v5, v2, :cond_16

    iget-object v7, p0, Landroid/support/v4/app/v;->mActive:Landroid/util/SparseArray;

    invoke-virtual {v7, v5}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v4/app/Fragment;

    if-eqz v7, :cond_15

    iget v6, v7, Landroid/support/v4/app/Fragment;->mIndex:I

    if-gez v6, :cond_6

    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Failure saving state: active "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v9, " has cleared index: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v9, v7, Landroid/support/v4/app/Fragment;->mIndex:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v6}, Landroid/support/v4/app/v;->a(Ljava/lang/RuntimeException;)V

    :cond_6
    new-instance v6, Landroid/support/v4/app/FragmentState;

    invoke-direct {v6, v7}, Landroid/support/v4/app/FragmentState;-><init>(Landroid/support/v4/app/Fragment;)V

    aput-object v6, v4, v5

    iget v8, v7, Landroid/support/v4/app/Fragment;->mState:I

    if-lez v8, :cond_12

    iget-object v8, v6, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    if-nez v8, :cond_12

    iget-object v8, p0, Landroid/support/v4/app/v;->mStateBundle:Landroid/os/Bundle;

    if-nez v8, :cond_7

    new-instance v8, Landroid/os/Bundle;

    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    iput-object v8, p0, Landroid/support/v4/app/v;->mStateBundle:Landroid/os/Bundle;

    :cond_7
    iget-object v8, p0, Landroid/support/v4/app/v;->mStateBundle:Landroid/os/Bundle;

    iget-object v9, v7, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v9, :cond_8

    iget-object v9, v7, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v9}, Landroid/support/v4/app/v;->saveAllState()Landroid/os/Parcelable;

    move-result-object v9

    if-eqz v9, :cond_8

    const-string v10, "android:support:fragments"

    invoke-virtual {v8, v10, v9}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_8
    iget-object v8, p0, Landroid/support/v4/app/v;->mStateBundle:Landroid/os/Bundle;

    invoke-direct {p0, v7, v8}, Landroid/support/v4/app/v;->d(Landroid/support/v4/app/Fragment;Landroid/os/Bundle;)V

    iget-object v8, p0, Landroid/support/v4/app/v;->mStateBundle:Landroid/os/Bundle;

    invoke-virtual {v8}, Landroid/os/Bundle;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_9

    iget-object v8, p0, Landroid/support/v4/app/v;->mStateBundle:Landroid/os/Bundle;

    iput-object v3, p0, Landroid/support/v4/app/v;->mStateBundle:Landroid/os/Bundle;

    goto :goto_4

    :cond_9
    move-object v8, v3

    :goto_4
    iget-object v9, v7, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v9, :cond_a

    invoke-direct {p0, v7}, Landroid/support/v4/app/v;->m(Landroid/support/v4/app/Fragment;)V

    :cond_a
    iget-object v9, v7, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    if-eqz v9, :cond_c

    if-nez v8, :cond_b

    new-instance v8, Landroid/os/Bundle;

    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    :cond_b
    const-string v9, "android:view_state"

    iget-object v10, v7, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    invoke-virtual {v8, v9, v10}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    :cond_c
    iget-boolean v9, v7, Landroid/support/v4/app/Fragment;->mUserVisibleHint:Z

    if-nez v9, :cond_e

    if-nez v8, :cond_d

    new-instance v8, Landroid/os/Bundle;

    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    :cond_d
    const-string v9, "android:user_visible_hint"

    iget-boolean v10, v7, Landroid/support/v4/app/Fragment;->mUserVisibleHint:Z

    invoke-virtual {v8, v9, v10}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_e
    iput-object v8, v6, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    iget-object v8, v7, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    if-eqz v8, :cond_13

    iget-object v8, v7, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    iget v8, v8, Landroid/support/v4/app/Fragment;->mIndex:I

    if-gez v8, :cond_f

    new-instance v8, Ljava/lang/IllegalStateException;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Failure saving state: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v10, " has target not in fragment manager: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v7, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v8}, Landroid/support/v4/app/v;->a(Ljava/lang/RuntimeException;)V

    :cond_f
    iget-object v8, v6, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    if-nez v8, :cond_10

    new-instance v8, Landroid/os/Bundle;

    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    iput-object v8, v6, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    :cond_10
    iget-object v8, v6, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    const-string v9, "android:target_state"

    iget-object v10, v7, Landroid/support/v4/app/Fragment;->hO:Landroid/support/v4/app/Fragment;

    iget v11, v10, Landroid/support/v4/app/Fragment;->mIndex:I

    if-gez v11, :cond_11

    new-instance v11, Ljava/lang/IllegalStateException;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "Fragment "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v13, " is not currently in the FragmentManager"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v11}, Landroid/support/v4/app/v;->a(Ljava/lang/RuntimeException;)V

    :cond_11
    iget v10, v10, Landroid/support/v4/app/Fragment;->mIndex:I

    invoke-virtual {v8, v9, v10}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget v8, v7, Landroid/support/v4/app/Fragment;->mTargetRequestCode:I

    if-eqz v8, :cond_13

    iget-object v8, v6, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    const-string v9, "android:target_req_state"

    iget v10, v7, Landroid/support/v4/app/Fragment;->mTargetRequestCode:I

    invoke-virtual {v8, v9, v10}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_5

    :cond_12
    iget-object v8, v7, Landroid/support/v4/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    iput-object v8, v6, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    :cond_13
    :goto_5
    sget-boolean v8, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v8, :cond_14

    const-string v8, "FragmentManager"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Saved state of "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v7, ": "

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v6, Landroid/support/v4/app/FragmentState;->mSavedFragmentState:Landroid/os/Bundle;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_14
    move v6, v0

    :cond_15
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_3

    :cond_16
    if-nez v6, :cond_18

    sget-boolean v0, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v0, :cond_17

    const-string v0, "FragmentManager"

    const-string v1, "saveAllState: no fragments!"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_17
    return-object v3

    :cond_18
    iget-object v0, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1b

    new-array v2, v0, [I

    move v5, v1

    :goto_6
    if-ge v5, v0, :cond_1c

    iget-object v6, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/app/Fragment;

    iget v6, v6, Landroid/support/v4/app/Fragment;->mIndex:I

    aput v6, v2, v5

    aget v6, v2, v5

    if-gez v6, :cond_19

    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Failure saving state: active "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v8, " has cleared index: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v8, v2, v5

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v6}, Landroid/support/v4/app/v;->a(Ljava/lang/RuntimeException;)V

    :cond_19
    sget-boolean v6, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v6, :cond_1a

    const-string v6, "FragmentManager"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "saveAllState: adding fragment #"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, p0, Landroid/support/v4/app/v;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1a
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    :cond_1b
    move-object v2, v3

    :cond_1c
    iget-object v0, p0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    if-eqz v0, :cond_1e

    iget-object v0, p0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1e

    new-array v3, v0, [Landroid/support/v4/app/BackStackState;

    :goto_7
    if-ge v1, v0, :cond_1e

    new-instance v5, Landroid/support/v4/app/BackStackState;

    iget-object v6, p0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/app/c;

    invoke-direct {v5, v6}, Landroid/support/v4/app/BackStackState;-><init>(Landroid/support/v4/app/c;)V

    aput-object v5, v3, v1

    sget-boolean v5, Landroid/support/v4/app/v;->DEBUG:Z

    if-eqz v5, :cond_1d

    const-string v5, "FragmentManager"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "saveAllState: adding back stack #"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Landroid/support/v4/app/v;->mBackStack:Ljava/util/ArrayList;

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_1e
    new-instance v0, Landroid/support/v4/app/FragmentManagerState;

    invoke-direct {v0}, Landroid/support/v4/app/FragmentManagerState;-><init>()V

    iput-object v4, v0, Landroid/support/v4/app/FragmentManagerState;->iZ:[Landroid/support/v4/app/FragmentState;

    iput-object v2, v0, Landroid/support/v4/app/FragmentManagerState;->mAdded:[I

    iput-object v3, v0, Landroid/support/v4/app/FragmentManagerState;->ja:[Landroid/support/v4/app/BackStackState;

    iget-object v1, p0, Landroid/support/v4/app/v;->iB:Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_1f

    iget-object v1, p0, Landroid/support/v4/app/v;->iB:Landroid/support/v4/app/Fragment;

    iget v1, v1, Landroid/support/v4/app/Fragment;->mIndex:I

    iput v1, v0, Landroid/support/v4/app/FragmentManagerState;->mPrimaryNavActiveIndex:I

    :cond_1f
    iget v1, p0, Landroid/support/v4/app/v;->mNextFragmentIndex:I

    iput v1, v0, Landroid/support/v4/app/FragmentManagerState;->mNextFragmentIndex:I

    invoke-direct {p0}, Landroid/support/v4/app/v;->saveNonConfig()V

    return-object v0

    :cond_20
    return-object v3
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "FragmentManager{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/support/v4/app/v;->iA:Landroid/support/v4/app/Fragment;

    :goto_0
    invoke-static {v1, v0}, Landroid/support/v4/c/f;->buildShortClassTag(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    goto :goto_1

    :cond_0
    iget-object v1, p0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    goto :goto_0

    :goto_1
    const-string v1, "}}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
