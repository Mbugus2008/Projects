package com.trimline.paul.datacollector;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SummaryAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private List<ListItem> items;
    private Context context;
    private Map<Summaries.Bydate, Boolean> expandedMap = new HashMap<>();

    public SummaryAdapter(Context context, List<ListItem> items) {
        this.context = context;
        this.items = items;
    }

    @Override
    public int getItemViewType(int position) {
        return items.get(position).type;
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        if (viewType == ListItem.TYPE_GROUP) {
            View view = LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.item_group, parent, false);
            return new GroupViewHolder(view);
        } else {
            View view = LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.item_child, parent, false);
            return new ChildViewHolder(view);
        }
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        ListItem item = items.get(position);

        if (holder instanceof GroupViewHolder) {
            GroupViewHolder gvh = (GroupViewHolder) holder;
            boolean expanded = expandedMap.getOrDefault(item.group, false);
            gvh.bind(item.group, expanded);
            gvh.itemView.setOnClickListener(v -> toggleGroup(item.group, position));
        } else if (holder instanceof ChildViewHolder) {
            ((ChildViewHolder) holder).bind(item.child);
        }
    }

    private void toggleGroup(Summaries.Bydate group, int position) {
        boolean expanded = expandedMap.getOrDefault(group, false);
        if (expanded) {
            for (int i = items.size() - 1; i > position; i--) {
                if (items.get(i).type == ListItem.TYPE_CHILD &&
                        items.get(i).group == group) {
                    items.remove(i);
                }
            }
        } else {
            List<Collection> children = group.Children;
            int index = position;
            for (Collection child : children) {
                items.add(++index, new ListItem(ListItem.TYPE_CHILD, group, child));
            }
        }

        expandedMap.put(group, !expanded);
        notifyDataSetChanged();
    }

    static class GroupViewHolder extends RecyclerView.ViewHolder {
        TextView txtDate, txtTotal;
        ImageView imgIndicator;

        GroupViewHolder(View view) {
            super(view);
            txtDate = view.findViewById(R.id.txtDate);
            txtTotal = view.findViewById(R.id.txtTotal);
            imgIndicator = view.findViewById(R.id.imgIndicator);
        }

        void bind(Summaries.Bydate group, boolean isExpanded) {
            txtDate.setText(group.Date);
            txtTotal.setText(String.format("Total: %.2f", group.Total));
            imgIndicator.setRotation(isExpanded ? 180 : 0);
        }
    }

    static class ChildViewHolder extends RecyclerView.ViewHolder {
        TextView txtName, txtKg;

        ChildViewHolder(View view) {
            super(view);
            txtName = view.findViewById(R.id.txtName);
            txtKg = view.findViewById(R.id.txtKg);
        }

        void bind(Collection c) {
            txtName.setText(c.Farmers_Name);
            txtKg.setText( String.format("%.1f kg",  c.Kg_Collected ));
        }
    }
}
