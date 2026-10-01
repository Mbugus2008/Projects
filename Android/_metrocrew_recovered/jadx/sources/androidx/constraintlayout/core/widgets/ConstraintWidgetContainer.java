package androidx.constraintlayout.core.widgets;

import androidx.constraintlayout.core.LinearSystem;
import androidx.constraintlayout.core.Metrics;
import androidx.constraintlayout.core.SolverVariable;
import androidx.constraintlayout.core.widgets.analyzer.BasicMeasure;
import androidx.constraintlayout.core.widgets.analyzer.DependencyGraph;
import androidx.constraintlayout.core.widgets.analyzer.Direct;
import androidx.constraintlayout.core.widgets.analyzer.Grouping;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
public class ConstraintWidgetContainer extends WidgetContainer {
    private static final boolean DEBUG = false;
    static final boolean DEBUG_GRAPH = false;
    private static final boolean DEBUG_LAYOUT = false;
    private static final int MAX_ITERATIONS = 8;
    static int sMyCounter = 0;
    BasicMeasure mBasicMeasureSolver;
    int mDebugSolverPassCount;
    public DependencyGraph mDependencyGraph;
    public boolean mGroupsWrapOptimized;
    private boolean mHeightMeasuredTooSmall;
    ChainHead[] mHorizontalChainsArray;
    public int mHorizontalChainsSize;
    private WeakReference<ConstraintAnchor> mHorizontalWrapMax;
    private WeakReference<ConstraintAnchor> mHorizontalWrapMin;
    public boolean mHorizontalWrapOptimized;
    private boolean mIsRtl;
    public BasicMeasure.Measure mMeasure;
    protected BasicMeasure.Measurer mMeasurer;
    public Metrics mMetrics;
    private int mOptimizationLevel;
    int mPaddingBottom;
    int mPaddingLeft;
    int mPaddingRight;
    int mPaddingTop;
    private int mPass;
    public boolean mSkipSolver;
    protected LinearSystem mSystem;
    ChainHead[] mVerticalChainsArray;
    public int mVerticalChainsSize;
    private WeakReference<ConstraintAnchor> mVerticalWrapMax;
    private WeakReference<ConstraintAnchor> mVerticalWrapMin;
    public boolean mVerticalWrapOptimized;
    HashSet<ConstraintWidget> mWidgetsToAdd;
    private boolean mWidthMeasuredTooSmall;
    public int mWrapFixedHeight;
    public int mWrapFixedWidth;

    public void invalidateGraph() {
        this.mDependencyGraph.invalidateGraph();
    }

    public void invalidateMeasures() {
        this.mDependencyGraph.invalidateMeasures();
    }

    public boolean directMeasure(boolean optimizeWrap) {
        return this.mDependencyGraph.directMeasure(optimizeWrap);
    }

    public boolean directMeasureSetup(boolean optimizeWrap) {
        return this.mDependencyGraph.directMeasureSetup(optimizeWrap);
    }

    public boolean directMeasureWithOrientation(boolean optimizeWrap, int orientation) {
        return this.mDependencyGraph.directMeasureWithOrientation(optimizeWrap, orientation);
    }

    public void defineTerminalWidgets() {
        this.mDependencyGraph.defineTerminalWidgets(getHorizontalDimensionBehaviour(), getVerticalDimensionBehaviour());
    }

    public long measure(int optimizationLevel, int widthMode, int widthSize, int heightMode, int heightSize, int lastMeasureWidth, int lastMeasureHeight, int paddingX, int paddingY) {
        this.mPaddingLeft = paddingX;
        this.mPaddingTop = paddingY;
        return this.mBasicMeasureSolver.solverMeasure(this, optimizationLevel, paddingX, paddingY, widthMode, widthSize, heightMode, heightSize, lastMeasureWidth, lastMeasureHeight);
    }

    public void updateHierarchy() {
        this.mBasicMeasureSolver.updateHierarchy(this);
    }

    public void setMeasurer(BasicMeasure.Measurer measurer) {
        this.mMeasurer = measurer;
        this.mDependencyGraph.setMeasurer(measurer);
    }

    public BasicMeasure.Measurer getMeasurer() {
        return this.mMeasurer;
    }

    public void fillMetrics(Metrics metrics) {
        this.mMetrics = metrics;
        this.mSystem.fillMetrics(metrics);
    }

