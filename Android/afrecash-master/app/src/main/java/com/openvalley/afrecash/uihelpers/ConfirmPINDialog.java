package com.openvalley.afrecash.uihelpers;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.View;

import androidx.recyclerview.widget.RecyclerView;

import com.openvalley.afrecash.R;
import com.openvalley.afrecash.listeners.PINListener;

import in.arjsna.passcodeview.PassCodeView;

/**
 * Created by @GeekNat on 4/18/17.
 */

public class ConfirmPINDialog extends Dialog {

    private RecyclerView recyclerView;
    private Context context;
    PassCodeView passCodeView;
    PINListener pinListener;
    boolean hasSent = false;

    public ConfirmPINDialog(Context context, PINListener pinListener) {
        super(context, R.style.AppThemeWhite_Light);
        this.context = context;
        this.pinListener = pinListener;
        show();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_confirm_pin);

        findViewById(R.id.btnCancel).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dismiss();
                pinListener.onPINCancelled();
            }
        });

        passCodeView = findViewById(R.id.pass_code_view);
        passCodeView.setOnTextChangeListener(new PassCodeView.TextChangeListener() {
            @Override
            public void onTextChanged(String text) {
                if (text.length() == 4) {
                    dismiss();
                    if (!hasSent) {
                        hasSent = true;
                        pinListener.onPINSet(text);
                    }
                }
            }
        });


    }


}
