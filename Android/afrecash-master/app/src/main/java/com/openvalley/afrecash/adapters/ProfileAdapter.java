package com.openvalley.afrecash.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.openvalley.afrecash.R;
import com.openvalley.afrecash.datasets.ProfileHolder;
import com.openvalley.afrecash.listeners.PINListener;
import com.openvalley.afrecash.network.Connect;
import com.openvalley.afrecash.uihelpers.ConfirmPINDialog;
import com.openvalley.afrecash.utils.ResponseHandler;
import com.openvalley.afrecash.utils.Utils;

/**
 * Created by @GeekNat on 4/17/17.
 */

public class ProfileAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private Context context;
    private ProfileHolder profileHolder;
    private static final int DATA_VIEW = 200;
    private ResponseHandler responseHandler;
    private boolean hasSent = false;

    public ProfileAdapter(Context context) {
        this.context = context;
        this.profileHolder = new ProfileHolder(context);
        this.responseHandler = new ResponseHandler(context);
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
                new ContentViewHolder(LayoutInflater.from(context).inflate(R.layout.fragment_profile, parent, false)) :
                new EmptyViewHolder(LayoutInflater.from(context).inflate(R.layout.empty_item, parent, false));
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, final int position) {
        ContentViewHolder contentViewHolder = (ContentViewHolder) holder;
        if (!profileHolder.getPhoto().equals("")) {
            Utils.displayImage(contentViewHolder.imageView, Connect.url + profileHolder.getPhoto());
        }

        contentViewHolder.tName.setText(profileHolder.getFirstName());
        contentViewHolder.tIdNumber.setText(profileHolder.getIDNumber());
        contentViewHolder.tANo.setText(profileHolder.getPhone());
        contentViewHolder.tAddress.setText(profileHolder.getAddress());
        contentViewHolder.tRegion.setText(profileHolder.getRegionName());

        contentViewHolder.btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new ConfirmPINDialog(context, new PINListener() {
                    @Override
                    public void onPINSet(String PIN) {
                        if (PIN.equals(profileHolder.getPIN())) {
                            responseHandler.showToast("Check");
                        } else {
                            responseHandler.showToast("Try again");
                        }
                    }

                    @Override
                    public void onPINCancelled() {

                    }
                });
            }
        });
    }

    @Override
    public int getItemCount() {
        return 1;
    }

    private static class ContentViewHolder extends RecyclerView.ViewHolder {
        TextView tName, tIdNumber, tANo, tAddress,tRegion;
        ImageView imageView;
        Button btn;

        ContentViewHolder(View view) {
            super(view);
            imageView = view.findViewById(R.id.userImage);
            tName = view.findViewById(R.id.full_name);
            tIdNumber = view.findViewById(R.id.id_number);
            tANo = view.findViewById(R.id.account_no);
            tAddress = view.findViewById(R.id.email);
            tRegion = view.findViewById(R.id.gName);
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