    public ConstraintWidgetContainer() {
        this.mBasicMeasureSolver = new BasicMeasure(this);
        this.mDependencyGraph = new DependencyGraph(this);
        this.mMeasurer = null;
        this.mIsRtl = false;
        this.mSystem = new LinearSystem();
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
        this.mVerticalChainsArray = new ChainHead[4];
        this.mHorizontalChainsArray = new ChainHead[4];
        this.mGroupsWrapOptimized = false;
        this.mHorizontalWrapOptimized = false;
        this.mVerticalWrapOptimized = false;
        this.mWrapFixedWidth = 0;
        this.mWrapFixedHeight = 0;
        this.mOptimizationLevel = 257;
        this.mSkipSolver = false;
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
        this.mDebugSolverPassCount = 0;
        this.mVerticalWrapMin = null;
        this.mHorizontalWrapMin = null;
        this.mVerticalWrapMax = null;
        this.mHorizontalWrapMax = null;
        this.mWidgetsToAdd = new HashSet<>();
        this.mMeasure = new BasicMeasure.Measure();
    }

    public ConstraintWidgetContainer(int x, int y, int width, int height) {
        super(x, y, width, height);
        this.mBasicMeasureSolver = new BasicMeasure(this);
        this.mDependencyGraph = new DependencyGraph(this);
        this.mMeasurer = null;
        this.mIsRtl = false;
        this.mSystem = new LinearSystem();
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
        this.mVerticalChainsArray = new ChainHead[4];
        this.mHorizontalChainsArray = new ChainHead[4];
        this.mGroupsWrapOptimized = false;
        this.mHorizontalWrapOptimized = false;
        this.mVerticalWrapOptimized = false;
        this.mWrapFixedWidth = 0;
        this.mWrapFixedHeight = 0;
        this.mOptimizationLevel = 257;
        this.mSkipSolver = false;
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
        this.mDebugSolverPassCount = 0;
        this.mVerticalWrapMin = null;
        this.mHorizontalWrapMin = null;
        this.mVerticalWrapMax = null;
        this.mHorizontalWrapMax = null;
        this.mWidgetsToAdd = new HashSet<>();
        this.mMeasure = new BasicMeasure.Measure();
    }

    public ConstraintWidgetContainer(int width, int height) {
        super(width, height);
        this.mBasicMeasureSolver = new BasicMeasure(this);
        this.mDependencyGraph = new DependencyGraph(this);
        this.mMeasurer = null;
        this.mIsRtl = false;
        this.mSystem = new LinearSystem();
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
        this.mVerticalChainsArray = new ChainHead[4];
        this.mHorizontalChainsArray = new ChainHead[4];
        this.mGroupsWrapOptimized = false;
        this.mHorizontalWrapOptimized = false;
        this.mVerticalWrapOptimized = false;
        this.mWrapFixedWidth = 0;
        this.mWrapFixedHeight = 0;
        this.mOptimizationLevel = 257;
        this.mSkipSolver = false;
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
        this.mDebugSolverPassCount = 0;
        this.mVerticalWrapMin = null;
        this.mHorizontalWrapMin = null;
        this.mVerticalWrapMax = null;
        this.mHorizontalWrapMax = null;
        this.mWidgetsToAdd = new HashSet<>();
        this.mMeasure = new BasicMeasure.Measure();
    }

    public ConstraintWidgetContainer(String debugName, int width, int height) {
        super(width, height);
        this.mBasicMeasureSolver = new BasicMeasure(this);
        this.mDependencyGraph = new DependencyGraph(this);
        this.mMeasurer = null;
        this.mIsRtl = false;
        this.mSystem = new LinearSystem();
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
        this.mVerticalChainsArray = new ChainHead[4];
        this.mHorizontalChainsArray = new ChainHead[4];
        this.mGroupsWrapOptimized = false;
        this.mHorizontalWrapOptimized = false;
        this.mVerticalWrapOptimized = false;
        this.mWrapFixedWidth = 0;
        this.mWrapFixedHeight = 0;
        this.mOptimizationLevel = 257;
        this.mSkipSolver = false;
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
        this.mDebugSolverPassCount = 0;
        this.mVerticalWrapMin = null;
        this.mHorizontalWrapMin = null;
        this.mVerticalWrapMax = null;
        this.mHorizontalWrapMax = null;
        this.mWidgetsToAdd = new HashSet<>();
        this.mMeasure = new BasicMeasure.Measure();
        setDebugName(debugName);
    }

    public void setOptimizationLevel(int value) {
        this.mOptimizationLevel = value;
        LinearSystem.USE_DEPENDENCY_ORDERING = optimizeFor(512);
    }

    public int getOptimizationLevel() {
        return this.mOptimizationLevel;
    }

    public boolean optimizeFor(int feature) {
        return (this.mOptimizationLevel & feature) == feature;
    }

    @Override // androidx.constraintlayout.core.widgets.ConstraintWidget
    public String getType() {
        return "ConstraintLayout";
    }

    @Override // androidx.constraintlayout.core.widgets.WidgetContainer, androidx.constraintlayout.core.widgets.ConstraintWidget
    public void reset() {
        this.mSystem.reset();
        this.mPaddingLeft = 0;
        this.mPaddingRight = 0;
        this.mPaddingTop = 0;
        this.mPaddingBottom = 0;
        this.mSkipSolver = false;
        super.reset();
    }

