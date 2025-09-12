package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Spinner;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.ColumnInfo;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Ignore;
import androidx.room.Index;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.PrimaryKey;
import androidx.room.Query;
import androidx.room.Update;


import com.trimline.pawdep.databinding.Receiptline;
import com.google.gson.Gson;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Entity( indices ={@Index(value = {"Transaction_No", "Account_No","Transaction_Type"},
        unique = true)} )
public class Receipt_lines {

    public String Key ;
    public boolean Sent =false;

    public String getNo() {
        return No;
    }

    public void setNo(String no) {
        No = no;
    }
    public String getNo_() {
        return No_;
    }
    public void setNo_(@NonNull String no_) {
        No_ = no_;
    }
    public int getTransaction_Type() {
        TransactionType = com.trimline.pawdep.Transaction_Type.values()[Transaction_Type].getText();
        return Transaction_Type;
    }
    public void setTransaction_Type(int transaction_Type) {

        Transaction_Type = transaction_Type;

    }
    public int getAccount_Type() {
        return Account_Type;
    }

    public void setAccount_Type(int account_Type) {
        Account_Type = account_Type;
    }


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

    public float getAmount() {
        return Amount;
    }

    public void setAmount(float amount) {
        Amount = amount;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getLoan_No() {
        return Loan_No;
    }

    public void setLoan_No(String loan_No) {
        Loan_No = loan_No;
    }
@ColumnInfo(name = "Transaction_No")
    public String No ;
    @NonNull
    @PrimaryKey
    public String No_ ;
    @NonNull
    public int Transaction_Type ;

    public String getTransactionType() {
        TransactionType =   com.trimline.pawdep.Transaction_Type.values()[Transaction_Type].getText();
        return TransactionType;
    }

    public void setTransactionType(String transactionType) {
        TransactionType = transactionType;
        Transaction_Type = com.trimline.pawdep.Transaction_Type.valueOf(transactionType.replace(" ","_").replace("Select","_blank_")).getCode();

    }

    @Ignore
    public String TransactionType;
    public Boolean Transaction_TypeSpecified ;
    public  int Account_Type ;

    public String getAccountType() {
      AccountType =Account_Types.values()[Account_Type].name();
        return AccountType;
    }

    public void setAccountType(String accountType) {

        AccountType = accountType;
        Account_Type = com.trimline.pawdep.Receipt_lines.Account_Types.valueOf(accountType.replace("Select","_blank_").replace(" ","_")).ordinal();
    }
@Ignore
    public  String AccountType;
    public Boolean Account_TypeSpecified ;
    @NonNull
    public String Account_No ;

    public String Account_Name ;
    public float Amount ;
    public Boolean AmountSpecified ;
    public String Description ;
    public String Loan_No;
    public enum Account_Types {
        /// <remarks/>
        G_L_Account,
        /// <remarks/>
        Customer,
        /// <remarks/>
        Vendor,

        /// <remarks/>
        Bank_Account,

        /// <remarks/>
        Fixed_Asset,

        /// <remarks/>
        IC_Partner,
    }
   @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Receipt_lines t);
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void Insertall(Iterable<Receipt_lines> t);
        @Update
        int Update(Receipt_lines t);

        @Delete
        void delete(Receipt_lines t);


        @Query("SELECT * FROM Receipt_lines")
        List<Receipt_lines> getAll();

        @Query("SELECT * FROM Receipt_lines where Transaction_No =:no ")
        List<Receipt_lines> getreceiptlines(String no);

       @Query("SELECT * FROM Receipt_lines where Sent =0")
       List<Receipt_lines> unsent();

