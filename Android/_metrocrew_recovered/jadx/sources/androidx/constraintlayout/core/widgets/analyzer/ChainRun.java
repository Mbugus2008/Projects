package androidx.constraintlayout.core.widgets.analyzer;

import androidx.constraintlayout.core.widgets.ConstraintAnchor;
import androidx.constraintlayout.core.widgets.ConstraintWidget;
import androidx.constraintlayout.core.widgets.ConstraintWidgetContainer;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class ChainRun extends WidgetRun {
    private int mChainStyle;
    ArrayList<WidgetRun> mWidgets;

    public ChainRun(ConstraintWidget widget, int orientation) {
        super(widget);
        this.mWidgets = new ArrayList<>();
        this.orientation = orientation;
        build();
    }

    public String toString() {
        StringBuilder log = new StringBuilder("ChainRun ");
        log.append(this.orientation == 0 ? "horizontal : " : "vertical : ");
        for (WidgetRun run : this.mWidgets) {
            log.append("<");
            log.append(run);
            log.append("> ");
        }
        return log.toString();
    }

    @Override // androidx.constraintlayout.core.widgets.analyzer.WidgetRun
    boolean supportsWrapComputation() {
        int count = this.mWidgets.size();
        for (int i = 0; i < count; i++) {
            WidgetRun run = this.mWidgets.get(i);
            if (!run.supportsWrapComputation()) {
                return false;
            }
        }
        return true;
    }

    @Override // androidx.constraintlayout.core.widgets.analyzer.WidgetRun
    public long getWrapDimension() {
        int count = this.mWidgets.size();
        long wrapDimension = 0;
        for (int i = 0; i < count; i++) {
            WidgetRun run = this.mWidgets.get(i);
            wrapDimension = wrapDimension + ((long) run.start.mMargin) + run.getWrapDimension() + ((long) run.end.mMargin);
        }
        return wrapDimension;
    }

    private void build() {
        ConstraintWidget current = this.mWidget;
        ConstraintWidget previous = current.getPreviousChainMember(this.orientation);
        while (previous != null) {
            current = previous;
            previous = current.getPreviousChainMember(this.orientation);
        }
        this.mWidget = current;
        this.mWidgets.add(current.getRun(this.orientation));
        ConstraintWidget next = current.getNextChainMember(this.orientation);
        while (next != null) {
            ConstraintWidget current2 = next;
            this.mWidgets.add(current2.getRun(this.orientation));
            next = current2.getNextChainMember(this.orientation);
        }
        for (WidgetRun run : this.mWidgets) {
            if (this.orientation == 0) {
                run.mWidget.horizontalChainRun = this;
            } else if (this.orientation == 1) {
                run.mWidget.verticalChainRun = this;
            }
        }
        boolean isInRtl = this.orientation == 0 && ((ConstraintWidgetContainer) this.mWidget.getParent()).isRtl();
        if (isInRtl && this.mWidgets.size() > 1) {
            this.mWidget = this.mWidgets.get(this.mWidgets.size() - 1).mWidget;
        }
        this.mChainStyle = this.orientation == 0 ? this.mWidget.getHorizontalChainStyle() : this.mWidget.getVerticalChainStyle();
    }

    @Override // androidx.constraintlayout.core.widgets.analyzer.WidgetRun
    void clear() {
        this.mRunGroup = null;
        for (WidgetRun run : this.mWidgets) {
            run.clear();
        }
    }

    @Override // androidx.constraintlayout.core.widgets.analyzer.WidgetRun
    void reset() {
        this.start.resolved = false;
        this.end.resolved = false;
    }

    /* JADX WARN: Code duplicated, block: B:59:0x00e6  */
    /* JADX WARN: Code duplicated, block: B:61:0x00f6  */
    /* JADX WARN: Code duplicated, block: B:63:0x00f8  */
    @Override // androidx.constraintlayout.core.widgets.analyzer.WidgetRun, androidx.constraintlayout.core.widgets.analyzer.Dependency
    public void update(Dependency dependency) {
        int i;
        int position;
        boolean isInRtl;
        float f;
        int i2;
        int position2;
        float bias;
        int position3;
        int gap;
        int gap2;
        int size;
        int size2;
        int max;
        ConstraintWidget parent;
        boolean treatAsFixed;
        boolean treatAsFixed2;
        float weight;
        ChainRun chainRun = this;
        if (!chainRun.start.resolved || !chainRun.end.resolved) {
            return;
        }
        ConstraintWidget parent2 = chainRun.mWidget.getParent();
        boolean isInRtl2 = false;
        if (parent2 instanceof ConstraintWidgetContainer) {
            isInRtl2 = ((ConstraintWidgetContainer) parent2).isRtl();
        }
        int distance = chainRun.end.value - chainRun.start.value;
        int size3 = 0;
        int numMatchConstraints = 0;
        float weights = 0.0f;
        int numVisibleWidgets = 0;
        int count = chainRun.mWidgets.size();
        int firstVisibleWidget = -1;
        int i3 = 0;
        while (true) {
            i = 8;
            if (i3 >= count) {
                break;
            }
            if (chainRun.mWidgets.get(i3).mWidget.getVisibility() == 8) {
                i3++;
            } else {
                firstVisibleWidget = i3;
                break;
            }
        }
        int lastVisibleWidget = -1;
        for (int i4 = count - 1; i4 >= 0; i4--) {
            if (chainRun.mWidgets.get(i4).mWidget.getVisibility() != 8) {
                lastVisibleWidget = i4;
                break;
            }
        }
        int j = 0;
        while (j < 2) {
            int i5 = 0;
            while (i5 < count) {
                WidgetRun run = chainRun.mWidgets.get(i5);
                if (run.mWidget.getVisibility() == i) {
                    parent = parent2;
                } else {
                    numVisibleWidgets++;
                    if (i5 > 0 && i5 >= firstVisibleWidget) {
                        size3 += run.start.mMargin;
                    }
                    int dimension = run.mDimension.value;
                    parent = parent2;
                    boolean treatAsFixed3 = run.mDimensionBehavior != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT;
                    if (treatAsFixed3) {
                        if (chainRun.orientation == 0 && !run.mWidget.mHorizontalRun.mDimension.resolved) {
                            return;
                        }
                        treatAsFixed = treatAsFixed3;
                        if (chainRun.orientation == 1 && !run.mWidget.mVerticalRun.mDimension.resolved) {
                            return;
                        }
                    } else {
                        treatAsFixed = treatAsFixed3;
                        if (run.matchConstraintsType == 1 && j == 0) {
                            treatAsFixed2 = true;
                            dimension = run.mDimension.wrapValue;
                            numMatchConstraints++;
                        } else if (run.mDimension.resolved) {
                            treatAsFixed2 = true;
                        }
                        if (treatAsFixed2) {
                            size3 += dimension;
                        } else {
                            numMatchConstraints++;
                            weight = run.mWidget.mWeight[chainRun.orientation];
                            if (weight >= 0.0f) {
                                weights += weight;
                            }
                        }
                        if (i5 >= count - 1 && i5 < lastVisibleWidget) {
                            size3 += -run.end.mMargin;
                        }
                    }
                    treatAsFixed2 = treatAsFixed;
                    if (treatAsFixed2) {
                        numMatchConstraints++;
                        weight = run.mWidget.mWeight[chainRun.orientation];
                        if (weight >= 0.0f) {
                            weights += weight;
                        }
                    } else {
                        size3 += dimension;
                    }
                    if (i5 >= count - 1) {
                    }
                }
                i5++;
                parent2 = parent;
                i = 8;
            }
            ConstraintWidget parent3 = parent2;
            if (size3 < distance || numMatchConstraints == 0) {
                break;
            }
            numVisibleWidgets = 0;
            numMatchConstraints = 0;
            size3 = 0;
            weights = 0.0f;
            j++;
            parent2 = parent3;
            i = 8;
        }
        int position4 = chainRun.start.value;
        if (isInRtl2) {
            position4 = chainRun.end.value;
        }
        float f2 = 0.5f;
        if (size3 > distance) {
            position4 = isInRtl2 ? position4 + ((int) (((size3 - distance) / 2.0f) + 0.5f)) : position4 - ((int) (((size3 - distance) / 2.0f) + 0.5f));
        }
        if (numMatchConstraints > 0) {
            int matchConstraintsDimension = (int) (((distance - size3) / numMatchConstraints) + 0.5f);
            int appliedLimits = 0;
            int i6 = 0;
            while (i6 < count) {
                WidgetRun run2 = chainRun.mWidgets.get(i6);
                float f3 = f2;
                int position5 = position4;
                if (run2.mWidget.getVisibility() == 8) {
                    size = size3;
                } else if (run2.mDimensionBehavior != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT || run2.mDimension.resolved) {
                    size = size3;
                } else {
                    int dimension2 = matchConstraintsDimension;
                    if (weights > 0.0f) {
                        dimension2 = (int) ((((distance - size3) * run2.mWidget.mWeight[chainRun.orientation]) / weights) + f3);
                    }
                    int value = dimension2;
                    if (chainRun.orientation == 0) {
                        int max2 = run2.mWidget.mMatchConstraintMaxWidth;
                        int i7 = size3;
                        size2 = run2.mWidget.mMatchConstraintMinWidth;
                        max = max2;
                        size = i7;
                    } else {
                        int max3 = run2.mWidget.mMatchConstraintMaxHeight;
                        int i8 = size3;
                        size2 = run2.mWidget.mMatchConstraintMinHeight;
                        max = max3;
                        size = i8;
                    }
                    int numMatchConstraints2 = run2.matchConstraintsType;
                    if (numMatchConstraints2 == 1) {
                        value = Math.min(value, run2.mDimension.wrapValue);
                    }
                    int value2 = Math.max(size2, value);
                    if (max > 0) {
                        value2 = Math.min(max, value2);
                    }
                    if (value2 != dimension2) {
                        appliedLimits++;
                        dimension2 = value2;
                    }
                    run2.mDimension.resolve(dimension2);
                }
                i6++;
                f2 = f3;
                position4 = position5;
                isInRtl2 = isInRtl2;
                size3 = size;
                numMatchConstraints = numMatchConstraints;
                weights = weights;
            }
            position = position4;
            isInRtl = isInRtl2;
            int size4 = size3;
            int numMatchConstraints3 = numMatchConstraints;
            f = f2;
            if (appliedLimits <= 0) {
                size3 = size4;
                numMatchConstraints = numMatchConstraints3;
            } else {
                numMatchConstraints = numMatchConstraints3 - appliedLimits;
                int size5 = 0;
                for (int i9 = 0; i9 < count; i9++) {
                    WidgetRun run3 = chainRun.mWidgets.get(i9);
                    if (run3.mWidget.getVisibility() != 8) {
                        if (i9 > 0 && i9 >= firstVisibleWidget) {
                            size5 += run3.start.mMargin;
                        }
                        size5 += run3.mDimension.value;
                        if (i9 < count - 1 && i9 < lastVisibleWidget) {
                            size5 += -run3.end.mMargin;
                        }
                    }
                }
                size3 = size5;
            }
            if (chainRun.mChainStyle == 2 && appliedLimits == 0) {
                chainRun.mChainStyle = 0;
            }
        } else {
            position = position4;
            isInRtl = isInRtl2;
            f = 0.5f;
        }
        if (size3 <= distance) {
            i2 = 2;
        } else {
            i2 = 2;
            chainRun.mChainStyle = 2;
        }
        if (numVisibleWidgets > 0 && numMatchConstraints == 0 && firstVisibleWidget == lastVisibleWidget) {
            chainRun.mChainStyle = i2;
        }
        if (chainRun.mChainStyle == 1) {
            int gap3 = 0;
            if (numVisibleWidgets > 1) {
                gap3 = (distance - size3) / (numVisibleWidgets - 1);
            } else if (numVisibleWidgets == 1) {
                gap3 = (distance - size3) / 2;
            }
            if (numMatchConstraints > 0) {
                gap3 = 0;
            }
            int i10 = 0;
            int position6 = position;
            while (i10 < count) {
                int index = i10;
                if (isInRtl) {
                    index = count - (i10 + 1);
                }
                WidgetRun run4 = chainRun.mWidgets.get(index);
                if (run4.mWidget.getVisibility() == 8) {
                    run4.start.resolve(position6);
                    run4.end.resolve(position6);
                    gap2 = gap3;
                } else {
                    if (i10 > 0) {
                        if (isInRtl) {
                            position6 -= gap3;
                        } else {
                            position6 += gap3;
                        }
                    }
                    if (i10 > 0 && i10 >= firstVisibleWidget) {
                        if (isInRtl) {
                            position6 -= run4.start.mMargin;
                        } else {
                            position6 += run4.start.mMargin;
                        }
                    }
                    if (isInRtl) {
                        run4.end.resolve(position6);
                    } else {
                        run4.start.resolve(position6);
                    }
                    int dimension3 = run4.mDimension.value;
                    gap2 = gap3;
                    if (run4.mDimensionBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && run4.matchConstraintsType == 1) {
                        dimension3 = run4.mDimension.wrapValue;
                    }
                    if (isInRtl) {
                        position6 -= dimension3;
                    } else {
                        position6 += dimension3;
                    }
                    if (isInRtl) {
                        run4.start.resolve(position6);
                    } else {
                        run4.end.resolve(position6);
                    }
                    run4.mResolved = true;
                    if (i10 < count - 1 && i10 < lastVisibleWidget) {
                        if (isInRtl) {
                            position6 -= -run4.end.mMargin;
                        } else {
                            position6 += -run4.end.mMargin;
                        }
                    }
                }
                i10++;
                gap3 = gap2;
            }
            return;
        }
        if (chainRun.mChainStyle == 0) {
            int gap4 = (distance - size3) / (numVisibleWidgets + 1);
            if (numMatchConstraints > 0) {
                gap4 = 0;
            }
            int i11 = 0;
            int position7 = position;
            while (i11 < count) {
                int index2 = i11;
                if (isInRtl) {
                    index2 = count - (i11 + 1);
                }
                WidgetRun run5 = chainRun.mWidgets.get(index2);
                if (run5.mWidget.getVisibility() == 8) {
                    run5.start.resolve(position7);
                    run5.end.resolve(position7);
                    gap = gap4;
                } else {
                    if (isInRtl) {
                        position3 = position7 - gap4;
                    } else {
                        position3 = position7 + gap4;
                    }
                    if (i11 > 0 && i11 >= firstVisibleWidget) {
                        if (isInRtl) {
                            position3 -= run5.start.mMargin;
                        } else {
                            position3 += run5.start.mMargin;
                        }
                    }
                    if (isInRtl) {
                        run5.end.resolve(position3);
                    } else {
                        run5.start.resolve(position3);
                    }
                    int dimension4 = run5.mDimension.value;
                    gap = gap4;
                    if (run5.mDimensionBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && run5.matchConstraintsType == 1) {
                        dimension4 = Math.min(dimension4, run5.mDimension.wrapValue);
                    }
                    if (isInRtl) {
                        position7 = position3 - dimension4;
                    } else {
                        position7 = position3 + dimension4;
                    }
                    if (isInRtl) {
                        run5.start.resolve(position7);
                    } else {
                        run5.end.resolve(position7);
                    }
                    if (i11 < count - 1 && i11 < lastVisibleWidget) {
                        if (isInRtl) {
                            position7 -= -run5.end.mMargin;
                        } else {
                            position7 += -run5.end.mMargin;
                        }
                    }
                }
                i11++;
                gap4 = gap;
            }
            return;
        }
        if (chainRun.mChainStyle == 2) {
            float bias2 = chainRun.orientation == 0 ? chainRun.mWidget.getHorizontalBiasPercent() : chainRun.mWidget.getVerticalBiasPercent();
            if (isInRtl) {
                bias2 = 1.0f - bias2;
            }
            int gap5 = (int) (((distance - size3) * bias2) + f);
            if (gap5 < 0 || numMatchConstraints > 0) {
                gap5 = 0;
            }
            if (isInRtl) {
                position2 = position - gap5;
            } else {
                position2 = position + gap5;
            }
            int i12 = 0;
            while (i12 < count) {
                int index3 = i12;
                if (isInRtl) {
                    index3 = count - (i12 + 1);
                }
                WidgetRun run6 = chainRun.mWidgets.get(index3);
                if (run6.mWidget.getVisibility() == 8) {
                    run6.start.resolve(position2);
                    run6.end.resolve(position2);
                    bias = bias2;
                } else {
                    if (i12 > 0 && i12 >= firstVisibleWidget) {
                        if (isInRtl) {
                            position2 -= run6.start.mMargin;
                        } else {
                            position2 += run6.start.mMargin;
                        }
                    }
                    if (isInRtl) {
                        run6.end.resolve(position2);
                    } else {
                        run6.start.resolve(position2);
                    }
                    int dimension5 = run6.mDimension.value;
                    bias = bias2;
                    if (run6.mDimensionBehavior == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && run6.matchConstraintsType == 1) {
                        dimension5 = run6.mDimension.wrapValue;
                    }
                    if (isInRtl) {
                        position2 -= dimension5;
                    } else {
                        position2 += dimension5;
                    }
                    if (isInRtl) {
                        run6.start.resolve(position2);
                    } else {
                        run6.end.resolve(position2);
                    }
                    if (i12 < count - 1 && i12 < lastVisibleWidget) {
                        if (isInRtl) {
                            position2 -= -run6.end.mMargin;
                        } else {
                            position2 += -run6.end.mMargin;
                        }
                    }
                }
                i12++;
                chainRun = this;
                bias2 = bias;
            }
        }
    }

    @Override // androidx.constraintlayout.core.widgets.analyzer.WidgetRun
    public void applyToWidget() {
        for (int i = 0; i < this.mWidgets.size(); i++) {
            WidgetRun run = this.mWidgets.get(i);
            run.applyToWidget();
        }
    }

    private ConstraintWidget getFirstVisibleWidget() {
        for (int i = 0; i < this.mWidgets.size(); i++) {
            WidgetRun run = this.mWidgets.get(i);
            if (run.mWidget.getVisibility() != 8) {
                return run.mWidget;
            }
        }
        return null;
    }

    private ConstraintWidget getLastVisibleWidget() {
        for (int i = this.mWidgets.size() - 1; i >= 0; i--) {
            WidgetRun run = this.mWidgets.get(i);
            if (run.mWidget.getVisibility() != 8) {
                return run.mWidget;
            }
        }
        return null;
    }

    @Override // androidx.constraintlayout.core.widgets.analyzer.WidgetRun
    void apply() {
        for (WidgetRun run : this.mWidgets) {
            run.apply();
        }
        int count = this.mWidgets.size();
        if (count < 1) {
            return;
        }
        ConstraintWidget firstWidget = this.mWidgets.get(0).mWidget;
        ConstraintWidget lastWidget = this.mWidgets.get(count - 1).mWidget;
        if (this.orientation == 0) {
            ConstraintAnchor startAnchor = firstWidget.mLeft;
            ConstraintAnchor endAnchor = lastWidget.mRight;
            DependencyNode startTarget = getTarget(startAnchor, 0);
            int startMargin = startAnchor.getMargin();
            ConstraintWidget firstVisibleWidget = getFirstVisibleWidget();
            if (firstVisibleWidget != null) {
                startMargin = firstVisibleWidget.mLeft.getMargin();
            }
            if (startTarget != null) {
                addTarget(this.start, startTarget, startMargin);
            }
            DependencyNode endTarget = getTarget(endAnchor, 0);
            int endMargin = endAnchor.getMargin();
            ConstraintWidget lastVisibleWidget = getLastVisibleWidget();
            if (lastVisibleWidget != null) {
                endMargin = lastVisibleWidget.mRight.getMargin();
            }
            if (endTarget != null) {
                addTarget(this.end, endTarget, -endMargin);
            }
        } else {
            ConstraintAnchor startAnchor2 = firstWidget.mTop;
            ConstraintAnchor endAnchor2 = lastWidget.mBottom;
            DependencyNode startTarget2 = getTarget(startAnchor2, 1);
            int startMargin2 = startAnchor2.getMargin();
            ConstraintWidget firstVisibleWidget2 = getFirstVisibleWidget();
            if (firstVisibleWidget2 != null) {
                startMargin2 = firstVisibleWidget2.mTop.getMargin();
            }
            if (startTarget2 != null) {
                addTarget(this.start, startTarget2, startMargin2);
            }
            DependencyNode endTarget2 = getTarget(endAnchor2, 1);
            int endMargin2 = endAnchor2.getMargin();
            ConstraintWidget lastVisibleWidget2 = getLastVisibleWidget();
            if (lastVisibleWidget2 != null) {
                endMargin2 = lastVisibleWidget2.mBottom.getMargin();
            }
            if (endTarget2 != null) {
                addTarget(this.end, endTarget2, -endMargin2);
            }
        }
        this.start.updateDelegate = this;
        this.end.updateDelegate = this;
    }
}
