package com.facebook.stetho.inspector.elements.android;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TextView;
import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.common.Predicate;
import com.facebook.stetho.common.ThreadBound;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.elements.Descriptor;
import com.facebook.stetho.inspector.elements.DescriptorMap;
import com.facebook.stetho.inspector.elements.DescriptorProvider;
import com.facebook.stetho.inspector.elements.DocumentProvider;
import com.facebook.stetho.inspector.elements.DocumentProviderListener;
import com.facebook.stetho.inspector.elements.NodeDescriptor;
import com.facebook.stetho.inspector.elements.ObjectDescriptor;
import com.facebook.stetho.inspector.helper.ThreadBoundProxy;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
final class AndroidDocumentProvider extends ThreadBoundProxy implements DocumentProvider, AndroidDescriptorHost {
    private static final int INSPECT_HOVER_COLOR = 1077952767;
    private static final int INSPECT_OVERLAY_COLOR = 1090519039;
    private static final long REPORT_CHANGED_INTERVAL_MS = 1000;
    private final Application mApplication;
    private final DescriptorMap mDescriptorMap;
    private final AndroidDocumentRoot mDocumentRoot;
    private final ViewHighlighter mHighlighter;
    private final Rect mHighlightingBoundsRect;
    private final Rect mHitRect;
    private final InspectModeHandler mInspectModeHandler;
    private boolean mIsReportChangesTimerPosted;

    @Nullable
    private DocumentProviderListener mListener;
    private final Runnable mReportChangesTimer;

