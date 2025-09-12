package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.databinding.BaseObservable;
import androidx.databinding.Bindable;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Ignore;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.TypeConverters;
import androidx.room.Update;

import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;
import com.trimline.pawdep.databinding.Allocations_line_binding;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity(tableName = "Allocation_Line",primaryKeys = {"No","Transaction_Type","Account_No","Loan_No"} )
public class Allocation_Line extends BaseObservable implements Serializable {
    public String Key ;
    @NonNull
    public String No ;
    @NonNull
    @TypeConverters(Converters.class)
    public enums.Transaction_Type Transaction_Type ;
    public Boolean Transaction_TypeSpecified ;
    public String Receipt_Account ;
    public Account_Types Account_Type ;
    public Boolean Account_TypeSpecified ;
    @NonNull
    public String Account_No ;
    public String Account_Name ;
    public double Amount ;
    public Boolean AmountSpecified ;
    public String Description ;

    public Rent_Types Rent_Type ;
    public Boolean Rent_TypeSpecified ;
    public String Unit_No ;
    public String Floor_Code ;
    public String Building_Code ;
    @NonNull
    public String Loan_No ;
    public String Branch ;
    public String Type ;
    public double Interest_Amount ;
    public Boolean Interest_AmountSpecified ;
    public double Principal_Repayment ;
    public Boolean Principal_RepaymentSpecified ;
    public double Expected_Interest ;
    public Boolean Expected_InterestSpecified ;
    public int LineNo ;
    public Boolean LineNoSpecified ;
@Bindable
    public java.lang.Boolean getRequireloan() {
        return requireloan;
    }

    public void setRequireloan(Boolean requireloan) {
        this.requireloan = requireloan;
        notifyPropertyChanged(BR.requireloan);
    }

    @Ignore
public Boolean requireloan;

  
@Bindable
    @NonNull
    public enums.Transaction_Type getTransaction_Type() {
        return Transaction_Type;
    }

    public void setTransaction_Type(@NonNull enums.Transaction_Type transaction_Type) {
        Transaction_Type = transaction_Type;
        switch (transaction_Type)
        {
        case Repayment:
        case Interest_Due:
        case Interest_Paid:
            case Penalty:
        case Loan:
            setRequireloan(true);
        break;
            default:
                setRequireloan(false);

        }
        notifyPropertyChanged(BR.transaction_Type);
    }

    public String getReceipt_Account() {
        return Receipt_Account;
    }

    public void setReceipt_Account(String receipt_Account) {
        Receipt_Account = receipt_Account;
    }

    public Account_Types getAccount_Type() {
        return Account_Type;
    }

    public void setAccount_Type(Account_Types account_Type) {
        Account_Type = account_Type;
    }

    @NonNull
    public String getAccount_No() {
        return Account_No;
    }

    public void setAccount_No(@NonNull String account_No) {
        Account_No = account_No;
    }

    public String getAccount_Name() {
        return Account_Name;
    }

    public void setAccount_Name(String account_Name) {
        Account_Name = account_Name;
    }

    public double getAmount() {
        return Amount;
    }

    public void setAmount(double amount) {
        Amount = amount;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    @NonNull
    public String getLoan_No() {
        return Loan_No;
    }

    public void setLoan_No(@NonNull String loan_No) {
        Loan_No = loan_No;
    }

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }

    public double getInterest_Amount() {
        return Interest_Amount;
    }

    public void setInterest_Amount(double interest_Amount) {
        Interest_Amount = interest_Amount;
    }

    public double getPrincipal_Repayment() {
        return Principal_Repayment;
    }

    public void setPrincipal_Repayment(double principal_Repayment) {
        Principal_Repayment = principal_Repayment;
    }

    public enum Account_Types {

        /// <remarks/>
        @SerializedName("0")
        G_L_Account,

        /// <remarks/>
        @SerializedName("1")
        Customer,

        /// <remarks/>
        @SerializedName("2")
        Vendor,

        /// <remarks/>
        @SerializedName("3")
        Bank_Account,

        /// <remarks/>
        @SerializedName("4")
        Fixed_Asset,

        /// <remarks/>
        @SerializedName("5")
        IC_Partner,
    }

    public enum Rent_Types {

        /// <remarks/>
        @SerializedName("0")
        None,

        /// <remarks/>
        @SerializedName("1")
        Rent,

        /// <remarks/>
        @SerializedName("2")
        Deposit,

        /// <remarks/>
        @SerializedName("3")
        Deposit_Refund,

