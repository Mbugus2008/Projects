package com.trimline.investors;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.databinding.DataBindingUtil;
import androidx.recyclerview.widget.RecyclerView;

import com.trimline.investors.databinding.Loansbinding;
import com.trimline.investors.databinding.Vehilebinding;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Loans {
    public String Key ;
    public String Credit_Number ;
    public String Credit_Type ;
    public String Product_Name ;
    public String Client_Code ;
    public String Client_Name ;
    public Double Credit_Request_Amount ;
    public Double Credit_Approved_Amount ;
    public Double Monthly_Repayment ;
    public Double Monthly_Principal_Repayment ;
    public Double Monthly_Interest_Repayment ;
    public Double Credit_Balance ;
    public Double Interest_Balance ;
    public Date Credit_Application_Date ;
    public Date Credit_Disbursement_Date ;
    public String Vehicle ;
    public Double Daily_Repayment ;
    public Double Paid_Today;
    public String Fleet_No ;
    public static class adapter extends RecyclerView.Adapter<adapter.Holder> implements IDataChangeListener {
        private List<Loans> data = new ArrayList<>();
        private adapter.OnItemClickListener listener;

        Loansbinding binding;
        Context c;
        Activity a;

        public adapter(Context cc) {

            this.c = cc;
        }

        @NonNull
        @Override
        public adapter.Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.loans, parent, false);

            return new adapter.Holder(parent, binding);
        }
        @Override
        public void onBindViewHolder(@NonNull adapter.Holder holder, int position) {
            Loans current = data.get(position);
            holder.bind(current);


        }
        @Override
        public void onEditTextChanged(String planetName) {
        }

        @Override
        public int getItemCount() {
            return data.size();
        }

        public void sett_line(List<Loans> advance) {
            this.data = advance;
            notifyDataSetChanged();
        }

        class Holder extends RecyclerView.ViewHolder {
            private Loansbinding binding;

            public Holder(@NonNull ViewGroup parent, Loansbinding itemView) {
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

            public void bind(Loans object) {
                binding.setL(object);
                binding.executePendingBindings();
            }

            public Loansbinding getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Loans note);
        }
        public void setOnItemClickListener(adapter.OnItemClickListener listener) {
            this.listener = listener;
        }
    }
}
