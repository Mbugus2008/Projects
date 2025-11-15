package com.trimline.paul.metro.reports;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.trimline.paul.metro.R;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Locale;

public class AgentTypeSummaryAdapter extends BaseAdapter {
    private final Context context;
    private final List<AgentTypeSummary> data;
    private final LayoutInflater inflater;

    public AgentTypeSummaryAdapter(Context context, List<AgentTypeSummary> data) {
        this.context = context;
        this.data = data;
        this.inflater = LayoutInflater.from(context);
    }

    @Override
    public int getCount() {
        return data.size();
    }

    @Override
    public AgentTypeSummary getItem(int position) {
        return data.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;

        if (convertView == null) {
            convertView = inflater.inflate(R.layout.item_agent_type, parent, false);
            holder = new ViewHolder();
            holder.agentNameView = convertView.findViewById(R.id.agentName);
            holder.typeView = convertView.findViewById(R.id.type);
            holder.amountView = convertView.findViewById(R.id.amount);
            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }

        AgentTypeSummary item = getItem(position);
        holder.agentNameView.setText(item.getAgentCode());
        holder.typeView.setText(item.getType());

        DecimalFormat formatter = new DecimalFormat("#,##0.00");
        String formattedAmount = formatter.format(item.getAmount());
        holder.amountView.setText(formattedAmount);

        return convertView;
    }

    private static class ViewHolder {
        TextView agentNameView;
        TextView typeView;
        TextView amountView;
    }
}