    public boolean isWidthMeasuredTooSmall() {
        return this.mWidthMeasuredTooSmall;
    }

    public boolean isHeightMeasuredTooSmall() {
        return this.mHeightMeasuredTooSmall;
    }

    void addVerticalWrapMinVariable(ConstraintAnchor top) {
        if (this.mVerticalWrapMin == null || this.mVerticalWrapMin.get() == null || top.getFinalValue() > this.mVerticalWrapMin.get().getFinalValue()) {
            this.mVerticalWrapMin = new WeakReference<>(top);
        }
    }

    public void addHorizontalWrapMinVariable(ConstraintAnchor left) {
        if (this.mHorizontalWrapMin == null || this.mHorizontalWrapMin.get() == null || left.getFinalValue() > this.mHorizontalWrapMin.get().getFinalValue()) {
            this.mHorizontalWrapMin = new WeakReference<>(left);
        }
    }

    void addVerticalWrapMaxVariable(ConstraintAnchor bottom) {
        if (this.mVerticalWrapMax == null || this.mVerticalWrapMax.get() == null || bottom.getFinalValue() > this.mVerticalWrapMax.get().getFinalValue()) {
            this.mVerticalWrapMax = new WeakReference<>(bottom);
        }
    }

    public void addHorizontalWrapMaxVariable(ConstraintAnchor right) {
        if (this.mHorizontalWrapMax == null || this.mHorizontalWrapMax.get() == null || right.getFinalValue() > this.mHorizontalWrapMax.get().getFinalValue()) {
            this.mHorizontalWrapMax = new WeakReference<>(right);
        }
    }

    private void addMinWrap(ConstraintAnchor constraintAnchor, SolverVariable parentMin) {
        SolverVariable variable = this.mSystem.createObjectVariable(constraintAnchor);
        this.mSystem.addGreaterThan(variable, parentMin, 0, 5);
    }

    private void addMaxWrap(ConstraintAnchor constraintAnchor, SolverVariable parentMax) {
        SolverVariable variable = this.mSystem.createObjectVariable(constraintAnchor);
        this.mSystem.addGreaterThan(parentMax, variable, 0, 5);
    }

    public boolean addChildrenToSolver(LinearSystem system) {
        ConstraintWidgetContainer constraintWidgetContainer;
        LinearSystem system2;
        int orientation;
        boolean optimize = optimizeFor(64);
        addToSolver(system, optimize);
        int count = this.mChildren.size();
        boolean hasBarriers = false;
        for (int i = 0; i < count; i++) {
            ConstraintWidget widget = this.mChildren.get(i);
            widget.setInBarrier(0, false);
            widget.setInBarrier(1, false);
            if (widget instanceof Barrier) {
                hasBarriers = true;
            }
        }
        if (hasBarriers) {
            for (int i2 = 0; i2 < count; i2++) {
                ConstraintWidget widget2 = this.mChildren.get(i2);
                if (widget2 instanceof Barrier) {
                    ((Barrier) widget2).markWidgets();
                }
            }
        }
        this.mWidgetsToAdd.clear();
        for (int i3 = 0; i3 < count; i3++) {
            ConstraintWidget widget3 = this.mChildren.get(i3);
            if (widget3.addFirst()) {
                if (widget3 instanceof VirtualLayout) {
                    this.mWidgetsToAdd.add(widget3);
                } else {
                    widget3.addToSolver(system, optimize);
                }
            }
        }
        while (this.mWidgetsToAdd.size() > 0) {
            int numLayouts = this.mWidgetsToAdd.size();
            Iterator<ConstraintWidget> it = this.mWidgetsToAdd.iterator();
            while (it.hasNext()) {
                VirtualLayout layout = (VirtualLayout) it.next();
                if (layout.contains(this.mWidgetsToAdd)) {
                    layout.addToSolver(system, optimize);
                    this.mWidgetsToAdd.remove(layout);
                    break;
                }
            }
            if (numLayouts == this.mWidgetsToAdd.size()) {
                Iterator<ConstraintWidget> it2 = this.mWidgetsToAdd.iterator();
                while (it2.hasNext()) {
                    it2.next().addToSolver(system, optimize);
                }
                this.mWidgetsToAdd.clear();
            }
        }
        if (LinearSystem.USE_DEPENDENCY_ORDERING) {
            HashSet<ConstraintWidget> widgetsToAdd = new HashSet<>();
            for (int i4 = 0; i4 < count; i4++) {
                ConstraintWidget widget4 = this.mChildren.get(i4);
                if (!widget4.addFirst()) {
                    widgetsToAdd.add(widget4);
                }
            }
            if (getHorizontalDimensionBehaviour() != ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                orientation = 1;
            } else {
                orientation = 0;
            }
            constraintWidgetContainer = this;
            system2 = system;
            constraintWidgetContainer.addChildrenToSolverByDependency(this, system2, widgetsToAdd, orientation, false);
            for (ConstraintWidget widget5 : widgetsToAdd) {
                Optimizer.checkMatchParent(this, system2, widget5);
                widget5.addToSolver(system2, optimize);
            }
        } else {
            constraintWidgetContainer = this;
            system2 = system;
            for (int i5 = 0; i5 < count; i5++) {
                ConstraintWidget widget6 = constraintWidgetContainer.mChildren.get(i5);
                if (widget6 instanceof ConstraintWidgetContainer) {
                    ConstraintWidget.DimensionBehaviour horizontalBehaviour = widget6.mListDimensionBehaviors[0];
                    ConstraintWidget.DimensionBehaviour verticalBehaviour = widget6.mListDimensionBehaviors[1];
                    if (horizontalBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                        widget6.setHorizontalDimensionBehaviour(ConstraintWidget.DimensionBehaviour.FIXED);
                    }
                    if (verticalBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                        widget6.setVerticalDimensionBehaviour(ConstraintWidget.DimensionBehaviour.FIXED);
                    }
                    widget6.addToSolver(system2, optimize);
                    if (horizontalBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                        widget6.setHorizontalDimensionBehaviour(horizontalBehaviour);
                    }
                    if (verticalBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                        widget6.setVerticalDimensionBehaviour(verticalBehaviour);
                    }
                } else {
                    Optimizer.checkMatchParent(this, system2, widget6);
                    if (!widget6.addFirst()) {
                        widget6.addToSolver(system2, optimize);
                    }
                }
            }
        }
        int i6 = constraintWidgetContainer.mHorizontalChainsSize;
        if (i6 > 0) {
            Chain.applyChainConstraints(this, system2, null, 0);
        }
        if (constraintWidgetContainer.mVerticalChainsSize > 0) {
            Chain.applyChainConstraints(this, system2, null, 1);
        }
        return true;
    }

