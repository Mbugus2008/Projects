package com.trimline.investors;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.databinding.DataBindingUtil;
import androidx.recyclerview.widget.RecyclerView;

import com.trimline.investors.databinding.Vehilebinding;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Vehicle implements Serializable {
    public String Key ;
    public String Vehicle_Number ;
    public Vehicle_Type Vehicle_Type ;
    public Boolean Vehicle_TypeSpecified ;
    public double Daily_Contribution ;
    public Boolean Daily_ContributionSpecified ;
    public Date Start_Date ;
    public Boolean Start_DateSpecified ;
    public String Code ;
    public String Id_Number ;
    public String Fleet_No ;
    public Double Todays_Collection;
    public enum Vehicle_Type {

        /// <remarks/>
        _x0031_4_Seater,

        /// <remarks/>
        _x0033_3_Seater,

        /// <remarks/>
        _x0032_5_Seater,

        /// <remarks/>
        _x0032_9_Seater,

        /// <remarks/>
        _41_Seater,

        /// <remarks/>
        _26_Seater,

        /// <remarks/>
        _37_Seater,
    }

    public static class adapter extends RecyclerView.Adapter<adapter.Holder> implements IDataChangeListener {
        private List<Vehicle> data = new ArrayList<>();
        private adapter.OnItemClickListener listener;

        Vehilebinding binding;
        Context c;
        Activity a;

        public adapter(Context cc) {

            this.c = cc;
        }

        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.vehicle, parent, false);

            return new Holder(parent, binding);
        }
        @Override
        public void onBindViewHolder(@NonNull Holder holder, int position) {
            Vehicle current = data.get(position);
            holder.bind(current);


        }
        @Override
        public void onEditTextChanged(String planetName) {
        }

        @Override
        public int getItemCount() {
            return data.size();
        }

        public void sett_line(List<Vehicle> advance) {
            this.data = advance;
            notifyDataSetChanged();
        }

        class Holder extends RecyclerView.ViewHolder {
            private Vehilebinding binding;

            public Holder(@NonNull ViewGroup parent, Vehilebinding itemView) {
                super(itemView.getRoot());

                this.binding = itemView;

                itemView.getRoot().setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (listener != null && position != RecyclerView.NO_POSITION) {
                            listener.onItemClick(data.get(position));
                        }
                    }
                });


            }

            public void bind(Vehicle object) {
                binding.setV(object);
                binding.executePendingBindings();
            }

            public Vehilebinding getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Vehicle note);
        }
        public void setOnItemClickListener(adapter.OnItemClickListener listener) {
            this.listener = listener;
        }
    }
}
