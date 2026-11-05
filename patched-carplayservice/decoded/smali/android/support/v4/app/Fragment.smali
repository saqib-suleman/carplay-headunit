.class public Landroid/support/v4/app/Fragment;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/arch/lifecycle/g;
.implements Landroid/arch/lifecycle/y;
.implements Landroid/content/ComponentCallbacks;
.implements Landroid/view/View$OnCreateContextMenuListener;


# static fields
.field private static final hL:Landroid/support/v4/c/s;

.field static final hM:Ljava/lang/Object;


# instance fields
.field am:Landroid/arch/lifecycle/x;

.field hN:Ljava/lang/Boolean;

.field hO:Landroid/support/v4/app/Fragment;

.field hP:Landroid/support/v4/app/v;

.field hQ:Landroid/support/v4/app/t;

.field hR:Landroid/support/v4/app/v;

.field hS:Landroid/support/v4/app/ak;

.field hT:Landroid/support/v4/app/Fragment;

.field hU:Landroid/view/View;

.field hV:Landroid/support/v4/app/k;

.field hW:F

.field hX:Landroid/arch/lifecycle/h;

.field private hY:Landroid/arch/lifecycle/h;

.field hZ:Landroid/arch/lifecycle/g;

.field ia:Landroid/arch/lifecycle/p;

.field mAdded:Z

.field mArguments:Landroid/os/Bundle;

.field mBackStackNesting:I

.field mCalled:Z

.field mContainer:Landroid/view/ViewGroup;

.field mContainerId:I

.field mDeferStart:Z

.field mDetached:Z

.field mFragmentId:I

.field mFromLayout:Z

.field mHasMenu:Z

.field mHidden:Z

.field mHiddenChanged:Z

.field mInLayout:Z

.field mIndex:I

.field mIsCreated:Z

.field mIsNewlyAdded:Z

.field mLayoutInflater:Landroid/view/LayoutInflater;

.field mMenuVisible:Z

.field mPerformedCreateView:Z

.field mRemoving:Z

.field mRestored:Z

.field mRetainInstance:Z

.field mRetaining:Z

.field mSavedFragmentState:Landroid/os/Bundle;

.field mSavedViewState:Landroid/util/SparseArray;

.field mState:I

.field mTag:Ljava/lang/String;

.field mTargetIndex:I

.field mTargetRequestCode:I

.field mUserVisibleHint:Z

.field mView:Landroid/view/View;

.field mWho:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/support/v4/c/s;

    invoke-direct {v0}, Landroid/support/v4/c/s;-><init>()V

    sput-object v0, Landroid/support/v4/app/Fragment;->hL:Landroid/support/v4/c/s;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v4/app/Fragment;->hM:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/app/Fragment;->mState:I

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/app/Fragment;->mIndex:I

    iput v0, p0, Landroid/support/v4/app/Fragment;->mTargetIndex:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mMenuVisible:Z

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mUserVisibleHint:Z

    new-instance v0, Landroid/arch/lifecycle/h;

    invoke-direct {v0, p0}, Landroid/arch/lifecycle/h;-><init>(Landroid/arch/lifecycle/g;)V

    iput-object v0, p0, Landroid/support/v4/app/Fragment;->hX:Landroid/arch/lifecycle/h;

    new-instance v0, Landroid/arch/lifecycle/p;

    invoke-direct {v0}, Landroid/arch/lifecycle/p;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/Fragment;->ia:Landroid/arch/lifecycle/p;

    return-void
.end method