    public boolean updateChildrenFromSolver(LinearSystem system, boolean[] flags) {
        flags[2] = false;
        boolean optimize = optimizeFor(64);
        updateFromSolver(system, optimize);
        int count = this.mChildren.size();
        boolean hasOverride = false;
        for (int i = 0; i < count; i++) {
            ConstraintWidget widget = this.mChildren.get(i);
            widget.updateFromSolver(system, optimize);
            if (widget.hasDimensionOverride()) {
                hasOverride = true;
            }
        }
        return hasOverride;
    }

    @Override // androidx.constraintlayout.core.widgets.ConstraintWidget
    public void updateFromRuns(boolean updateHorizontal, boolean updateVertical) {
        super.updateFromRuns(updateHorizontal, updateVertical);
        int count = this.mChildren.size();
        for (int i = 0; i < count; i++) {
            ConstraintWidget widget = this.mChildren.get(i);
            widget.updateFromRuns(updateHorizontal, updateVertical);
        }
    }

    public void setPadding(int left, int top, int right, int bottom) {
        this.mPaddingLeft = left;
        this.mPaddingTop = top;
        this.mPaddingRight = right;
        this.mPaddingBottom = bottom;
    }

    public void setRtl(boolean isRtl) {
        this.mIsRtl = isRtl;
    }

    public boolean isRtl() {
        return this.mIsRtl;
    }

