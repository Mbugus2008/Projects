package com.trimline.metrocrew;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.Html;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.google.gson.Gson;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.function.ToDoubleFunction;

/* JADX INFO: loaded from: classes5.dex */
public class Receipts extends AppCompatActivity implements View.OnClickListener {
    Member.autocomplete adapter;
    Button add;
    ImageButton addmember;
    EditText amount;
    TextView balances;
    Button cancel;
    loan.Model lmodel;
    Spinner loanspinner;
    Member member;
    AutoCompleteTextView memberno;
    Member.Model model;
    Spinner paymentmodes;
    payment_modes.Model pmodel;
    Button print;
    TextView recordCount;
    theader theader;
    theader.Model theaderModel;
    types.Model tmodel;
    TextView total;
    List<transaction> transactionList;
    transaction.Model trmodel;
    Spinner ttypes;
    AutoCompleteTextView vehicle;
    Vehicles.Model vmodel;
    private Printer.printer p = new Printer.printer();
    int LAUNCH_SECOND_ACTIVITY = 1;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receipts);
        this.model = (Member.Model) ViewModelProviders.of(this).get(Member.Model.class);
        this.tmodel = (types.Model) ViewModelProviders.of(this).get(types.Model.class);
        this.lmodel = (loan.Model) ViewModelProviders.of(this).get(loan.Model.class);
        this.pmodel = (payment_modes.Model) ViewModelProviders.of(this).get(payment_modes.Model.class);
        this.trmodel = (transaction.Model) ViewModelProviders.of(this).get(transaction.Model.class);
        this.theaderModel = (theader.Model) ViewModelProviders.of(this).get(theader.Model.class);
        this.vmodel = (Vehicles.Model) ViewModelProviders.of(this).get(Vehicles.Model.class);
        Log.i("Logged in user", new Gson().toJson(agent.Model.CurrentAgent));
        createNewHeader();
        this.recordCount = (TextView) findViewById(R.id.recordCount);
        this.balances = (TextView) findViewById(R.id.balances);
        this.ttypes = (Spinner) findViewById(R.id.ttype);
        this.loanspinner = (Spinner) findViewById(R.id.LoanNo);
        this.paymentmodes = (Spinner) findViewById(R.id.paymenttype);
        this.memberno = (AutoCompleteTextView) findViewById(R.id.receipt);
        this.vehicle = (AutoCompleteTextView) findViewById(R.id.vehicles);
        this.add = (Button) findViewById(R.id.Add);
        this.print = (Button) findViewById(R.id.Print);
        this.cancel = (Button) findViewById(R.id.Cancel);
        this.addmember = (ImageButton) findViewById(R.id.addmember);
        this.add.setOnClickListener(this);
        this.print.setOnClickListener(this);
        this.cancel.setOnClickListener(this);
        this.addmember.setOnClickListener(this);
        this.amount = (EditText) findViewById(R.id.amount);
        this.total = (TextView) findViewById(R.id.total);
        RecyclerView recyclerView = (RecyclerView) findViewById(R.id.translist);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(true);
        final transaction.TransAdapter adapter = new transaction.TransAdapter(new DeleteListener() { // from class: com.trimline.metrocrew.Receipts.1
            @Override // com.trimline.metrocrew.DeleteListener
            public void onDelete(transaction transaction, int i) {
                Receipts.this.trmodel.delete(transaction);
                Receipts.this.transactionList.remove(i);
                Receipts.this.trmodel.transline = Receipts.this.transactionList;
                Receipts.this.trmodel.translines.setValue(Receipts.this.trmodel.transline);
            }
        });
        recyclerView.setAdapter(adapter);
        this.trmodel.gettransactions().observe(this, new Observer<List<transaction>>() { // from class: com.trimline.metrocrew.Receipts.2
            @Override // androidx.lifecycle.Observer
            public void onChanged(List<transaction> notes) {
                Receipts.this.transactionList = notes;
                Log.i("items", notes.toString());
                Receipts.this.recordCount.setText("Receipt lines (" + notes.size() + ")");
                adapter.submitList(notes);
                adapter.notifyDataSetChanged();
                Receipts.this.theader.Total_Amount = 0.0f;
                for (transaction t : notes) {
                    theader theaderVar = Receipts.this.theader;
                    theaderVar.Total_Amount = (float) (((double) theaderVar.Total_Amount) + t.Amount.doubleValue());
                }
                if (Receipts.this.total != null) {
                    Receipts.this.total.setText(Html.fromHtml(String.format("%,.2f", Float.valueOf(Receipts.this.theader.Total_Amount))));
                }
                Receipts.this.theaderModel.updateHeader(Receipts.this.theader);
            }
        });
        this.memberno.setOnTouchListener(new View.OnTouchListener() { // from class: com.trimline.metrocrew.Receipts.3
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View view, MotionEvent event) {
                if (event.getAction() == 1 && event.getRawX() >= Receipts.this.memberno.getRight() - Receipts.this.memberno.getCompoundDrawables()[2].getBounds().width()) {
                    Receipts.this.memberno.setText("");
                    return true;
                }
                return false;
            }
        });
        this.memberno.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.trimline.metrocrew.Receipts.4
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Receipts.this.member = (Member) adapterView.getItemAtPosition(i);
                if (Receipts.this.member.No.equalsIgnoreCase("New")) {
                    Receipts.this.member.Name = "";
                    Intent inte = new Intent(Receipts.this, (Class<?>) add_edit_member.class);
                    inte.putExtra("member", Receipts.this.member);
                    Receipts.this.startActivityForResult(inte, Receipts.this.LAUNCH_SECOND_ACTIVITY);
                    return;
                }
                Receipts.this.getmember(Receipts.this.member);
            }
        });
        this.ttypes.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.trimline.metrocrew.Receipts.5
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                types type = (types) adapterView.getItemAtPosition(i);
                Receipts.this.trmodel.trans.transtype = type.Code;
                if (type.Code != null) {
                    if (type.Code.toLowerCase().equals("loan")) {
                        Receipts.this.loanspinner.setVisibility(0);
                    } else {
                        Receipts.this.loanspinner.setVisibility(8);
                    }
                }
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        this.paymentmodes.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.trimline.metrocrew.Receipts.6
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                payment_modes pm = (payment_modes) adapterView.getItemAtPosition(i);
                Receipts.this.theader.PayMode = pm.Code;
                Receipts.this.trmodel.trans.PayMode = pm.Code;
                Receipts.this.theaderModel.updateHeader(Receipts.this.theader);
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        this.loanspinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.trimline.metrocrew.Receipts.7
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                loan pm = (loan) adapterView.getItemAtPosition(i);
                Receipts.this.trmodel.trans.Loan_No = pm.Loan_No;
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        new autocomplete().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    public void getmember(Member member) {
        this.memberno.setText(member.No);
        this.theader.Account_No = member.No;
        this.theader.Name = member.Name;
        this.theader.Received_From = member.Name;
        this.theaderModel.updateHeader(this.theader);
        this.balances.setText(Html.fromHtml(String.format("Name        : <b>%s</b><br/>", member.Name) + String.format("Loans       : <b>%,.2f</b><br/>", Double.valueOf(member.Outstanding_Balance)) + String.format("Deposits    : <b>%,.2f</b><br/>", Double.valueOf(member.Current_Shares)) + String.format("Shares      : <b>%,.2f</b><br/>", Double.valueOf(member.Shares_Retained)) + String.format("Registration: <b>%,.2f</b><br/>", Double.valueOf(member.Registration_Fee_Paid)) + String.format("Savings     : <b>%,.2f</b>", Double.valueOf(member.Current_Savings))));
        new getloans(member.No).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == this.LAUNCH_SECOND_ACTIVITY && resultCode == -1) {
            Member m = (Member) data.getSerializableExtra("member");
            Log.i("Mm", new Gson().toJson(m));
            this.model.insert(m);
            this.adapter.add(m);
            this.adapter.notifyDataSetChanged();
            getmember(m);
        }
    }

    void createNewHeader() {
        this.theader = new theader();
        this.theader.No = String.valueOf(System.currentTimeMillis());
        this.theader.PayMode = "Cash";
        this.theader.Cashier = agent.Model.CurrentAgent.Agent_Code;
        this.theader.Date = new Date(Calendar.getInstance().getTime().getTime());
        this.theader.Created_Date_Time = new Date(Calendar.getInstance().getTime().getTime());
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.Add /* 2131361793 */:
                this.theader.Group_Name = this.vehicle.getText().toString();
                if (this.theader.PayMode == null) {
                    this.paymentmodes.performClick();
                    Toast.makeText(getApplicationContext(), "Payment Mode is blank", 1).show();
                } else if (this.memberno.getText().toString().equals("")) {
                    this.memberno.setError("Please enter member no");
                    this.memberno.requestFocus();
                } else if (this.amount.getText().toString().equals("")) {
                    this.amount.setError("Please enter amount");
                    this.amount.requestFocus();
                } else if (Double.valueOf(this.amount.getText().toString()).doubleValue() <= 0.0d) {
                    this.amount.setError("Please enter valid amount");
                    this.amount.requestFocus();
                } else if (this.trmodel.trans.transtype == null) {
                    this.ttypes.performClick();
                    Toast.makeText(getApplicationContext(), "Transaction type is blank", 1).show();
                } else if (this.trmodel.trans.transtype.toLowerCase().equals("loan") && this.trmodel.trans.Loan_No == null) {
                    this.loanspinner.performClick();
                    Toast.makeText(getApplicationContext(), "Loan No is blank", 1).show();
                } else {
                    this.trmodel.trans.PayMode = this.theader.PayMode;
                    this.trmodel.trans.Account_No = this.theader.Account_No;
                    this.trmodel.trans.Amount = Double.valueOf(this.amount.getText().toString());
                    this.trmodel.trans.No = this.theader.No;
                    this.trmodel.trans.Type = "MEMBER";
                    Log.i("single", new Gson().toJson(this.trmodel.trans));
                    this.trmodel.transline.add(this.trmodel.trans);
                    Log.i("single2", new Gson().toJson(this.trmodel.transline));
                    this.trmodel.translines.setValue(this.trmodel.transline);
                    this.amount.setText("");
                    this.trmodel.trans = new transaction();
                }
                break;
            case R.id.Print /* 2131361807 */:
                this.theader.tlines = this.trmodel.transline;
                this.theader.Amount_Recieved = (float) this.trmodel.transline.stream().mapToDouble(new ToDoubleFunction() { // from class: com.trimline.metrocrew.Receipts$$ExternalSyntheticLambda0
                    @Override // java.util.function.ToDoubleFunction
                    public final double applyAsDouble(Object obj) {
                        return ((transaction) obj).Amount.doubleValue();
                    }
                }).sum();
                if (this.theader.Amount_Recieved <= 0.0f) {
                    Toast.makeText(this, "No Transaction to print", 0).show();
                } else {
                    this.theader.From_Entry_No = (int) this.trmodel.transline.stream().count();
                    this.theaderModel.insert(this.theader);
                    this.trmodel.insert(this.trmodel.transline);
                    Bitmap b = BitmapFactory.decodeResource(getResources(), R.drawable.clear_24dp);
                    this.p.printcollection(b, this.theader);
                    this.paymentmodes.setSelection(0);
                    this.memberno.clearListSelection();
                    this.memberno.setText((CharSequence) "", false);
                    this.balances.setText("");
                    this.ttypes.setSelection(0);
                    this.trmodel.transline = new ArrayList();
                    this.trmodel.translines.setValue(this.trmodel.transline);
                    createNewHeader();
                    Runnable myRunnable5 = new Runnable() { // from class: com.trimline.metrocrew.Receipts.8
                        @Override // java.lang.Runnable
                        public void run() {
                            new worker(Receipts.this).postReceiptHeader();
                        }
                    };
                    new Thread(myRunnable5).start();
                    Runnable lines = new Runnable() { // from class: com.trimline.metrocrew.Receipts.9
                        @Override // java.lang.Runnable
                        public void run() {
                            new worker(Receipts.this).postReceiptLines();
                        }
                    };
                    new Thread(lines).start();
                }
                break;
            case R.id.addmember /* 2131361878 */:
                Member m = new Member();
                Intent inte = new Intent(this, (Class<?>) add_edit_member.class);
                inte.putExtra("member", m);
                startActivityForResult(inte, this.LAUNCH_SECOND_ACTIVITY);
                break;
        }
    }

    private class autocomplete extends AsyncTask<Void, Void, Void> {
        List<Member> members;
        List<payment_modes> paymodes;
        List<types> typess;
        List<Vehicles> vehicles;

        private autocomplete() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public Void doInBackground(Void... agents) {
            this.members = Receipts.this.model.getallmbers();
            this.typess = Receipts.this.tmodel.getalltypes();
            this.paymodes = Receipts.this.pmodel.getall();
            this.vehicles = Receipts.this.vmodel.getall();
            return null;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(Void res) {
            Receipts.this.adapter = new Member.autocomplete(Receipts.this, R.layout.autocompletemembers, this.members);
            Receipts.this.memberno.setAdapter(Receipts.this.adapter);
            types t = new types();
            t.Code = null;
            t.Name = "";
            this.typess.add(0, t);
            ArrayAdapter<types> dataAdapter = new ArrayAdapter<>(Receipts.this, R.layout.myspinner, this.typess);
            Receipts.this.ttypes.setAdapter((SpinnerAdapter) dataAdapter);
            payment_modes p = new payment_modes();
            p.Code = null;
            p.Name = "";
            this.paymodes.add(0, p);
            ArrayAdapter<payment_modes> dataAdapterpaymodes = new ArrayAdapter<>(Receipts.this, R.layout.paymodes, this.paymodes);
            Receipts.this.paymentmodes.setAdapter((SpinnerAdapter) dataAdapterpaymodes);
            Log.i("Vehicles", new Gson().toJson(this.vehicles));
            Vehicles.autocomplete v = new Vehicles.autocomplete(Receipts.this, R.layout.autocompletevehicles, this.vehicles);
            Receipts.this.vehicle.setAdapter(v);
        }
    }

    private class getloans extends AsyncTask<Void, Void, Void> {
        public String Mno;
        List<loan> loans;

        public getloans(String memberno) {
            this.Mno = memberno;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public Void doInBackground(Void... agents) {
            this.loans = Receipts.this.lmodel.getcustomerloans(this.Mno);
            return null;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(Void res) {
            loan l = new loan();
            l.Loan_No = null;
            this.loans.add(0, l);
            ArrayAdapter<loan> dataAdapter = new ArrayAdapter<>(Receipts.this, R.layout.myloanspinner, this.loans);
            Receipts.this.loanspinner.setAdapter((SpinnerAdapter) dataAdapter);
        }
    }
}