.method static synthetic a(Landroid/support/v4/app/Fragment;Landroid/arch/lifecycle/h;)Landroid/arch/lifecycle/h;
    .locals 0

    iput-object p1, p0, Landroid/support/v4/app/Fragment;->hY:Landroid/arch/lifecycle/h;

    return-object p1
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    .locals 2

    :try_start_0
    sget-object v0, Landroid/support/v4/app/Fragment;->hL:Landroid/support/v4/c/s;

    invoke-virtual {v0, p1}, Landroid/support/v4/c/s;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sget-object p0, Landroid/support/v4/app/Fragment;->hL:Landroid/support/v4/c/s;

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/c/s;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const/4 p0, 0x0

    new-array v1, p0, [Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    new-array v1, p0, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    if-eqz p2, :cond_4

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    iget v1, v0, Landroid/support/v4/app/Fragment;->mIndex:I

    if-ltz v1, :cond_3

    iget-object v1, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object p0, v0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    invoke-virtual {p0}, Landroid/support/v4/app/v;->isStateSaved()Z

    move-result p0

    :goto_0
    if-nez p0, :cond_2

    goto :goto_1

    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p2, "Fragment already active and state has been saved"

    invoke-direct {p0, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    :goto_1
    iput-object p2, v0, Landroid/support/v4/app/Fragment;->mArguments:Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_4
    return-object v0

    :catch_0
    move-exception p0

    new-instance p2, Landroid/support/v4/app/Fragment$InstantiationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unable to instantiate fragment "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": calling Fragment constructor caused an exception"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1, p0}, Landroid/support/v4/app/Fragment$InstantiationException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p2

    :catch_1
    move-exception p0

    new-instance p2, Landroid/support/v4/app/Fragment$InstantiationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unable to instantiate fragment "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": could not find Fragment constructor"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1, p0}, Landroid/support/v4/app/Fragment$InstantiationException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p2

    :catch_2
    move-exception p0

    new-instance p2, Landroid/support/v4/app/Fragment$InstantiationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unable to instantiate fragment "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": make sure class name exists, is public, and has an empty constructor that is public"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1, p0}, Landroid/support/v4/app/Fragment$InstantiationException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p2

    :catch_3
    move-exception p0

    new-instance p2, Landroid/support/v4/app/Fragment$InstantiationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unable to instantiate fragment "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": make sure class name exists, is public, and has an empty constructor that is public"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1, p0}, Landroid/support/v4/app/Fragment$InstantiationException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p2

    :catch_4
    move-exception p0

    new-instance p2, Landroid/support/v4/app/Fragment$InstantiationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unable to instantiate fragment "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": make sure class name exists, is public, and has an empty constructor that is public"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1, p0}, Landroid/support/v4/app/Fragment$InstantiationException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p2
.end method

.method static a(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1

    :try_start_0
    sget-object v0, Landroid/support/v4/app/Fragment;->hL:Landroid/support/v4/c/s;

    invoke-virtual {v0, p1}, Landroid/support/v4/c/s;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sget-object p0, Landroid/support/v4/app/Fragment;->hL:Landroid/support/v4/c/s;

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/c/s;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-class p0, Landroid/support/v4/app/Fragment;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const/4 p0, 0x0

    return p0
.end method

.method public static aU()V
    .locals 0

    return-void
.end method

.method public static aV()V
    .locals 0

    return-void
.end method

.method public static aW()V
    .locals 0

    return-void
.end method

.method public static aZ()V
    .locals 0

    return-void
.end method

.method public static ba()Landroid/view/animation/Animation;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public static bb()Landroid/animation/Animator;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public static bc()V
    .locals 0

    return-void
.end method

.method private bj()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/support/v4/app/k;->mEnterTransitionPostponed:Z

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget-object v0, v0, Landroid/support/v4/app/k;->io:Landroid/support/v4/app/l;

    iget-object v2, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iput-object v1, v2, Landroid/support/v4/app/k;->io:Landroid/support/v4/app/l;

    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/support/v4/app/l;->onStartEnterTransition()V

    :cond_1
    return-void
.end method

.method private bm()Landroid/support/v4/app/k;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    new-instance v0, Landroid/support/v4/app/k;

    invoke-direct {v0}, Landroid/support/v4/app/k;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    return-object v0
.end method

.method static synthetic c(Landroid/support/v4/app/Fragment;)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;->bj()V

    return-void
.end method

.method static synthetic d(Landroid/support/v4/app/Fragment;)Landroid/arch/lifecycle/h;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/app/Fragment;->hY:Landroid/arch/lifecycle/h;

    return-object p0
.end method

.method private instantiateChildFragmentManager()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    if-eqz v0, :cond_0

    new-instance v0, Landroid/support/v4/app/v;

    invoke-direct {v0}, Landroid/support/v4/app/v;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    new-instance v2, Landroid/support/v4/app/i;

    invoke-direct {v2, p0}, Landroid/support/v4/app/i;-><init>(Landroid/support/v4/app/Fragment;)V

    invoke-virtual {v0, v1, v2, p0}, Landroid/support/v4/app/v;->a(Landroid/support/v4/app/t;Landroid/support/v4/app/r;Landroid/support/v4/app/Fragment;)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Fragment has not been attached yet."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static onDestroyOptionsMenu()V
    .locals 0

    return-void
.end method


# virtual methods
.method final a(ILandroid/support/v4/app/Fragment;)V
    .locals 0

    iput p1, p0, Landroid/support/v4/app/Fragment;->mIndex:I

    if-eqz p2, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p2, p2, Landroid/support/v4/app/Fragment;->mWho:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ":"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_0
    iget p2, p0, Landroid/support/v4/app/Fragment;->mIndex:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/app/Fragment;->mWho:Ljava/lang/String;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "android:fragment:"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method final a(Landroid/animation/Animator;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;->bm()Landroid/support/v4/app/k;

    move-result-object v0

    iput-object p1, v0, Landroid/support/v4/app/k;->mAnimator:Landroid/animation/Animator;

    return-void
.end method

.method final a(Landroid/os/Bundle;)V
    .locals 2

    if-eqz p1, :cond_1

    const-string v0, "android:support:fragments"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-nez v0, :cond_0

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;->instantiateChildFragmentManager()V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hS:Landroid/support/v4/app/ak;

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/app/v;->a(Landroid/os/Parcelable;Landroid/support/v4/app/ak;)V

    const/4 p1, 0x0

    iput-object p1, p0, Landroid/support/v4/app/Fragment;->hS:Landroid/support/v4/app/ak;

    iget-object p1, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {p1}, Landroid/support/v4/app/v;->dispatchCreate()V

    :cond_1
    return-void
.end method

.method final aT()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hU:Landroid/view/View;

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/app/Fragment;->mSavedViewState:Landroid/util/SparseArray;

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hY:Landroid/arch/lifecycle/h;

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$Event;->ON_CREATE:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/Lifecycle$Event;)V

    :cond_1
    iget-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    if-eqz v0, :cond_2

    return-void

    :cond_2
    new-instance v0, Landroid/support/v4/app/SuperNotCalledException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onViewStateRestored()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/app/SuperNotCalledException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final aX()Landroid/view/LayoutInflater;
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    if-eqz v0, :cond_4

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v0}, Landroid/support/v4/app/t;->onGetLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-nez v1, :cond_3

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;->instantiateChildFragmentManager()V

    iget v1, p0, Landroid/support/v4/app/Fragment;->mState:I

    const/4 v2, 0x5

    if-lt v1, v2, :cond_0

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v1}, Landroid/support/v4/app/v;->dispatchResume()V

    goto :goto_0

    :cond_0
    iget v1, p0, Landroid/support/v4/app/Fragment;->mState:I

    const/4 v2, 0x4

    if-lt v1, v2, :cond_1

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v1}, Landroid/support/v4/app/v;->dispatchStart()V

    goto :goto_0

    :cond_1
    iget v1, p0, Landroid/support/v4/app/Fragment;->mState:I

    const/4 v2, 0x2

    if-lt v1, v2, :cond_2

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v1}, Landroid/support/v4/app/v;->dispatchActivityCreated()V

    goto :goto_0

    :cond_2
    iget v1, p0, Landroid/support/v4/app/Fragment;->mState:I

    if-lez v1, :cond_3

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v1}, Landroid/support/v4/app/v;->dispatchCreate()V

    :cond_3
    :goto_0
    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-static {v0, v1}, Landroid/support/v4/view/e;->b(Landroid/view/LayoutInflater;Landroid/view/LayoutInflater$Factory2;)V

    iput-object v0, p0, Landroid/support/v4/app/Fragment;->mLayoutInflater:Landroid/view/LayoutInflater;

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->mLayoutInflater:Landroid/view/LayoutInflater;

    return-object v0

    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "onGetLayoutInflater() cannot be executed until the Fragment is attached to the FragmentManager."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final aY()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v1}, Landroid/support/v4/app/t;->getActivity()Landroid/app/Activity;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_1

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    :cond_1
    return-void
