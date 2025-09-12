package com.openvalley.afrecash.uihelpers;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.openvalley.afrecash.R;
import com.openvalley.afrecash.listeners.PINListener;
import com.openvalley.afrecash.utils.ResponseHandler;

import in.arjsna.passcodeview.PassCodeView;

/**
 * Created by @GeekNat on 4/18/17.
 */

public class SetPINDialog extends Dialog {

    private RecyclerView recyclerView;
    private Context context;
    PassCodeView passCodeView;
    PINListener pinListener;
    TextView tTitle;
    String title;
    boolean confirmPIN = false;
    int numberOfInput = 1;
    String pinOne;
    ResponseHandler responseHandler;

    public SetPINDialog(Context context, PINListener pinListener, String title, boolean confirmPIN) {
        super(context, R.style.AppThemeWhite_Light);
        this.context = context;
        this.title = title;
        this.pinListener = pinListener;
        this.confirmPIN = confirmPIN;
        this.responseHandler = new ResponseHandler(context);
        show();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dialog_pin);

        findViewById(R.id.btnCancel).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dismiss();
            }
        });
        tTitle = findViewById(R.id.title);

        tTitle.setText(title);

        passCodeView = findViewById(R.id.pass_code_view);
        passCodeView.setOnTextChangeListener(new PassCodeView.TextChangeListener() {
            @Override
            public void onTextChanged(String text) {
                if (text.length() == 4) {

                    if (confirmPIN && numberOfInput == 1) {
                        pinOne = text;
                        passCodeView.reset();
                        numberOfInput = numberOfInput + 1;
                        tTitle.setText("Confirm Your PIN");
                        return;
                    }

                    if (confirmPIN && numberOfInput == 2) {
                        if (!text.equals(pinOne)) {
                            responseHandler.showToast("PIN do not match");
                            return;
                        }
                    }

                    dismiss();
                    pinListener.onPINSet(text);
                }
            }
        });


    }


}
