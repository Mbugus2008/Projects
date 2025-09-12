package com.openvalley.afrecash.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.openvalley.afrecash.R;
import com.openvalley.afrecash.datasets.StatementHolder;

import java.util.ArrayList;

/**
 * Created by @GeekNat on 4/17/17.
 */

public class StatementAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private Context context;
    private ArrayList<StatementHolder> contentItems;
    private static final int EMPTY_VIEW = 100;
    private static final int DATA_VIEW = 200;

    public StatementAdapter(Context context, ArrayList<StatementHolder> statementHolders) {
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
                new ContentViewHolder(LayoutInflater.from(context).inflate(R.layout.statement, parent, false)) :
                new EmptyViewHolder(LayoutInflater.from(context).inflate(R.layout.empty_item, parent, false));
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
        if (getSizeOfItems() == 0) {
            EmptyViewHolder emptyHolder = (EmptyViewHolder) holder;
            emptyHolder.tItemName.setText("No statement at the moment...");
            emptyHolder.tSub.setText("All your account activity will be displayed here when available...");
        } else {

            StatementHolder contentItem = contentItems.get(position);
            ContentViewHolder contentViewHolder = (ContentViewHolder) holder;
            contentViewHolder.tText.setText(contentItem.getText());
        }
    }

    @Override
    public int getItemCount() {
        return getSizeOfItems() == 0 ? 1 : contentItems.size();
    }

    private static class ContentViewHolder extends RecyclerView.ViewHolder {
        TextView tText;

        ContentViewHolder(View itemView) {
            super(itemView);
            tText = itemView.findViewById(R.id.text);
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
