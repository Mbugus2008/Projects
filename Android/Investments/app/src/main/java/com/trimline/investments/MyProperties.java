package com.trimline.investments;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.widget.PopupMenu;
import androidx.databinding.BindingAdapter;
import androidx.databinding.DataBindingUtil;
import androidx.recyclerview.widget.RecyclerView;

import com.trimline.investments.databinding.MyProperty;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class MyProperties {
    public String Key ;
    public String Application_No ;
    public String Loan_Product;
    public String Product_Description ;
    public String Member_No;
    public String Member_Name;
    public java.util.Date Application_Date ;
    public Boolean Application_DateSpecified ;
    public String Credit_Officer ;
    public String Credit_Officer_Name ;
    public float Principle_Amount ;
    public Boolean Principle_AmountSpecified ;
    public Boolean Protected_Member ;
    public Boolean Protected_MemberSpecified ;
    public int Loan_Status ;
    public Boolean Loan_StatusSpecified ;
    public float Minimum_Loan_Amount ;
    public Boolean Minimum_Loan_AmountSpecified ;
    public float Max_Loan_Amount ;
    public Boolean Max_Loan_AmountSpecified ;
    public float Min_Interest_Rate ;
    public Boolean Min_Interest_RateSpecified ;
    public int Max_Repayment_Period ;
    public Boolean Max_Repayment_PeriodSpecified ;
    public String Grace_Period ;
    public java.util.Date Posting_Date ;
    public Boolean Posting_DateSpecified ;
    public java.util.Date Repayment_Start_Date ;
    public Boolean Repayment_Start_DateSpecified ;
    public float Interest_Rate ;
    public Boolean Interest_RateSpecified ;
    public int Repayment_Period_M ;
    public Boolean Repayment_Period_MSpecified ;
    public java.util.Date Repayment_End_Date ;
    public Boolean Repayment_End_DateSpecified ;
    public float Total_Principle_Repayment ;
    public Boolean Total_Principle_RepaymentSpecified ;
    public float Total_Interest_Repayment ;
    public Boolean Total_Interest_RepaymentSpecified ;
    public float Total_Loan_Repayment ;
    public Boolean Total_Loan_RepaymentSpecified ;
    public String Loan_No ;
    public int Mode_of_Disbursement ;
    public Boolean Mode_of_DisbursementSpecified ;
    public String Disbursement_Account ;
    public float External_Clearances ;
    public Boolean External_ClearancesSpecified ;
    public float External_Clearances_Commission ;
    public Boolean External_Clearances_CommissionSpecified ;
    public Boolean Pays_PAYE ;
    public Boolean Pays_PAYESpecified ;
    public Boolean Enforce_Speed_Charge ;
    public Boolean Enforce_Speed_ChargeSpecified ;
    public String Payslip_Month ;
    public float Qualified_Amount ;
    public Boolean Qualified_AmountSpecified ;
    public float Loan_Balance ;
    public Boolean Loan_BalanceSpecified ;
    public String Source_Code ;
    public int Status ;
    public Boolean StatusSpecified ;
    public String Control_Account ;
    public float Internal_Deductions ;
    public Boolean Internal_DeductionsSpecified ;
    public float Internal_Deduction_Commision ;
    public Boolean Internal_Deduction_CommisionSpecified ;
    public float Total_Guaranteed ;
    public Boolean Total_GuaranteedSpecified ;
    public float Total_Securities ;
    public Boolean Total_SecuritiesSpecified ;
    public java.util.Date Last_Capitalized_Date ;
    public Boolean Last_Capitalized_DateSpecified ;
    public java.util.Date Next_Capitalized_Date ;
    public Boolean Next_Capitalized_DateSpecified ;
    public java.util.Date Next_Principle_Installment ;
    public Boolean Next_Principle_InstallmentSpecified ;
    public String Created_By ;
    public java.util.Date Created_On ;
    public Boolean Created_OnSpecified ;
    public String Last_Updated_By ;
    public java.util.Date Last_Updated_On ;
    public Boolean Last_Updated_OnSpecified ;
    public int Current_Level ;
    public Boolean Current_LevelSpecified ;
    public int Approval_Loop ;
    public Boolean Approval_LoopSpecified ;
    public String Action_ID ;
    public int Approval_Status ;
    public Boolean Approval_StatusSpecified ;
    public java.util.Date Last_Open_Interest_Due_Date ;
    public Boolean Last_Open_Interest_Due_DateSpecified ;
    public int Defaulted_Days ;
    public Boolean Defaulted_DaysSpecified ;
    public float Monthly_Installment ;
    public Boolean Monthly_InstallmentSpecified ;
    public String Staff_No ;
    public float Speed_Charge_Amnt ;
    public Boolean Speed_Charge_AmntSpecified ;
    public int Max_Installments ;
    public Boolean Max_InstallmentsSpecified ;
    public float Rebate_Amount ;
    public Boolean Rebate_AmountSpecified ;
    public float Insurance_Amount ;
    public Boolean Insurance_AmountSpecified ;
    public float Total_Deductions ;
    public Boolean Total_DeductionsSpecified ;
    public float Net_Payout ;
    public Boolean Net_PayoutSpecified ;
    public String To_Be_Cleared_By ;
    public int Repayment_Intalments_Base ;
    public Boolean Repayment_Intalments_BaseSpecified ;
    public float Total_Principle_Arrears ;
    public Boolean Total_Principle_ArrearsSpecified ;
    public float Accrued_Interest ;
    public Boolean Accrued_InterestSpecified ;
    public int BOSA_FOSA ;
    public Boolean BOSA_FOSASpecified ;
    public int Days_to_End_Month ;
    public Boolean Days_to_End_MonthSpecified ;
    public int Approval_Entries ;
    public Boolean Approval_EntriesSpecified ;
    public String Batch_ID ;
    public java.util.Date Date_Filter ;
    public Boolean Date_FilterSpecified ;
    public String Global_Dimension_1_Code ;
    public String Global_Dimension_2_Code ;
    public Boolean Variated ;
    public Boolean VariatedSpecified ;
    public java.util.Date Last_Variation_Date ;
    public Boolean Last_Variation_DateSpecified ;
    public String Previous_Loan_No ;
    public float Balance_at_Reschedule ;
    public Boolean Balance_at_RescheduleSpecified ;
    public float Total_Interest_Due ;
    public Boolean Total_Interest_DueSpecified ;
    public float Total_Interest_Paid ;
    public Boolean Total_Interest_PaidSpecified ;
    public float Total_Principl_Paid ;
    public Boolean Total_Principl_PaidSpecified ;
    public float Total_Principle_Bill_Due ;
    public Boolean Total_Principle_Bill_DueSpecified ;
    public int Posted_Entries ;
    public Boolean Posted_EntriesSpecified ;
    public float Control_Account_Balance ;
    public Boolean Control_Account_BalanceSpecified ;
    public Boolean Top_Up ;
    public Boolean Top_UpSpecified ;
    public java.util.Date Rescheduled_Date ;
    public Boolean Rescheduled_DateSpecified ;
    public java.util.Date Last_Open_Principle ;
    public Boolean Last_Open_PrincipleSpecified ;
    public java.util.Date Open_Interest_Paid ;
    public Boolean Open_Interest_PaidSpecified ;
    public String Employer_Code ;
    public java.util.Date Date_In_Arrears ;
    public Boolean Date_In_ArrearsSpecified ;
    public java.util.Date Marturity_Date ;
    public Boolean Marturity_DateSpecified ;
    public String KRA_PIN_No ;
    public Boolean Loan_Purpose_Filled ;
    public Boolean Loan_Purpose_FilledSpecified ;
    public String Bill_Code_Filter ;
    public Boolean Bill_Exist ;
    public Boolean Bill_ExistSpecified ;
    public Boolean Installments_Changed ;
    public Boolean Installments_ChangedSpecified ;
    public int Default_Installments ;
    public Boolean Default_InstallmentsSpecified ;
    public float Outstanding_Principle ;
    public Boolean Outstanding_PrincipleSpecified ;
    public String Premature_Interest_No ;
    public Boolean Premature_Interest_Posted ;
    public Boolean Premature_Interest_PostedSpecified ;
    public float Outstanding_Loans ;
    public Boolean Outstanding_LoansSpecified ;
    public int Source_Type ;
    public Boolean Source_TypeSpecified ;
    public String Project_Code ;
    public String Sales_Code ;
    public String Project_Description ;
    public String Title_Deed ;
    public String Asset_Code ;
    public String Asset_Name ;
    /// <remarks/>
    public String Plot_No ;

    public String getProjectname_plot_No() {
        return String.format("%s-%s",Project_Description,Plot_No);
    }

    public void setProjectname_plot_No(String projectname_plot_No) {
        this.projectname_plot_No = projectname_plot_No;
    }

    public String projectname_plot_No;
    @BindingAdapter("android:date")
    public static void loadGender(TextView tv, Date date) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        if (date != null)
            tv.setText( df.format(date));
    }
    public static class adapter extends RecyclerView.Adapter<adapter.NoteHolder> {
        private List<MyProperties> notes = new ArrayList<>();
        MyProperty binding;
        boolean isFABOpen = false;
        private OnItemClickListener listener;
        private Context mCtx;
        public adapter( Context mCtx) {
            this.mCtx = mCtx;
        }
        @NonNull
        @Override
        public NoteHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            this.binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.activity_my__properties_line, parent, false);
            return new NoteHolder(binding);
        }
        @Override
        public void onBindViewHolder(@NonNull final NoteHolder holder, int position) {
            final MyProperties currentNote = notes.get(position);
            holder.bind(currentNote);
            holder.binding.pay.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent i = new Intent(mCtx.getApplicationContext(),transfer.class);
                    i.putExtra("depositto", currentNote.Application_No);
                    mCtx.startActivity(i);
                }
            });
            holder.binding.textViewOptions.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    //creating a popup menu
                    PopupMenu popup = new PopupMenu(mCtx, holder.binding.textViewOptions);
                    //inflating menu from xml resource
                    popup.inflate(R.menu.properties);
                    //adding click listener
                    popup.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() {
                        @Override
                        public boolean onMenuItemClick(MenuItem item) {
                            switch (item.getItemId()) {
                                case R.id.payment:

                                    //depositto


                                    break;
                            }
                            return false;
                        }
                    });
                    //displaying the popup
                    popup.show();
                    //will show popup menu here
                }
            });
        }
        @Override
        public int getItemCount() {
            return notes.size();
        }
        public MyProperties getTransAt(int position) {
            return notes.get(position);
        }
        public void setTrans(List<MyProperties> notes) {
            this.notes = notes;
            notifyDataSetChanged();
        }
      public   class NoteHolder extends RecyclerView.ViewHolder {
            private MyProperty binding;
            public NoteHolder(MyProperty itemView) {
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
            public void bind(MyProperties object) {
                binding.setMyprop (object);
                binding.executePendingBindings();
            }
        }
        public interface OnItemClickListener {
            void onItemClick(MyProperties note);
        }
        public void setOnItemClickListener(OnItemClickListener listener) {
            this.listener = listener;
        }
    }
}
