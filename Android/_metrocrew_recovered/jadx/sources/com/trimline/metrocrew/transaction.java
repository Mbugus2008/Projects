package com.trimline.metrocrew;

import android.app.Application;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.recyclerview.widget.DiffUtil;
import androidx.recyclerview.widget.ListAdapter;
import androidx.recyclerview.widget.RecyclerView;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public class transaction {
    public String Account_Name;
    public String Account_No;
    public String Agent_Code;
    public Double Amount;
    public String Applies_to_Doc_No;
    public String Applies_to_ID;
    public String Apply_to;
    public String Apply_to_ID;
    public int BD_From_Number;
    public int BD_Register_Number;
    public int BD_To_Number;
    public String Bank_Account;
    public String Bank_Code;
    public Boolean Batch_Posted;
    public String Batch_Posted_UserID;
    public String Branch_Code;
    public Boolean Cancelled;
    public String Cancelled_By;
    public Date Cancelled_Date;
    public Date Cancelled_Time;
    public String Cashier;
    public String Cheque_Deposit_Slip_Bank;
    public Date Cheque_Deposit_Slip_Date;
    public String Cheque_Deposit_Slip_No;
    public Boolean Cheque_Retrieved;
    public Boolean Confirmed;
    public String Currency_Code;
    public Double Currency_Factor;
    public Boolean Customer_Payment_On_Account;
    public Date Date;
    public Date Date_Posted;
    public Date Deposit_Slip_Time;
    public String Dest_Global_Dimension_1_Code;
    public String Dest_Shortcut_Dimension_2_Code;
    public int Dimension_Set_ID;
    public String Donor;
    public int Entry_No;
    public int From_Entry_No;
    public String Gen_Bus_Posting_Group;
    public Boolean Gen_Posting_TypeSpecified;
    public String Gen_Prod_Posting_Group;
    public String Global_Dimension_1_Code;
    public String Grant_No;
    public String Group_Code;
    public String Grouping;
    public int Installment_Number;
    public String Key;
    public int Line_No;
    public String Loan_No;
    public Double Med_Fines;
    public Date Next_Installment_Date;
    public String No;
    public String On_Behalf_Of;
    public String Orig_Cashier;
    public String PayMode;
    public String Pay_Mode;
    public Double Penalty;
    public Boolean Post_Dated;
    public Boolean Posted;
    public String Posted_By;
    public Double Pre_ADM_Fines;
    public int Print_No;
    public String Received_From;
    public Boolean Reconciled;
    public int Register_Number;
    public String Remarks;
    public String Reversal_By;
    public Date Reversal_Date;
    public int Reversal_From_Entry_No;
    public int Reversal_Register_No;
    public Date Reversal_Time;
    public int Reversal_To_Entry_No;
    public Boolean Reversed;
    public Boolean Select;
    public String Shortcut_Dimension_2_Code;
    public String Teller_ID;
    public Date Time_Posted;
    public int To_Entry_No;
    public Double Total_Amount;
    public String Transaction_Name;
    public String Transaction_No;
    public String Type;
    public String User_ID;
    public Double VAT_Amount;
    public String VAT_Bus_Posting_Group;
    public Double VAT_Percent;
    public String VAT_Prod_Posting_Group;
    public boolean sent;
    public String transtype;

    public static abstract class dao {
        abstract void Insertall(Iterable<transaction> t);

        abstract void delete(transaction entity);

        abstract void insert(transaction entity);

        abstract LiveData<List<transaction>> load();

        abstract List<transaction> loadAll();

        abstract List<transaction> loadunsent();

        abstract void update(transaction entity);
    }

    public String getTranstype() {
        return this.transtype;
    }

    public void setTranstype(String transtype) {
        this.transtype = transtype;
    }

    public static class Repository {
        private dao dao;
        public LiveData<List<transaction>> tranlineLive;
        private List<transaction> transactionList;
        private MutableLiveData<List<transaction>> transactionListLive = new MutableLiveData<>();

        public Repository(Application application) {
            this.tranlineLive = new MutableLiveData();
            DB database = DB.getInstance(application);
            this.dao = database.tdao();
            this.tranlineLive = this.dao.load();
        }

        public MutableLiveData<List<transaction>> getTransactionListLive() {
            return this.transactionListLive;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void asyncFinished(List<transaction> results) {
            this.transactionList = results;
            this.transactionListLive.setValue(results);
        }

        public LiveData<List<transaction>> getall() {
            return this.tranlineLive;
        }

        public void findAll() {
            FetchtransactionAsyncTask task = new FetchtransactionAsyncTask(this.dao);
            task.repository = this;
            task.execute(new Void[0]);
        }

        public void insert(transaction transaction) {
            new InserttransactionAsyncTask(this.dao, transaction).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new transaction[0]);
        }

        public void insert(List<transaction> transaction) {
            new InserttransactionsAsyncTask(this.dao, transaction).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new List[0]);
        }

        public void update(transaction transaction) {
            new UpdatetransactionAsyncTask(this.dao).execute(transaction);
        }

        public void delete(transaction transaction) {
            new DeletetransactionAsyncTask(this.dao).execute(transaction);
        }

        public List<transaction> getTransactionList() {
            return this.transactionList;
        }

        private class FetchtransactionAsyncTask extends AsyncTask<Void, Void, List<transaction>> {
            private dao dao;
            Repository repository;
            private List<transaction> transactionList;

            private FetchtransactionAsyncTask(dao dao) {
                this.repository = null;
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public List<transaction> doInBackground(Void... voids) {
                this.transactionList = this.dao.loadAll();
                return this.transactionList;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public void onPostExecute(List<transaction> result) {
                this.repository.asyncFinished(result);
            }
        }

        private class InserttransactionAsyncTask extends AsyncTask<transaction, Void, Void> {
            private dao dao;
            private transaction transaction;

            private InserttransactionAsyncTask(dao dao, transaction transaction1) {
                this.dao = dao;
                this.transaction = transaction1;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(transaction... transactions) {
                this.dao.insert(this.transaction);
                return null;
            }
        }

        private class InserttransactionsAsyncTask extends AsyncTask<List<transaction>, Void, Void> {
            private dao dao;
            private List<transaction> transaction;

            private InserttransactionsAsyncTask(dao dao, List<transaction> transaction1) {
                this.dao = dao;
                this.transaction = transaction1;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(List<transaction>... transactions) {
                this.dao.Insertall(this.transaction);
                return null;
            }
        }

        private class UpdatetransactionAsyncTask extends AsyncTask<transaction, Void, Void> {
            private dao dao;

            private UpdatetransactionAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(transaction... transactions) {
                this.dao.update(transactions[0]);
                return null;
            }
        }

        private class DeletetransactionAsyncTask extends AsyncTask<transaction, Void, Void> {
            private dao dao;

            private DeletetransactionAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(transaction... transactions) {
                this.dao.delete(transactions[0]);
                return null;
            }
        }
    }

    public static class Model extends AndroidViewModel {
        private Repository repository;
        public transaction trans;
        public List<transaction> transline;
        public LiveData<List<transaction>> translinelive;
        public MutableLiveData<List<transaction>> translines;

        public Model(Application application) {
            super(application);
            this.trans = new transaction();
            this.translines = new MutableLiveData<>();
            this.transline = new ArrayList();
            this.repository = new Repository(application);
            this.translinelive = this.repository.getall();
        }

        public LiveData<List<transaction>> getall() {
            return this.translinelive;
        }

        public void insert(transaction transaction) {
            this.repository.insert(transaction);
        }

        public void insert(List<transaction> transaction) {
            this.repository.insert(transaction);
        }

        public void update(transaction transaction) {
            this.repository.update(transaction);
        }

        public void delete(transaction transaction) {
            this.repository.delete(transaction);
        }

        public void findTransactions() {
            this.repository.findAll();
        }

        public LiveData<List<transaction>> gettransactions() {
            Log.i("trans", "here");
            return this.translines;
        }
    }

    public static class TransAdapter extends ListAdapter<transaction, Transholder> {
        private static final DiffUtil.ItemCallback<transaction> DIFF_CALLBACK = new DiffUtil.ItemCallback<transaction>() { // from class: com.trimline.metrocrew.transaction.TransAdapter.1
            @Override // androidx.recyclerview.widget.DiffUtil.ItemCallback
            public boolean areItemsTheSame(transaction oldItem, transaction newItem) {
                return oldItem.Entry_No == newItem.Entry_No;
            }

            @Override // androidx.recyclerview.widget.DiffUtil.ItemCallback
            public boolean areContentsTheSame(transaction oldItem, transaction newItem) {
                return String.valueOf(oldItem.Entry_No).equals(Integer.valueOf(newItem.Entry_No));
            }
        };
        private DeleteListener deleteListener;
        private OnItemClickListener listener;

        public interface OnItemClickListener {
            void onItemClick(transaction note);
        }

        public TransAdapter(DeleteListener deleteListener) {
            super(DIFF_CALLBACK);
            this.deleteListener = deleteListener;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public Transholder onCreateViewHolder(ViewGroup parent, int viewType) {
            View itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.transline_new, parent, false);
            return new Transholder(itemView);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public void onBindViewHolder(final Transholder holder, final int position) {
            final transaction currentNote = getItem(position);
            holder.type.setText(currentNote.transtype + " (" + currentNote.PayMode + ")");
            holder.tMemberNo.setText(currentNote.Account_No);
            holder.amount.setText(currentNote.Amount.toString());
            holder.cancel.setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.transaction.TransAdapter.2
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    TransAdapter.this.deleteListener.onDelete(currentNote, position);
                }
            });
        }

        public transaction getNoteAt(int position) {
            return getItem(position);
        }

        class Transholder extends RecyclerView.ViewHolder {
            private TextView amount;
            private ImageButton cancel;
            private TextView tMemberNo;
            private TextView type;

            public Transholder(View itemView) {
                super(itemView);
                this.type = (TextView) itemView.findViewById(R.id.member);
                this.tMemberNo = (TextView) itemView.findViewById(R.id.receipt);
                this.amount = (TextView) itemView.findViewById(R.id.amount);
                this.cancel = (ImageButton) itemView.findViewById(R.id.remove);
                itemView.setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.transaction.TransAdapter.Transholder.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        int position = Transholder.this.getAdapterPosition();
                        if (TransAdapter.this.listener != null && position != -1) {
                            TransAdapter.this.listener.onItemClick((transaction) TransAdapter.this.getItem(position));
                        }
                    }
                });
            }
        }

        public void setOnItemClickListener(OnItemClickListener listener) {
            this.listener = listener;
        }
    }
}