        /// <remarks/>
        @SerializedName("4")
        Service_Charge,
    }

    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Allocation_Line t);
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void   Insertall(Iterable<Allocation_Line> t) ;
        @Update
        int Update(Allocation_Line t);
        @Delete
        void delete(Allocation_Line t);

        @Query("SELECT * FROM Allocation_Line")
        LiveData<List<Allocation_Line>> getAll();

        @Query("SELECT * FROM Allocation_Line where `No` =:no")
        List<Allocation_Line> getlines(String no);
    }


    public static class Model extends AndroidViewModel {
        public Allocation_Line current;
        Allocation_Line.Repository repository;
        private LiveData<List<Allocation_Line>> all;

        public Model(@NonNull Application application) {
            super(application);
            repository = new Allocation_Line.Repository(application);
            all = repository.getall();
        }

        public List<Allocation_Line> getlines(String a) {
            return repository.getlines(a);
        }

        public LiveData<List<Allocation_Line>> getall() {
            return all;
        }

        public void insert(Allocation_Line a) {
            repository.insert(a);
        }
        public void update(Allocation_Line a) {
            repository.update(a);
        } public void delete(Allocation_Line a) {
            repository.delete(a);
        }
    }
    public static class Repository {
        private static Allocation_Line.dao Dao;
        private LiveData<List<Allocation_Line>> all;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.alllinedao();
            all = Dao.getAll();
        }
        public LiveData<List<Allocation_Line>> getall(){
            return all;
        }

        public List<Allocation_Line> getlines(String a) {
          return  Dao.getlines(a);
        }

        public void insert(Allocation_Line a) {
            new insert(a).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        }
        public void update(Allocation_Line a) {
            new update(a).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        }
        public void delete(Allocation_Line a) {
            new delete(a).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        }
        private class insert extends AsyncTask<Void, Void, Void> {
            private Allocation_Line a;
            public insert(Allocation_Line aa) {
                this.a = aa;
            }
            @Override
            protected Void doInBackground(Void... m) {
                Dao.Insert(a);
                return null;
            }
        }
        private class update extends AsyncTask<Void, Void, Void> {
            private Allocation_Line a;
            public update(Allocation_Line aa) {
                this.a = aa;
            }
            @Override
            protected Void doInBackground(Void... m) {
                Log.i("Updating", new Gson().toJson(a));
                Dao.Update(a);
                return null;
            }
        }
        private class delete extends AsyncTask<Void, Void, Void> {
            private Allocation_Line a;
            public delete(Allocation_Line aa) {
                this.a = aa;
            }
            @Override
            protected Void doInBackground(Void... m) {
                Dao.delete(a);
                return null;
            }
        }
    }
    public static class adapter extends RecyclerView.Adapter<Allocation_Line.adapter.NoteHolder> {
        public List<Allocation_Line> notes = new ArrayList<>();
        Allocations_line_binding binding;
        boolean isFABOpen = false;
        private Allocation_Line.adapter.OnItemClickListener listener;
        Context c;
        Loan.Model lmodel;
        Allocation_header.Model allmodel;
        Allocation_Line.Model alllinemodel;
       public List<Loan> loans;
        public adapter(Context cc,Loan.Model m,Allocation_Line.Model am, Allocation_header.Model model){

            this.c= cc;
        lmodel = m;
        alllinemodel=am;
        allmodel = model;
        }

        @NonNull
        @Override
        public Allocation_Line.adapter.NoteHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

            this.binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.all_add_edit_line_detail, parent, false);

            return new Allocation_Line.adapter.NoteHolder(binding);
        }

        @Override
        public void onBindViewHolder(@NonNull Allocation_Line.adapter.NoteHolder holder, int position) {
            holder.binding.allTranstype.setAdapter(new ArrayAdapter<enums.Transaction_Type>(c, R.layout.simple_spinner, enums.Transaction_Type.values()));
            holder.binding.allAccounttype.setAdapter(new ArrayAdapter<Allocation_Line.Account_Types>(c, R.layout.simple_spinner, Allocation_Line.Account_Types.values()));

            Allocation_Line currentNote = notes.get(position);
            Loan.attachparams a = new Loan.attachparams();
            a.autoCompleteTextView = holder.binding.allLoanno;
            a.loanstatus = 3;
            a.Memberno = currentNote.Account_No;
            a.isdropdown = true;
            a.l = loans;

            lmodel.bindmemberloans2(a);

            holder.bind(currentNote);
            holder.clear.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    notes.remove(currentNote);
                    allmodel.currentlines.remove(currentNote);
                    alllinemodel.delete(currentNote);
                    notifyItemRemoved(position);
                    notifyItemRangeChanged(position, getItemCount());
                }
            });

            View.OnFocusChangeListener focusChangeListener = new View.OnFocusChangeListener() {
                @Override
                public void onFocusChange(View v, boolean hasFocus) {
                    if (!hasFocus) {
                        Allocation_Line line = holder.binding.getAll();
                        Log.i("captured", new Gson().toJson(line));
                        if (line.Transaction_Type == enums.Transaction_Type._blank_) {
                            Toast.makeText(c, "Select transaction Type", Toast.LENGTH_SHORT).show();
                            return;
                        }
                        switch (line.Transaction_Type) {
                            case Repayment:
                            case Interest_Due:
                            case Interest_Paid:
                            case Penalty:
                            case Loan: {
                                //  holder.binding.allLoanno.setEnabled(true);
                                if (line.Loan_No.equals("")) {
                                    holder.binding.allLoanno.setError("select loan");
                                    return;
                                } else
                                    holder.binding.allLoanno.setError(null);
                                break;
                            }
                            default:
                                // holder.binding.allLoanno.setEnabled(false);
                                break;
                        }
                        alllinemodel.insert(line);

                    }

                }
            };
            holder.binding.allAmount.setOnFocusChangeListener(focusChangeListener);
            holder.binding.allLoanno.setOnFocusChangeListener(focusChangeListener);
        }

        @Override
        public int getItemCount() {
            return notes.size();
        }

        public Allocation_Line getTransAt(int position) {
            return notes.get(position);
        }

        public void setTrans(List<Allocation_Line> notes) {
            this.notes = notes;
            notifyDataSetChanged();
        }
        public void setloans(List<Loan> notes) {
            loans = notes;

        }
        class NoteHolder extends RecyclerView.ViewHolder {
            private Allocations_line_binding binding;
            ConstraintLayout grouptrans;
            ImageView clear ;
            public NoteHolder(Allocations_line_binding itemView) {
                super(itemView.getRoot());
                this.binding = itemView;
                clear = itemView.getRoot().findViewById(R.id.clear);
                grouptrans = (ConstraintLayout) itemView.getRoot().findViewById(R.id.all_container);


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

            public void bind(Allocation_Line object) {
                binding.setAll(object);
                binding.executePendingBindings();
            }
        }

        public interface OnItemClickListener {
            void onItemClick(Allocation_Line note);
        }

        public void setOnItemClickListener(Allocation_Line.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }
    }


}
