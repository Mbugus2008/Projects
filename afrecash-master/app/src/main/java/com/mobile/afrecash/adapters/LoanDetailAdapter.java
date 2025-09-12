package com.mobile.afrecash.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.mobile.afrecash.R;
import com.mobile.afrecash.datasets.Loan;
import com.mobile.afrecash.uihelpers.PayLoanDialog;
import com.mobile.afrecash.utils.Utils;

/**
 * Created by @GeekNat on 4/17/17.
 */

public class LoanDetailAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private Context context;
    private static final int DATA_VIEW = 200;
    private Loan loanHolder;

    public LoanDetailAdapter(Context context, Loan loanHolder) {
        this.context = context;
        this.loanHolder = loanHolder;
        setHasStableIds(true);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public int getItemViewType(int position) {
        return DATA_VIEW;
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return viewType == DATA_VIEW ?
                new ContentViewHolder(LayoutInflater.from(context).inflate(R.layout.fragment_loan_details, parent, false)) :
                new EmptyViewHolder(LayoutInflater.from(context).inflate(R.layout.empty_item, parent, false));
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
        ContentViewHolder contentViewHolder = (ContentViewHolder) holder;
        contentViewHolder.tToBePaidBy.setText(loanHolder.getClientName());
        contentViewHolder.tDateRequested.setText(loanHolder.getApplicationDate());
        contentViewHolder.tStatus.setText(loanHolder.getOutstandingBalance() <= 0 ? "CLEARED" : "PENDING");
        contentViewHolder.tAmount.setText(String.format("KShs %s", Utils.formatNumber(String.valueOf(loanHolder.getApprovedAmount()))));
        contentViewHolder.tFullAmount.setText(String.format("KShs %s", Utils.formatNumber(String.valueOf(loanHolder.getOutstandingBalance()))));
        contentViewHolder.tLoanAmount.setText(String.format("KShs %s", Utils.formatNumber(String.valueOf(loanHolder.getApprovedAmount()))));
        contentViewHolder.tInterest.setText(String.format("KShs %s", Utils.formatNumber(String.valueOf(loanHolder.getOutstandingInterest()))));

        contentViewHolder.btn.setVisibility(View.GONE);

        if (loanHolder.getOutstandingBalance() > 0) {
            contentViewHolder.btn.setVisibility(View.VISIBLE);
        }

        contentViewHolder.btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new PayLoanDialog(context, loanHolder);
            }
        });

    }

    @Override
    public int getItemCount() {
        return 1;
    }

    private static class ContentViewHolder extends RecyclerView.ViewHolder {
        TextView tAmount, tLoanAmount, tStatus, tDuration, tPrincipal, tInterest,
                tFullAmount, tAmountRepaid, tDateRequested, tToBePaidBy;
        Button btn;

        ContentViewHolder(View view) {
            super(view);

            tAmount = view.findViewById(R.id.amount);
            tLoanAmount = view.findViewById(R.id.loan_amount);
            tStatus = view.findViewById(R.id.status);
            tDuration = view.findViewById(R.id.duration);
            tPrincipal = view.findViewById(R.id.monthly_principal);
            tInterest = view.findViewById(R.id.monthly_interest);
            tFullAmount = view.findViewById(R.id.full_amount);
            tAmountRepaid = view.findViewById(R.id.amount_repaid);
            tDateRequested = view.findViewById(R.id.date_requested);
            tToBePaidBy = view.findViewById(R.id.due_date);
            btn = view.findViewById(R.id.btnProceed);
        }

    }

    private static class EmptyViewHolder extends RecyclerView.ViewHolder {
        TextView tItemName, tSub;

        EmptyViewHolder(View itemView) {
            super(itemView);
            tItemName = itemView.findViewById(R.id.itemName);
            tSub = itemView.findViewById(R.id.subItemName);
        }
    }
}
