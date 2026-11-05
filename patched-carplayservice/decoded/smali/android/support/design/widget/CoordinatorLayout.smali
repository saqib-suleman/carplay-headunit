.class public Landroid/support/design/widget/CoordinatorLayout;
.super Landroid/view/ViewGroup;

# interfaces
.implements Landroid/support/v4/view/j;


# static fields
.field static final gR:Ljava/lang/String;

.field static final gS:[Ljava/lang/Class;

.field static final gT:Ljava/lang/ThreadLocal;

.field static final gU:Ljava/util/Comparator;

.field private static final gV:Landroid/support/v4/c/o;


# instance fields
.field private final gW:Ljava/util/List;

.field private final gX:Landroid/support/v4/widget/a;

.field private final gY:Ljava/util/List;

.field private final gZ:[I

.field private ha:Z

.field private hb:[I

.field private hc:Landroid/view/View;

.field private hd:Landroid/view/View;

.field private he:Landroid/support/design/widget/f;

.field private hf:Z

.field private hg:Landroid/support/v4/view/x;

.field private hh:Z

.field private hi:Landroid/graphics/drawable/Drawable;

.field private hj:Landroid/support/v4/view/l;

.field private final hk:Landroid/support/v4/view/k;

.field private mIsAttachedToWindow:Z

.field mOnHierarchyChangeListener:Landroid/view/ViewGroup$OnHierarchyChangeListener;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-class v0, Landroid/support/design/widget/CoordinatorLayout;

    invoke-virtual {v0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    sput-object v0, Landroid/support/design/widget/CoordinatorLayout;->gR:Ljava/lang/String;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_1

    new-instance v0, Landroid/support/design/widget/h;

    invoke-direct {v0}, Landroid/support/design/widget/h;-><init>()V

    sput-object v0, Landroid/support/design/widget/CoordinatorLayout;->gU:Ljava/util/Comparator;

    goto :goto_1

    :cond_1
    sput-object v1, Landroid/support/design/widget/CoordinatorLayout;->gU:Ljava/util/Comparator;

    :goto_1
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Landroid/content/Context;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Landroid/util/AttributeSet;

    aput-object v2, v0, v1

    sput-object v0, Landroid/support/design/widget/CoordinatorLayout;->gS:[Ljava/lang/Class;

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Landroid/support/design/widget/CoordinatorLayout;->gT:Ljava/lang/ThreadLocal;

    new-instance v0, Landroid/support/v4/c/q;

    invoke-direct {v0}, Landroid/support/v4/c/q;-><init>()V

    sput-object v0, Landroid/support/design/widget/CoordinatorLayout;->gV:Landroid/support/v4/c/o;

    return-void
.end method

.method static a(Landroid/content/Context;Landroid/util/AttributeSet;Ljava/lang/String;)Landroid/support/design/widget/c;
    .locals 4

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "."

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_1
    const/16 v0, 0x2e

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_2

    sget-object v1, Landroid/support/design/widget/CoordinatorLayout;->gR:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Landroid/support/design/widget/CoordinatorLayout;->gR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :cond_2
    :goto_0
    :try_start_0
    sget-object v0, Landroid/support/design/widget/CoordinatorLayout;->gT:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sget-object v1, Landroid/support/design/widget/CoordinatorLayout;->gT:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_3
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Constructor;

    const/4 v2, 0x1

    if-nez v1, :cond_4

    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sget-object v3, Landroid/support/design/widget/CoordinatorLayout;->gS:[Ljava/lang/Class;

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v0, v3

    aput-object p1, v0, v2

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/support/design/widget/c;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Could not inflate Behavior subclass "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method private static a(Landroid/view/View;)Landroid/support/design/widget/e;
    .locals 6

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/e;

    iget-boolean v1, v0, Landroid/support/design/widget/e;->hn:Z

    if-nez v1, :cond_4

    instance-of v1, p0, Landroid/support/design/widget/b;

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    check-cast p0, Landroid/support/design/widget/b;

    invoke-interface {p0}, Landroid/support/design/widget/b;->aM()Landroid/support/design/widget/c;

    move-result-object p0

    if-nez p0, :cond_0

    const-string v1, "CoordinatorLayout"

    const-string v3, "Attached behavior class is null"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {v0, p0}, Landroid/support/design/widget/e;->a(Landroid/support/design/widget/c;)V

    :cond_1
    :goto_0
    iput-boolean v2, v0, Landroid/support/design/widget/e;->hn:Z

    return-object v0

    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const/4 v1, 0x0

    :goto_1
    if-eqz p0, :cond_3

    const-class v1, Landroid/support/design/widget/d;

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/d;

    if-nez v1, :cond_3

    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_1

    :cond_3
    if-eqz v1, :cond_1

    :try_start_0
    invoke-interface {v1}, Landroid/support/design/widget/d;->value()Ljava/lang/Class;

    move-result-object p0

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {p0, v4}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/support/design/widget/c;

    invoke-virtual {v0, p0}, Landroid/support/design/widget/e;->a(Landroid/support/design/widget/c;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v3, "CoordinatorLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Default behavior class "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1}, Landroid/support/design/widget/d;->value()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " could not be instantiated. Did you forget a default constructor?"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_4
    return-object v0
.end method

.method private static a(ILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/support/design/widget/e;II)V
    .locals 6

    iget v0, p3, Landroid/support/design/widget/e;->gravity:I

    if-nez v0, :cond_0

    const/16 v0, 0x11

    :cond_0
    invoke-static {v0, p0}, Landroid/support/v4/view/d;->getAbsoluteGravity(II)I

    move-result v0

    iget p3, p3, Landroid/support/design/widget/e;->ho:I

    invoke-static {p3}, Landroid/support/design/widget/CoordinatorLayout;->l(I)I

    move-result p3

    invoke-static {p3, p0}, Landroid/support/v4/view/d;->getAbsoluteGravity(II)I

    move-result p0

    and-int/lit8 p3, v0, 0x7

    and-int/lit8 v0, v0, 0x70

    and-int/lit8 v1, p0, 0x7

    and-int/lit8 p0, p0, 0x70

    const/4 v2, 0x5

    const/4 v3, 0x1

    if-eq v1, v3, :cond_2

    if-eq v1, v2, :cond_1

    iget v1, p1, Landroid/graphics/Rect;->left:I

    goto :goto_0

    :cond_1
    iget v1, p1, Landroid/graphics/Rect;->right:I

    goto :goto_0

    :cond_2
    iget v1, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v1, v4

    :goto_0
    const/16 v4, 0x50

    const/16 v5, 0x10

    if-eq p0, v5, :cond_4

    if-eq p0, v4, :cond_3

    iget p0, p1, Landroid/graphics/Rect;->top:I

    goto :goto_1

    :cond_3
    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    goto :goto_1

    :cond_4
    iget p0, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    add-int/2addr p0, p1

    :goto_1
    if-eq p3, v3, :cond_5

    if-eq p3, v2, :cond_6

    sub-int/2addr v1, p4

    goto :goto_2

    :cond_5
    div-int/lit8 p1, p4, 0x2

    sub-int/2addr v1, p1

    :cond_6
    :goto_2
    if-eq v0, v5, :cond_7

    if-eq v0, v4, :cond_8

    sub-int/2addr p0, p5

    goto :goto_3

    :cond_7
    div-int/lit8 p1, p5, 0x2

    sub-int/2addr p0, p1

    :cond_8
    :goto_3
    add-int/2addr p4, v1

    add-int/2addr p5, p0

    invoke-virtual {p2, v1, p0, p4, p5}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method private static a(Landroid/graphics/Rect;)V
    .locals 1

    invoke-virtual {p0}, Landroid/graphics/Rect;->setEmpty()V

    sget-object v0, Landroid/support/design/widget/CoordinatorLayout;->gV:Landroid/support/v4/c/o;

    invoke-interface {v0, p0}, Landroid/support/v4/c/o;->release(Ljava/lang/Object;)Z

    return-void
.end method

.method private a(Landroid/support/design/widget/e;Landroid/graphics/Rect;II)V
    .locals 5

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingLeft()I

    move-result v2

    iget v3, p1, Landroid/support/design/widget/e;->leftMargin:I

    add-int/2addr v2, v3

    iget v3, p2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingRight()I

    move-result v4

    sub-int/2addr v0, v4

    sub-int/2addr v0, p3

    iget v4, p1, Landroid/support/design/widget/e;->rightMargin:I

    sub-int/2addr v0, v4

    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingTop()I

    move-result v2

    iget v3, p1, Landroid/support/design/widget/e;->topMargin:I

    add-int/2addr v2, v3

    iget v3, p2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v1, v4

    sub-int/2addr v1, p4

    iget p1, p1, Landroid/support/design/widget/e;->bottomMargin:I

    sub-int/2addr v1, p1

    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    add-int/2addr p3, v0

    add-int/2addr p4, p1

    invoke-virtual {p2, v0, p1, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method private static a(Landroid/view/View;I)V
    .locals 2

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/e;

    iget v1, v0, Landroid/support/design/widget/e;->ht:I

    if-eq v1, p1, :cond_0

    iget v1, v0, Landroid/support/design/widget/e;->ht:I

    sub-int v1, p1, v1

    invoke-static {p0, v1}, Landroid/support/v4/view/n;->f(Landroid/view/View;I)V

    iput p1, v0, Landroid/support/design/widget/e;->ht:I

    :cond_0
    return-void
.end method

.method private a(Landroid/view/View;ZLandroid/graphics/Rect;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->isLayoutRequested()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    invoke-static {p0, p1, p3}, Landroid/support/v4/widget/m;->a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result p1

    invoke-virtual {p3, p2, v0, v1, p1}, Landroid/graphics/Rect;->set(IIII)V

    return-void

    :cond_2
    :goto_0
    invoke-virtual {p3}, Landroid/graphics/Rect;->setEmpty()V

    return-void
.end method

.method private a(Landroid/view/MotionEvent;)Z
    .locals 17

    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    iget-object v2, v0, Landroid/support/design/widget/CoordinatorLayout;->gY:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->isChildrenDrawingOrderEnabled()Z

    move-result v3

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v4

    add-int/lit8 v5, v4, -0x1

    :goto_0
    if-ltz v5, :cond_1

    if-eqz v3, :cond_0

    invoke-virtual {v0, v4, v5}, Landroid/support/design/widget/CoordinatorLayout;->getChildDrawingOrder(II)I

    move-result v6

    goto :goto_1

    :cond_0
    move v6, v5

    :goto_1
    invoke-virtual {v0, v6}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, -0x1

    goto :goto_0

    :cond_1
    sget-object v0, Landroid/support/design/widget/CoordinatorLayout;->gU:Ljava/util/Comparator;

    if-eqz v0, :cond_2

    sget-object v0, Landroid/support/design/widget/CoordinatorLayout;->gU:Ljava/util/Comparator;

    invoke-static {v2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move v5, v3

    move-object v6, v4

    move v4, v5

    :goto_2
    if-ge v4, v0, :cond_6

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/support/design/widget/e;

    iget-object v8, v7, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    if-eqz v5, :cond_3

    if-eqz v1, :cond_3

    if-eqz v8, :cond_5

    if-nez v6, :cond_5

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v11

    const/4 v13, 0x3

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-wide v9, v11

    invoke-static/range {v9 .. v16}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v6

    goto :goto_4

    :cond_3
    invoke-virtual {v7}, Landroid/support/design/widget/e;->aN()Z

    move-result v5

    invoke-virtual {v7}, Landroid/support/design/widget/e;->aO()Z

    move-result v7

    if-eqz v7, :cond_4

    if-nez v5, :cond_4

    const/4 v5, 0x1

    goto :goto_3

    :cond_4
    move v5, v3

    :goto_3
    if-eqz v7, :cond_5

    if-eqz v5, :cond_6

    :cond_5
    :goto_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_6
    invoke-interface {v2}, Ljava/util/List;->clear()V

    return v3
.end method

.method private static aK()Landroid/graphics/Rect;
    .locals 1

    sget-object v0, Landroid/support/design/widget/CoordinatorLayout;->gV:Landroid/support/v4/c/o;

    invoke-interface {v0}, Landroid/support/v4/c/o;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    :cond_0
    return-object v0
.end method

.method private aL()V
    .locals 12

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    invoke-virtual {p0, v2}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/design/widget/e;

    iget-object v3, v3, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    if-eqz v3, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    const/4 v8, 0x3

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-wide v4, v6

    invoke-static/range {v4 .. v11}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/MotionEvent;->recycle()V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    move v2, v1

    :goto_1
    if-ge v2, v0, :cond_2

    invoke-virtual {p0, v2}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/design/widget/e;

    invoke-virtual {v3}, Landroid/support/design/widget/e;->aP()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hc:Landroid/view/View;

    iput-boolean v1, p0, Landroid/support/design/widget/CoordinatorLayout;->ha:Z

    return-void
.end method

.method private static b(Landroid/view/View;I)V
    .locals 2

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/e;

    iget v1, v0, Landroid/support/design/widget/e;->hu:I

    if-eq v1, p1, :cond_0

    iget v1, v0, Landroid/support/design/widget/e;->hu:I

    sub-int v1, p1, v1

    invoke-static {p0, v1}, Landroid/support/v4/view/n;->d(Landroid/view/View;I)V

    iput p1, v0, Landroid/support/design/widget/e;->hu:I

    :cond_0
    return-void
.end method

.method private k(I)I
    .locals 4

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hb:[I

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "CoordinatorLayout"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "No keylines defined for "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " - attempted index lookup "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :goto_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    if-ltz p1, :cond_2

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hb:[I

    array-length v0, v0

    if-lt p1, v0, :cond_1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hb:[I

    aget p1, v0, p1

    return p1

    :cond_2
    :goto_1
    const-string v0, "CoordinatorLayout"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Keyline index "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " out of range for "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private static l(I)I
    .locals 1

    and-int/lit8 v0, p0, 0x7

    if-nez v0, :cond_0

    const v0, 0x800003

    or-int/2addr p0, v0

    :cond_0
    and-int/lit8 v0, p0, 0x70

    if-nez v0, :cond_1

    or-int/lit8 p0, p0, 0x30

    :cond_1
    return p0
.end method

.method private static m(I)I
    .locals 0

    if-nez p0, :cond_0

    const p0, 0x800035

    :cond_0
    return p0
.end method


# virtual methods
.method final a(Landroid/support/v4/view/x;)Landroid/support/v4/view/x;
    .locals 5

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/16 v4, 0x13

    if-lt v1, v4, :cond_0

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    goto :goto_1

    :cond_0
    if-eq v0, p1, :cond_2

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    move v0, v3

    goto :goto_1

    :cond_2
    :goto_0
    move v0, v2

    :goto_1
    if-nez v0, :cond_7

    iput-object p1, p0, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroid/support/v4/view/x;->getSystemWindowInsetTop()I

    move-result v0

    if-lez v0, :cond_3

    move v0, v2

    goto :goto_2

    :cond_3
    move v0, v3

    :goto_2
    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hh:Z

    iget-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hh:Z

    if-nez v0, :cond_4

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_4

    goto :goto_3

    :cond_4
    move v2, v3

    :goto_3
    invoke-virtual {p0, v2}, Landroid/support/design/widget/CoordinatorLayout;->setWillNotDraw(Z)V

    invoke-virtual {p1}, Landroid/support/v4/view/x;->isConsumed()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v0

    :goto_4
    if-ge v3, v0, :cond_6

    invoke-virtual {p0, v3}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Landroid/support/v4/view/n;->j(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/e;

    iget-object v1, v1, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    if-eqz v1, :cond_5

    invoke-virtual {p1}, Landroid/support/v4/view/x;->isConsumed()Z

    move-result v1

    if-nez v1, :cond_6

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_6
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->requestLayout()V

    :cond_7
    return-object p1
.end method

.method public final a(II[II)V
    .locals 10

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    move v4, v3

    move v5, v4

    :goto_0
    const/4 v6, 0x1

    if-ge v2, v0, :cond_3

    invoke-virtual {p0, v2}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result v8

    const/16 v9, 0x8

    if-eq v8, v9, :cond_2

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/support/design/widget/e;

    invoke-virtual {v7, p4}, Landroid/support/design/widget/e;->q(I)Z

    move-result v8

    if-eqz v8, :cond_2

    iget-object v7, v7, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    if-eqz v7, :cond_2

    iget-object v5, p0, Landroid/support/design/widget/CoordinatorLayout;->gZ:[I

    iget-object v7, p0, Landroid/support/design/widget/CoordinatorLayout;->gZ:[I

    aput v1, v7, v6

    aput v1, v5, v1

    if-lez p1, :cond_0

    iget-object v5, p0, Landroid/support/design/widget/CoordinatorLayout;->gZ:[I

    aget v5, v5, v1

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    goto :goto_1

    :cond_0
    iget-object v5, p0, Landroid/support/design/widget/CoordinatorLayout;->gZ:[I

    aget v5, v5, v1

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    :goto_1
    if-lez p2, :cond_1

    iget-object v5, p0, Landroid/support/design/widget/CoordinatorLayout;->gZ:[I

    aget v5, v5, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    goto :goto_2

    :cond_1
    iget-object v5, p0, Landroid/support/design/widget/CoordinatorLayout;->gZ:[I

    aget v5, v5, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    :goto_2
    move v5, v6

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    aput v3, p3, v1

    aput v4, p3, v6

    if-eqz v5, :cond_4

    invoke-virtual {p0, v6}, Landroid/support/design/widget/CoordinatorLayout;->n(I)V

    :cond_4
    return-void
.end method

.method public final a(Landroid/view/View;II)V
    .locals 0

    iget-object p3, p0, Landroid/support/design/widget/CoordinatorLayout;->hk:Landroid/support/v4/view/k;

    invoke-virtual {p3, p2}, Landroid/support/v4/view/k;->D(I)V

    iput-object p1, p0, Landroid/support/design/widget/CoordinatorLayout;->hd:Landroid/view/View;

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result p1

    const/4 p2, 0x0

    :goto_0
    if-ge p2, p1, :cond_0

    invoke-virtual {p0, p2}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final a(II)Z
    .locals 5

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result p1

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, p1, :cond_1

    invoke-virtual {p0, v1}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-eq v3, v4, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/e;

    invoke-virtual {v2, p2}, Landroid/support/design/widget/e;->p(I)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public final b(II)V
    .locals 6

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result p1

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x1

    if-ge v0, p1, :cond_1

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_0

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/design/widget/e;

    invoke-virtual {v3, p2}, Landroid/support/design/widget/e;->q(I)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v3, v3, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    if-eqz v3, :cond_0

    move v1, v2

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    if-eqz v1, :cond_2

    invoke-virtual {p0, v2}, Landroid/support/design/widget/CoordinatorLayout;->n(I)V

    :cond_2
    return-void
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1

    instance-of v0, p1, Landroid/support/design/widget/e;

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 0

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p1

    return p1
.end method

.method protected drawableStateChanged()V
    .locals 4

    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getDrawableState()[I

    move-result-object v0

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->hi:Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    or-int/2addr v2, v0

    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->invalidate()V

    :cond_1
    return-void
.end method

.method protected synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    new-instance v0, Landroid/support/design/widget/e;

    invoke-direct {v0}, Landroid/support/design/widget/e;-><init>()V

    return-object v0
.end method

.method public synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2

    new-instance v0, Landroid/support/design/widget/e;

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/design/widget/e;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    instance-of v0, p1, Landroid/support/design/widget/e;

    if-eqz v0, :cond_0

    new-instance v0, Landroid/support/design/widget/e;

    check-cast p1, Landroid/support/design/widget/e;

    invoke-direct {v0, p1}, Landroid/support/design/widget/e;-><init>(Landroid/support/design/widget/e;)V

    return-object v0

    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1

    new-instance v0, Landroid/support/design/widget/e;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, p1}, Landroid/support/design/widget/e;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object v0

    :cond_1
    new-instance v0, Landroid/support/design/widget/e;

    invoke-direct {v0, p1}, Landroid/support/design/widget/e;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getNestedScrollAxes()I
    .locals 1

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hk:Landroid/support/v4/view/k;

    invoke-virtual {v0}, Landroid/support/v4/view/k;->getNestedScrollAxes()I

    move-result v0

    return v0
.end method

.method protected getSuggestedMinimumHeight()I
    .locals 3

    invoke-super {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingBottom()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method protected getSuggestedMinimumWidth()I
    .locals 3

    invoke-super {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingRight()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method final n(I)V
    .locals 24

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/n;->f(Landroid/view/View;)I

    move-result v8

    iget-object v2, v0, Landroid/support/design/widget/CoordinatorLayout;->gW:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {}, Landroid/support/design/widget/CoordinatorLayout;->aK()Landroid/graphics/Rect;

    move-result-object v10

    invoke-static {}, Landroid/support/design/widget/CoordinatorLayout;->aK()Landroid/graphics/Rect;

    move-result-object v11

    invoke-static {}, Landroid/support/design/widget/CoordinatorLayout;->aK()Landroid/graphics/Rect;

    move-result-object v12

    const/4 v13, 0x0

    move v14, v13

    :goto_0
    if-ge v14, v9, :cond_17

    iget-object v2, v0, Landroid/support/design/widget/CoordinatorLayout;->gW:Ljava/util/List;

    invoke-interface {v2, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Landroid/view/View;

    invoke-virtual {v15}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroid/support/design/widget/e;

    if-nez v1, :cond_1

    invoke-virtual {v15}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_0

    goto :goto_1

    :cond_0
    move v3, v9

    move-object v4, v12

    move v2, v13

    move/from16 v20, v14

    goto/16 :goto_d

    :cond_1
    :goto_1
    move v6, v13

    :goto_2
    if-ge v6, v14, :cond_6

    iget-object v2, v0, Landroid/support/design/widget/CoordinatorLayout;->gW:Ljava/util/List;

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    iget-object v3, v7, Landroid/support/design/widget/e;->hw:Landroid/view/View;

    if-ne v3, v2, :cond_5

    invoke-virtual {v15}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Landroid/support/design/widget/e;

    iget-object v2, v5, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    if-eqz v2, :cond_5

    invoke-static {}, Landroid/support/design/widget/CoordinatorLayout;->aK()Landroid/graphics/Rect;

    move-result-object v4

    invoke-static {}, Landroid/support/design/widget/CoordinatorLayout;->aK()Landroid/graphics/Rect;

    move-result-object v3

    invoke-static {}, Landroid/support/design/widget/CoordinatorLayout;->aK()Landroid/graphics/Rect;

    move-result-object v2

    move-object/from16 v16, v2

    iget-object v2, v5, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    invoke-static {v0, v2, v4}, Landroid/support/v4/widget/m;->a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-direct {v0, v15, v13, v3}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/View;ZLandroid/graphics/Rect;)V

    invoke-virtual {v15}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {v15}, Landroid/view/View;->getMeasuredHeight()I

    move-result v13

    move/from16 v18, v2

    move-object/from16 v17, v16

    move v2, v8

    move/from16 v19, v9

    move-object v9, v3

    move-object v3, v4

    move/from16 v20, v14

    move-object v14, v4

    move-object/from16 v4, v17

    move-object/from16 v21, v5

    move/from16 v16, v6

    move/from16 v6, v18

    move-object/from16 v22, v12

    move-object v12, v7

    move v7, v13

    invoke-static/range {v2 .. v7}, Landroid/support/design/widget/CoordinatorLayout;->a(ILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/support/design/widget/e;II)V

    move-object/from16 v2, v17

    iget v3, v2, Landroid/graphics/Rect;->left:I

    iget v4, v9, Landroid/graphics/Rect;->left:I

    if-ne v3, v4, :cond_2

    iget v3, v2, Landroid/graphics/Rect;->top:I

    iget v3, v9, Landroid/graphics/Rect;->top:I

    :cond_2
    move/from16 v4, v18

    move-object/from16 v3, v21

    invoke-direct {v0, v3, v2, v4, v13}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/support/design/widget/e;Landroid/graphics/Rect;II)V

    iget v3, v2, Landroid/graphics/Rect;->left:I

    iget v4, v9, Landroid/graphics/Rect;->left:I

    sub-int/2addr v3, v4

    iget v4, v2, Landroid/graphics/Rect;->top:I

    iget v5, v9, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v5

    if-eqz v3, :cond_3

    invoke-static {v15, v3}, Landroid/support/v4/view/n;->f(Landroid/view/View;I)V

    :cond_3
    if-eqz v4, :cond_4

    invoke-static {v15, v4}, Landroid/support/v4/view/n;->d(Landroid/view/View;I)V

    :cond_4
    invoke-static {v14}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    invoke-static {v9}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    invoke-static {v2}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    goto :goto_3

    :cond_5
    move/from16 v16, v6

    move/from16 v19, v9

    move-object/from16 v22, v12

    move/from16 v20, v14

    move-object v12, v7

    :goto_3
    add-int/lit8 v6, v16, 0x1

    move-object v7, v12

    move/from16 v9, v19

    move/from16 v14, v20

    move-object/from16 v12, v22

    const/4 v13, 0x0

    goto/16 :goto_2

    :cond_6
    move/from16 v19, v9

    move-object/from16 v22, v12

    move/from16 v20, v14

    move-object v12, v7

    const/4 v13, 0x1

    invoke-direct {v0, v15, v13, v11}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/View;ZLandroid/graphics/Rect;)V

    iget v2, v12, Landroid/support/design/widget/e;->hr:I

    const/4 v3, 0x5

    const/4 v4, 0x3

    const/16 v5, 0x50

    const/16 v6, 0x30

    if-eqz v2, :cond_b

    invoke-virtual {v11}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_b

    iget v2, v12, Landroid/support/design/widget/e;->hr:I

    invoke-static {v2, v8}, Landroid/support/v4/view/d;->getAbsoluteGravity(II)I

    move-result v2

    and-int/lit8 v7, v2, 0x70

    if-eq v7, v6, :cond_8

    if-eq v7, v5, :cond_7

    goto :goto_4

    :cond_7
    iget v7, v10, Landroid/graphics/Rect;->bottom:I

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v9

    iget v14, v11, Landroid/graphics/Rect;->top:I

    sub-int/2addr v9, v14

    invoke-static {v7, v9}, Ljava/lang/Math;->max(II)I

    move-result v7

    iput v7, v10, Landroid/graphics/Rect;->bottom:I

    goto :goto_4

    :cond_8
    iget v7, v10, Landroid/graphics/Rect;->top:I

    iget v9, v11, Landroid/graphics/Rect;->bottom:I

    invoke-static {v7, v9}, Ljava/lang/Math;->max(II)I

    move-result v7

    iput v7, v10, Landroid/graphics/Rect;->top:I

    :goto_4
    and-int/lit8 v2, v2, 0x7

    if-eq v2, v4, :cond_a

    if-eq v2, v3, :cond_9

    goto :goto_5

    :cond_9
    iget v2, v10, Landroid/graphics/Rect;->right:I

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getWidth()I

    move-result v7

    iget v9, v11, Landroid/graphics/Rect;->left:I

    sub-int/2addr v7, v9

    invoke-static {v2, v7}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v10, Landroid/graphics/Rect;->right:I

    goto :goto_5

    :cond_a
    iget v2, v10, Landroid/graphics/Rect;->left:I

    iget v7, v11, Landroid/graphics/Rect;->right:I

    invoke-static {v2, v7}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v10, Landroid/graphics/Rect;->left:I

    :cond_b
    :goto_5
    iget v2, v12, Landroid/support/design/widget/e;->hs:I

    if-eqz v2, :cond_13

    invoke-virtual {v15}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_13

    invoke-static {v15}, Landroid/support/v4/view/n;->m(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_13

    invoke-virtual {v15}, Landroid/view/View;->getWidth()I

    move-result v2

    if-lez v2, :cond_13

    invoke-virtual {v15}, Landroid/view/View;->getHeight()I

    move-result v2

    if-gtz v2, :cond_c

    goto/16 :goto_9

    :cond_c
    invoke-virtual {v15}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/e;

    invoke-static {}, Landroid/support/design/widget/CoordinatorLayout;->aK()Landroid/graphics/Rect;

    move-result-object v7

    invoke-static {}, Landroid/support/design/widget/CoordinatorLayout;->aK()Landroid/graphics/Rect;

    move-result-object v9

    invoke-virtual {v15}, Landroid/view/View;->getLeft()I

    move-result v12

    invoke-virtual {v15}, Landroid/view/View;->getTop()I

    move-result v14

    invoke-virtual {v15}, Landroid/view/View;->getRight()I

    move-result v13

    invoke-virtual {v15}, Landroid/view/View;->getBottom()I

    move-result v3

    invoke-virtual {v9, v12, v14, v13, v3}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {v7, v9}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    invoke-static {v9}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    invoke-virtual {v7}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_12

    iget v3, v2, Landroid/support/design/widget/e;->hs:I

    invoke-static {v3, v8}, Landroid/support/v4/view/d;->getAbsoluteGravity(II)I

    move-result v3

    and-int/lit8 v9, v3, 0x30

    if-ne v9, v6, :cond_d

    iget v6, v7, Landroid/graphics/Rect;->top:I

    iget v9, v2, Landroid/support/design/widget/e;->topMargin:I

    sub-int/2addr v6, v9

    iget v9, v2, Landroid/support/design/widget/e;->hu:I

    sub-int/2addr v6, v9

    iget v9, v10, Landroid/graphics/Rect;->top:I

    if-ge v6, v9, :cond_d

    iget v9, v10, Landroid/graphics/Rect;->top:I

    sub-int/2addr v9, v6

    invoke-static {v15, v9}, Landroid/support/design/widget/CoordinatorLayout;->b(Landroid/view/View;I)V

    const/4 v13, 0x1

    goto :goto_6

    :cond_d
    const/4 v13, 0x0

    :goto_6
    and-int/lit8 v6, v3, 0x50

    if-ne v6, v5, :cond_e

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v5

    iget v6, v7, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v5, v6

    iget v6, v2, Landroid/support/design/widget/e;->bottomMargin:I

    sub-int/2addr v5, v6

    iget v6, v2, Landroid/support/design/widget/e;->hu:I

    add-int/2addr v5, v6

    iget v6, v10, Landroid/graphics/Rect;->bottom:I

    if-ge v5, v6, :cond_e

    iget v6, v10, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v5, v6

    invoke-static {v15, v5}, Landroid/support/design/widget/CoordinatorLayout;->b(Landroid/view/View;I)V

    const/4 v13, 0x1

    :cond_e
    if-nez v13, :cond_f

    const/4 v5, 0x0

    invoke-static {v15, v5}, Landroid/support/design/widget/CoordinatorLayout;->b(Landroid/view/View;I)V

    :cond_f
    and-int/lit8 v5, v3, 0x3

    if-ne v5, v4, :cond_10

    iget v4, v7, Landroid/graphics/Rect;->left:I

    iget v5, v2, Landroid/support/design/widget/e;->leftMargin:I

    sub-int/2addr v4, v5

    iget v5, v2, Landroid/support/design/widget/e;->ht:I

    sub-int/2addr v4, v5

    iget v5, v10, Landroid/graphics/Rect;->left:I

    if-ge v4, v5, :cond_10

    iget v5, v10, Landroid/graphics/Rect;->left:I

    sub-int/2addr v5, v4

    invoke-static {v15, v5}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/View;I)V

    const/4 v13, 0x1

    goto :goto_7

    :cond_10
    const/4 v13, 0x0

    :goto_7
    and-int/lit8 v3, v3, 0x5

    const/4 v4, 0x5

    if-ne v3, v4, :cond_11

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getWidth()I

    move-result v3

    iget v4, v7, Landroid/graphics/Rect;->right:I

    sub-int/2addr v3, v4

    iget v4, v2, Landroid/support/design/widget/e;->rightMargin:I

    sub-int/2addr v3, v4

    iget v2, v2, Landroid/support/design/widget/e;->ht:I

    add-int/2addr v3, v2

    iget v2, v10, Landroid/graphics/Rect;->right:I

    if-ge v3, v2, :cond_11

    iget v2, v10, Landroid/graphics/Rect;->right:I

    sub-int/2addr v3, v2

    invoke-static {v15, v3}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/View;I)V

    const/4 v13, 0x1

    :cond_11
    if-nez v13, :cond_12

    const/4 v2, 0x0

    invoke-static {v15, v2}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/View;I)V

    goto :goto_8

    :cond_12
    const/4 v2, 0x0

    :goto_8
    invoke-static {v7}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    goto :goto_a

    :cond_13
    :goto_9
    const/4 v2, 0x0

    :goto_a
    const/4 v3, 0x2

    if-eq v1, v3, :cond_15

    invoke-virtual {v15}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/design/widget/e;

    iget-object v3, v3, Landroid/support/design/widget/e;->hB:Landroid/graphics/Rect;

    move-object/from16 v4, v22

    invoke-virtual {v4, v3}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    invoke-virtual {v4, v11}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_14

    invoke-virtual {v15}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/design/widget/e;

    iget-object v3, v3, Landroid/support/design/widget/e;->hB:Landroid/graphics/Rect;

    invoke-virtual {v3, v11}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    goto :goto_b

    :cond_14
    move/from16 v3, v19

    goto :goto_d

    :cond_15
    move-object/from16 v4, v22

    :goto_b
    add-int/lit8 v14, v20, 0x1

    move/from16 v3, v19

    :goto_c
    if-ge v14, v3, :cond_16

    iget-object v5, v0, Landroid/support/design/widget/CoordinatorLayout;->gW:Ljava/util/List;

    invoke-interface {v5, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    add-int/lit8 v14, v14, 0x1

    goto :goto_c

    :cond_16
    :goto_d
    add-int/lit8 v14, v20, 0x1

    move v13, v2

    move v9, v3

    move-object v12, v4

    goto/16 :goto_0

    :cond_17
    move-object v4, v12

    invoke-static {v10}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    invoke-static {v11}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    invoke-static {v4}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    return-void
.end method

.method public final o(I)V
    .locals 4

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hk:Landroid/support/v4/view/k;

    invoke-virtual {v0}, Landroid/support/v4/view/k;->cd()V

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p0, v1}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/e;

    invoke-virtual {v2, p1}, Landroid/support/design/widget/e;->q(I)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2, p1}, Landroid/support/design/widget/e;->p(I)V

    invoke-virtual {v2}, Landroid/support/design/widget/e;->aQ()V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    iput-object p1, p0, Landroid/support/design/widget/CoordinatorLayout;->hd:Landroid/view/View;

    return-void
.end method

.method public onAttachedToWindow()V
    .locals 2

    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout;->aL()V

    iget-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hf:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->he:Landroid/support/design/widget/f;

    if-nez v0, :cond_0

    new-instance v0, Landroid/support/design/widget/f;

    invoke-direct {v0, p0}, Landroid/support/design/widget/f;-><init>(Landroid/support/design/widget/CoordinatorLayout;)V

    iput-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->he:Landroid/support/design/widget/f;

    :cond_0
    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->he:Landroid/support/design/widget/f;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_1
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    if-nez v0, :cond_2

    invoke-static {p0}, Landroid/support/v4/view/n;->j(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p0}, Landroid/support/v4/view/n;->i(Landroid/view/View;)V

    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mIsAttachedToWindow:Z

    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout;->aL()V

    iget-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hf:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->he:Landroid/support/design/widget/f;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->he:Landroid/support/design/widget/f;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_0
    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hd:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hd:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CoordinatorLayout;->onStopNestedScroll(Landroid/view/View;)V

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout;->mIsAttachedToWindow:Z

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hh:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hi:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    invoke-virtual {v0}, Landroid/support/v4/view/x;->getSystemWindowInsetTop()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-lez v0, :cond_1

    iget-object v2, p0, Landroid/support/design/widget/CoordinatorLayout;->hi:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getWidth()I

    move-result v3

    invoke-virtual {v2, v1, v1, v3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hi:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_1
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout;->aL()V

    :cond_0
    invoke-direct {p0, p1}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/MotionEvent;)Z

    const/4 p1, 0x1

    if-eq v0, p1, :cond_1

    const/4 p1, 0x3

    if-ne v0, p1, :cond_2

    :cond_1
    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout;->aL()V

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method protected onLayout(ZIIII)V
    .locals 17

    move-object/from16 v0, p0

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/n;->f(Landroid/view/View;)I

    move-result v7

    iget-object v1, v0, Landroid/support/design/widget/CoordinatorLayout;->gW:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x0

    move v10, v9

    :goto_0
    if-ge v10, v8, :cond_c

    iget-object v1, v0, Landroid/support/design/widget/CoordinatorLayout;->gW:Ljava/util/List;

    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Landroid/view/View;

    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_b

    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/e;

    iget-object v2, v1, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    const/4 v3, 0x1

    if-nez v2, :cond_0

    iget v2, v1, Landroid/support/design/widget/e;->hq:I

    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    move v2, v3

    goto :goto_1

    :cond_0
    move v2, v9

    :goto_1
    if-nez v2, :cond_a

    iget-object v2, v1, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    if-eqz v2, :cond_1

    iget-object v1, v1, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    invoke-static {}, Landroid/support/design/widget/CoordinatorLayout;->aK()Landroid/graphics/Rect;

    move-result-object v12

    invoke-static {}, Landroid/support/design/widget/CoordinatorLayout;->aK()Landroid/graphics/Rect;

    move-result-object v13

    :try_start_0
    invoke-static {v0, v1, v12}, Landroid/support/v4/widget/m;->a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Landroid/support/design/widget/e;

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    move v1, v7

    move-object v2, v12

    move-object v3, v13

    move-object v4, v14

    move v5, v15

    move/from16 v16, v6

    invoke-static/range {v1 .. v6}, Landroid/support/design/widget/CoordinatorLayout;->a(ILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/support/design/widget/e;II)V

    move/from16 v1, v16

    invoke-direct {v0, v14, v13, v15, v1}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/support/design/widget/e;Landroid/graphics/Rect;II)V

    iget v1, v13, Landroid/graphics/Rect;->left:I

    iget v2, v13, Landroid/graphics/Rect;->top:I

    iget v3, v13, Landroid/graphics/Rect;->right:I

    iget v4, v13, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v11, v1, v2, v3, v4}, Landroid/view/View;->layout(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_5

    :catchall_0
    move-exception v0

    invoke-static {v12}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    invoke-static {v13}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    throw v0

    :cond_1
    iget v2, v1, Landroid/support/design/widget/e;->hp:I

    if-ltz v2, :cond_7

    iget v1, v1, Landroid/support/design/widget/e;->hp:I

    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/e;

    iget v4, v2, Landroid/support/design/widget/e;->gravity:I

    invoke-static {v4}, Landroid/support/design/widget/CoordinatorLayout;->m(I)I

    move-result v4

    invoke-static {v4, v7}, Landroid/support/v4/view/d;->getAbsoluteGravity(II)I

    move-result v4

    and-int/lit8 v5, v4, 0x7

    and-int/lit8 v4, v4, 0x70

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getWidth()I

    move-result v6

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v12

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    if-ne v7, v3, :cond_2

    sub-int v1, v6, v1

    :cond_2
    invoke-direct {v0, v1}, Landroid/support/design/widget/CoordinatorLayout;->k(I)I

    move-result v1

    sub-int/2addr v1, v13

    if-eq v5, v3, :cond_4

    const/4 v3, 0x5

    if-eq v5, v3, :cond_3

    goto :goto_2

    :cond_3
    add-int/2addr v1, v13

    goto :goto_2

    :cond_4
    div-int/lit8 v3, v13, 0x2

    add-int/2addr v1, v3

    :goto_2
    const/16 v3, 0x10

    if-eq v4, v3, :cond_6

    const/16 v3, 0x50

    if-eq v4, v3, :cond_5

    move v3, v9

    goto :goto_3

    :cond_5
    add-int v3, v9, v14

    goto :goto_3

    :cond_6
    div-int/lit8 v3, v14, 0x2

    add-int/2addr v3, v9

    :goto_3
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingLeft()I

    move-result v4

    iget v5, v2, Landroid/support/design/widget/e;->leftMargin:I

    add-int/2addr v4, v5

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingRight()I

    move-result v5

    sub-int/2addr v6, v5

    sub-int/2addr v6, v13

    iget v5, v2, Landroid/support/design/widget/e;->rightMargin:I

    sub-int/2addr v6, v5

    invoke-static {v1, v6}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingTop()I

    move-result v4

    iget v5, v2, Landroid/support/design/widget/e;->topMargin:I

    add-int/2addr v4, v5

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v12, v5

    sub-int/2addr v12, v14

    iget v2, v2, Landroid/support/design/widget/e;->bottomMargin:I

    sub-int/2addr v12, v2

    invoke-static {v3, v12}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    add-int/2addr v13, v1

    add-int/2addr v14, v2

    invoke-virtual {v11, v1, v2, v13, v14}, Landroid/view/View;->layout(IIII)V

    goto/16 :goto_6

    :cond_7
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/e;

    invoke-static {}, Landroid/support/design/widget/CoordinatorLayout;->aK()Landroid/graphics/Rect;

    move-result-object v12

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingLeft()I

    move-result v2

    iget v3, v1, Landroid/support/design/widget/e;->leftMargin:I

    add-int/2addr v2, v3

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingTop()I

    move-result v3

    iget v4, v1, Landroid/support/design/widget/e;->topMargin:I

    add-int/2addr v3, v4

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getWidth()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    iget v5, v1, Landroid/support/design/widget/e;->rightMargin:I

    sub-int/2addr v4, v5

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingBottom()I

    move-result v6

    sub-int/2addr v5, v6

    iget v6, v1, Landroid/support/design/widget/e;->bottomMargin:I

    sub-int/2addr v5, v6

    invoke-virtual {v12, v2, v3, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v2, v0, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    if-eqz v2, :cond_8

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/n;->j(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-static {v11}, Landroid/support/v4/view/n;->j(Landroid/view/View;)Z

    move-result v2

    if-nez v2, :cond_8

    iget v2, v12, Landroid/graphics/Rect;->left:I

    iget-object v3, v0, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    invoke-virtual {v3}, Landroid/support/v4/view/x;->getSystemWindowInsetLeft()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, v12, Landroid/graphics/Rect;->left:I

    iget v2, v12, Landroid/graphics/Rect;->top:I

    iget-object v3, v0, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    invoke-virtual {v3}, Landroid/support/v4/view/x;->getSystemWindowInsetTop()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, v12, Landroid/graphics/Rect;->top:I

    iget v2, v12, Landroid/graphics/Rect;->right:I

    iget-object v3, v0, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    invoke-virtual {v3}, Landroid/support/v4/view/x;->getSystemWindowInsetRight()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, v12, Landroid/graphics/Rect;->right:I

    iget v2, v12, Landroid/graphics/Rect;->bottom:I

    iget-object v3, v0, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    invoke-virtual {v3}, Landroid/support/v4/view/x;->getSystemWindowInsetBottom()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, v12, Landroid/graphics/Rect;->bottom:I

    :cond_8
    invoke-static {}, Landroid/support/design/widget/CoordinatorLayout;->aK()Landroid/graphics/Rect;

    move-result-object v13

    iget v1, v1, Landroid/support/design/widget/e;->gravity:I

    invoke-static {v1}, Landroid/support/design/widget/CoordinatorLayout;->l(I)I

    move-result v1

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x11

    if-lt v4, v5, :cond_9

    move-object v4, v12

    move-object v5, v13

    move v6, v7

    invoke-static/range {v1 .. v6}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;I)V

    goto :goto_4

    :cond_9
    invoke-static {v1, v2, v3, v12, v13}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    :goto_4
    iget v1, v13, Landroid/graphics/Rect;->left:I

    iget v2, v13, Landroid/graphics/Rect;->top:I

    iget v3, v13, Landroid/graphics/Rect;->right:I

    iget v4, v13, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v11, v1, v2, v3, v4}, Landroid/view/View;->layout(IIII)V

    :goto_5
    invoke-static {v12}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    invoke-static {v13}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    goto :goto_6

    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "An anchor may not be changed after CoordinatorLayout measurement begins before layout is complete."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_b
    :goto_6
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    :cond_c
    return-void
.end method

.method protected onMeasure(II)V
    .locals 29

    move-object/from16 v6, p0

    iget-object v0, v6, Landroid/support/design/widget/CoordinatorLayout;->gW:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, v6, Landroid/support/design/widget/CoordinatorLayout;->gX:Landroid/support/v4/widget/a;

    invoke-virtual {v0}, Landroid/support/v4/widget/a;->clear()V

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v0

    const/4 v7, 0x0

    move v1, v7

    :goto_0
    const/4 v2, 0x1

    if-ge v1, v0, :cond_15

    invoke-virtual {v6, v1}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/View;)Landroid/support/design/widget/e;

    move-result-object v4

    iget v5, v4, Landroid/support/design/widget/e;->hq:I

    const/4 v8, -0x1

    const/4 v9, 0x0

    if-ne v5, v8, :cond_0

    :goto_1
    iput-object v9, v4, Landroid/support/design/widget/e;->hw:Landroid/view/View;

    iput-object v9, v4, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    goto/16 :goto_7

    :cond_0
    iget-object v5, v4, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    if-eqz v5, :cond_6

    iget-object v5, v4, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getId()I

    move-result v5

    iget v8, v4, Landroid/support/design/widget/e;->hq:I

    if-eq v5, v8, :cond_1

    :goto_2
    move v5, v7

    goto :goto_5

    :cond_1
    iget-object v5, v4, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    iget-object v8, v4, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    :goto_3
    if-eq v8, v6, :cond_5

    if-eqz v8, :cond_4

    if-ne v8, v3, :cond_2

    goto :goto_4

    :cond_2
    instance-of v10, v8, Landroid/view/View;

    if-eqz v10, :cond_3

    move-object v5, v8

    check-cast v5, Landroid/view/View;

    :cond_3
    invoke-interface {v8}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    goto :goto_3

    :cond_4
    :goto_4
    iput-object v9, v4, Landroid/support/design/widget/e;->hw:Landroid/view/View;

    iput-object v9, v4, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    goto :goto_2

    :cond_5
    iput-object v5, v4, Landroid/support/design/widget/e;->hw:Landroid/view/View;

    move v5, v2

    :goto_5
    if-nez v5, :cond_e

    :cond_6
    iget v5, v4, Landroid/support/design/widget/e;->hq:I

    invoke-virtual {v6, v5}, Landroid/support/design/widget/CoordinatorLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, v4, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    iget-object v5, v4, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    if-eqz v5, :cond_d

    iget-object v5, v4, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    if-ne v5, v6, :cond_8

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->isInEditMode()Z

    move-result v5

    if-eqz v5, :cond_7

    goto :goto_1

    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "View can not be anchored to the the parent CoordinatorLayout"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8
    iget-object v5, v4, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    iget-object v8, v4, Landroid/support/design/widget/e;->hv:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    :goto_6
    if-eq v8, v6, :cond_c

    if-eqz v8, :cond_c

    if-ne v8, v3, :cond_a

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->isInEditMode()Z

    move-result v5

    if-eqz v5, :cond_9

    goto :goto_1

    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Anchor must not be a descendant of the anchored view"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    instance-of v10, v8, Landroid/view/View;

    if-eqz v10, :cond_b

    move-object v5, v8

    check-cast v5, Landroid/view/View;

    :cond_b
    invoke-interface {v8}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    goto :goto_6

    :cond_c
    iput-object v5, v4, Landroid/support/design/widget/e;->hw:Landroid/view/View;

    goto :goto_7

    :cond_d
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->isInEditMode()Z

    move-result v5

    if-eqz v5, :cond_14

    goto/16 :goto_1

    :cond_e
    :goto_7
    iget-object v5, v6, Landroid/support/design/widget/CoordinatorLayout;->gX:Landroid/support/v4/widget/a;

    invoke-virtual {v5, v3}, Landroid/support/v4/widget/a;->o(Ljava/lang/Object;)V

    move v5, v7

    :goto_8
    if-ge v5, v0, :cond_13

    if-eq v5, v1, :cond_12

    invoke-virtual {v6, v5}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    iget-object v9, v4, Landroid/support/design/widget/e;->hw:Landroid/view/View;

    if-eq v8, v9, :cond_10

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/n;->f(Landroid/view/View;)I

    move-result v9

    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/support/design/widget/e;

    iget v10, v10, Landroid/support/design/widget/e;->hr:I

    invoke-static {v10, v9}, Landroid/support/v4/view/d;->getAbsoluteGravity(II)I

    move-result v10

    if-eqz v10, :cond_f

    iget v11, v4, Landroid/support/design/widget/e;->hs:I

    invoke-static {v11, v9}, Landroid/support/v4/view/d;->getAbsoluteGravity(II)I

    move-result v9

    and-int/2addr v9, v10

    if-ne v9, v10, :cond_f

    move v9, v2

    goto :goto_9

    :cond_f
    move v9, v7

    :goto_9
    if-nez v9, :cond_10

    iget-object v9, v4, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    move v9, v7

    goto :goto_a

    :cond_10
    move v9, v2

    :goto_a
    if-eqz v9, :cond_12

    iget-object v9, v6, Landroid/support/design/widget/CoordinatorLayout;->gX:Landroid/support/v4/widget/a;

    invoke-virtual {v9, v8}, Landroid/support/v4/widget/a;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_11

    iget-object v9, v6, Landroid/support/design/widget/CoordinatorLayout;->gX:Landroid/support/v4/widget/a;

    invoke-virtual {v9, v8}, Landroid/support/v4/widget/a;->o(Ljava/lang/Object;)V

    :cond_11
    iget-object v9, v6, Landroid/support/design/widget/CoordinatorLayout;->gX:Landroid/support/v4/widget/a;

    invoke-virtual {v9, v8, v3}, Landroid/support/v4/widget/a;->b(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_12
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_14
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not find CoordinatorLayout descendant view with id "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v4, v4, Landroid/support/design/widget/e;->hq:I

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " to anchor view "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_15
    iget-object v0, v6, Landroid/support/design/widget/CoordinatorLayout;->gW:Ljava/util/List;

    iget-object v1, v6, Landroid/support/design/widget/CoordinatorLayout;->gX:Landroid/support/v4/widget/a;

    invoke-virtual {v1}, Landroid/support/v4/widget/a;->cu()Ljava/util/ArrayList;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, v6, Landroid/support/design/widget/CoordinatorLayout;->gW:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v0

    move v1, v7

    :goto_b
    if-ge v1, v0, :cond_17

    invoke-virtual {v6, v1}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    iget-object v4, v6, Landroid/support/design/widget/CoordinatorLayout;->gX:Landroid/support/v4/widget/a;

    invoke-virtual {v4, v3}, Landroid/support/v4/widget/a;->p(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_16

    move v0, v2

    goto :goto_c

    :cond_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_17
    move v0, v7

    :goto_c
    iget-boolean v1, v6, Landroid/support/design/widget/CoordinatorLayout;->hf:Z

    if-eq v0, v1, :cond_1c

    if-eqz v0, :cond_1a

    iget-boolean v0, v6, Landroid/support/design/widget/CoordinatorLayout;->mIsAttachedToWindow:Z

    if-eqz v0, :cond_19

    iget-object v0, v6, Landroid/support/design/widget/CoordinatorLayout;->he:Landroid/support/design/widget/f;

    if-nez v0, :cond_18

    new-instance v0, Landroid/support/design/widget/f;

    invoke-direct {v0, v6}, Landroid/support/design/widget/f;-><init>(Landroid/support/design/widget/CoordinatorLayout;)V

    iput-object v0, v6, Landroid/support/design/widget/CoordinatorLayout;->he:Landroid/support/design/widget/f;

    :cond_18
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, v6, Landroid/support/design/widget/CoordinatorLayout;->he:Landroid/support/design/widget/f;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_19
    iput-boolean v2, v6, Landroid/support/design/widget/CoordinatorLayout;->hf:Z

    goto :goto_d

    :cond_1a
    iget-boolean v0, v6, Landroid/support/design/widget/CoordinatorLayout;->mIsAttachedToWindow:Z

    if-eqz v0, :cond_1b

    iget-object v0, v6, Landroid/support/design/widget/CoordinatorLayout;->he:Landroid/support/design/widget/f;

    if-eqz v0, :cond_1b

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, v6, Landroid/support/design/widget/CoordinatorLayout;->he:Landroid/support/design/widget/f;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_1b
    iput-boolean v7, v6, Landroid/support/design/widget/CoordinatorLayout;->hf:Z

    :cond_1c
    :goto_d
    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingLeft()I

    move-result v8

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingTop()I

    move-result v0

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingRight()I

    move-result v9

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getPaddingBottom()I

    move-result v1

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/n;->f(Landroid/view/View;)I

    move-result v10

    if-ne v10, v2, :cond_1d

    move v11, v2

    goto :goto_e

    :cond_1d
    move v11, v7

    :goto_e
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v12

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v13

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v14

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v15

    add-int v16, v8, v9

    add-int v17, v0, v1

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getSuggestedMinimumWidth()I

    move-result v0

    invoke-virtual/range {p0 .. p0}, Landroid/support/design/widget/CoordinatorLayout;->getSuggestedMinimumHeight()I

    move-result v1

    iget-object v3, v6, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    if-eqz v3, :cond_1e

    invoke-static/range {p0 .. p0}, Landroid/support/v4/view/n;->j(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_1e

    move/from16 v18, v2

    goto :goto_f

    :cond_1e
    move/from16 v18, v7

    :goto_f
    iget-object v2, v6, Landroid/support/design/widget/CoordinatorLayout;->gW:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    move v3, v0

    move v2, v7

    move v4, v2

    :goto_10
    if-ge v4, v5, :cond_28

    iget-object v0, v6, Landroid/support/design/widget/CoordinatorLayout;->gW:Ljava/util/List;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v7

    move/from16 v20, v1

    const/16 v1, 0x8

    if-eq v7, v1, :cond_27

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/support/design/widget/e;

    iget v1, v7, Landroid/support/design/widget/e;->hp:I

    if-ltz v1, :cond_24

    if-eqz v12, :cond_24

    iget v1, v7, Landroid/support/design/widget/e;->hp:I

    invoke-direct {v6, v1}, Landroid/support/design/widget/CoordinatorLayout;->k(I)I

    move-result v1

    move/from16 v21, v2

    iget v2, v7, Landroid/support/design/widget/e;->gravity:I

    invoke-static {v2}, Landroid/support/design/widget/CoordinatorLayout;->m(I)I

    move-result v2

    invoke-static {v2, v10}, Landroid/support/v4/view/d;->getAbsoluteGravity(II)I

    move-result v2

    and-int/lit8 v2, v2, 0x7

    move/from16 v22, v3

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1f

    if-eqz v11, :cond_20

    :cond_1f
    const/4 v3, 0x5

    if-ne v2, v3, :cond_21

    if-eqz v11, :cond_21

    :cond_20
    sub-int v2, v13, v9

    sub-int/2addr v2, v1

    const/4 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    move v3, v1

    move/from16 v19, v2

    goto :goto_11

    :cond_21
    if-ne v2, v3, :cond_22

    if-eqz v11, :cond_23

    :cond_22
    const/4 v3, 0x3

    if-ne v2, v3, :cond_25

    if-eqz v11, :cond_25

    :cond_23
    sub-int/2addr v1, v8

    const/4 v3, 0x0

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    move/from16 v19, v1

    goto :goto_11

    :cond_24
    move/from16 v21, v2

    move/from16 v22, v3

    :cond_25
    const/4 v3, 0x0

    move/from16 v19, v3

    :goto_11
    if-eqz v18, :cond_26

    invoke-static {v0}, Landroid/support/v4/view/n;->j(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_26

    iget-object v1, v6, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    invoke-virtual {v1}, Landroid/support/v4/view/x;->getSystemWindowInsetLeft()I

    move-result v1

    iget-object v2, v6, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    invoke-virtual {v2}, Landroid/support/v4/view/x;->getSystemWindowInsetRight()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, v6, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    invoke-virtual {v2}, Landroid/support/v4/view/x;->getSystemWindowInsetTop()I

    move-result v2

    iget-object v3, v6, Landroid/support/design/widget/CoordinatorLayout;->hg:Landroid/support/v4/view/x;

    invoke-virtual {v3}, Landroid/support/v4/view/x;->getSystemWindowInsetBottom()I

    move-result v3

    add-int/2addr v2, v3

    sub-int v1, v13, v1

    invoke-static {v1, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    sub-int v2, v15, v2

    invoke-static {v2, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    move/from16 v23, v2

    move v2, v1

    goto :goto_12

    :cond_26
    move/from16 v2, p1

    move/from16 v23, p2

    :goto_12
    const/16 v24, 0x0

    move-object v3, v0

    move-object v0, v6

    move/from16 v25, v20

    move-object v1, v3

    move/from16 v26, v21

    move-object/from16 v27, v3

    move/from16 v28, v22

    const/16 v20, 0x0

    move/from16 v3, v19

    move/from16 v19, v4

    move/from16 v4, v23

    move/from16 v21, v5

    move/from16 v5, v24

    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/CoordinatorLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    move-object/from16 v0, v27

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    add-int v1, v16, v1

    iget v2, v7, Landroid/support/design/widget/e;->leftMargin:I

    add-int/2addr v1, v2

    iget v2, v7, Landroid/support/design/widget/e;->rightMargin:I

    add-int/2addr v1, v2

    move/from16 v2, v28

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    add-int v2, v17, v2

    iget v3, v7, Landroid/support/design/widget/e;->topMargin:I

    add-int/2addr v2, v3

    iget v3, v7, Landroid/support/design/widget/e;->bottomMargin:I

    add-int/2addr v2, v3

    move/from16 v3, v25

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredState()I

    move-result v0

    move/from16 v7, v26

    invoke-static {v7, v0}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v0

    move v3, v1

    move v1, v2

    move v2, v0

    goto :goto_13

    :cond_27
    move v7, v2

    move v2, v3

    move/from16 v19, v4

    move/from16 v21, v5

    move/from16 v3, v20

    const/16 v20, 0x0

    move v1, v3

    move v3, v2

    move v2, v7

    :goto_13
    add-int/lit8 v4, v19, 0x1

    move/from16 v7, v20

    move/from16 v5, v21

    goto/16 :goto_10

    :cond_28
    move v7, v2

    move v2, v3

    move v3, v1

    const/high16 v0, -0x1000000

    and-int/2addr v0, v7

    move/from16 v1, p1

    invoke-static {v2, v1, v0}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v0

    shl-int/lit8 v1, v7, 0x10

    move/from16 v2, p2

    invoke-static {v3, v2, v1}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v1

    invoke-virtual {v6, v0, v1}, Landroid/support/design/widget/CoordinatorLayout;->setMeasuredDimension(II)V

    return-void
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .locals 2

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result p1

    const/4 p2, 0x0

    move p3, p2

    :goto_0
    if-ge p3, p1, :cond_1

    invoke-virtual {p0, p3}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p4

    invoke-virtual {p4}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    :cond_0
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_1
    return p2
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .locals 3

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result p1

    const/4 p2, 0x0

    move p3, p2

    :goto_0
    if-ge p3, p1, :cond_1

    invoke-virtual {p0, p3}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    :cond_0
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_1
    return p2
.end method

.method public onNestedPreScroll(Landroid/view/View;II[I)V
    .locals 0

    const/4 p1, 0x0

    invoke-virtual {p0, p2, p3, p4, p1}, Landroid/support/design/widget/CoordinatorLayout;->a(II[II)V

    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIII)V
    .locals 0

    const/4 p1, 0x0

    invoke-virtual {p0, p5, p1}, Landroid/support/design/widget/CoordinatorLayout;->b(II)V

    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .locals 0

    const/4 p1, 0x0

    invoke-virtual {p0, p2, p3, p1}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/View;II)V

    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 5

    instance-of v0, p1, Landroid/support/design/widget/CoordinatorLayout$SavedState;

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    :cond_0
    check-cast p1, Landroid/support/design/widget/CoordinatorLayout$SavedState;

    invoke-virtual {p1}, Landroid/support/design/widget/CoordinatorLayout$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    iget-object p1, p1, Landroid/support/design/widget/CoordinatorLayout$SavedState;->hD:Landroid/util/SparseArray;

    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v1

    :goto_0
    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v3

    invoke-static {v2}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/View;)Landroid/support/design/widget/e;

    move-result-object v2

    iget-object v2, v2, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    if-eqz v2, :cond_1

    invoke-virtual {p1, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 7

    new-instance v0, Landroid/support/design/widget/CoordinatorLayout$SavedState;

    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/design/widget/CoordinatorLayout$SavedState;-><init>(Landroid/os/Parcelable;)V

    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    invoke-virtual {p0}, Landroid/support/design/widget/CoordinatorLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    invoke-virtual {p0, v3}, Landroid/support/design/widget/CoordinatorLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v5

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/support/design/widget/e;

    iget-object v4, v4, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    const/4 v6, -0x1

    if-eq v5, v6, :cond_0

    if-eqz v4, :cond_0

    sget-object v4, Landroid/view/View$BaseSavedState;->EMPTY_STATE:Landroid/view/AbsSavedState;

    if-eqz v4, :cond_0

    invoke-virtual {v1, v5, v4}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iput-object v1, v0, Landroid/support/design/widget/CoordinatorLayout$SavedState;->hD:Landroid/util/SparseArray;

    return-object v0
.end method

.method public onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .locals 0

    const/4 p1, 0x0

    invoke-virtual {p0, p3, p1}, Landroid/support/design/widget/CoordinatorLayout;->a(II)Z

    move-result p1

    return p1
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .locals 0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/support/design/widget/CoordinatorLayout;->o(I)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->hc:Landroid/view/View;

    if-nez v1, :cond_0

    invoke-direct {p0, p1}, Landroid/support/design/widget/CoordinatorLayout;->a(Landroid/view/MotionEvent;)Z

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->hc:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/e;

    iget-object v1, v1, Landroid/support/design/widget/e;->hm:Landroid/support/design/widget/c;

    :goto_0
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->hc:Landroid/view/View;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    or-int/2addr v2, p1

    :cond_1
    const/4 p1, 0x1

    if-eq v0, p1, :cond_2

    const/4 p1, 0x3

    if-ne v0, p1, :cond_3

    :cond_2
    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout;->aL()V

    :cond_3
    return v2
.end method

.method public requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z

    move-result p1

    return p1
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 0

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Landroid/support/design/widget/CoordinatorLayout;->ha:Z

    if-nez p1, :cond_0

    invoke-direct {p0}, Landroid/support/design/widget/CoordinatorLayout;->aL()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/design/widget/CoordinatorLayout;->ha:Z

    :cond_0
    return-void
.end method

.method public setFitsSystemWindows(Z)V
    .locals 1

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setFitsSystemWindows(Z)V

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p1, v0, :cond_2

    invoke-static {p0}, Landroid/support/v4/view/n;->j(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroid/support/design/widget/CoordinatorLayout;->hj:Landroid/support/v4/view/l;

    if-nez p1, :cond_0

    new-instance p1, Landroid/support/design/widget/a;

    invoke-direct {p1, p0}, Landroid/support/design/widget/a;-><init>(Landroid/support/design/widget/CoordinatorLayout;)V

    iput-object p1, p0, Landroid/support/design/widget/CoordinatorLayout;->hj:Landroid/support/v4/view/l;

    :cond_0
    iget-object p1, p0, Landroid/support/design/widget/CoordinatorLayout;->hj:Landroid/support/v4/view/l;

    invoke-static {p0, p1}, Landroid/support/v4/view/n;->a(Landroid/view/View;Landroid/support/v4/view/l;)V

    const/16 p1, 0x500

    invoke-virtual {p0, p1}, Landroid/support/design/widget/CoordinatorLayout;->setSystemUiVisibility(I)V

    return-void

    :cond_1
    const/4 p1, 0x0

    invoke-static {p0, p1}, Landroid/support/v4/view/n;->a(Landroid/view/View;Landroid/support/v4/view/l;)V

    :cond_2
    return-void
.end method

.method public setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V
    .locals 0

    iput-object p1, p0, Landroid/support/design/widget/CoordinatorLayout;->mOnHierarchyChangeListener:Landroid/view/ViewGroup$OnHierarchyChangeListener;

    return-void
.end method

.method public setVisibility(I)V
    .locals 2

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->hi:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->hi:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v1

    if-eq v1, p1, :cond_1

    iget-object v1, p0, Landroid/support/design/widget/CoordinatorLayout;->hi:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_1
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/support/design/widget/CoordinatorLayout;->hi:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method
