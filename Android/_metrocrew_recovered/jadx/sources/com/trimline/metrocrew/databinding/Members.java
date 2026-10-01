package com.trimline.metrocrew.databinding;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import androidx.cardview.widget.CardView;
import androidx.constraintlayout.widget.Guideline;
import androidx.databinding.Bindable;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.ViewDataBinding;
import com.trimline.metrocrew.Member;
import com.trimline.metrocrew.R;

/* JADX INFO: loaded from: classes4.dex */
public abstract class Members extends ViewDataBinding {
    public final TextView Id;
    public final TextView Name;
    public final EditText Nameedit;
    public final CardView balances;
    public final Guideline guideline4;
    public final Guideline guideline5;
    public final EditText idedit;

    @Bindable
    protected Member mD;
    public final TextView no;
    public final TextView phone;
    public final EditText phoneedit;
    public final Button save;

    public abstract void setD(Member d);

    protected Members(Object _bindingComponent, View _root, int _localFieldCount, TextView Id, TextView Name, EditText Nameedit, CardView balances, Guideline guideline4, Guideline guideline5, EditText idedit, TextView no, TextView phone, EditText phoneedit, Button save) {
        super(_bindingComponent, _root, _localFieldCount);
        this.Id = Id;
        this.Name = Name;
        this.Nameedit = Nameedit;
        this.balances = balances;
        this.guideline4 = guideline4;
        this.guideline5 = guideline5;
        this.idedit = idedit;
        this.no = no;
        this.phone = phone;
        this.phoneedit = phoneedit;
        this.save = save;
    }

    public Member getD() {
        return this.mD;
    }

    public static Members inflate(LayoutInflater inflater, ViewGroup root, boolean attachToRoot) {
        return inflate(inflater, root, attachToRoot, DataBindingUtil.getDefaultComponent());
    }

    @Deprecated
    public static Members inflate(LayoutInflater inflater, ViewGroup root, boolean attachToRoot, Object component) {
        return (Members) ViewDataBinding.inflateInternal(inflater, R.layout.activity_add_edit_member, root, attachToRoot, component);
    }

    public static Members inflate(LayoutInflater inflater) {
        return inflate(inflater, DataBindingUtil.getDefaultComponent());
    }

    @Deprecated
    public static Members inflate(LayoutInflater inflater, Object component) {
        return (Members) ViewDataBinding.inflateInternal(inflater, R.layout.activity_add_edit_member, null, false, component);
    }

    public static Members bind(View view) {
        return bind(view, DataBindingUtil.getDefaultComponent());
    }

    @Deprecated
    public static Members bind(View view, Object component) {
        return (Members) bind(component, view, R.layout.activity_add_edit_member);
    }
}