.end method

.method final b(Landroid/support/v4/app/l;)V
    .locals 2

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;->bm()Landroid/support/v4/app/k;

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget-object v0, v0, Landroid/support/v4/app/k;->io:Landroid/support/v4/app/l;

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_2

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget-object v0, v0, Landroid/support/v4/app/k;->io:Landroid/support/v4/app/l;

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Trying to set a replacement startPostponedEnterTransition on "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget-boolean v0, v0, Landroid/support/v4/app/k;->mEnterTransitionPostponed:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iput-object p1, v0, Landroid/support/v4/app/k;->io:Landroid/support/v4/app/l;

    :cond_3
    if-eqz p1, :cond_4

    invoke-interface {p1}, Landroid/support/v4/app/l;->startListening()V

    :cond_4
    return-void
.end method

.method final b(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;->bm()Landroid/support/v4/app/k;

    move-result-object v0

    iput-object p1, v0, Landroid/support/v4/app/k;->ic:Landroid/view/View;

    return-void
.end method

.method public final bd()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    invoke-static {v0}, Landroid/support/v4/app/k;->a(Landroid/support/v4/app/k;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final be()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    invoke-static {v0}, Landroid/support/v4/app/k;->b(Landroid/support/v4/app/k;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Landroid/support/v4/app/Fragment;->hM:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->bd()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    invoke-static {v0}, Landroid/support/v4/app/k;->b(Landroid/support/v4/app/k;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final bf()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    invoke-static {v0}, Landroid/support/v4/app/k;->c(Landroid/support/v4/app/k;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final bg()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    invoke-static {v0}, Landroid/support/v4/app/k;->d(Landroid/support/v4/app/k;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Landroid/support/v4/app/Fragment;->hM:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->bf()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    invoke-static {v0}, Landroid/support/v4/app/k;->d(Landroid/support/v4/app/k;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final bh()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    invoke-static {v0}, Landroid/support/v4/app/k;->e(Landroid/support/v4/app/k;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final bi()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    invoke-static {v0}, Landroid/support/v4/app/k;->f(Landroid/support/v4/app/k;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Landroid/support/v4/app/Fragment;->hM:Ljava/lang/Object;

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->bh()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    invoke-static {v0}, Landroid/support/v4/app/k;->f(Landroid/support/v4/app/k;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method final bk()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->noteStateNotSaved()V

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mPerformedCreateView:Z

    new-instance v0, Landroid/support/v4/app/j;

    invoke-direct {v0, p0}, Landroid/support/v4/app/j;-><init>(Landroid/support/v4/app/Fragment;)V

    iput-object v0, p0, Landroid/support/v4/app/Fragment;->hZ:Landroid/arch/lifecycle/g;

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/app/Fragment;->hY:Landroid/arch/lifecycle/h;

    iput-object v0, p0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v1, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hZ:Landroid/arch/lifecycle/g;

    invoke-interface {v0}, Landroid/arch/lifecycle/g;->g()Landroid/arch/lifecycle/Lifecycle;

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->ia:Landroid/arch/lifecycle/p;

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hZ:Landroid/arch/lifecycle/g;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/p;->setValue(Ljava/lang/Object;)V

    return-void

    :cond_1
    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hY:Landroid/arch/lifecycle/h;

    if-nez v1, :cond_2

    iput-object v0, p0, Landroid/support/v4/app/Fragment;->hZ:Landroid/arch/lifecycle/g;

    return-void

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Called getViewLifecycleOwner() but onCreateView() returned null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final bl()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->noteStateNotSaved()V

    :cond_0
    const/4 v0, 0x2

    iput v0, p0, Landroid/support/v4/app/Fragment;->mState:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    iget-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchActivityCreated()V

    :cond_1
    return-void

    :cond_2
    new-instance v0, Landroid/support/v4/app/SuperNotCalledException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onActivityCreated()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/app/SuperNotCalledException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final bn()Landroid/support/v4/app/bl;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget-object v0, v0, Landroid/support/v4/app/k;->im:Landroid/support/v4/app/bl;

    return-object v0
.end method

.method final bo()Landroid/support/v4/app/bl;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget-object v0, v0, Landroid/support/v4/app/k;->in:Landroid/support/v4/app/bl;

    return-object v0
.end method

.method final bp()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget-object v0, v0, Landroid/support/v4/app/k;->ic:Landroid/view/View;

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 0

    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final g()Landroid/arch/lifecycle/Lifecycle;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hX:Landroid/arch/lifecycle/h;

    return-object v0
.end method

.method final getAnimator()Landroid/animation/Animator;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget-object v0, v0, Landroid/support/v4/app/k;->mAnimator:Landroid/animation/Animator;

    return-object v0
.end method

.method public final getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v0}, Landroid/support/v4/app/t;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method final getNextAnim()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget v0, v0, Landroid/support/v4/app/k;->mNextAnim:I

    return v0
.end method

.method final getNextTransition()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget v0, v0, Landroid/support/v4/app/k;->mNextTransition:I

    return v0
.end method

.method final getNextTransitionStyle()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget v0, v0, Landroid/support/v4/app/k;->mNextTransitionStyle:I

    return v0
.end method

.method final getStateAfterAnimating()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget v0, v0, Landroid/support/v4/app/k;->mStateAfterAnimating:I

    return v0
.end method

.method public final hashCode()I
    .locals 1

    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method final isHideReplaced()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget-boolean v0, v0, Landroid/support/v4/app/k;->mIsHideReplaced:Z

    return v0
.end method

.method final isInBackStack()Z
    .locals 1

    iget v0, p0, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method final isPostponed()Z
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iget-boolean v0, v0, Landroid/support/v4/app/k;->mEnterTransitionPostponed:Z

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v0}, Landroid/support/v4/app/t;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/n;

    :goto_0
    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/n;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    return-void
.end method

.method public onLowMemory()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    return-void
.end method

.method final performCreate(Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->noteStateNotSaved()V

    :cond_0
    const/4 v0, 0x1

    iput v0, p0, Landroid/support/v4/app/Fragment;->mState:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    invoke-virtual {p0, p1}, Landroid/support/v4/app/Fragment;->a(Landroid/os/Bundle;)V

    iget-object p1, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz p1, :cond_2

    iget-object p1, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    iget p1, p1, Landroid/support/v4/app/v;->mCurState:I

    if-lez p1, :cond_1

    move v1, v0

    :cond_1
    if-nez v1, :cond_2

    iget-object p1, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {p1}, Landroid/support/v4/app/v;->dispatchCreate()V

    :cond_2
    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mIsCreated:Z

    iget-boolean p1, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    if-eqz p1, :cond_3

    iget-object p1, p0, Landroid/support/v4/app/Fragment;->hX:Landroid/arch/lifecycle/h;

    sget-object v0, Landroid/arch/lifecycle/Lifecycle$Event;->ON_CREATE:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-virtual {p1, v0}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/Lifecycle$Event;)V

    return-void

    :cond_3
    new-instance p1, Landroid/support/v4/app/SuperNotCalledException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Fragment "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " did not call through to super.onCreate()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/support/v4/app/SuperNotCalledException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method final performDestroyView()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchDestroyView()V

    :cond_0
    const/4 v0, 0x1

    iput v0, p0, Landroid/support/v4/app/Fragment;->mState:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hY:Landroid/arch/lifecycle/h;

    sget-object v2, Landroid/arch/lifecycle/Lifecycle$Event;->ON_DESTROY:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-virtual {v0, v2}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/Lifecycle$Event;)V

    :cond_1
    iget-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    if-eqz v0, :cond_2

    invoke-static {p0}, Landroid/support/v4/app/bf;->c(Landroid/arch/lifecycle/g;)Landroid/support/v4/app/bf;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/bf;->bI()V

    iput-boolean v1, p0, Landroid/support/v4/app/Fragment;->mPerformedCreateView:Z

    return-void

    :cond_2
    new-instance v0, Landroid/support/v4/app/SuperNotCalledException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onDestroyView()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/app/SuperNotCalledException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final performPause()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hY:Landroid/arch/lifecycle/h;

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$Event;->ON_PAUSE:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/Lifecycle$Event;)V

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hX:Landroid/arch/lifecycle/h;

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$Event;->ON_PAUSE:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/Lifecycle$Event;)V

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchPause()V

    :cond_1
    const/4 v0, 0x4

    iput v0, p0, Landroid/support/v4/app/Fragment;->mState:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    iget-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    if-eqz v0, :cond_2

    return-void

    :cond_2
    new-instance v0, Landroid/support/v4/app/SuperNotCalledException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onPause()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/app/SuperNotCalledException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final performResume()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->noteStateNotSaved()V

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->execPendingActions()Z

    :cond_0
    const/4 v0, 0x5

    iput v0, p0, Landroid/support/v4/app/Fragment;->mState:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    iget-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchResume()V

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->execPendingActions()Z

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hX:Landroid/arch/lifecycle/h;

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$Event;->ON_RESUME:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/Lifecycle$Event;)V

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hY:Landroid/arch/lifecycle/h;

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$Event;->ON_RESUME:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/Lifecycle$Event;)V

    :cond_2
    return-void

    :cond_3
    new-instance v0, Landroid/support/v4/app/SuperNotCalledException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onResume()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/app/SuperNotCalledException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final performStart()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->noteStateNotSaved()V

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->execPendingActions()Z

    :cond_0
    const/4 v0, 0x4

    iput v0, p0, Landroid/support/v4/app/Fragment;->mState:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    iget-boolean v0, p0, Landroid/support/v4/app/Fragment;->mCalled:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hR:Landroid/support/v4/app/v;

    invoke-virtual {v0}, Landroid/support/v4/app/v;->dispatchStart()V

    :cond_1
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hX:Landroid/arch/lifecycle/h;

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$Event;->ON_START:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/Lifecycle$Event;)V

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hY:Landroid/arch/lifecycle/h;

    sget-object v1, Landroid/arch/lifecycle/Lifecycle$Event;->ON_START:Landroid/arch/lifecycle/Lifecycle$Event;

    invoke-virtual {v0, v1}, Landroid/arch/lifecycle/h;->a(Landroid/arch/lifecycle/Lifecycle$Event;)V

    :cond_2
    return-void

    :cond_3
    new-instance v0, Landroid/support/v4/app/SuperNotCalledException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fragment "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onStart()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/app/SuperNotCalledException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final r()Landroid/arch/lifecycle/x;
    .locals 2

    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->am:Landroid/arch/lifecycle/x;

    if-nez v0, :cond_0

    new-instance v0, Landroid/arch/lifecycle/x;

    invoke-direct {v0}, Landroid/arch/lifecycle/x;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/Fragment;->am:Landroid/arch/lifecycle/x;

    :cond_0
    iget-object v0, p0, Landroid/support/v4/app/Fragment;->am:Landroid/arch/lifecycle/x;

    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t access ViewModels from detached fragment"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final setHideReplaced(Z)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;->bm()Landroid/support/v4/app/k;

    move-result-object v0

    iput-boolean p1, v0, Landroid/support/v4/app/k;->mIsHideReplaced:Z

    return-void
.end method

.method final setNextAnim(I)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;->bm()Landroid/support/v4/app/k;

    move-result-object v0

    iput p1, v0, Landroid/support/v4/app/k;->mNextAnim:I

    return-void
.end method

.method final setNextTransition(II)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;->bm()Landroid/support/v4/app/k;

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iput p1, v0, Landroid/support/v4/app/k;->mNextTransition:I

    iget-object p1, p0, Landroid/support/v4/app/Fragment;->hV:Landroid/support/v4/app/k;

    iput p2, p1, Landroid/support/v4/app/k;->mNextTransitionStyle:I

    return-void
.end method

.method final setStateAfterAnimating(I)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;->bm()Landroid/support/v4/app/k;

    move-result-object v0

    iput p1, v0, Landroid/support/v4/app/k;->mStateAfterAnimating:I

    return-void
.end method

.method public final startPostponedEnterTransition()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    iget-object v0, v0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    iget-object v1, v1, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v1}, Landroid/support/v4/app/t;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Landroid/support/v4/app/Fragment;->hP:Landroid/support/v4/app/v;

    iget-object v0, v0, Landroid/support/v4/app/v;->hQ:Landroid/support/v4/app/t;

    invoke-virtual {v0}, Landroid/support/v4/app/t;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Landroid/support/v4/app/h;

    invoke-direct {v1, p0}, Landroid/support/v4/app/h;-><init>(Landroid/support/v4/app/Fragment;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    return-void

    :cond_1
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;->bj()V

    return-void

    :cond_2
    :goto_0
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;->bm()Landroid/support/v4/app/k;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/support/v4/app/k;->mEnterTransitionPostponed:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-static {p0, v0}, Landroid/support/v4/c/f;->buildShortClassTag(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    iget v1, p0, Landroid/support/v4/app/Fragment;->mIndex:I

    if-ltz v1, :cond_0

    const-string v1, " #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/app/Fragment;->mIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_0
    iget v1, p0, Landroid/support/v4/app/Fragment;->mFragmentId:I

    if-eqz v1, :cond_1

    const-string v1, " id=0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/app/Fragment;->mFragmentId:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    iget-object v1, p0, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    if-eqz v1, :cond_2

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
