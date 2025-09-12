package com.mobile.afrecash.adapters;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.mobile.afrecash.R;
import com.mobile.afrecash.activities.ViewLoan;
import com.mobile.afrecash.datasets.Loan;
import com.mobile.afrecash.utils.Utils;

import java.util.ArrayList;

/**
 * Created by @GeekNat on 4/17/17.
 */

public class LoanAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private Context context;
    private ArrayList<Loan> contentItems;
    private static final int EMPTY_VIEW = 100;
    private static final int DATA_VIEW = 200;

    public LoanAdapter(Context context, ArrayList<Loan> statementHolders) {
        this.context = context;
        this.contentItems = statementHolders;
        setHasStableIds(true);
    }

    private int getSizeOfItems() {
        return contentItems.size();
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public int getItemViewType(int position) {
        return getSizeOfItems() == 0 ? EMPTY_VIEW : DATA_VIEW;
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return viewType == DATA_VIEW ?
                new ContentViewHolder(LayoutInflater.from(context).inflate(R.layout.loan_item, parent, false)) :
                new EmptyViewHolder(LayoutInflater.from(context).inflate(R.layout.empty_item, parent, false));
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
        if (getSizeOfItems() == 0) {
            EmptyViewHolder emptyHolder = (EmptyViewHolder) holder;
            emptyHolder.tItemName.setText("No loans at the moment...");
            emptyHolder.tSub.setText("All your loans will be displayed here when available...");
        } else {

            final Loan contentItem = contentItems.get(position);
            ContentViewHolder contentViewHolder = (ContentViewHolder) holder;
            contentViewHolder.tLoanNumber.setText(contentItem.getApplicationDate());
            contentViewHolder.tAmount.setText(String.format("KShs %s", Utils.formatNumber(String.valueOf(contentItem.getApprovedAmount()))));
            contentViewHolder.tStatus.setText(contentItem.getOutstandingBalance() <= 0 ? "CLEARED" : "PENDING");

            contentViewHolder.cardView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    context.startActivity(new Intent(context, ViewLoan.class).putExtra("loan", contentItem));
                }
            });
        }
    }

    @Override
    public int getItemCount() {
        return getSizeOfItems() == 0 ? 1 : contentItems.size();
    }

    private static class ContentViewHolder extends RecyclerView.ViewHolder {
        TextView tLoanNumber, tAmount, tStatus;
        CardView cardView;

        ContentViewHolder(View itemView) {
            super(itemView);
            tLoanNumber = itemView.findViewById(R.id.loan_number);
            tAmount = itemView.findViewById(R.id.amount);
            tStatus = itemView.findViewById(R.id.status);
            cardView = itemView.findViewById(R.id.card_view);
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