       @Query("update `Receipt_lines` set Account_No =:newm  where `Account_No` =:old")
       void updatpawdep(String old,String newm );
   }

    public static class adapter extends RecyclerView.Adapter<Receipt_lines.adapter.Holder> {
        private List<Receipt_lines> data = new ArrayList<>();
        private Receipt_lines.adapter.OnItemClickListener listener;
        DB db;
        Receipts receipts;
        //Member m;
       // Transaction t;
        Context c;
        //List<Member> mm;
        //Member.dao mdao;
        Receiptline binding;
        Repository repository ;
        Accounts.Repository accrepository;
        Banks.Repository brepository;
        Member.Repository mrepository;

        public adapter(Context cc, Receipts r) {
        this.receipts = r;
            this.c = cc;

        }

        @NonNull
        @Override
        public Receipt_lines.adapter.Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.receipts_line, parent, false);
            db = DB.getInstance(parent.getContext());
            //d = db.rldao();

            brepository= new Banks.Repository((Application)c.getApplicationContext());
            accrepository= new Accounts.Repository((Application)c.getApplicationContext());
           repository = new Repository((Application)c.getApplicationContext());
           mrepository = new Member.Repository((Application)c.getApplicationContext());
            return new adapter.Holder(parent, binding);
        }
        @Override
        public void onBindViewHolder(@NonNull Receipt_lines.adapter.Holder holder, int position) {
            Receipt_lines current = data.get(position);
            holder.bind(current);



            holder.binding.AccountNo.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                    switch (holder.binding.transactiontype.getText().toString())
                    {
                        case "Loan":


                    }
                }
            });


            List<String> enumName = Stream.of(Receipt_lines.Account_Types.values())
                    .map(Receipt_lines.Account_Types::name)
                    .collect(Collectors.toList());

            holder.binding.AccountType.setAdapter(new Pawdep.Ttypes(c,
                    R.layout.enums, enumName));

            holder.binding.AccountType.setInputType(InputType.TYPE_NULL);
            holder.binding.AccountType.setOnTouchListener(new View.OnTouchListener() {
                @Override
                public boolean onTouch(View v, MotionEvent event) {
                    holder.binding.AccountType.showDropDown();
                    return false;
                }
            });
            holder.binding.AccountType.addTextChangedListener(new TextWatcher() {
                @Override
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {

                }

                @Override
                public void onTextChanged(CharSequence s, int start, int before, int count) {

                }

                @Override
                public void afterTextChanged(Editable s) {
                    String t =(String) holder.binding.AccountType.getText().toString();
                    if (t!=null )
                    {
                        holder.binding.AccountNo.setText("");
                        switch (Account_Types.valueOf(t))
                        {
                            case G_L_Account:
                                accrepository.bindaccount(holder.binding.AccountNo);
                                break;
                            case Customer:
                                Toast.makeText(c,receipts.Group_Name , Toast.LENGTH_SHORT).show();
                                mrepository.members(holder.binding.AccountNo,receipts.Group_Name);
                                break;
                            case Bank_Account:
                                brepository.Banks(holder.binding.AccountNo);
                                break;

                        }
                }}
            });


            List<String> enumNames = Stream.of(com.trimline.pawdep.Transaction_Type.values())
                    .map(com.trimline.pawdep.Transaction_Type::getText)
                    .collect(Collectors.toList());
            holder.binding.transactiontype.setAdapter(new Pawdep.Ttypes(c,
                    R.layout.enums, enumNames));
            holder.binding.transactiontype.setInputType(InputType.TYPE_NULL);


            holder.binding.transactiontype.setOnTouchListener(new View.OnTouchListener() {
                @Override
                public boolean onTouch(View v, MotionEvent event) {
                    holder.binding.transactiontype.showDropDown();
                    return false;
                }
            });

            View.OnFocusChangeListener focusChangeListener = new View.OnFocusChangeListener() {
                @Override
                public void onFocusChange(View view, boolean b) {
                    if (b == false) {
                        Receipt_lines t = holder.binding.getReceipt();
                        System.out.println(new Gson().toJson(t));
                        try {
                            repository.insert(t);
                            notifyItemChanged(position, t);
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                }
            };
            holder.binding.AccountType.setOnFocusChangeListener(focusChangeListener);
            holder.binding.AccountNo.setOnFocusChangeListener(focusChangeListener);
            holder.binding.transactiontype.setOnFocusChangeListener(focusChangeListener);
            holder.binding.Amount.setOnFocusChangeListener(focusChangeListener);
            holder.binding.LoanNo.setOnFocusChangeListener(focusChangeListener);

            holder.binding.clear.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Receipt_lines t = holder.binding.getReceipt();
                    data.remove(t);
                    repository.delete(t);
                    notifyItemRemoved(position);
                    notifyItemRangeChanged(position, getItemCount());
                }
            });

        }

        @Override
        public int getItemCount() {
            return data.size();
        }

        public void sett_line(List<Receipt_lines> advance) {
            this.data = advance;
            notifyDataSetChanged();
        }

        class Holder extends RecyclerView.ViewHolder {
            private Receiptline binding;
            Spinner s;

            public Holder(@NonNull ViewGroup parent, Receiptline itemView) {
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

            public void bind(Receipt_lines object) {
                binding.setReceipt(object);
                binding.executePendingBindings();
            }

            public Receiptline getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Receipt_lines note);
        }

        public void setOnItemClickListener(Receipt_lines.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }

    }
    public static class Repository {
        private static dao Dao;
        private LiveData<List<Receipt_lines>> allReceipt_liness;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            System.out.println("herrrre");
            Dao = database.rldao();
        }

        public void insert(Receipt_lines member) {
            new InsertReceipt_linesAsyncTask(Dao).execute(member);
        }

        public void insert(List<Receipt_lines> member) {
            new InsertReceipt_linessAsyncTask(Dao).execute(member);
        }

        public void update(Receipt_lines member) {
            new UpdateReceipt_linesAsyncTask(Dao).execute(member);
        }

        public void delete(Receipt_lines member) {
            new DeleteReceipt_linesAsyncTask(Dao).execute(member);
        }

        public LiveData<List<Receipt_lines>> allReceipt_liness() {
            return allReceipt_liness;
        }


        private class InsertReceipt_linesAsyncTask extends AsyncTask<Receipt_lines, Void, Void> {
            private dao Dao;

            private InsertReceipt_linesAsyncTask(dao Dao) {

                    this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Receipt_lines... members) {
                try {
                    //if(members[0].Amount!= 0)
                    Dao.Insert(members[0]);
                }
                catch (Exception ex){ex.printStackTrace();}
                return null;
            }
        }

        private class InsertReceipt_linessAsyncTask extends AsyncTask<List<Receipt_lines>, Void, Void> {
            private Receipt_lines.dao Dao;

            private InsertReceipt_linessAsyncTask(dao memberDao) {
                this.Dao = memberDao;
            }

            @Override
            protected Void doInBackground(List<Receipt_lines>... members) {
                Dao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateReceipt_linesAsyncTask extends AsyncTask<Receipt_lines, Void, Void> {
            private Receipt_lines.dao memberDao;

            private UpdateReceipt_linesAsyncTask(Receipt_lines.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Receipt_lines... members) {
                memberDao.Update(members[0]);
                return null;
            }
        }

        private class DeleteReceipt_linesAsyncTask extends AsyncTask<Receipt_lines, Void, Void> {
            private Receipt_lines.dao memberDao;

            private DeleteReceipt_linesAsyncTask(Receipt_lines.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Receipt_lines... members) {
                memberDao.delete(members[0]);
                return null;
            }
        }

    }
    public static class Model extends AndroidViewModel {
        public Transaction t;
        Receipt_lines.dao Dao;

        private List<Receipt_lines> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.rldao();
        }

        public List<Receipt_lines> getAll() {
            return Dao.getAll();
        }

        public void insert(Receipt_lines t) {
            new Receipt_lines.Model.InsertAsyncTask(Dao).execute(t);

        }

        private class InsertAsyncTask extends AsyncTask<Receipt_lines, Void, Void> {
            private Receipt_lines.dao Dao;

            private InsertAsyncTask(Receipt_lines.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Receipt_lines... notes) {
                long l = Dao.Insert(notes[0]);
                Log.i("insert", String.valueOf(l));
                return null;
            }
        }
    }
}