    public AndroidDocumentProvider(Application application, List<DescriptorProvider> descriptorProviders, ThreadBound enforcer) {
        super(enforcer);
        this.mHighlightingBoundsRect = new Rect();
        this.mHitRect = new Rect();
        this.mIsReportChangesTimerPosted = false;
        this.mReportChangesTimer = new Runnable() { // from class: com.facebook.stetho.inspector.elements.android.AndroidDocumentProvider.1
            @Override // java.lang.Runnable
            public void run() {
                AndroidDocumentProvider.this.mIsReportChangesTimerPosted = false;
                if (AndroidDocumentProvider.this.mListener != null) {
                    AndroidDocumentProvider.this.mListener.onPossiblyChanged();
                    AndroidDocumentProvider.this.mIsReportChangesTimerPosted = true;
                    AndroidDocumentProvider.this.postDelayed(this, AndroidDocumentProvider.REPORT_CHANGED_INTERVAL_MS);
                }
            }
        };
        this.mApplication = (Application) Util.throwIfNull(application);
        this.mDocumentRoot = new AndroidDocumentRoot(application);
        this.mDescriptorMap = new DescriptorMap().beginInit().registerDescriptor(Activity.class, (Descriptor) new ActivityDescriptor()).registerDescriptor(AndroidDocumentRoot.class, (Descriptor) this.mDocumentRoot).registerDescriptor(Application.class, (Descriptor) new ApplicationDescriptor()).registerDescriptor(Dialog.class, (Descriptor) new DialogDescriptor()).registerDescriptor(Object.class, (Descriptor) new ObjectDescriptor()).registerDescriptor(TextView.class, (Descriptor) new TextViewDescriptor()).registerDescriptor(View.class, (Descriptor) new ViewDescriptor()).registerDescriptor(ViewGroup.class, (Descriptor) new ViewGroupDescriptor()).registerDescriptor(Window.class, (Descriptor) new WindowDescriptor());
        DialogFragmentDescriptor.register(this.mDescriptorMap);
        FragmentDescriptor.register(this.mDescriptorMap);
        int size = descriptorProviders.size();
        for (int i = 0; i < size; i++) {
            DescriptorProvider descriptorProvider = descriptorProviders.get(i);
            descriptorProvider.registerDescriptor(this.mDescriptorMap);
        }
        this.mDescriptorMap.setHost(this).endInit();
        this.mHighlighter = ViewHighlighter.newInstance();
        this.mInspectModeHandler = new InspectModeHandler();
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public void dispose() {
        verifyThreadAccess();
        this.mHighlighter.clearHighlight();
        this.mInspectModeHandler.disable();
        removeCallbacks(this.mReportChangesTimer);
        this.mIsReportChangesTimerPosted = false;
        this.mListener = null;
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public void setListener(DocumentProviderListener listener) {
        verifyThreadAccess();
        this.mListener = listener;
        if (this.mListener == null && this.mIsReportChangesTimerPosted) {
            this.mIsReportChangesTimerPosted = false;
            removeCallbacks(this.mReportChangesTimer);
        } else if (this.mListener != null && !this.mIsReportChangesTimerPosted) {
            this.mIsReportChangesTimerPosted = true;
            postDelayed(this.mReportChangesTimer, REPORT_CHANGED_INTERVAL_MS);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public Object getRootElement() {
        verifyThreadAccess();
        return this.mDocumentRoot;
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public NodeDescriptor getNodeDescriptor(Object element) {
        verifyThreadAccess();
        return getDescriptor(element);
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public void highlightElement(Object element, int color) {
        verifyThreadAccess();
        HighlightableDescriptor descriptor = getHighlightableDescriptor(element);
        if (descriptor == null) {
            this.mHighlighter.clearHighlight();
            return;
        }
        this.mHighlightingBoundsRect.setEmpty();
        View highlightingView = descriptor.getViewAndBoundsForHighlighting(element, this.mHighlightingBoundsRect);
        if (highlightingView == null) {
            this.mHighlighter.clearHighlight();
        } else {
            this.mHighlighter.setHighlightedView(highlightingView, this.mHighlightingBoundsRect, color);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public void hideHighlight() {
        verifyThreadAccess();
        this.mHighlighter.clearHighlight();
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public void setInspectModeEnabled(boolean enabled) {
        verifyThreadAccess();
        if (enabled) {
            this.mInspectModeHandler.enable();
        } else {
            this.mInspectModeHandler.disable();
        }
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProvider
    public void setAttributesAsText(Object element, String text) {
        verifyThreadAccess();
        Descriptor descriptor = this.mDescriptorMap.get(element.getClass());
        if (descriptor != null) {
            descriptor.setAttributesAsText(element, text);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.Descriptor.Host
    public Descriptor getDescriptor(Object element) {
        if (element == null) {
            return null;
        }
        return this.mDescriptorMap.get(element.getClass());
    }

    @Override // com.facebook.stetho.inspector.elements.Descriptor.Host
    public void onAttributeModified(Object element, String name, String value) {
        if (this.mListener != null) {
            this.mListener.onAttributeModified(element, name, value);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.Descriptor.Host
    public void onAttributeRemoved(Object element, String name) {
        if (this.mListener != null) {
            this.mListener.onAttributeRemoved(element, name);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.android.AndroidDescriptorHost
    @Nullable
    public HighlightableDescriptor getHighlightableDescriptor(@Nullable Object element) {
        if (element == null) {
            return null;
        }
        HighlightableDescriptor highlightableDescriptor = null;
        Object obj = null;
        for (Class<?> theClass = element.getClass(); highlightableDescriptor == null && theClass != null; theClass = theClass.getSuperclass()) {
            Object obj2 = this.mDescriptorMap.get(theClass);
            if (obj2 == null) {
                return null;
            }
            if (obj2 != obj && (obj2 instanceof HighlightableDescriptor)) {
                highlightableDescriptor = (HighlightableDescriptor) obj2;
            }
            obj = obj2;
        }
        return highlightableDescriptor;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getWindows(final Accumulator<Window> accumulator) {
        Descriptor appDescriptor = getDescriptor(this.mApplication);
        if (appDescriptor != null) {
            Accumulator<Object> elementAccumulator = new Accumulator<Object>() { // from class: com.facebook.stetho.inspector.elements.android.AndroidDocumentProvider.2
                @Override // com.facebook.stetho.common.Accumulator
                public void store(Object element) {
                    if (element instanceof Window) {
                        accumulator.store((Window) element);
                        return;
                    }
                    Descriptor elementDescriptor = AndroidDocumentProvider.this.getDescriptor(element);
                    if (elementDescriptor != null) {
                        elementDescriptor.getChildren(element, this);
                    }
                }
            };
            appDescriptor.getChildren(this.mApplication, elementAccumulator);
        }
    }

    private final class InspectModeHandler {
        private List<View> mOverlays;
        private final Predicate<View> mViewSelector;

        private InspectModeHandler() {
            this.mViewSelector = new Predicate<View>() { // from class: com.facebook.stetho.inspector.elements.android.AndroidDocumentProvider.InspectModeHandler.1
                @Override // com.facebook.stetho.common.Predicate
                public boolean apply(View view) {
                    return !(view instanceof DocumentHiddenView);
                }
            };
        }

        public void enable() {
            AndroidDocumentProvider.this.verifyThreadAccess();
            if (this.mOverlays != null) {
                disable();
            }
            this.mOverlays = new ArrayList();
            AndroidDocumentProvider.this.getWindows(new Accumulator<Window>() { // from class: com.facebook.stetho.inspector.elements.android.AndroidDocumentProvider.InspectModeHandler.2
                @Override // com.facebook.stetho.common.Accumulator
                public void store(Window object) {
                    if (object.peekDecorView() instanceof ViewGroup) {
                        ViewGroup decorView = (ViewGroup) object.peekDecorView();
                        OverlayView overlayView = InspectModeHandler.this.new OverlayView(AndroidDocumentProvider.this.mApplication);
                        WindowManager.LayoutParams layoutParams = new WindowManager.LayoutParams();
                        layoutParams.width = -1;
                        layoutParams.height = -1;
                        decorView.addView(overlayView, layoutParams);
                        decorView.bringChildToFront(overlayView);
                        InspectModeHandler.this.mOverlays.add(overlayView);
                    }
                }
            });
        }

        public void disable() {
            AndroidDocumentProvider.this.verifyThreadAccess();
            if (this.mOverlays == null) {
                return;
            }
            for (int i = 0; i < this.mOverlays.size(); i++) {
                View overlayView = this.mOverlays.get(i);
                ViewGroup decorViewGroup = (ViewGroup) overlayView.getParent();
                decorViewGroup.removeView(overlayView);
            }
            this.mOverlays = null;
        }

        private final class OverlayView extends DocumentHiddenView {
            public OverlayView(Context context) {
                super(context);
            }

            @Override // android.view.View
            protected void onDraw(Canvas canvas) {
                canvas.drawColor(AndroidDocumentProvider.INSPECT_OVERLAY_COLOR);
                super.onDraw(canvas);
            }

            @Override // android.view.View
            public boolean onTouchEvent(MotionEvent event) {
                HighlightableDescriptor descriptor;
                int x = (int) event.getX();
                int y = (int) event.getY();
                Object elementToHighlight = getParent();
                while (true) {
                    HighlightableDescriptor descriptor2 = AndroidDocumentProvider.this.getHighlightableDescriptor(elementToHighlight);
                    if (descriptor2 == null) {
                        break;
                    }
                    AndroidDocumentProvider.this.mHitRect.setEmpty();
                    Object element = descriptor2.getElementToHighlightAtPosition(elementToHighlight, x, y, AndroidDocumentProvider.this.mHitRect);
                    x -= AndroidDocumentProvider.this.mHitRect.left;
                    y -= AndroidDocumentProvider.this.mHitRect.top;
                    if (element == elementToHighlight) {
                        break;
                    }
                    elementToHighlight = element;
                }
                if (elementToHighlight != null && (descriptor = AndroidDocumentProvider.this.getHighlightableDescriptor(elementToHighlight)) != null) {
                    View viewToHighlight = descriptor.getViewAndBoundsForHighlighting(elementToHighlight, AndroidDocumentProvider.this.mHighlightingBoundsRect);
                    if (event.getAction() != 3 && viewToHighlight != null) {
                        AndroidDocumentProvider.this.mHighlighter.setHighlightedView(viewToHighlight, AndroidDocumentProvider.this.mHighlightingBoundsRect, AndroidDocumentProvider.INSPECT_HOVER_COLOR);
                        if (event.getAction() == 1 && AndroidDocumentProvider.this.mListener != null) {
                            AndroidDocumentProvider.this.mListener.onInspectRequested(elementToHighlight);
                        }
                    }
                }
                return true;
            }
        }
    }
}
