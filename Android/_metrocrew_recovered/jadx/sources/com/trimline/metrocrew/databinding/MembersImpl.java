package com.trimline.metrocrew.databinding;

import android.util.SparseIntArray;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import androidx.cardview.widget.CardView;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.Guideline;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.InverseBindingListener;
import androidx.databinding.ViewDataBinding;
import androidx.databinding.adapters.TextViewBindingAdapter;
import com.trimline.metrocrew.Member;
import com.trimline.metrocrew.R;

/* JADX INFO: loaded from: classes4.dex */
public class MembersImpl extends Members {
    private static final ViewDataBinding.IncludedLayouts sIncludes = null;
    private static final SparseIntArray sViewsWithIds = new SparseIntArray();
    private InverseBindingListener NameeditandroidTextAttrChanged;
    private InverseBindingListener ideditandroidTextAttrChanged;
    private long mDirtyFlags;
    private final ConstraintLayout mboundView0;
    private final TextView mboundView1;
    private InverseBindingListener phoneeditandroidTextAttrChanged;

    static {
        sViewsWithIds.put(R.id.balances, 5);
        sViewsWithIds.put(R.id.no, 6);
        sViewsWithIds.put(R.id.Name, 7);
        sViewsWithIds.put(R.id.phone, 8);
        sViewsWithIds.put(R.id.Id, 9);
        sViewsWithIds.put(R.id.save, 10);
        sViewsWithIds.put(R.id.guideline4, 11);
        sViewsWithIds.put(R.id.guideline5, 12);
    }

    public MembersImpl(DataBindingComponent bindingComponent, View root) {
        this(bindingComponent, root, mapBindings(bindingComponent, root, 13, sIncludes, sViewsWithIds));
    }

    private MembersImpl(DataBindingComponent bindingComponent, View root, Object[] bindings) {
        super(bindingComponent, root, 0, (TextView) bindings[9], (TextView) bindings[7], (EditText) bindings[2], (CardView) bindings[5], (Guideline) bindings[11], (Guideline) bindings[12], (EditText) bindings[4], (TextView) bindings[6], (TextView) bindings[8], (EditText) bindings[3], (Button) bindings[10]);
        this.NameeditandroidTextAttrChanged = new InverseBindingListener() { // from class: com.trimline.metrocrew.databinding.MembersImpl.1
            @Override // androidx.databinding.InverseBindingListener
            public void onChange() {
                String callbackArg_0 = TextViewBindingAdapter.getTextString(MembersImpl.this.Nameedit);
                Member d = MembersImpl.this.mD;
                boolean dJavaLangObjectNull = d != null;
                if (dJavaLangObjectNull) {
                    d.Name = callbackArg_0;
                }
            }
        };
        this.ideditandroidTextAttrChanged = new InverseBindingListener() { // from class: com.trimline.metrocrew.databinding.MembersImpl.2
            @Override // androidx.databinding.InverseBindingListener
            public void onChange() {
                String callbackArg_0 = TextViewBindingAdapter.getTextString(MembersImpl.this.idedit);
                Member d = MembersImpl.this.mD;
                boolean dJavaLangObjectNull = d != null;
                if (dJavaLangObjectNull) {
                    d.ID_No = callbackArg_0;
                }
            }
        };
        this.phoneeditandroidTextAttrChanged = new InverseBindingListener() { // from class: com.trimline.metrocrew.databinding.MembersImpl.3
            @Override // androidx.databinding.InverseBindingListener
            public void onChange() {
                String callbackArg_0 = TextViewBindingAdapter.getTextString(MembersImpl.this.phoneedit);
                Member d = MembersImpl.this.mD;
                boolean dJavaLangObjectNull = d != null;
                if (dJavaLangObjectNull) {
                    d.Phone_No = callbackArg_0;
                }
            }
        };
        this.mDirtyFlags = -1L;
        this.Nameedit.setTag(null);
        this.idedit.setTag(null);
        this.mboundView0 = (ConstraintLayout) bindings[0];
        this.mboundView0.setTag(null);
        this.mboundView1 = (TextView) bindings[1];
        this.mboundView1.setTag(null);
        this.phoneedit.setTag(null);
        setRootTag(root);
        invalidateAll();
    }

    @Override // androidx.databinding.ViewDataBinding
    public void invalidateAll() {
        synchronized (this) {
            this.mDirtyFlags = 2L;
        }
        requestRebind();
    }

    @Override // androidx.databinding.ViewDataBinding
    public boolean hasPendingBindings() {
        synchronized (this) {
            return this.mDirtyFlags != 0;
        }
    }

    @Override // androidx.databinding.ViewDataBinding
    public boolean setVariable(int variableId, Object variable) {
        if (1 == variableId) {
            setD((Member) variable);
            return true;
        }
        return false;
    }

    @Override // com.trimline.metrocrew.databinding.Members
    public void setD(Member D) {
        this.mD = D;
        synchronized (this) {
            this.mDirtyFlags |= 1;
        }
        notifyPropertyChanged(1);
        super.requestRebind();
    }

    @Override // androidx.databinding.ViewDataBinding
    protected boolean onFieldChange(int localFieldId, Object object, int fieldId) {
        return false;
    }

    @Override // androidx.databinding.ViewDataBinding
    protected void executeBindings() {
        long dirtyFlags;
        synchronized (this) {
            dirtyFlags = this.mDirtyFlags;
            this.mDirtyFlags = 0L;
        }
        String dName = null;
        String dPhoneNo = null;
        String dIDNo = null;
        String dNo = null;
        Member d = this.mD;
        if ((dirtyFlags & 3) != 0 && d != null) {
            dName = d.Name;
            dPhoneNo = d.Phone_No;
            dIDNo = d.ID_No;
            dNo = d.No;
        }
        if ((3 & dirtyFlags) != 0) {
            TextViewBindingAdapter.setText(this.Nameedit, dName);
            TextViewBindingAdapter.setText(this.idedit, dIDNo);
            TextViewBindingAdapter.setText(this.mboundView1, dNo);
            TextViewBindingAdapter.setText(this.phoneedit, dPhoneNo);
        }
        if ((2 & dirtyFlags) != 0) {
            TextViewBindingAdapter.setTextWatcher(this.Nameedit, null, null, null, this.NameeditandroidTextAttrChanged);
            TextViewBindingAdapter.setTextWatcher(this.idedit, null, null, null, this.ideditandroidTextAttrChanged);
            TextViewBindingAdapter.setTextWatcher(this.phoneedit, null, null, null, this.phoneeditandroidTextAttrChanged);
        }
    }
}