    public static boolean measure(int level, ConstraintWidget widget, BasicMeasure.Measurer measurer, BasicMeasure.Measure measure, int measureStrategy) {
        int measuredWidth;
        int measuredHeight;
        if (measurer == null) {
            return false;
        }
        if (widget.getVisibility() == 8 || (widget instanceof Guideline) || (widget instanceof Barrier)) {
            measure.measuredWidth = 0;
            measure.measuredHeight = 0;
            return false;
        }
        measure.horizontalBehavior = widget.getHorizontalDimensionBehaviour();
        measure.verticalBehavior = widget.getVerticalDimensionBehaviour();
        measure.horizontalDimension = widget.getWidth();
        measure.verticalDimension = widget.getHeight();
        measure.measuredNeedsSolverPass = false;
        measure.measureStrategy = measureStrategy;
        boolean horizontalMatchConstraints = measure.horizontalBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
        boolean verticalMatchConstraints = measure.verticalBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
        boolean horizontalUseRatio = horizontalMatchConstraints && widget.mDimensionRatio > 0.0f;
        boolean verticalUseRatio = verticalMatchConstraints && widget.mDimensionRatio > 0.0f;
        if (horizontalMatchConstraints && widget.hasDanglingDimension(0) && widget.mMatchConstraintDefaultWidth == 0 && !horizontalUseRatio) {
            horizontalMatchConstraints = false;
            measure.horizontalBehavior = ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
            if (verticalMatchConstraints && widget.mMatchConstraintDefaultHeight == 0) {
                measure.horizontalBehavior = ConstraintWidget.DimensionBehaviour.FIXED;
            }
        }
        if (verticalMatchConstraints && widget.hasDanglingDimension(1) && widget.mMatchConstraintDefaultHeight == 0 && !verticalUseRatio) {
            verticalMatchConstraints = false;
            measure.verticalBehavior = ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
            if (horizontalMatchConstraints && widget.mMatchConstraintDefaultWidth == 0) {
                measure.verticalBehavior = ConstraintWidget.DimensionBehaviour.FIXED;
            }
        }
        if (widget.isResolvedHorizontally()) {
            horizontalMatchConstraints = false;
            measure.horizontalBehavior = ConstraintWidget.DimensionBehaviour.FIXED;
        }
        if (widget.isResolvedVertically()) {
            verticalMatchConstraints = false;
            measure.verticalBehavior = ConstraintWidget.DimensionBehaviour.FIXED;
        }
        if (horizontalUseRatio) {
            if (widget.mResolvedMatchConstraintDefault[0] == 4) {
                measure.horizontalBehavior = ConstraintWidget.DimensionBehaviour.FIXED;
            } else if (!verticalMatchConstraints) {
                if (measure.verticalBehavior == ConstraintWidget.DimensionBehaviour.FIXED) {
                    measuredHeight = measure.verticalDimension;
                } else {
                    measure.horizontalBehavior = ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
                    measurer.measure(widget, measure);
                    measuredHeight = measure.measuredHeight;
                }
                measure.horizontalBehavior = ConstraintWidget.DimensionBehaviour.FIXED;
                measure.horizontalDimension = (int) (widget.getDimensionRatio() * measuredHeight);
            }
        }
        if (verticalUseRatio) {
            if (widget.mResolvedMatchConstraintDefault[1] == 4) {
                measure.verticalBehavior = ConstraintWidget.DimensionBehaviour.FIXED;
            } else if (!horizontalMatchConstraints) {
                if (measure.horizontalBehavior == ConstraintWidget.DimensionBehaviour.FIXED) {
                    measuredWidth = measure.horizontalDimension;
                } else {
                    measure.verticalBehavior = ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
                    measurer.measure(widget, measure);
                    measuredWidth = measure.measuredWidth;
                }
                measure.verticalBehavior = ConstraintWidget.DimensionBehaviour.FIXED;
                if (widget.getDimensionRatioSide() == -1) {
                    measure.verticalDimension = (int) (measuredWidth / widget.getDimensionRatio());
                } else {
                    measure.verticalDimension = (int) (widget.getDimensionRatio() * measuredWidth);
                }
            }
        }
        measurer.measure(widget, measure);
        widget.setWidth(measure.measuredWidth);
        widget.setHeight(measure.measuredHeight);
        widget.setHasBaseline(measure.measuredHasBaseline);
        widget.setBaselineDistance(measure.measuredBaseline);
        measure.measureStrategy = BasicMeasure.Measure.SELF_DIMENSIONS;
        return measure.measuredNeedsSolverPass;
    }

