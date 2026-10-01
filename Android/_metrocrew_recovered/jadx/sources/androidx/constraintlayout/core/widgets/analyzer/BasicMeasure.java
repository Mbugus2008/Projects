package androidx.constraintlayout.core.widgets.analyzer;

import androidx.constraintlayout.core.LinearSystem;
import androidx.constraintlayout.core.widgets.Barrier;
import androidx.constraintlayout.core.widgets.ConstraintAnchor;
import androidx.constraintlayout.core.widgets.ConstraintWidget;
import androidx.constraintlayout.core.widgets.ConstraintWidgetContainer;
import androidx.constraintlayout.core.widgets.Guideline;
import androidx.constraintlayout.core.widgets.Helper;
import androidx.constraintlayout.core.widgets.Optimizer;
import androidx.constraintlayout.core.widgets.VirtualLayout;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class BasicMeasure {
    public static final int AT_MOST = Integer.MIN_VALUE;
    private static final boolean DEBUG = false;
    private static final boolean DO_NOT_USE = false;
    public static final int EXACTLY = 1073741824;
    public static final int FIXED = -3;
    public static final int MATCH_PARENT = -1;
    private static final int MODE_SHIFT = 30;
    public static final int UNSPECIFIED = 0;
    public static final int WRAP_CONTENT = -2;
    private ConstraintWidgetContainer mConstraintWidgetContainer;
    private final ArrayList<ConstraintWidget> mVariableDimensionsWidgets = new ArrayList<>();
    private Measure mMeasure = new Measure();

    public static class Measure {
        public static int SELF_DIMENSIONS = 0;
        public static int TRY_GIVEN_DIMENSIONS = 1;
        public static int USE_GIVEN_DIMENSIONS = 2;
        public ConstraintWidget.DimensionBehaviour horizontalBehavior;
        public int horizontalDimension;
        public int measureStrategy;
        public int measuredBaseline;
        public boolean measuredHasBaseline;
        public int measuredHeight;
        public boolean measuredNeedsSolverPass;
        public int measuredWidth;
        public ConstraintWidget.DimensionBehaviour verticalBehavior;
        public int verticalDimension;
    }

    public interface Measurer {
        void didMeasures();

        void measure(ConstraintWidget constraintWidget, Measure measure);
    }

    public void updateHierarchy(ConstraintWidgetContainer layout) {
        this.mVariableDimensionsWidgets.clear();
        int childCount = layout.mChildren.size();
        for (int i = 0; i < childCount; i++) {
            ConstraintWidget widget = layout.mChildren.get(i);
            if (widget.getHorizontalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT || widget.getVerticalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                this.mVariableDimensionsWidgets.add(widget);
            }
        }
        layout.invalidateGraph();
    }

    public BasicMeasure(ConstraintWidgetContainer constraintWidgetContainer) {
        this.mConstraintWidgetContainer = constraintWidgetContainer;
    }

    private void measureChildren(ConstraintWidgetContainer layout) {
        int childCount = layout.mChildren.size();
        boolean optimize = layout.optimizeFor(64);
        Measurer measurer = layout.getMeasurer();
        for (int i = 0; i < childCount; i++) {
            ConstraintWidget child = layout.mChildren.get(i);
            if (!(child instanceof Guideline) && !(child instanceof Barrier) && !child.isInVirtualLayout() && (!optimize || child.mHorizontalRun == null || child.mVerticalRun == null || !child.mHorizontalRun.mDimension.resolved || !child.mVerticalRun.mDimension.resolved)) {
                boolean skip = false;
                ConstraintWidget.DimensionBehaviour widthBehavior = child.getDimensionBehaviour(0);
                ConstraintWidget.DimensionBehaviour heightBehavior = child.getDimensionBehaviour(1);
                if (widthBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && child.mMatchConstraintDefaultWidth != 1 && heightBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && child.mMatchConstraintDefaultHeight != 1) {
                    skip = true;
                }
                if (!skip && layout.optimizeFor(1) && !(child instanceof VirtualLayout)) {
                    if (widthBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && child.mMatchConstraintDefaultWidth == 0 && heightBehavior != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && !child.isInHorizontalChain()) {
                        skip = true;
                    }
                    if (heightBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && child.mMatchConstraintDefaultHeight == 0 && widthBehavior != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && !child.isInHorizontalChain()) {
                        skip = true;
                    }
                    if ((widthBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT || heightBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) && child.mDimensionRatio > 0.0f) {
                        skip = true;
                    }
                }
                if (!skip) {
                    measure(measurer, child, Measure.SELF_DIMENSIONS);
                    if (layout.mMetrics != null) {
                        layout.mMetrics.measuredWidgets++;
                    }
                }
            }
        }
        measurer.didMeasures();
    }

    private void solveLinearSystem(ConstraintWidgetContainer layout, String reason, int pass, int w, int h) {
        long startLayout = layout.mMetrics != null ? System.nanoTime() : 0L;
        int minWidth = layout.getMinWidth();
        int minHeight = layout.getMinHeight();
        layout.setMinWidth(0);
        layout.setMinHeight(0);
        layout.setWidth(w);
        layout.setHeight(h);
        layout.setMinWidth(minWidth);
        layout.setMinHeight(minHeight);
        this.mConstraintWidgetContainer.setPass(pass);
        this.mConstraintWidgetContainer.layout();
        if (layout.mMetrics != null) {
            long endLayout = System.nanoTime();
            layout.mMetrics.mSolverPasses++;
            layout.mMetrics.measuresLayoutDuration += endLayout - startLayout;
        }
    }

    public long solverMeasure(ConstraintWidgetContainer layout, int optimizationLevel, int paddingX, int paddingY, int widthMode, int widthSize, int heightMode, int heightSize, int lastMeasureWidth, int lastMeasureHeight) {
        long layoutTime;
        long j;
        boolean containerWrapHeight;
        boolean allSolved;
        int computations;
        int sizeDependentWidgetsCount;
        int optimizations;
        boolean z;
        long layoutTime2;
        int i;
        int sizeDependentWidgetsCount2;
        int maxIterations;
        int measureStrategy;
        boolean needSolverPass;
        boolean needSolverPass2;
        boolean allSolved2;
        boolean z2;
        BasicMeasure basicMeasure = this;
        Measurer measurer = layout.getMeasurer();
        long layoutTime3 = 0;
        int childCount = layout.mChildren.size();
        int startingWidth = layout.getWidth();
        int startingHeight = layout.getHeight();
        boolean optimizeWrap = Optimizer.enabled(optimizationLevel, 128);
        boolean optimize = optimizeWrap || Optimizer.enabled(optimizationLevel, 64);
        if (!optimize) {
            layoutTime = 0;
        } else {
            int i2 = 0;
            while (true) {
                if (i2 >= childCount) {
                    layoutTime = layoutTime3;
                    break;
                }
                ConstraintWidget child = layout.mChildren.get(i2);
                layoutTime = layoutTime3;
                boolean matchWidth = child.getHorizontalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
                boolean matchHeight = child.getVerticalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
                boolean ratio = matchWidth && matchHeight && child.getDimensionRatio() > 0.0f;
                if (child.isInHorizontalChain() && ratio) {
                    optimize = false;
                    break;
                }
                if (child.isInVerticalChain() && ratio) {
                    optimize = false;
                    break;
                }
                boolean matchWidth2 = child instanceof VirtualLayout;
                if (matchWidth2) {
                    optimize = false;
                    break;
                }
                if (!child.isInHorizontalChain() && !child.isInVerticalChain()) {
                    i2++;
                    layoutTime3 = layoutTime;
                } else {
                    optimize = false;
                    break;
                }
            }
        }
        if (!optimize || LinearSystem.sMetrics == null) {
            j = 1;
        } else {
            j = 1;
            LinearSystem.sMetrics.measures++;
        }
        boolean optimize2 = ((widthMode == 1073741824 && heightMode == 1073741824) || optimizeWrap) & optimize;
        int computations2 = 0;
        if (!optimize2) {
            containerWrapHeight = true;
            allSolved = false;
            computations = 0;
        } else {
            int widthSize2 = Math.min(layout.getMaxWidth(), widthSize);
            int heightSize2 = Math.min(layout.getMaxHeight(), heightSize);
            if (widthMode == 1073741824 && layout.getWidth() != widthSize2) {
                layout.setWidth(widthSize2);
                layout.invalidateGraph();
            }
            if (heightMode == 1073741824 && layout.getHeight() != heightSize2) {
                layout.setHeight(heightSize2);
                layout.invalidateGraph();
            }
            if (widthMode == 1073741824 && heightMode == 1073741824) {
                allSolved2 = layout.directMeasure(optimizeWrap);
                computations2 = 2;
                heightSize2 = heightSize2;
                z2 = true;
            } else {
                allSolved2 = layout.directMeasureSetup(optimizeWrap);
                if (widthMode == 1073741824) {
                    allSolved2 &= layout.directMeasureWithOrientation(optimizeWrap, 0);
                    computations2 = 0 + 1;
                }
                if (heightMode != 1073741824) {
                    z2 = true;
                } else {
                    z2 = true;
                    allSolved2 &= layout.directMeasureWithOrientation(optimizeWrap, 1);
                    computations2++;
                }
            }
            if (allSolved2) {
                if (widthMode != 1073741824) {
                    z2 = false;
                }
                layout.updateFromRuns(z2, heightMode == 1073741824);
            }
            allSolved = allSolved2;
            computations = computations2;
            containerWrapHeight = true;
        }
        if (allSolved && computations == 2) {
            layoutTime2 = layoutTime;
        } else {
            int optimizations2 = layout.getOptimizationLevel();
            if (childCount > 0) {
                measureChildren(layout);
            }
            if (layout.mMetrics != null) {
                layoutTime = System.nanoTime();
            }
            updateHierarchy(layout);
            int sizeDependentWidgetsCount3 = basicMeasure.mVariableDimensionsWidgets.size();
            if (childCount <= 0) {
                sizeDependentWidgetsCount = sizeDependentWidgetsCount3;
                optimizations = optimizations2;
                z = false;
            } else {
                sizeDependentWidgetsCount = sizeDependentWidgetsCount3;
                optimizations = optimizations2;
                z = false;
                basicMeasure.solveLinearSystem(layout, "First pass", 0, startingWidth, startingHeight);
            }
            if (sizeDependentWidgetsCount > 0) {
                boolean needSolverPass3 = false;
                boolean containerWrapWidth = layout.getHorizontalDimensionBehaviour() == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT ? containerWrapHeight : z;
                if (layout.getVerticalDimensionBehaviour() != ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                    containerWrapHeight = z;
                }
                int minWidth = Math.max(layout.getWidth(), basicMeasure.mConstraintWidgetContainer.getMinWidth());
                int minHeight = Math.max(layout.getHeight(), basicMeasure.mConstraintWidgetContainer.getMinHeight());
                int minWidth2 = minWidth;
                int startingWidth2 = startingWidth;
                int startingWidth3 = 0;
                while (startingWidth3 < sizeDependentWidgetsCount) {
                    int startingHeight2 = startingHeight;
                    ConstraintWidget widget = basicMeasure.mVariableDimensionsWidgets.get(startingWidth3);
                    int i3 = startingWidth3;
                    if (!(widget instanceof VirtualLayout)) {
                        needSolverPass2 = needSolverPass3;
                        optimizeWrap = optimizeWrap;
                        optimize2 = optimize2;
                    } else {
                        int preWidth = widget.getWidth();
                        int preHeight = widget.getHeight();
                        boolean needSolverPass4 = needSolverPass3 | basicMeasure.measure(measurer, widget, Measure.TRY_GIVEN_DIMENSIONS);
                        if (layout.mMetrics != null) {
                            layout.mMetrics.measuredMatchWidgets += j;
                        }
                        int measuredWidth = widget.getWidth();
                        int measuredHeight = widget.getHeight();
                        if (measuredWidth == preWidth) {
                            needSolverPass = needSolverPass4;
                        } else {
                            widget.setWidth(measuredWidth);
                            if (containerWrapWidth && widget.getRight() > minWidth2) {
                                int w = widget.getRight() + widget.getAnchor(ConstraintAnchor.Type.RIGHT).getMargin();
                                minWidth2 = Math.max(minWidth2, w);
                            }
                            needSolverPass = true;
                        }
                        if (measuredHeight == preHeight) {
                            minWidth2 = minWidth2;
                        } else {
                            widget.setHeight(measuredHeight);
                            if (containerWrapHeight && widget.getBottom() > minHeight) {
                                int h = widget.getBottom() + widget.getAnchor(ConstraintAnchor.Type.BOTTOM).getMargin();
                                minHeight = Math.max(minHeight, h);
                            }
                            needSolverPass = true;
                        }
                        VirtualLayout virtualLayout = (VirtualLayout) widget;
                        needSolverPass2 = needSolverPass | virtualLayout.needSolverPass();
                        minWidth2 = minWidth2;
                    }
                    needSolverPass3 = needSolverPass2;
                    startingWidth3 = i3 + 1;
                    startingHeight = startingHeight2;
                    childCount = childCount;
                    optimizeWrap = optimizeWrap;
                    optimize2 = optimize2;
                }
                int startingHeight3 = startingHeight;
                boolean optimize3 = optimize2;
                int maxIterations2 = 2;
                int j2 = 0;
                int minWidth3 = minWidth2;
                int minWidth4 = minHeight;
                boolean needSolverPass5 = needSolverPass3;
                while (j2 < maxIterations2) {
                    int preHeight2 = 0;
                    boolean needSolverPass6 = needSolverPass5;
                    int minHeight2 = minWidth4;
                    int minWidth5 = minWidth3;
                    while (preHeight2 < sizeDependentWidgetsCount) {
                        ConstraintWidget widget2 = basicMeasure.mVariableDimensionsWidgets.get(preHeight2);
                        if (((widget2 instanceof Helper) && !(widget2 instanceof VirtualLayout)) || (widget2 instanceof Guideline)) {
                            i = preHeight2;
                        } else {
                            i = preHeight2;
                            if (widget2.getVisibility() != 8 && ((!optimize3 || !widget2.mHorizontalRun.mDimension.resolved || !widget2.mVerticalRun.mDimension.resolved) && !(widget2 instanceof VirtualLayout))) {
                                int preWidth2 = widget2.getWidth();
                                int preHeight3 = widget2.getHeight();
                                sizeDependentWidgetsCount2 = sizeDependentWidgetsCount;
                                int preBaselineDistance = widget2.getBaselineDistance();
                                int measureStrategy2 = Measure.TRY_GIVEN_DIMENSIONS;
                                maxIterations = maxIterations2;
                                if (j2 != maxIterations - 1) {
                                    measureStrategy = measureStrategy2;
                                } else {
                                    int measureStrategy3 = Measure.USE_GIVEN_DIMENSIONS;
                                    measureStrategy = measureStrategy3;
                                }
                                boolean hasMeasure = basicMeasure.measure(measurer, widget2, measureStrategy);
                                needSolverPass6 |= hasMeasure;
                                if (layout.mMetrics != null) {
                                    layout.mMetrics.measuredMatchWidgets += j;
                                }
                                int measuredWidth2 = widget2.getWidth();
                                int measuredHeight2 = widget2.getHeight();
                                if (measuredWidth2 != preWidth2) {
                                    widget2.setWidth(measuredWidth2);
                                    if (containerWrapWidth && widget2.getRight() > minWidth5) {
                                        int w2 = widget2.getRight() + widget2.getAnchor(ConstraintAnchor.Type.RIGHT).getMargin();
                                        minWidth5 = Math.max(minWidth5, w2);
                                    }
                                    needSolverPass6 = true;
                                }
                                if (measuredHeight2 != preHeight3) {
                                    widget2.setHeight(measuredHeight2);
                                    if (containerWrapHeight && widget2.getBottom() > minHeight2) {
                                        int h2 = widget2.getBottom() + widget2.getAnchor(ConstraintAnchor.Type.BOTTOM).getMargin();
                                        minHeight2 = Math.max(minHeight2, h2);
                                    }
                                    needSolverPass6 = true;
                                }
                                if (widget2.hasBaseline() && preBaselineDistance != widget2.getBaselineDistance()) {
                                    needSolverPass6 = true;
                                }
                            }
                            preHeight2 = i + 1;
                            basicMeasure = this;
                            sizeDependentWidgetsCount = sizeDependentWidgetsCount2;
                            maxIterations2 = maxIterations;
                            measurer = measurer;
                        }
                        sizeDependentWidgetsCount2 = sizeDependentWidgetsCount;
                        maxIterations = maxIterations2;
                        measurer = measurer;
                        preHeight2 = i + 1;
                        basicMeasure = this;
                        sizeDependentWidgetsCount = sizeDependentWidgetsCount2;
                        maxIterations2 = maxIterations;
                        measurer = measurer;
                    }
                    int sizeDependentWidgetsCount4 = sizeDependentWidgetsCount;
                    int maxIterations3 = maxIterations2;
                    Measurer measurer2 = measurer;
                    if (!needSolverPass6) {
                        break;
                    }
                    int minWidth6 = minWidth5;
                    int minWidth7 = startingWidth2;
                    solveLinearSystem(layout, "intermediate pass", j2 + 1, minWidth7, startingHeight3);
                    needSolverPass5 = false;
                    j2++;
                    startingWidth2 = minWidth7;
                    minWidth3 = minWidth6;
                    minWidth4 = minHeight2;
                    maxIterations2 = maxIterations3;
                    measurer = measurer2;
                    basicMeasure = this;
                    sizeDependentWidgetsCount = sizeDependentWidgetsCount4;
                }
            }
            layout.setOptimizationLevel(optimizations);
            layoutTime2 = layoutTime;
        }
        if (layout.mMetrics != null) {
            return System.nanoTime() - layoutTime2;
        }
        return layoutTime2;
    }

    private boolean measure(Measurer measurer, ConstraintWidget widget, int measureStrategy) {
        this.mMeasure.horizontalBehavior = widget.getHorizontalDimensionBehaviour();
        this.mMeasure.verticalBehavior = widget.getVerticalDimensionBehaviour();
        this.mMeasure.horizontalDimension = widget.getWidth();
        this.mMeasure.verticalDimension = widget.getHeight();
        this.mMeasure.measuredNeedsSolverPass = false;
        this.mMeasure.measureStrategy = measureStrategy;
        boolean horizontalMatchConstraints = this.mMeasure.horizontalBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
        boolean verticalMatchConstraints = this.mMeasure.verticalBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
        boolean horizontalUseRatio = horizontalMatchConstraints && widget.mDimensionRatio > 0.0f;
        boolean verticalUseRatio = verticalMatchConstraints && widget.mDimensionRatio > 0.0f;
        if (horizontalUseRatio && widget.mResolvedMatchConstraintDefault[0] == 4) {
            this.mMeasure.horizontalBehavior = ConstraintWidget.DimensionBehaviour.FIXED;
        }
        if (verticalUseRatio && widget.mResolvedMatchConstraintDefault[1] == 4) {
            this.mMeasure.verticalBehavior = ConstraintWidget.DimensionBehaviour.FIXED;
        }
        measurer.measure(widget, this.mMeasure);
        widget.setWidth(this.mMeasure.measuredWidth);
        widget.setHeight(this.mMeasure.measuredHeight);
        widget.setHasBaseline(this.mMeasure.measuredHasBaseline);
        widget.setBaselineDistance(this.mMeasure.measuredBaseline);
        this.mMeasure.measureStrategy = Measure.SELF_DIMENSIONS;
        return this.mMeasure.measuredNeedsSolverPass;
    }
}
