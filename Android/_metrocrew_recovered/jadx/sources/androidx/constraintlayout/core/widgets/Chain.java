package androidx.constraintlayout.core.widgets;

import androidx.constraintlayout.core.ArrayRow;
import androidx.constraintlayout.core.LinearSystem;
import androidx.constraintlayout.core.SolverVariable;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class Chain {
    private static final boolean DEBUG = false;
    public static final boolean USE_CHAIN_OPTIMIZATION = false;

    public static void applyChainConstraints(ConstraintWidgetContainer constraintWidgetContainer, LinearSystem system, ArrayList<ConstraintWidget> widgets, int orientation) {
        int offset;
        int chainsSize;
        ChainHead[] chainsArray;
        if (orientation == 0) {
            offset = 0;
            chainsSize = constraintWidgetContainer.mHorizontalChainsSize;
            chainsArray = constraintWidgetContainer.mHorizontalChainsArray;
        } else {
            offset = 2;
            chainsSize = constraintWidgetContainer.mVerticalChainsSize;
            chainsArray = constraintWidgetContainer.mVerticalChainsArray;
        }
        for (int i = 0; i < chainsSize; i++) {
            ChainHead first = chainsArray[i];
            first.define();
            if (widgets == null || widgets.contains(first.mFirst)) {
                applyChainConstraints(constraintWidgetContainer, system, orientation, offset, first);
            }
        }
    }

    /* JADX WARN: Code duplicated, block: B:311:0x0615  */
    /* JADX WARN: Code duplicated, block: B:314:0x0620  */
    /* JADX WARN: Code duplicated, block: B:315:0x0625  */
    /* JADX WARN: Code duplicated, block: B:318:0x062a  */
    /* JADX WARN: Code duplicated, block: B:319:0x062f  */
    /* JADX WARN: Code duplicated, block: B:321:0x0632  */
    /* JADX WARN: Code duplicated, block: B:323:0x063c  */
    /* JADX WARN: Code duplicated, block: B:324:0x0643  */
    /* JADX WARN: Code duplicated, block: B:326:0x0649  */
    /* JADX WARN: Code duplicated, block: B:328:0x064c  */
    /* JADX WARN: Code duplicated, block: B:329:0x0658  */
    static void applyChainConstraints(ConstraintWidgetContainer container, LinearSystem system, int orientation, int offset, ChainHead chainHead) {
        boolean isChainSpread;
        boolean isChainSpreadInside;
        ConstraintWidget widget;
        boolean isChainPacked;
        ConstraintWidget widget2;
        ConstraintAnchor begin;
        ConstraintAnchor end;
        SolverVariable beginTarget;
        SolverVariable endTarget;
        SolverVariable endTarget2;
        ConstraintAnchor end2;
        ConstraintAnchor realEnd;
        SolverVariable solverVariable;
        ConstraintAnchor end3;
        ConstraintAnchor endTarget3;
        ConstraintWidget next;
        int nextMargin;
        ConstraintAnchor beginNextAnchor;
        SolverVariable beginNext;
        SolverVariable beginNext2;
        int nextMargin2;
        int i;
        ConstraintAnchor beginNextAnchor2;
        int nextMargin3;
        float bias;
        int count;
        float totalWeights;
        float currentWeight;
        int margin;
        ConstraintWidget next2;
        int strength;
        ConstraintWidget first = chainHead.mFirst;
        ConstraintWidget last = chainHead.mLast;
        ConstraintWidget firstVisibleWidget = chainHead.mFirstVisibleWidget;
        ConstraintWidget lastVisibleWidget = chainHead.mLastVisibleWidget;
        ConstraintWidget head = chainHead.mHead;
        boolean done = false;
        float totalWeights2 = chainHead.mTotalWeight;
        ConstraintWidget firstMatchConstraintsWidget = chainHead.mFirstMatchConstraintWidget;
        ConstraintWidget constraintWidget = chainHead.mLastMatchConstraintWidget;
        boolean isWrapContent = container.mListDimensionBehaviors[orientation] == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
        if (orientation == 0) {
            boolean isChainSpread2 = head.mHorizontalChainStyle == 0;
            isChainSpread = isChainSpread2;
            boolean isChainSpreadInside2 = head.mHorizontalChainStyle == 1;
            isChainSpreadInside = isChainSpreadInside2;
            widget = first;
            isChainPacked = head.mHorizontalChainStyle == 2;
        } else {
            boolean isChainSpread3 = head.mVerticalChainStyle == 0;
            isChainSpread = isChainSpread3;
            boolean isChainSpreadInside3 = head.mVerticalChainStyle == 1;
            isChainSpreadInside = isChainSpreadInside3;
            widget = first;
            isChainPacked = head.mVerticalChainStyle == 2;
        }
        while (!done) {
            ConstraintAnchor begin2 = widget.mListAnchors[offset];
            int strength2 = 4;
            if (isChainPacked) {
                strength2 = 1;
            }
            int margin2 = begin2.getMargin();
            boolean isSpreadOnly = widget.mListDimensionBehaviors[orientation] == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && widget.mResolvedMatchConstraintDefault[orientation] == 0;
            if (begin2.mTarget != null && widget != first) {
                margin = margin2 + begin2.mTarget.getMargin();
            } else {
                margin = margin2;
            }
            if (isChainPacked && widget != first && widget != firstVisibleWidget) {
                strength2 = 8;
            }
            boolean isSpreadOnly2 = isSpreadOnly;
            if (begin2.mTarget == null) {
                totalWeights2 = totalWeights2;
                firstMatchConstraintsWidget = firstMatchConstraintsWidget;
            } else {
                if (widget == firstVisibleWidget) {
                    system.addGreaterThan(begin2.mSolverVariable, begin2.mTarget.mSolverVariable, margin, 6);
                } else {
                    system.addGreaterThan(begin2.mSolverVariable, begin2.mTarget.mSolverVariable, margin, 8);
                }
                if (isSpreadOnly2 && !isChainPacked) {
                    strength2 = 5;
                }
                if (widget == firstVisibleWidget && isChainPacked && widget.isInBarrier(orientation)) {
                    strength = 5;
                } else {
                    strength = strength2;
                }
                system.addEquality(begin2.mSolverVariable, begin2.mTarget.mSolverVariable, margin, strength);
            }
            if (isWrapContent) {
                if (widget.getVisibility() != 8 && widget.mListDimensionBehaviors[orientation] == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                    system.addGreaterThan(widget.mListAnchors[offset + 1].mSolverVariable, widget.mListAnchors[offset].mSolverVariable, 0, 5);
                }
                system.addGreaterThan(widget.mListAnchors[offset].mSolverVariable, container.mListAnchors[offset].mSolverVariable, 0, 8);
            }
            ConstraintAnchor nextAnchor = widget.mListAnchors[offset + 1].mTarget;
            if (nextAnchor != null) {
                ConstraintWidget next3 = nextAnchor.mOwner;
                next2 = (next3.mListAnchors[offset].mTarget == null || next3.mListAnchors[offset].mTarget.mOwner != widget) ? null : next3;
            } else {
                next2 = null;
            }
            if (next2 != null) {
                widget = next2;
            } else {
                done = true;
            }
            totalWeights2 = totalWeights2;
            firstMatchConstraintsWidget = firstMatchConstraintsWidget;
        }
        float totalWeights3 = totalWeights2;
        if (lastVisibleWidget == null || last.mListAnchors[offset + 1].mTarget == null) {
            widget2 = widget;
        } else {
            ConstraintAnchor end4 = lastVisibleWidget.mListAnchors[offset + 1];
            boolean isSpreadOnly3 = lastVisibleWidget.mListDimensionBehaviors[orientation] == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && lastVisibleWidget.mResolvedMatchConstraintDefault[orientation] == 0;
            if (!isSpreadOnly3 || isChainPacked || end4.mTarget.mOwner != container) {
                widget2 = widget;
                if (isChainPacked && end4.mTarget.mOwner == container) {
                    system.addEquality(end4.mSolverVariable, end4.mTarget.mSolverVariable, -end4.getMargin(), 4);
                }
            } else {
                widget2 = widget;
                system.addEquality(end4.mSolverVariable, end4.mTarget.mSolverVariable, -end4.getMargin(), 5);
            }
            system.addLowerThan(end4.mSolverVariable, last.mListAnchors[offset + 1].mTarget.mSolverVariable, -end4.getMargin(), 6);
        }
        if (isWrapContent) {
            system.addGreaterThan(container.mListAnchors[offset + 1].mSolverVariable, last.mListAnchors[offset + 1].mSolverVariable, last.mListAnchors[offset + 1].getMargin(), 8);
        }
        ArrayList<ConstraintWidget> listMatchConstraints = chainHead.mWeightedMatchConstraintsWidgets;
        if (listMatchConstraints != null && (count = listMatchConstraints.size()) > 1) {
            ConstraintWidget lastMatch = null;
            if (chainHead.mHasUndefinedWeights && !chainHead.mHasComplexMatchWeights) {
                totalWeights = chainHead.mWidgetsMatchCount;
            } else {
                totalWeights = totalWeights3;
            }
            int i2 = 0;
            float lastWeight = 0.0f;
            while (i2 < count) {
                ConstraintWidget match = listMatchConstraints.get(i2);
                float currentWeight2 = match.mWeight[orientation];
                if (currentWeight2 < 0.0f) {
                    if (chainHead.mHasComplexMatchWeights) {
                        listMatchConstraints = listMatchConstraints;
                        count = count;
                        system.addEquality(match.mListAnchors[offset + 1].mSolverVariable, match.mListAnchors[offset].mSolverVariable, 0, 4);
                    } else {
                        currentWeight = 1.0f;
                    }
                    i2++;
                    listMatchConstraints = listMatchConstraints;
                    count = count;
                } else {
                    currentWeight = currentWeight2;
                }
                if (currentWeight == 0.0f) {
                    system.addEquality(match.mListAnchors[offset + 1].mSolverVariable, match.mListAnchors[offset].mSolverVariable, 0, 8);
                } else {
                    if (lastMatch != null) {
                        SolverVariable begin3 = lastMatch.mListAnchors[offset].mSolverVariable;
                        SolverVariable end5 = lastMatch.mListAnchors[offset + 1].mSolverVariable;
                        SolverVariable nextBegin = match.mListAnchors[offset].mSolverVariable;
                        SolverVariable nextEnd = match.mListAnchors[offset + 1].mSolverVariable;
                        ArrayRow row = system.createRow();
                        row.createRowEqualMatchDimensions(lastWeight, totalWeights, currentWeight, begin3, end5, nextBegin, nextEnd);
                        system.addConstraint(row);
                    }
                    lastMatch = match;
                    lastWeight = currentWeight;
                }
                i2++;
                listMatchConstraints = listMatchConstraints;
                count = count;
            }
        }
        if (firstVisibleWidget != null && (firstVisibleWidget == lastVisibleWidget || isChainPacked)) {
            ConstraintAnchor begin4 = first.mListAnchors[offset];
            ConstraintAnchor end6 = last.mListAnchors[offset + 1];
            SolverVariable beginTarget2 = begin4.mTarget != null ? begin4.mTarget.mSolverVariable : null;
            SolverVariable endTarget4 = end6.mTarget != null ? end6.mTarget.mSolverVariable : null;
            ConstraintAnchor begin5 = firstVisibleWidget.mListAnchors[offset];
            if (lastVisibleWidget != null) {
                end6 = lastVisibleWidget.mListAnchors[offset + 1];
            }
            if (beginTarget2 != null && endTarget4 != null) {
                if (orientation == 0) {
                    bias = head.mHorizontalBiasPercent;
                } else {
                    bias = head.mVerticalBiasPercent;
                }
                int beginMargin = begin5.getMargin();
                int endMargin = end6.getMargin();
                system.addCentering(begin5.mSolverVariable, beginTarget2, beginMargin, bias, endTarget4, end6.mSolverVariable, endMargin, 7);
            }
        } else {
            if (!isChainSpread || firstVisibleWidget == null) {
                int i3 = 8;
                if (isChainSpreadInside && firstVisibleWidget != null) {
                    boolean applyFixedEquality = chainHead.mWidgetsMatchCount > 0 && chainHead.mWidgetsCount == chainHead.mWidgetsMatchCount;
                    ConstraintWidget previousVisibleWidget = firstVisibleWidget;
                    ConstraintWidget previousVisibleWidget2 = firstVisibleWidget;
                    while (previousVisibleWidget != null) {
                        ConstraintWidget next4 = previousVisibleWidget.mNextChainWidget[orientation];
                        while (next4 != null && next4.getVisibility() == i3) {
                            next4 = next4.mNextChainWidget[orientation];
                        }
                        if (previousVisibleWidget == firstVisibleWidget || previousVisibleWidget == lastVisibleWidget || next4 == null) {
                            previousVisibleWidget2 = previousVisibleWidget2;
                            previousVisibleWidget = previousVisibleWidget;
                            next = next4;
                        } else {
                            if (next4 == lastVisibleWidget) {
                                next4 = null;
                            }
                            ConstraintAnchor beginAnchor = previousVisibleWidget.mListAnchors[offset];
                            SolverVariable begin6 = beginAnchor.mSolverVariable;
                            if (beginAnchor.mTarget != null) {
                                SolverVariable solverVariable2 = beginAnchor.mTarget.mSolverVariable;
                            }
                            SolverVariable beginTarget3 = previousVisibleWidget2.mListAnchors[offset + 1].mSolverVariable;
                            SolverVariable beginNext3 = null;
                            int beginMargin2 = beginAnchor.getMargin();
                            int nextMargin4 = previousVisibleWidget.mListAnchors[offset + 1].getMargin();
                            if (next4 != null) {
                                nextMargin = nextMargin4;
                                beginNextAnchor = next4.mListAnchors[offset];
                                beginNext2 = beginNextAnchor.mSolverVariable;
                                beginNext = beginNextAnchor.mTarget != null ? beginNextAnchor.mTarget.mSolverVariable : null;
                            } else {
                                nextMargin = nextMargin4;
                                beginNextAnchor = lastVisibleWidget.mListAnchors[offset];
                                if (beginNextAnchor != null) {
                                    beginNext3 = beginNextAnchor.mSolverVariable;
                                }
                                SolverVariable solverVariable3 = beginNext3;
                                beginNext = previousVisibleWidget.mListAnchors[offset + 1].mSolverVariable;
                                beginNext2 = solverVariable3;
                            }
                            if (beginNextAnchor == null) {
                                nextMargin2 = nextMargin;
                            } else {
                                nextMargin2 = nextMargin + beginNextAnchor.getMargin();
                            }
                            int beginMargin3 = beginMargin2 + previousVisibleWidget2.mListAnchors[offset + 1].getMargin();
                            int strength3 = 4;
                            if (applyFixedEquality) {
                                strength3 = 8;
                            }
                            if (begin6 != null && beginTarget3 != null && beginNext2 != null && beginNext != null) {
                                SolverVariable beginTarget4 = beginNext2;
                                system.addCentering(begin6, beginTarget3, beginMargin3, 0.5f, beginTarget4, beginNext, nextMargin2, strength3);
                            }
                            next = next4;
                        }
                        if (previousVisibleWidget.getVisibility() != 8) {
                            previousVisibleWidget2 = previousVisibleWidget;
                        }
                        previousVisibleWidget = next;
                        previousVisibleWidget2 = previousVisibleWidget2;
                        i3 = 8;
                    }
                    system = system;
                    ConstraintAnchor begin7 = firstVisibleWidget.mListAnchors[offset];
                    ConstraintAnchor beginTarget5 = first.mListAnchors[offset].mTarget;
                    ConstraintAnchor end7 = lastVisibleWidget.mListAnchors[offset + 1];
                    ConstraintAnchor endTarget5 = last.mListAnchors[offset + 1].mTarget;
                    if (beginTarget5 == null) {
                        end3 = end7;
                        endTarget3 = endTarget5;
                    } else if (firstVisibleWidget != lastVisibleWidget) {
                        system.addEquality(begin7.mSolverVariable, beginTarget5.mSolverVariable, begin7.getMargin(), 5);
                        end3 = end7;
                        endTarget3 = endTarget5;
                    } else if (endTarget5 != null) {
                        end3 = end7;
                        endTarget3 = endTarget5;
                        system.addCentering(begin7.mSolverVariable, beginTarget5.mSolverVariable, begin7.getMargin(), 0.5f, end7.mSolverVariable, endTarget5.mSolverVariable, end7.getMargin(), 5);
                    } else {
                        end3 = end7;
                        endTarget3 = endTarget5;
                    }
                    if (endTarget3 != null && firstVisibleWidget != lastVisibleWidget) {
                        system.addEquality(end3.mSolverVariable, endTarget3.mSolverVariable, -end3.getMargin(), 5);
                    }
                }
            } else {
                boolean applyFixedEquality2 = chainHead.mWidgetsMatchCount > 0 && chainHead.mWidgetsCount == chainHead.mWidgetsMatchCount;
                ConstraintWidget previousVisibleWidget3 = firstVisibleWidget;
                ConstraintWidget previousVisibleWidget4 = firstVisibleWidget;
                while (previousVisibleWidget3 != null) {
                    ConstraintWidget next5 = previousVisibleWidget3.mNextChainWidget[orientation];
                    while (true) {
                        if (next5 == null) {
                            i = 8;
                            break;
                        }
                        i = 8;
                        if (next5.getVisibility() != 8) {
                            break;
                        } else {
                            next5 = next5.mNextChainWidget[orientation];
                        }
                    }
                    if (next5 != null || previousVisibleWidget3 == lastVisibleWidget) {
                        ConstraintAnchor beginAnchor2 = previousVisibleWidget3.mListAnchors[offset];
                        SolverVariable begin8 = beginAnchor2.mSolverVariable;
                        SolverVariable beginTarget6 = beginAnchor2.mTarget != null ? beginAnchor2.mTarget.mSolverVariable : null;
                        if (previousVisibleWidget4 != previousVisibleWidget3) {
                            beginTarget6 = previousVisibleWidget4.mListAnchors[offset + 1].mSolverVariable;
                        } else if (previousVisibleWidget3 == firstVisibleWidget) {
                            beginTarget6 = first.mListAnchors[offset].mTarget != null ? first.mListAnchors[offset].mTarget.mSolverVariable : null;
                        }
                        SolverVariable beginNext4 = null;
                        int beginMargin4 = beginAnchor2.getMargin();
                        int nextMargin5 = previousVisibleWidget3.mListAnchors[offset + 1].getMargin();
                        if (next5 != null) {
                            ConstraintAnchor beginNextAnchor3 = next5.mListAnchors[offset];
                            beginNext4 = beginNextAnchor3.mSolverVariable;
                            beginNextAnchor2 = beginNextAnchor3;
                        } else {
                            ConstraintAnchor beginNextAnchor4 = last.mListAnchors[offset + 1].mTarget;
                            if (beginNextAnchor4 == null) {
                                beginNextAnchor2 = beginNextAnchor4;
                            } else {
                                beginNext4 = beginNextAnchor4.mSolverVariable;
                                beginNextAnchor2 = beginNextAnchor4;
                            }
                        }
                        SolverVariable beginNextTarget = previousVisibleWidget3.mListAnchors[offset + 1].mSolverVariable;
                        if (beginNextAnchor2 != null) {
                            nextMargin5 += beginNextAnchor2.getMargin();
                        }
                        int beginMargin5 = beginMargin4 + previousVisibleWidget4.mListAnchors[offset + 1].getMargin();
                        if (begin8 == null || beginTarget6 == null || beginNext4 == null || beginNextTarget == null) {
                            nextMargin3 = 8;
                        } else {
                            int margin1 = beginMargin5;
                            if (previousVisibleWidget3 == firstVisibleWidget) {
                                margin1 = firstVisibleWidget.mListAnchors[offset].getMargin();
                            }
                            int margin3 = nextMargin5;
                            if (previousVisibleWidget3 == lastVisibleWidget) {
                                margin3 = lastVisibleWidget.mListAnchors[offset + 1].getMargin();
                            }
                            int strength4 = 5;
                            if (applyFixedEquality2) {
                                strength4 = 8;
                            }
                            SolverVariable beginTarget7 = beginTarget6;
                            SolverVariable beginTarget8 = beginNext4;
                            int margin4 = margin1;
                            int margin5 = margin3;
                            nextMargin3 = 8;
                            system.addCentering(begin8, beginTarget7, margin4, 0.5f, beginTarget8, beginNextTarget, margin5, strength4);
                        }
                    } else {
                        nextMargin3 = i;
                    }
                    if (previousVisibleWidget3.getVisibility() == nextMargin3) {
                        previousVisibleWidget4 = previousVisibleWidget4;
                    } else {
                        previousVisibleWidget4 = previousVisibleWidget3;
                    }
                    previousVisibleWidget3 = next5;
                }
                system = system;
            }
            if ((!isChainSpread || isChainSpreadInside) && firstVisibleWidget != null && firstVisibleWidget != lastVisibleWidget) {
                begin = firstVisibleWidget.mListAnchors[offset];
                if (lastVisibleWidget == null) {
                    lastVisibleWidget = firstVisibleWidget;
                }
                end = lastVisibleWidget.mListAnchors[offset + 1];
                if (begin.mTarget != null) {
                    beginTarget = begin.mTarget.mSolverVariable;
                } else {
                    beginTarget = null;
                }
                if (end.mTarget != null) {
                    endTarget = end.mTarget.mSolverVariable;
                } else {
                    endTarget = null;
                }
                if (last != lastVisibleWidget) {
                    endTarget2 = endTarget;
                } else {
                    realEnd = last.mListAnchors[offset + 1];
                    if (realEnd.mTarget != null) {
                        solverVariable = realEnd.mTarget.mSolverVariable;
                    } else {
                        solverVariable = null;
                    }
                    SolverVariable endTarget6 = solverVariable;
                    endTarget2 = endTarget6;
                }
                if (firstVisibleWidget == lastVisibleWidget) {
                    end2 = end;
                } else {
                    begin = firstVisibleWidget.mListAnchors[offset];
                    end2 = firstVisibleWidget.mListAnchors[offset + 1];
                }
                if (beginTarget == null && endTarget2 != null) {
                    int beginMargin6 = begin.getMargin();
                    int endMargin2 = lastVisibleWidget.mListAnchors[offset + 1].getMargin();
                    system.addCentering(begin.mSolverVariable, beginTarget, beginMargin6, 0.5f, endTarget2, end2.mSolverVariable, endMargin2, 5);
                    return;
                }
            }
            return;
        }
        if (!isChainSpread) {
        }
        begin = firstVisibleWidget.mListAnchors[offset];
        if (lastVisibleWidget == null) {
            lastVisibleWidget = firstVisibleWidget;
        }
        end = lastVisibleWidget.mListAnchors[offset + 1];
        if (begin.mTarget != null) {
            beginTarget = begin.mTarget.mSolverVariable;
        } else {
            beginTarget = null;
        }
        if (end.mTarget != null) {
            endTarget = end.mTarget.mSolverVariable;
        } else {
            endTarget = null;
        }
        if (last != lastVisibleWidget) {
            endTarget2 = endTarget;
        } else {
            realEnd = last.mListAnchors[offset + 1];
            if (realEnd.mTarget != null) {
                solverVariable = realEnd.mTarget.mSolverVariable;
            } else {
                solverVariable = null;
            }
            SolverVariable endTarget7 = solverVariable;
            endTarget2 = endTarget7;
        }
        if (firstVisibleWidget == lastVisibleWidget) {
            end2 = end;
        } else {
            begin = firstVisibleWidget.mListAnchors[offset];
            end2 = firstVisibleWidget.mListAnchors[offset + 1];
        }
        if (beginTarget == null) {
        }
    }
}