    /* JADX WARN: Code duplicated, block: B:121:0x0248  */
    /* JADX WARN: Code duplicated, block: B:122:0x0251  */
    /* JADX WARN: Code duplicated, block: B:124:0x0259 A[LOOP:5: B:123:0x0257->B:124:0x0259, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:146:0x02e8  */
    /* JADX WARN: Code duplicated, block: B:149:0x02fe  */
    /* JADX WARN: Code duplicated, block: B:152:0x0319  */
    /* JADX WARN: Code duplicated, block: B:154:0x0328  */
    /* JADX WARN: Code duplicated, block: B:160:0x0349  */
    /* JADX WARN: Code duplicated, block: B:167:0x036e  */
    /* JADX WARN: Code duplicated, block: B:170:0x0376  */
    /* JADX WARN: Code duplicated, block: B:195:0x037a A[SYNTHETIC] */
    @Override // androidx.constraintlayout.core.widgets.WidgetContainer
    public void layout() {
        int i;
        int i2;
        int i3;
        char c;
        int i4;
        boolean zUpdateChildrenFromSolver;
        boolean z;
        int iMax;
        int iMax2;
        boolean z2;
        boolean z3;
        boolean z4 = false;
        this.mX = 0;
        this.mY = 0;
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
        int size = this.mChildren.size();
        int iMax3 = Math.max(0, getWidth());
        int iMax4 = Math.max(0, getHeight());
        int i5 = 1;
        ConstraintWidget.DimensionBehaviour dimensionBehaviour = this.mListDimensionBehaviors[1];
        ConstraintWidget.DimensionBehaviour dimensionBehaviour2 = this.mListDimensionBehaviors[0];
        if (this.mMetrics != null) {
            this.mMetrics.layouts++;
        }
        if (this.mPass == 0 && Optimizer.enabled(this.mOptimizationLevel, 1)) {
            Direct.solvingPass(this, getMeasurer());
            int i6 = 0;
            while (i6 < size) {
                ConstraintWidget constraintWidget = this.mChildren.get(i6);
                if (constraintWidget.isMeasureRequested() && !(constraintWidget instanceof Guideline) && !(constraintWidget instanceof Barrier) && !(constraintWidget instanceof VirtualLayout) && !constraintWidget.isInVirtualLayout()) {
                    if (((constraintWidget.getDimensionBehaviour(0) != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT || constraintWidget.mMatchConstraintDefaultWidth == i5 || constraintWidget.getDimensionBehaviour(i5) != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT || constraintWidget.mMatchConstraintDefaultHeight == i5) ? 0 : i5) == 0) {
                        measure(0, constraintWidget, this.mMeasurer, new BasicMeasure.Measure(), BasicMeasure.Measure.SELF_DIMENSIONS);
                    }
                }
                i6++;
                i5 = 1;
            }
        }
        char c2 = 2;
        if (size <= 2 || ((dimensionBehaviour2 != ConstraintWidget.DimensionBehaviour.WRAP_CONTENT && dimensionBehaviour != ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) || !Optimizer.enabled(this.mOptimizationLevel, 1024) || !Grouping.simpleSolvingPass(this, getMeasurer()))) {
            i = iMax3;
            i2 = 0;
            i3 = iMax4;
        } else {
            if (dimensionBehaviour2 == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                if (iMax3 < getWidth() && iMax3 > 0) {
                    setWidth(iMax3);
                    this.mWidthMeasuredTooSmall = true;
                } else {
                    iMax3 = getWidth();
                }
            }
            if (dimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                if (iMax4 < getHeight() && iMax4 > 0) {
                    setHeight(iMax4);
                    this.mHeightMeasuredTooSmall = true;
                } else {
                    iMax4 = getHeight();
                }
            }
            int i7 = iMax4;
            i = iMax3;
            i2 = 1;
            i3 = i7;
        }
        boolean z5 = optimizeFor(64) || optimizeFor(128);
        this.mSystem.graphOptimizer = false;
        this.mSystem.newgraphOptimizer = false;
        if (this.mOptimizationLevel != 0 && z5) {
            this.mSystem.newgraphOptimizer = true;
        }
        ArrayList<ConstraintWidget> arrayList = this.mChildren;
        boolean z6 = getHorizontalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT || getVerticalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
        resetChains();
        int i8 = 0;
        while (i8 < size) {
            ConstraintWidget constraintWidget2 = this.mChildren.get(i8);
            boolean z7 = z4;
            if (constraintWidget2 instanceof WidgetContainer) {
                ((WidgetContainer) constraintWidget2).layout();
            }
            i8++;
            z4 = z7;
        }
        boolean z8 = z4;
        boolean zOptimizeFor = optimizeFor(64);
        int i9 = i2;
        int i10 = 0;
        boolean zAddChildrenToSolver = true;
        while (zAddChildrenToSolver) {
            int i11 = i10 + 1;
            try {
                this.mSystem.reset();
                resetChains();
                createObjectVariables(this.mSystem);
                int i12 = 0;
                while (i12 < size) {
                    c = c2;
                    try {
                        this.mChildren.get(i12).createObjectVariables(this.mSystem);
                        i12++;
                        c2 = c;
                    } catch (Exception e) {
                        e = e;
                        e.printStackTrace();
                        System.out.println("EXCEPTION : " + e);
                        if (zAddChildrenToSolver) {
                            zUpdateChildrenFromSolver = updateChildrenFromSolver(this.mSystem, Optimizer.sFlags);
                        } else {
                            updateFromSolver(this.mSystem, zOptimizeFor);
                            for (i4 = 0; i4 < size; i4++) {
                                this.mChildren.get(i4).updateFromSolver(this.mSystem, zOptimizeFor);
                            }
                            zUpdateChildrenFromSolver = false;
                        }
                        if (!z6) {
                            i9 = i9;
                            z = zUpdateChildrenFromSolver;
                        } else {
                            i9 = i9;
                            z = zUpdateChildrenFromSolver;
                        }
                        iMax = Math.max(this.mMinWidth, getWidth());
                        if (iMax > getWidth()) {
                            setWidth(iMax);
                            this.mListDimensionBehaviors[z8 ? 1 : 0] = ConstraintWidget.DimensionBehaviour.FIXED;
                            i9 = 1;
                            z = true;
                        }
                        iMax2 = Math.max(this.mMinHeight, getHeight());
                        if (iMax2 > getHeight()) {
                            setHeight(iMax2);
                            this.mListDimensionBehaviors[1] = ConstraintWidget.DimensionBehaviour.FIXED;
                            i9 = 1;
                            z = true;
                        }
                        if (i9 == 0) {
                            z3 = z;
                            if (this.mListDimensionBehaviors[z8 ? 1 : 0] != ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                                z = z3;
                            } else {
                                z = z3;
                            }
                            z2 = zOptimizeFor;
                            if (this.mListDimensionBehaviors[1] == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                                this.mHeightMeasuredTooSmall = true;
                                this.mListDimensionBehaviors[1] = ConstraintWidget.DimensionBehaviour.FIXED;
                                setHeight(i3);
                                z = true;
                                i9 = 1;
                            }
                        } else {
                            z2 = zOptimizeFor;
                        }
                        if (i11 > 8) {
                            z = false;
                        }
                        zAddChildrenToSolver = z;
                        i10 = i11;
                        c2 = c;
                        zOptimizeFor = z2;
                    }
                }
                c = c2;
                zAddChildrenToSolver = addChildrenToSolver(this.mSystem);
                if (this.mVerticalWrapMin != null && this.mVerticalWrapMin.get() != null) {
                    addMinWrap(this.mVerticalWrapMin.get(), this.mSystem.createObjectVariable(this.mTop));
                    this.mVerticalWrapMin = null;
                }
                if (this.mVerticalWrapMax != null && this.mVerticalWrapMax.get() != null) {
                    addMaxWrap(this.mVerticalWrapMax.get(), this.mSystem.createObjectVariable(this.mBottom));
                    this.mVerticalWrapMax = null;
                }
                if (this.mHorizontalWrapMin != null && this.mHorizontalWrapMin.get() != null) {
                    addMinWrap(this.mHorizontalWrapMin.get(), this.mSystem.createObjectVariable(this.mLeft));
                    this.mHorizontalWrapMin = null;
                }
                if (this.mHorizontalWrapMax != null && this.mHorizontalWrapMax.get() != null) {
                    addMaxWrap(this.mHorizontalWrapMax.get(), this.mSystem.createObjectVariable(this.mRight));
                    this.mHorizontalWrapMax = null;
                }
                if (zAddChildrenToSolver) {
                    this.mSystem.minimize();
                }
            } catch (Exception e2) {
                e = e2;
                c = c2;
            }
            if (zAddChildrenToSolver) {
                zUpdateChildrenFromSolver = updateChildrenFromSolver(this.mSystem, Optimizer.sFlags);
            } else {
                updateFromSolver(this.mSystem, zOptimizeFor);
                while (i4 < size) {
                    this.mChildren.get(i4).updateFromSolver(this.mSystem, zOptimizeFor);
                }
                zUpdateChildrenFromSolver = false;
            }
            if (!z6 && i11 < 8 && Optimizer.sFlags[c]) {
                int iMax5 = 0;
                int iMax6 = 0;
                int i13 = 0;
                while (i13 < size) {
                    ConstraintWidget constraintWidget3 = this.mChildren.get(i13);
                    iMax5 = Math.max(iMax5, constraintWidget3.mX + constraintWidget3.getWidth());
                    iMax6 = Math.max(iMax6, constraintWidget3.mY + constraintWidget3.getHeight());
                    i13++;
                    zUpdateChildrenFromSolver = zUpdateChildrenFromSolver;
                }
                boolean z9 = zUpdateChildrenFromSolver;
                int iMax7 = Math.max(this.mMinWidth, iMax5);
                int iMax8 = Math.max(this.mMinHeight, iMax6);
                if (dimensionBehaviour2 == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT && getWidth() < iMax7) {
                    setWidth(iMax7);
                    this.mListDimensionBehaviors[z8 ? 1 : 0] = ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
                    i9 = 1;
                    z9 = true;
                } else {
                    i9 = i9;
                }
                if (dimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT && getHeight() < iMax8) {
                    setHeight(iMax8);
                    this.mListDimensionBehaviors[1] = ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
                    i9 = 1;
                    z = true;
                } else {
                    z = z9;
                }
            } else {
                i9 = i9;
                z = zUpdateChildrenFromSolver;
            }
            iMax = Math.max(this.mMinWidth, getWidth());
            if (iMax > getWidth()) {
                setWidth(iMax);
                this.mListDimensionBehaviors[z8 ? 1 : 0] = ConstraintWidget.DimensionBehaviour.FIXED;
                i9 = 1;
                z = true;
            }
            iMax2 = Math.max(this.mMinHeight, getHeight());
            if (iMax2 > getHeight()) {
                setHeight(iMax2);
                this.mListDimensionBehaviors[1] = ConstraintWidget.DimensionBehaviour.FIXED;
                i9 = 1;
                z = true;
            }
            if (i9 == 0) {
                z3 = z;
                if (this.mListDimensionBehaviors[z8 ? 1 : 0] != ConstraintWidget.DimensionBehaviour.WRAP_CONTENT && i > 0 && getWidth() > i) {
                    this.mWidthMeasuredTooSmall = true;
                    i9 = 1;
                    this.mListDimensionBehaviors[z8 ? 1 : 0] = ConstraintWidget.DimensionBehaviour.FIXED;
                    setWidth(i);
                    z = true;
                } else {
                    z = z3;
                }
                z2 = zOptimizeFor;
                if (this.mListDimensionBehaviors[1] == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT && i3 > 0 && getHeight() > i3) {
                    this.mHeightMeasuredTooSmall = true;
                    this.mListDimensionBehaviors[1] = ConstraintWidget.DimensionBehaviour.FIXED;
                    setHeight(i3);
                    z = true;
                    i9 = 1;
                }
            } else {
                z2 = zOptimizeFor;
            }
            if (i11 > 8) {
                z = false;
            }
            zAddChildrenToSolver = z;
            i10 = i11;
            c2 = c;
            zOptimizeFor = z2;
        }
        int i14 = i9;
        this.mChildren = arrayList;
        if (i14 != 0) {
            this.mListDimensionBehaviors[z8 ? 1 : 0] = dimensionBehaviour2;
            this.mListDimensionBehaviors[1] = dimensionBehaviour;
        }
        resetSolverVariables(this.mSystem.getCache());
    }

