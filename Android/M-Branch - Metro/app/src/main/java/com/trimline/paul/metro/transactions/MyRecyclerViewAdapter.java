package com.trimline.paul.metro.transactions;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.trimline.paul.metro.R;
import com.trimline.paul.metro.transaction;

import java.util.List;

public class MyRecyclerViewAdapter extends RecyclerView.Adapter<MyRecyclerViewAdapter.ViewHolder> {

    private List<transaction> dataList;
    private OnItemClickListener listener;

    public interface OnItemClickListener {
        void onItemClick(transaction item);
    }

    public MyRecyclerViewAdapter(List<transaction> dataList, OnItemClickListener listener) {
        this.dataList = dataList;
        this.listener = listener;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.vehdetails, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        transaction item = dataList.get(position);
        holder.time.setText(item.Time);
        holder.type.setText(item.Type);
        holder.agent.setText(item.Agent_Code);
        holder.amount.setText(String.format("%,.2f",item.getAmount() ) );
        holder.itemView.setOnClickListener(v -> listener.onItemClick(item));
    }

    @Override
    public int getItemCount() {
        return dataList.size();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        TextView time,type,agent,amount;

        public ViewHolder(View itemView) {
            super(itemView);
            time = itemView.findViewById(R.id.time);
            type = itemView.findViewById(R.id.trans);
            agent = itemView.findViewById(R.id.agent);
            amount = itemView.findViewById(R.id.amount);

        }
    }
}
