package com.trimline.pawdep;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.ObservableArrayList;
import androidx.databinding.ObservableList;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.room.Query;
import androidx.room.Transaction;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.pawdep.databinding.Allocations_Header_binding;

import java.lang.reflect.Type;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadPoolExecutor;

public class all_add_edit extends AppCompatActivity {
    Allocations_Header_binding binding;
    Allocation_header.Model allmodel;
    Allocation_Line.Model alllinemodel;
    Bank_Entries.Model bnkmodel;
    Member.Model membermodel;
    Allocation_Line.adapter adapter;
    Loan.Model loanmodel;
    final String TAG = "Codeinfo";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.all_add_edit);
        binding = DataBindingUtil.setContentView(this, R.layout.all_add_edit);
        binding.allCategoryEdit.setAdapter(new ArrayAdapter<Allocation_header.Categorys>(this, android.R.layout.simple_spinner_item, Allocation_header.Categorys.values()));

        allmodel = ViewModelProviders.of(this).get(Allocation_header.Model.class);
        bnkmodel = ViewModelProviders.of(this).get(Bank_Entries.Model.class);
        membermodel = ViewModelProviders.of(this).get(Member.Model.class);
        loanmodel = ViewModelProviders.of(this).get(Loan.Model.class);
        alllinemodel = ViewModelProviders.of(this).get(Allocation_Line.Model.class);

        Intent i = getIntent();
        allmodel.current = (Allocation_header) i.getSerializableExtra("allocation");
        binding.setAll(allmodel.current);
        if (allmodel.current.Pawdep_No != null)
            if (!allmodel.current.Pawdep_No.equals(""))
                new memberloans(allmodel.current.Pawdep_No).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        //load bank entries
        binding.allTransidEdit.setHint("Getting bank entries.. Please wait");
        new Bank_Entries.attachlist(binding.allTransidEdit, this).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        //load members
        //membermodel.members(binding.allPawdepnoedit, "");

        binding.allTransidEdit.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Bank_Entries b = (Bank_Entries) parent.getItemAtPosition(position);
                if (b != null) {
                    bnkmodel.currentbankentry = b;
                    allmodel.current.setTransaction_No(bnkmodel.currentbankentry.TransactionId);
                    allmodel.current.setTransaction_Description(bnkmodel.currentbankentry.Payment_Ref);
                    //yyyy-MM-dd
                    //20200717
                    //String d = bnkmodel.currentbankentry.Message_DateTime;//.split("-");
                    //Log.i("Valuedate", d);

                    allmodel.current.setAllocation_Date(bnkmodel.currentbankentry.Message_DateTime);
                    allmodel.current.setAmount(bnkmodel.currentbankentry.Amount);
                    if (bnkmodel.currentbankentry.Member_No != null && !bnkmodel.currentbankentry.Member_No.equals("")) {
                        allmodel.current.setPawdep_No(bnkmodel.currentbankentry.Member_No);
                        binding.allPawdepnoedit.setEnabled(false);
                        new getmember(allmodel.current.Pawdep_No).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                        new memberloans(allmodel.current.Pawdep_No).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                    } else {
                        allmodel.current.setPawdep_No("");
                        binding.allPawdepnoedit.setEnabled(true);
                    }

                }
            }
        });

        binding.newline.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(all_add_edit.this, "New line", Toast.LENGTH_SHORT).show();
                allmodel.current = binding.getAll();
                Log.i("Allocations", new Gson().toJson(binding.getAll()));
                if (allmodel.current.Transaction_No == null || allmodel.current.Transaction_No.equals("")) {
                    binding.allTransidEdit.setError("Please enter the transaction");
                    binding.allTransidEdit.requestFocus();
                    return;
                }
                if (allmodel.current.Pawdep_No == null || allmodel.current.Pawdep_No.equals("")) {
                    binding.allPawdepnoedit.setError("Please enter the transaction");
                    binding.allPawdepnoedit.requestFocus();
                    return;
                }

                Log.i("Lines", new Gson().toJson(allmodel.currentlines));
                Allocation_Line l = new Allocation_Line();
                l.No = allmodel.current.No;
                l.Account_No = allmodel.current.Pawdep_No;
                l.Account_Type = Allocation_Line.Account_Types.Customer;
                l.Account_Name = allmodel.current.Member_Names;
                l.Loan_No = "";
                l.Rent_Type = Allocation_Line.Rent_Types.None;

                allmodel.current.allocation_lines.add(l);
                adapter.notifyItemInserted(allmodel.current.allocation_lines.size() - 1);

                binding.headercontainer.setEnabled(false);
            }
        });

        allmodel.current.allocation_lines = (new ObservableArrayList<>());
        allmodel.current.allocation_lines.addOnListChangedCallback(new ObservableList.OnListChangedCallback<ObservableList<Allocation_Line>>() {
            @Override
            public void onChanged(ObservableList<Allocation_Line> sender) {
                Log.i(TAG, "onChanged: ");
            }

            @Override
            public void onItemRangeChanged(ObservableList<Allocation_Line> sender, int positionStart, int itemCount) {
                Log.i(TAG, "onItemRangeChanged: ");
            }

            @Override
            public void onItemRangeInserted(ObservableList<Allocation_Line> sender, int positionStart, int itemCount) {

                allmodel.current.setAmount_Distributed(sender.stream().mapToDouble(a -> a.Amount).sum());
                if (sender.size() > 0)
                    binding.allTransidEdit.setEnabled(false);
                else
                    binding.allTransidEdit.setEnabled(true);
            }

            @Override
            public void onItemRangeMoved(ObservableList<Allocation_Line> sender, int fromPosition, int toPosition, int itemCount) {
                Log.i(TAG, "onItemRangeMoved: ");
            }

            @Override
            public void onItemRangeRemoved(ObservableList<Allocation_Line> sender, int positionStart, int itemCount) {
                allmodel.current.setAmount_Distributed(sender.stream().mapToDouble(a -> a.Amount).sum());
                if (sender.size() > 0)
                    binding.allTransidEdit.setEnabled(false);
                else
                    binding.allTransidEdit.setEnabled(true);
            }
        });
        adapter = new Allocation_Line.adapter(getApplicationContext(), loanmodel, alllinemodel, allmodel);
        adapter.setTrans(allmodel.current.allocation_lines);
        binding.allocationlines.setLayoutManager(new LinearLayoutManager(this));
        binding.allocationlines.setHasFixedSize(false);
        binding.allocationlines.setAdapter(adapter);
        new getlines(allmodel.current.No).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.all_edit, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.save:
                binding.allocationlines.requestFocus();
                allmodel.current.setAmount_Distributed(allmodel.current.allocation_lines.stream().mapToDouble(a -> a.Amount).sum());
                Allocation_header all = binding.getAll();
                allmodel.insert(all);

                return true;
            case R.id.Post:
                binding.allocationlines.requestFocus();

                allmodel.current.setAmount_Distributed(allmodel.current.allocation_lines.stream().mapToDouble(a -> a.Amount).sum());

                Allocation_header alls = binding.getAll();
                allmodel.insert(alls);


                if (alls.Amount != alls.Amount_Distributed) {
                    Toast.makeText(this, "Transaction Amount must me distributed in full", Toast.LENGTH_SHORT).show();
                    return true;
                }
                alls.allocation_lines = allmodel.current.allocation_lines;
                new postallocation(alls).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                return true;

            case R.id.Print:
                 alls = binding.getAll();
                if (alls.Amount != alls.Amount_Distributed) {
                    Toast.makeText(this, "Transaction Amount must me distributed in full", Toast.LENGTH_SHORT).show();
                    return true;
                }
                alls.allocation_lines = allmodel.current.allocation_lines;
                if (alls.Posted == false)
                {
                    Toast.makeText(this, "Transaction must be posted before printing", Toast.LENGTH_SHORT).show();
                    return true;
                }
                Printer.printer p = new Printer.printer();
                SharedPreferences preferences = getSharedPreferences("Settings", MODE_PRIVATE);
                JsonParser.preferences = preferences;
                p.printallocation(alls);

                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    private class getlines extends AsyncTask<Void, Void, List<Allocation_Line>> {
        private String no;

        public getlines(String noo) {
            this.no = noo;

        }

        @Override
        protected List<Allocation_Line> doInBackground(Void... notes) {

            return alllinemodel.getlines(no);
        }

        @Override
        protected void onPostExecute(List<Allocation_Line> res) {
            if (res.size() > 0) {
                allmodel.current.allocation_lines.clear();
                allmodel.current.allocation_lines.addAll(res);

                adapter.notifyItemInserted(0);
            }

        }
    }

    private class getmember extends AsyncTask<Void, Void, Member> {
        private String no;

        public getmember(String noo) {
            this.no = noo;

        }

        @Override
        protected Member doInBackground(Void... notes) {

            return membermodel.getmember(no);
        }

        @Override
        protected void onPostExecute(Member res) {
            if (res != null) {
                allmodel.current.setMember_Names(res.Name);
                allmodel.current.setGroup_Name(res.Group_Name);
                allmodel.current.setMember_No(String.valueOf(res.GID));
            }

        }
    }

    private class memberloans extends AsyncTask<Void, Void, List<Loan>> {
        private String no;

        public memberloans(String noo) {
            this.no = noo;

        }

        @Override
        protected List<Loan> doInBackground(Void... notes) {
            String result = JsonParser.postjson("Memberloansloans", "member", no);
            Type localType = new TypeToken<List<Loan>>() {
            }.getType();
            List<Loan> results = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            return results;

        }

        @Override
        protected void onPostExecute(List<Loan> res) {
            if (res != null) {
                adapter.setloans(res);

            }

        }
    }

    private class postallocation extends AsyncTask<Void, Void, Allocation_header> {
        private Allocation_header all;

        public postallocation(Allocation_header noo) {
            this.all = noo;

        }

        @Override
        protected Allocation_header doInBackground(Void... notes) {

            Allocation_header n = null;
            try {
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String data = g.toJson(all);
                String result = JsonParser.postjson("allocations", "data", data);

                Type localType = new TypeToken<Allocation_header>() {
                }.getType();
                n = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {
                e.printStackTrace();
            }
            return n;
        }

        @Override
        protected void onPostExecute(Allocation_header res) {
            if (res != null) {
                if (res.Key.equals("")) {
                    Toast.makeText(all_add_edit.this, "Failed to post transaction, please try again", Toast.LENGTH_SHORT).show();

                } else {
                    res.allocation_lines = all.allocation_lines;
                    new postallocationlines(res).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);

                }
            } else
                Toast.makeText(all_add_edit.this, "Failed to post transaction, Please try again", Toast.LENGTH_SHORT).show();

        }
    }

    private class postallocationlines extends AsyncTask<Void, Void, List<Allocation_Line>> {
        private Allocation_header all;

        public postallocationlines(Allocation_header noo) {
            this.all = noo;

        }

        @Override
        protected List<Allocation_Line> doInBackground(Void... notes) {

            List<Allocation_Line> n = null;
            try {
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String data = g.toJson(all.allocation_lines);
                String result = JsonParser.postjson("allocationlines", "data", data);
                Type localType = new TypeToken<List<Allocation_Line>>() {
                }.getType();
                n = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {
                e.printStackTrace();
            }
            return n;
        }

        @Override
        protected void onPostExecute(List<Allocation_Line> res) {
            if (res != null) {
                Boolean success = true;
                for (Allocation_Line al : res
                ) {
                    if (al.Key.equals("")) {
                        Toast.makeText(all_add_edit.this, "Failed to post transaction, please try again", Toast.LENGTH_SHORT).show();
                        success = false;
                    } else {

                        alllinemodel.update(al);
                    }
                }
                if (success)
                {  all.Posted = true;
                allmodel.update(all);
                    Printer.printer p = new Printer.printer();
                    SharedPreferences preferences = getSharedPreferences("Settings", MODE_PRIVATE);
                    JsonParser.preferences = preferences;
                    p.printallocation(all);
                                finish();

                }
            } else
                Toast.makeText(all_add_edit.this, "Failed to post transaction, Please try again", Toast.LENGTH_SHORT).show();

        }
    }
}