    public boolean handlesInternalConstraints() {
        return false;
    }

    public ArrayList<Guideline> getVerticalGuidelines() {
        ArrayList<Guideline> guidelines = new ArrayList<>();
        int mChildrenSize = this.mChildren.size();
        for (int i = 0; i < mChildrenSize; i++) {
            ConstraintWidget widget = this.mChildren.get(i);
            if (widget instanceof Guideline) {
                Guideline guideline = (Guideline) widget;
                if (guideline.getOrientation() == 1) {
                    guidelines.add(guideline);
                }
            }
        }
        return guidelines;
    }

    public ArrayList<Guideline> getHorizontalGuidelines() {
        ArrayList<Guideline> guidelines = new ArrayList<>();
        int mChildrenSize = this.mChildren.size();
        for (int i = 0; i < mChildrenSize; i++) {
            ConstraintWidget widget = this.mChildren.get(i);
            if (widget instanceof Guideline) {
                Guideline guideline = (Guideline) widget;
                if (guideline.getOrientation() == 0) {
                    guidelines.add(guideline);
                }
            }
        }
        return guidelines;
    }

    public LinearSystem getSystem() {
        return this.mSystem;
    }

    private void resetChains() {
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
    }

    void addChain(ConstraintWidget constraintWidget, int type) {
        if (type == 0) {
            addHorizontalChain(constraintWidget);
        } else if (type == 1) {
            addVerticalChain(constraintWidget);
        }
    }

