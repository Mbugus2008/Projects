package com.openvalley.afrecash.adapters;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.openvalley.afrecash.R;
import com.openvalley.afrecash.activities.MyLoans;
import com.openvalley.afrecash.activities.RequestLoan;
import com.openvalley.afrecash.activities.ViewLoan;
import com.openvalley.afrecash.datasets.HomeHolder;
import com.openvalley.afrecash.uihelpers.PayLoanDialog;

/**
 * Created by @GeekNat on 4/17/17.
 */

public class HomeAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private Context context;
    private HomeHolder homeHolder;
    private static final int OVERVIEW = 100;
    private static final int STATUS = 200;

    public HomeAdapter(Context context, HomeHolder homeHolder) {
        this.context = context;
        this.homeHolder = homeHolder;
        setHasStableIds(true);
    }


    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public int getItemViewType(int position) {
        switch (position) {
            case 0:
                return STATUS;
            case 1:
                return OVERVIEW;
        }

        return STATUS;
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        switch (viewType) {
            case OVERVIEW:
                return new LoanOverviewHolder(LayoutInflater.from(context).inflate(R.layout.loan_overview, parent, false));
            case STATUS:
                return new LoanStatusHolder(LayoutInflater.from(context).inflate(R.layout.loan_status, parent, false));

        }
        return null;
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {

        if (holder instanceof LoanStatusHolder) {

            LoanStatusHolder loanStatusHolder = (LoanStatusHolder) holder;

            if (homeHolder.getBtnText().isEmpty()) {
                loanStatusHolder.btn.setVisibility(View.GONE);
            } else {
                loanStatusHolder.btn.setVisibility(View.VISIBLE);
                loanStatusHolder.btn.setText(homeHolder.getBtnText());
                loanStatusHolder.btn.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        if (homeHolder.getBtnText().equals("Request for a loan")) {
                            context.startActivity(new Intent(context, RequestLoan.class));
                        }

                        if (homeHolder.getBtnText().equals("Make loan repayment")) {
                            new PayLoanDialog(context,  homeHolder.getLoanHolder());
                        }

                        if (homeHolder.getBtnText().equals("VIEW LOAN")) {
                            context.startActivity(new Intent(context, ViewLoan.class).putExtra("loan", homeHolder.getLoanHolder()));
                        }


                    }
                });
            }

            loanStatusHolder.tHeader.setText(homeHolder.getHeaderText());
            loanStatusHolder.tFooter.setText(homeHolder.getFooterText());
            loanStatusHolder.tAmount.setText(homeHolder.getHeaderAmount());

        }

        if (holder instanceof LoanOverviewHolder) {

            LoanOverviewHolder loanOverviewHolder = (LoanOverviewHolder) holder;
            loanOverviewHolder.tOngoing.setText(homeHolder.getOngoingLoans());
            loanOverviewHolder.tRejected.setText(homeHolder.getRejectedLoans());
            loanOverviewHolder.tPending.setText(homeHolder.getPendingLoans());
            loanOverviewHolder.tPaid.setText(homeHolder.getPaidLoans());
            loanOverviewHolder.tDefaulted.setText(homeHolder.getDefaultedLoans());
            loanOverviewHolder.btn.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    context.startActivity(new Intent(context, MyLoans.class));
                }
            });
        }

    }

    @Override
    public int getItemCount() {
        return 1;
    }

    private static class LoanOverviewHolder extends RecyclerView.ViewHolder {
        TextView tOngoing, tPaid, tPending, tDefaulted, tRejected;
        Button btn;

        LoanOverviewHolder(View itemView) {
            super(itemView);
            tOngoing = itemView.findViewById(R.id.ongoing_loans);
            tPaid = itemView.findViewById(R.id.paid_loans);
            tPending = itemView.findViewById(R.id.pending_loans);
            tDefaulted = itemView.findViewById(R.id.defaulted_loans);
            tRejected = itemView.findViewById(R.id.rejected_loans);
            btn = itemView.findViewById(R.id.btnProceed);
        }
    }

    public static class LoanStatusHolder extends RecyclerView.ViewHolder {
        TextView tHeader, tAmount, tFooter;
        Button btn;

        public LoanStatusHolder(View itemView) {
            super(itemView);
            tHeader = itemView.findViewById(R.id.header);
            tAmount = itemView.findViewById(R.id.amount);
            tFooter = itemView.findViewById(R.id.footer);
            btn = itemView.findViewById(R.id.btnProceed);
        }
    }
}
