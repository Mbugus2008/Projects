package com.mobile.afrecash.uihelpers;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import com.mobile.afrecash.R;
import com.mobile.afrecash.activities.EnterPhone;
import com.mobile.afrecash.activities.Home;
import com.mobile.afrecash.datasets.ProfileHolder;
import com.mobile.afrecash.listeners.PINListener;
import com.mobile.afrecash.utils.ResponseHandler;

import in.arjsna.passcodeview.PassCodeView;

/**
 * Created by @GeekNat on 4/18/17.
 */

public class EnterPINDialog extends Dialog {

    private Context context;
    PassCodeView passCodeView;
    PINListener pinListener;
    ProfileHolder profileHolder;
    ResponseHandler responseHandler;

    public EnterPINDialog(Context context, PINListener pinListener) {
        super(context, R.style.AppThemeWhite_Light);
        this.context = context;
        this.pinListener = pinListener;
        this.profileHolder = new ProfileHolder(context);
        this.responseHandler = new ResponseHandler(context);
        show();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_pin_after_login);

        findViewById(R.id.btnCancel).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                context.startActivity(new Intent(context, EnterPhone.class));
                dismiss();
            }
        });

        passCodeView = findViewById(R.id.pass_code_view);

        passCodeView.setOnTextChangeListener(new PassCodeView.TextChangeListener() {
            @Override
            public void onTextChanged(String text) {
                if (text.length() == 4) {
                    dismiss();
                    if (text.equals(profileHolder.getPIN())) {
                        context.startActivity(new Intent(context, Home.class));
                    }
                }
            }
        });

        findViewById(R.id.btnReset).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

            }
        });

    }


}
