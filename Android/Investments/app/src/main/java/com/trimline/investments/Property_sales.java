package com.trimline.investments;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.databinding.DataBindingUtil;
import androidx.recyclerview.widget.RecyclerView;

import com.google.gson.annotations.SerializedName;
import com.trimline.investments.databinding.Mybooking;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Property_sales implements Serializable {

    public String Key ;
    public String Transaction_No ;
    public String Member_Category ;
    public String Member_No ;
    public String Member_Name ;
    public String Global_Dimension_1_Code ;
    public String Global_Dimension_2_Code ;
    public String Investment_Account ;
    public String Savings_Account ;
    public float Savings_Account_Balance ;
    public Boolean Savings_Account_BalanceSpecified ;
    public String Category_Name ;
    public float Share_Balance ;
    public Boolean Share_BalanceSpecified ;
    public float Minimum_Share_Balance ;
    public Boolean Minimum_Share_BalanceSpecified ;
    public float Registration_Fee ;
    public Boolean Registration_FeeSpecified ;
    public float Registration_Fee_Paid ;
    public Boolean Registration_Fee_PaidSpecified ;
    public String Sales_Code ;
    public String Sales_Description ;
    public String Project_Code ;
    public String Project_Name ;
    public String Subdivision_Name ;
    public String Subdivision_Code ;
    public String Asset_Code ;
    public String Asset_Name ;
    public String Location ;
    public String Sales_Officer ;
    public String Sales_Officer_Name ;
    public Double Booking_Price ;
    public Boolean Booking_PriceSpecified ;
    public float Proposed_Selling_Price ;
    public Boolean Proposed_Selling_PriceSpecified ;
    public Double Minimum_Deposit ;
    public Boolean Minimum_DepositSpecified ;
    public int Max_Repayment_Period ;
    public Boolean Max_Repayment_PeriodSpecified ;
    public float Commission_Percent ;
    public Boolean Commission_PercentSpecified ;
    public float Commission_Amount ;
    public Boolean Commission_AmountSpecified ;
    public float Deposit_Amount ;
    public Boolean Deposit_AmountSpecified ;
    public float Book_Value ;
    public Boolean Book_ValueSpecified ;
    public float Profit ;
    public Boolean ProfitSpecified ;
    public float Booking_Fee ;
    public Boolean Booking_FeeSpecified ;
    public Payment_Types Payment_Type ;
    public Boolean Payment_TypeSpecified ;
    public float FOSA_Allocated_AMount ;
    public Boolean FOSA_Allocated_AMountSpecified ;
    public float Total_Payment_Amount ;
    public Boolean Total_Payment_AmountSpecified ;
    public int Fixed_Installmenst ;
    public Boolean Fixed_InstallmenstSpecified ;
    public float Selling_Price ;
    public Boolean Selling_PriceSpecified ;
    public String Profit_Receivable_Account ;
    public String Profit_Received_Account ;
    public String Product_Code ;
    public float Minimum_Interest_Rate ;
    public Boolean Minimum_Interest_RateSpecified ;
    public float Principle_Amount ;
    public Boolean Principle_AmountSpecified ;
    public float Interest_Rate ;
    public Boolean Interest_RateSpecified ;
    public int Repayment_Period ;
    public Boolean Repayment_PeriodSpecified ;
    public java.util.Date Repayment_Start_Date ;
    public Boolean Repayment_Start_DateSpecified ;
    public java.util.Date Repayment_End_Date ;
    public Boolean Repayment_End_DateSpecified ;
    public float Principle_Repayment ;
    public Boolean Principle_RepaymentSpecified ;
    public float Interest_Repayment ;
    public Boolean Interest_RepaymentSpecified ;
    public float Total_Repayment ;
    public Boolean Total_RepaymentSpecified ;
    public float Allocated_Booking ;
    public Boolean Allocated_BookingSpecified ;
    public float Allocated_Deposit ;
    public Boolean Allocated_DepositSpecified ;
    public float Allocated_Price ;
    public Boolean Allocated_PriceSpecified ;
    public java.util.Date Booking_Date ;
    public Boolean Booking_DateSpecified ;
    public java.util.Date Deposits_Due_Date ;
    public Boolean Deposits_Due_DateSpecified ;
    public String Action_ID ;
    public Approval_Status Approval_Status ;
    public Boolean Approval_StatusSpecified ;
    public int Approval_Loop ;
    public Boolean Approval_LoopSpecified ;
    public int Current_Level ;
    public Boolean Current_LevelSpecified ;
    public String Created_By ;


    public java.util.Date Created_On ;
    public Boolean Created_OnSpecified ;
    public Pre_Sale[] Pre_Sales ;

    public static class Pre_Sale {
        public String Key;
        public String Transaction_No;
        public Allocation_Type Allocation_Type;
        public Boolean Allocation_TypeSpecified;
        public String Refrence_No;
        public String Posting_Description;
        public java.util.Date Posting_Date;
        public Boolean Posting_DateSpecified;
        public Double Amount;
        public Boolean AmountSpecified;
        public String Payment_Method;
        public Bal_Account_Type Bal_Account_Type;
        public Boolean Bal_Account_TypeSpecified;
        public String Bal_Account_No;
        public String Bal_Account_Name;
        public String Member_No ;

    }
    public enum Allocation_Type {

        /// <remarks/>
        @SerializedName("0")
        _blank_,

        /// <remarks/>
        @SerializedName("1")
        Booking,

        /// <remarks/>
        @SerializedName("2")
        Deposit,

        /// <remarks/>
        @SerializedName("3")
        Repayment,
    }
    public enum Bal_Account_Type {

        /// <remarks/>
        _blank_,

        /// <remarks/>
        Bank_Account,

        /// <remarks/>
        Member_Account,
    }
    public enum Payment_Types {

        /// <remarks/>
        @SerializedName("0")
        Cash("Cash"),

        /// <remarks/>
        @SerializedName("1")
        Credit("Credit"),

        /// <remarks/>
        @SerializedName("2")
        FOSA_Deposit("Fosa Deposit"),

        /// <remarks/>
        @SerializedName("3")
        Fixed_Installment("Fixed Installment");
        String name;
        Payment_Types(String Name)
        {this.name = Name ;  }
        @Override
        public String toString(){return name;
        }
    }
    public enum Approval_Status {

        /// <remarks/>
        New,

        /// <remarks/>
        Approval_Pending,

        /// <remarks/>
        Approved,
    }

    public static class adapter extends RecyclerView.Adapter<adapter.NoteHolder> {
        private List<Property_sales> notes = new ArrayList<>();
        Mybooking binding;
        boolean isFABOpen = false;
        private OnItemClickListener listener;

        @NonNull
        @Override
        public NoteHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

            this.binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.activity_my_booking_line, parent, false);

            return new NoteHolder(binding);
        }

        @Override
        public void onBindViewHolder(@NonNull NoteHolder holder, int position) {

            Property_sales currentNote = notes.get(position);
            holder.bind(currentNote);



        }


        @Override
        public int getItemCount() {
            return notes.size();
        }

        public Property_sales getTransAt(int position) {
            return notes.get(position);
        }

        public void setTrans(List<Property_sales> notes) {
            this.notes = notes;
            notifyDataSetChanged();
        }

        class NoteHolder extends RecyclerView.ViewHolder {
            private Mybooking binding;
            ConstraintLayout grouptrans;
            public NoteHolder(Mybooking itemView) {
                super(itemView.getRoot());
                this.binding = itemView;

                itemView.getRoot().setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (listener != null && position != RecyclerView.NO_POSITION) {
                            listener.onItemClick(notes.get(position));
                        }
                    }
                });
            }
            public void bind(Property_sales object) {
                binding.setBooking (object);
                binding.executePendingBindings();
            }
        }
        public interface OnItemClickListener {
            void onItemClick(Property_sales note);
        }
        public void setOnItemClickListener(OnItemClickListener listener) {
            this.listener = listener;
        }
    }
}