    private void addHorizontalChain(ConstraintWidget widget) {
        if (this.mHorizontalChainsSize + 1 >= this.mHorizontalChainsArray.length) {
            this.mHorizontalChainsArray = (ChainHead[]) Arrays.copyOf(this.mHorizontalChainsArray, this.mHorizontalChainsArray.length * 2);
        }
        this.mHorizontalChainsArray[this.mHorizontalChainsSize] = new ChainHead(widget, 0, isRtl());
        this.mHorizontalChainsSize++;
    }

    private void addVerticalChain(ConstraintWidget widget) {
        if (this.mVerticalChainsSize + 1 >= this.mVerticalChainsArray.length) {
            this.mVerticalChainsArray = (ChainHead[]) Arrays.copyOf(this.mVerticalChainsArray, this.mVerticalChainsArray.length * 2);
        }
        this.mVerticalChainsArray[this.mVerticalChainsSize] = new ChainHead(widget, 1, isRtl());
        this.mVerticalChainsSize++;
    }

    public void setPass(int pass) {
        this.mPass = pass;
    }

    @Override // androidx.constraintlayout.core.widgets.ConstraintWidget
    public void getSceneString(StringBuilder ret) {
        ret.append(this.stringId + ":{\n");
        ret.append("  actualWidth:" + this.mWidth);
        ret.append("\n");
        ret.append("  actualHeight:" + this.mHeight);
        ret.append("\n");
        ArrayList<ConstraintWidget> children = getChildren();
        for (ConstraintWidget child : children) {
            child.getSceneString(ret);
            ret.append(",\n");
        }
        ret.append("}");
    }
}
