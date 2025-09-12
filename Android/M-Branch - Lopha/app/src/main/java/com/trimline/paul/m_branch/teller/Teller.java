package com.trimline.paul.m_branch.teller;

import android.text.format.Time;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.databinding.BaseObservable;
import androidx.databinding.DataBindingUtil;
import androidx.recyclerview.widget.DiffUtil;
import androidx.recyclerview.widget.ListAdapter;
import androidx.recyclerview.widget.RecyclerView;


import com.trimline.paul.m_branch.R;
import com.trimline.paul.m_branch.databinding.Tellerlistbinding;

import com.trimline.paul.m_branch.enums.issued;
import com.trimline.paul.m_branch.enums.received;
import com.trimline.paul.m_branch.enums.teller_status;
import com.trimline.paul.m_branch.enums.transaction_Type;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Teller extends BaseObservable implements   Serializable {
    public String Key ;
    public String No ;

    public Date getTransaction_Date() {
        return Transaction_Date;
    }

    public void setTransaction_Date(Date transaction_Date) {
        Transaction_Date = transaction_Date;
    }

    public Date Transaction_Date ;
    public transaction_Type Transaction_Type ;
    public String From_Account ;
    public String To_Account ;

    public String getNo() {
        return No;
    }

    public void setNo(String no) {
        No = no;
    }

    public transaction_Type getTransaction_Type() {
        return Transaction_Type;
    }

    public void setTransaction_Type(transaction_Type transaction_Type) {
        Transaction_Type = transaction_Type;
    }

    public String getFrom_Account() {
        return From_Account;
    }

    public void setFrom_Account(String from_Account) {
        From_Account = from_Account;
    }

    public String getTo_Account() {
        return To_Account;
    }

    public void setTo_Account(String to_Account) {
        To_Account = to_Account;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public double getAmount() {
        return Amount;
    }

    public void setAmount(double amount) {
        Amount = amount;
    }

    public issued getIssued() {
        return Issued;
    }

    public void setIssued(issued issued) {
        Issued = issued;
    }

    public String getIssued_By() {
        return Issued_By;
    }

    public void setIssued_By(String issued_By) {
        Issued_By = issued_By;
    }

    public String getReceived_By() {
        return Received_By;
    }

    public void setReceived_By(String received_By) {
        Received_By = received_By;
    }

    public received getReceived() {
        return Received;
    }

    public void setReceived(received received) {
        Received = received;
    }

    public String getCheque_No() {
        return Cheque_No;
    }

    public void setCheque_No(String cheque_No) {
        Cheque_No = cheque_No;
    }

    public String Description ;
    public double Amount ;
    public boolean Posted ;

    public double Coinage_Amount ;
    public String Currency_Code ;
    public issued Issued ;
    public Date Date_Issued ;
    public Date Time_Issued ;
    public Date Date_Received ;

    public String Issued_By ;
    public String Received_By ;
    public received Received ;
    public String Request_No ;
    public String Bank_No ;
    public double Denomination_Total ;
    public String External_Document_No ;
    public String Cheque_No ;
    public String Transacting_Branch ;
    public boolean Approved ;

    public String Last_Transaction ;
    public double Total_Cash_on_Treasury_Coinage ;
    public double Till_Treasury_Balance ;
    public double Excess_Shortage_Amount ;
    public String From_Account_Name ;
    public String To_Account_Name ;
    public double Actual_Cash_At_Hand ;
    public String Branch ;
    public String Branch_Code ;
    public teller_status Status ;
    public String Description_Excess_Shortage ;
    public String Remarks ;
    public double Treasury_Balance ;




    public static class Adapter extends ListAdapter<Teller, Adapter.Transholder> {
        private OnItemClickListener listener;
        private DeleteListener deleteListener;
Tellerlistbinding binding;
        private List<Teller> notes = new ArrayList<>();
        public Adapter(DeleteListener deleteListener) {
            super(DIFF_CALLBACK);
            this.deleteListener = deleteListener;
        }

        private static final DiffUtil.ItemCallback<Teller> DIFF_CALLBACK = new DiffUtil.ItemCallback<Teller>() {
            @Override
            public boolean areItemsTheSame(Teller oldItem, Teller newItem) {
                return oldItem.No == newItem.No;
            }

            @Override
            public boolean areContentsTheSame(Teller oldItem, Teller newItem) {
                return String.valueOf(oldItem.No).equals(newItem.No);
            }
        };
        @NonNull
        @Override
        public Adapter.Transholder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

            this.binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.telleritem, parent, false);

            return new Adapter.Transholder(binding);
        }


        @Override
        public void onBindViewHolder(@NonNull final Transholder holder, final int position) {
            final Teller currentNote = getItem(position);

            holder.bind(currentNote);
            //holder.type.setText(currentNote.No);
//            holder.tMemberNo.setText(currentNote.Account_No);
//            holder.amount.setText(currentNote.Amount.toString());
//            holder.cancel.setOnClickListener(new View.OnClickListener() {
//                @Override
//                public void onClick(View view) {
//                    deleteListener.onDelete(currentNote, position);
//                }
//            });
        }

        public Teller getNoteAt(int position) {
            return getItem(position);
        }

        class Transholder extends RecyclerView.ViewHolder {
            private TextView type, tMemberNo;
            private TextView amount;
            private ImageButton cancel;
            private Tellerlistbinding binding;
            public Transholder(Tellerlistbinding itemView) {
                super(itemView.getRoot());
                this.binding = itemView;
                //type = itemView.findViewById(R.id.tellers);
//                tMemberNo = itemView.findViewById(R.id.receipt);
//                amount = itemView.findViewById(R.id.amount);
//                cancel = (ImageButton) itemView.findViewById(R.id.remove);
                itemView.getRoot().setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (listener != null && position != RecyclerView.NO_POSITION) {
                            listener.onItemClick(getItem(position));
                        }
                    }
                });
            }
            public void bind(Teller object) {
                binding.setTellerlist(object);
                binding.executePendingBindings();
            }
        }

        public interface OnItemClickListener {
            void onItemClick(Teller note);
        }

        public void setOnItemClickListener(OnItemClickListener listener) {
            this.listener = listener;
        }
    }
}
