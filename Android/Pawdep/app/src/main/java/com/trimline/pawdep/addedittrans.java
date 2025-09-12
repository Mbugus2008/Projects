package com.trimline.pawdep;

import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.DownloadManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;

import androidx.appcompat.widget.PopupMenu;
import androidx.databinding.DataBindingUtil;
import androidx.appcompat.app.AppCompatActivity;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.SharedPreferences;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.trimline.pawdep.databinding.Additem;


import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

public class addedittrans extends AppCompatActivity {
    String tno;
    Transaction t;
    Additem b;
    EditText edittext;
    Calendar myCalendar;
    Transaction.Model tModel;
    Group.dao Dao;
    Advance.dao advanceDao;
    T_line.dao tlinedao;
    Member.dao mdao;
    Loan.dao ldao;
    Repayment.dao adao;
    PW_Transactions.dao ptdao;
    private Transaction.dao tdao;
    ImageView newmember;
    SalesAdapter adapter;
    RecyclerView recyclerView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // setContentView(R.layout.activity_addedittrans);
        b = DataBindingUtil.setContentView(this, R.layout.addedittran);
        Group.Model gmodel = ViewModelProviders.of(this)
                .get(Group.Model.class);
        tModel = ViewModelProviders.of(this).get(Transaction.Model.class);
        DB db = DB.getInstance(getApplicationContext());
        Dao = db.groupDao();
        tdao = db.transactiondao();
        mdao = db.memberDao();
        advanceDao = db.advissuedao();
        tlinedao = db.t_linedao();
        mdao = db.memberDao();
        ldao = db.loandao();
        adao = db.adao();
        ptdao = db.ptadao();
        new GetgroupsTask().execute();
        newmember = (ImageView) findViewById(R.id.newmember);
        newmember.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Member m = new Member();
                m.No = Pawdep.Uid();
                m.Group_Name = t.Group_Name;
                m.Group_No = t.Group_Code;
                m.update = 1;
                Intent intent = new Intent(addedittrans.this, addeditmember.class);
                intent.putExtra("member", m);
                startActivity(intent);

            }
        });
        Intent i = getIntent();
        t = (Transaction) i.getSerializableExtra("Transaction");
        b.setTransaction(t);
        // new getadapterdata().execute(tno);
        b.GroupName.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Group g = (Group) parent.getItemAtPosition(position);
                if (g != null) {
                    b.groupbranch.setText(g.Branch_Name);
                    t.Group_Code = g.Old_Group_No;
                    t.Branch_Code = g.Branch_Code;
                    t.Branch_Name = g.Branch_Name;
                    b.setTransaction(t);
                }

            }
        });


        myCalendar = Calendar.getInstance();

        final DatePickerDialog.OnDateSetListener date = new DatePickerDialog.OnDateSetListener() {

            @Override
            public void onDateSet(DatePicker view, int year, int monthOfYear,
                                  int dayOfMonth) {
                // TODO Auto-generated method stub
                myCalendar.set(Calendar.YEAR, year);
                myCalendar.set(Calendar.MONTH, monthOfYear);
                myCalendar.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                updateLabel();
            }

        };

        b.date.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                new DatePickerDialog(addedittrans.this, date, myCalendar
                        .get(Calendar.YEAR), myCalendar.get(Calendar.MONTH),
                        myCalendar.get(Calendar.DAY_OF_MONTH)).show();
            }
        });

        recyclerView = findViewById(R.id.groupmembersummarylist);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(true);
    }
    private void updateLabel() {
        String myFormat = "dd/MM/yy"; //In which you need put here
        SimpleDateFormat sdf = new SimpleDateFormat(myFormat, Locale.US);
        b.date.setText(sdf.format(myCalendar.getTime()));
    }
    @Override
    public void onResume() {
        super.onResume();
        if (t != null)
            new getadapterdata().execute(t.Transaction_No);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.save, menu);
        return true;
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.save:
                if (!posted(t)) {
                    Transaction d = b.getTransaction();
                    tModel.insert(d);

                    Toast.makeText(getApplicationContext(), "Transaction successful saved", Toast.LENGTH_LONG).show();
                }
                return true;
            case R.id.List:
                if (!posted(t)) {
                    Transaction dd = b.getTransaction();
                    tModel.insert(dd);
                    Intent intent = new Intent(addedittrans.this, transline.class);
                    intent.putExtra("list", dd);
                    startActivityForResult(intent, 0);
                }
                return true;
            case R.id.advancerepayment:
                if (!posted(t)) {
                    tModel.insert(b.getTransaction());
                    Intent payloan = new Intent(addedittrans.this, Advance_Repayment.class);
                    payloan.putExtra("list", b.getTransaction());
                    startActivityForResult(payloan, 0);
                }
                return true;

            case R.id.transaction:
                if (!posted(t)) {
                    tModel.insert(b.getTransaction());
                    Intent pwtrans = new Intent(addedittrans.this, PW_Trans.class);
                    pwtrans.putExtra("list", b.getTransaction());
                    startActivityForResult(pwtrans, 0);
                }
                return true;
            case R.id.Booking:
                if (!posted(t)) {
                    tModel.insert(b.getTransaction());
                    Intent loanrequest = new Intent(addedittrans.this, Loan_request_app.class);
                    loanrequest.putExtra("list", b.getTransaction());
                    startActivityForResult(loanrequest, 0);
                }
                return true;
            case R.id.Grouploans:
                if (!posted(t)) {
                    tModel.insert(b.getTransaction());
                    Intent gloans = new Intent(addedittrans.this, Group_loan_issue.class);
                    gloans.putExtra("list", b.getTransaction());
                    startActivityForResult(gloans, 0);
                }
                return true;
            case R.id.Non_Cash:
                if (!posted(t)) {
                    tModel.insert(b.getTransaction());
                    Intent non = new Intent(addedittrans.this, Non_Cash_Tran.class);
                    non.putExtra("list", b.getTransaction());
                    startActivityForResult(non, 0);
                }
                return true;
            case R.id.loanapplication:
                if (!posted(t)) {
                    Intent lal = new Intent(addedittrans.this, Loan_app_list.class);
                    lal.putExtra("trans", b.getTransaction());
                    startActivityForResult(lal, 0);
                }
                return true;
            case R.id.advance:
                if (!posted(t)) {
                    tModel.insert(b.getTransaction());
                    Intent advanceissue = new Intent(addedittrans.this, Advance_Issue.class);
                    advanceissue.putExtra("list", b.getTransaction());
                    startActivityForResult(advanceissue, 0);
                }
                return true;

            case R.id.Post:
                if (!posted(t)) {
                    if (t.NonCash == 0) {
                        new AlertDialog.Builder(this)
                                .setTitle("No Non-Cash transactions")
                                .setMessage("Do you want to send for approval without Non-cash transactions?")
                                .setIcon(android.R.drawable.ic_dialog_alert)
                                .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int whichButton) {
                                        tModel.insert(b.getTransaction());
                                        Transaction tt = b.getTransaction();
                                        new Post().execute(tt);
                                    }
                                })
                                .setNegativeButton(R.string.Edit, new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        tModel.insert(b.getTransaction());
                                        Intent non = new Intent(addedittrans.this, Non_Cash_Tran.class);
                                        non.putExtra("list", b.getTransaction());
                                        startActivityForResult(non, 0);
                                    }
                                }).show();
                    } else {
                        new AlertDialog.Builder(this)
                                .setTitle("Sending For Approval")
                                .setMessage("Do you Want to send this Group transaction for approval?\n The transaction will not be editable after.")
                                .setIcon(android.R.drawable.ic_dialog_alert)
                                .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {

                                    public void onClick(DialogInterface dialog, int whichButton) {
                                        tModel.insert(b.getTransaction());
                                        Transaction tt = b.getTransaction();
                                        new Post().execute(tt);
                                    }
                                })
                                .setNegativeButton(android.R.string.no, null).show();

                    }
                }
                return true;
            case R.id.print:
                tModel.insert(b.getTransaction());
                Printer.printer p = new Printer.printer();
                Member[] mm = t.members;
                SharedPreferences preferences = getSharedPreferences("Settings", MODE_PRIVATE);
                JsonParser.preferences = preferences;
                String delay = preferences.getString("DELAY", "");
                if (!t.Posted) {
                    Toast.makeText(getApplicationContext(), "Transaction Must be Sent for approval before you Print Receipts", Toast.LENGTH_LONG).show();
                    return true;
                }
                for (Member m : mm
                ) {
                    if (m.Total > 0) {

                        p.printcollection(m);
//                        try {
//                            if (delay!=null) {
//                                Toast.makeText(this, "Please Tear the receipt", Toast.LENGTH_SHORT).show();
//                                Thread.sleep(Integer.valueOf(delay)*1000);
//                            }  } catch (InterruptedException e) {
//                                e.printStackTrace();
//                            }

                    }
                }

                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    private Boolean posted(Transaction t) {
        if (t.Posted)
            Toast.makeText(this, "Transaction has been sent for approval and cannot be edited", Toast.LENGTH_SHORT).show();
        return t.Posted;
    }

    private class GetgroupsTask extends AsyncTask<Void, Void, List<Group>> {
        @Override
        protected List<Group> doInBackground(Void... notes) {
            List<Group> l = Dao.Groups();

            return l;
        }

        @Override
        protected void onPostExecute(List<Group> res) {

            if (res.size() != 0) {
                Log.i("groups", "Loading");
                Group.Groupsadapter adapter = new Group.Groupsadapter(addedittrans.this, R.layout.groupnames, res);
                b.GroupName.setAdapter(adapter);

            }
        }
    }

    private class getadapterdata extends AsyncTask<String, Void, Transaction> {
        @Override
        protected Transaction doInBackground(String... notes) {
            Transaction t = tModel.gettransaction(notes[0]);
            if (t != null) {
                List<T_line> t_lines = tlinedao.Transctionline(t.Transaction_No);

                List<Repayment> repayments = adao.GroupLoans(t.Transaction_No);

                List<Advance> advances = advanceDao.Groupadvances(t.Transaction_No);

                List<PW_Transactions> othertrans = ptdao.getgrouptransaction(t.Transaction_No);

                List<Member> mm = mdao.getbygroupmembers(t.Group_Name);
//
                for (Member m : mm
                ) {
                    m.Transaction_No = t.Transaction_No;
                    m.StringDate = t.StringDate;
                    m.Advances_Issued = (float) advances.stream().filter(o -> o.Pawdep_No.contentEquals(m.No)).mapToDouble(a -> a.Amount).sum();
                    m.Advance_Fees = (float) advances.stream().filter(o -> o.Pawdep_No.contentEquals(m.No)).mapToDouble(a -> a.Advance_Fees).sum();
                    m.othertrans = othertrans.stream().filter(o -> o.Pawdep_No.contentEquals(m.No)).collect(Collectors.toList());
                    m.Advance_Principle_Paid = (float) repayments.stream().filter(o -> o.Pawdep_No.contentEquals(m.No)).mapToDouble(a -> a.Principle_Paid).sum();
                    m.Advance_Interest_Paid = (float) repayments.stream().filter(o -> o.Pawdep_No.contentEquals(m.No)).mapToDouble(a -> a.Interest_Paid).sum();
                    m.Advance_Penalty = (float) repayments.stream().filter(o -> o.Pawdep_No.contentEquals(m.No)).mapToDouble(a -> a.Penalty).sum();
                    m.Interest_Paid = (float) t_lines.stream().filter(o -> o.PAWDEP_No.contentEquals(m.No)).mapToDouble(a -> a.Interest_Paid).sum();
                    m.Principle_Paid = (float) t_lines.stream().filter(o -> o.PAWDEP_No.contentEquals(m.No)).mapToDouble(a -> a.Principle_Paid).sum();
                    m.Monthly_Savings = (float) t_lines.stream().filter(o -> o.PAWDEP_No.contentEquals(m.No)).mapToDouble(a -> a.Monthly_Savings).sum();
                    m.Fines = (float) t_lines.stream().filter(o -> o.PAWDEP_No.contentEquals(m.No)).mapToDouble(a -> a.Fines).sum();
                    m.Hall = (float) t_lines.stream().filter(o -> o.PAWDEP_No.contentEquals(m.No)).mapToDouble(a -> a.Hall).sum();
                    m.Penalty = (float) t_lines.stream().filter(o -> o.PAWDEP_No.contentEquals(m.No)).mapToDouble(a -> a.Penalty_Charged).sum();
                    m.Advance_Paid = m.Advance_Interest_Paid + m.Advance_Principle_Paid;
                    m.Loan_Paid = m.Interest_Paid + m.Principle_Paid;
                    m.Total = m.Advance_Fees + m.Advance_Principle_Paid + m.Advance_Interest_Paid + m.Principle_Paid + m.Interest_Paid + m.Monthly_Savings + m.Fines + m.Hall + m.Penalty;

                }
                t.members = mm.stream().toArray(Member[]::new);
            }
            return t;
        }

        @Override
        protected void onPostExecute(Transaction res) {
            if (res != null) {
                t = res;
                b.setTransaction(t);
                adapter = new SalesAdapter(Arrays.asList(t.members).stream().sorted(Comparator.comparing(Member::getMemberNo)).collect(Collectors.toList()), addedittrans.this, t);

                recyclerView.setAdapter(adapter);
            }
        }
    }

    private class Post extends AsyncTask<Transaction, Void, Transaction> {
        @Override
        protected Transaction doInBackground(Transaction... notes) {
            t.Posted = (tdao.Post(notes[0].Transaction_No) == 1);

            return t;
        }

        @Override
        protected void onPostExecute(Transaction res) {
            if (res.Posted) {
                Toast.makeText(addedittrans.this, "Transaction has been sent for approval", Toast.LENGTH_SHORT).show();
                Runnable myRunnable5 = new Runnable() {
                    @Override
                    public void run() {
                        new worker(addedittrans.this).sendtrans();
                    }
                };
                new Thread(myRunnable5).start();

            } else
                Toast.makeText(addedittrans.this, "Failed, Please try again", Toast.LENGTH_SHORT).show();

        }
    }


    public static class SalesAdapter extends RecyclerView.Adapter<SalesAdapter.ProductViewHolder> {
        private Transaction t;
        private List<Member> members;
        Context context;

        public SalesAdapter(List<Member> grocderyItemList, Context context, Transaction tt) {
            this.members = grocderyItemList;
            this.context = context;
            this.t = tt;
        }

        @Override
        public ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            //inflate the layout file
            View groceryProductView = LayoutInflater.from(parent.getContext()).inflate(R.layout.membersummary, parent, false);
            ProductViewHolder gvh = new ProductViewHolder(groceryProductView);
            return gvh;
        }

        @Override
        public void onBindViewHolder(ProductViewHolder holder, final int position) {
            //holder.imageProductImage.setImageResource(members.get(position).getProductImage());
            Member m = members.get(position);
            holder.name.setText(m.Name);
            holder.pawdepno.setText(Html.fromHtml(String.format("%s(<b>%s</b>)", m.No, m.GID)));
            holder.principal.setText(String.format("%,.2f", m.Principle_Paid));
            holder.interest.setText(String.format("%,.2f", m.Interest_Paid));
            holder.advanceprincipal.setText(String.format("%,.2f", m.Advance_Principle_Paid));
            holder.advanceinterest.setText(String.format("%,.2f", m.Advance_Interest_Paid));
            holder.fines.setText(String.format("%,.2f", m.Fines));
            holder.Hall.setText(String.format("%,.2f", m.Hall));
            holder.othertrans.setText(String.format("%,.2f", m.othertrans.stream().mapToDouble(o -> o.Amount).sum()));
            holder.total.setText(String.format("%,.2f", m.Total));
            holder.advanceissued.setText(String.format("%,.2f", m.Advances_Issued));
            holder.savings.setText(String.format("%,.2f", m.Monthly_Savings));

            if (m.Total > 0)
                holder.print.setVisibility(View.VISIBLE);
            else
                holder.print.setVisibility(View.GONE);

            holder.print.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if (t.Posted)
                        new Printer.printer().printcollection(m);
                    else
                        Toast.makeText(context, "The Performance must be sent for approval before you can print the receipt", Toast.LENGTH_SHORT).show();
                }
            });

            holder.menu.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
//creating a popup menu
                    PopupMenu popup = new PopupMenu(context, holder.menu);
                    //inflating menu from xml resource
                    popup.inflate(R.menu.membermenu);
                    //adding click listener
                    popup.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() {
                        @Override
                        public boolean onMenuItemClick(MenuItem item) {
                            switch (item.getItemId()) {
                                case R.id.loans:
                                    Intent intent = new Intent(context, Loan_history.class);
                                    intent.putExtra("member", m);
                                    context.startActivity(intent);
                                    break;
                                case R.id.statement:
                                   new statement(m.No).execute();
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
            return members.size();
        }

        public class ProductViewHolder extends RecyclerView.ViewHolder {
            TextView pawdepno, name, no, principal, interest, advanceprincipal, advanceinterest, fines, Hall, othertrans, advanceissued, penalty, loandisbursed, total, savings,menu;
            ImageView print;


            public ProductViewHolder(View view) {
                super(view);
                pawdepno = view.findViewById(R.id.member_PAWDEP_No);
                name = view.findViewById(R.id.member_Member_Name);
                principal = view.findViewById(R.id.member_Loan_Principle_Paid);
                interest = view.findViewById(R.id.member_Loan_Interest_Paid);
                advanceinterest = view.findViewById(R.id.member_Advance_Interest_Paid);
                advanceprincipal = view.findViewById(R.id.member_Advance_Principle_Paid);
                fines = view.findViewById(R.id.member_Fines);
                othertrans = view.findViewById(R.id.member_Othertrans);
                total = view.findViewById(R.id.member_totalpaid);
                Hall = view.findViewById(R.id.member_Hall);
                advanceissued = view.findViewById(R.id.member_Advanceissue);
                savings = view.findViewById(R.id.member_Savingsreceived);
                menu = view.findViewById(R.id.textViewOptions);
                print = view.findViewById(R.id.print);


            }
        }




        private class statement extends AsyncTask<Void, Void, String> {

            private String member;
            public  statement(String m)
            {
                this.member= m;

            }
            @Override
            protected String doInBackground(Void... notes) {

                String path = JsonParser.postjson("statement", "memberno", member);

                return path;
            }

            @Override
            protected void onPostExecute(String res) {

                beginDownload("http://173.249.49.91:3544/Statements/"+ res + ".pdf",member.replace("/","_"));
            }
        }

        public  void beginDownload(String url,String name ) {
try {
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url))
                    .setTitle(name)// Title of the Download Notification
                    .setDescription("Downloading")// Description of the Download Notification
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)// Visibility of the download Notification
                    .setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS,name)
                    .setMimeType("*/*")
                    //.setDestinationUri(Uri.fromFile(file))// Uri of the destination file
                    .setRequiresCharging(false)// Set if charging is required to begin the download
                    .setAllowedOverMetered(true)// Set if download is allowed on Mobile network
                    .setAllowedOverRoaming(true);// Set if download is allowed on roaming network
            DownloadManager downloadManager = (DownloadManager) context. getSystemService(DOWNLOAD_SERVICE);
            downloadID = downloadManager.enqueue(request);// enqueue puts the download request in the queue.
        }catch ( Exception ex){
    ex.printStackTrace();

}}

    }
   static long downloadID;
    private BroadcastReceiver onDownloadComplete = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            //Fetching the download id received with the broadcast
            long id = intent.getLongExtra(DownloadManager.EXTRA_DOWNLOAD_ID, -1);
            //Checking if the received broadcast is for our enqueued download by matching download id
            if ( downloadID == id) {
                Toast.makeText(addedittrans.this, "Download Completed", Toast.LENGTH_SHORT).show();
            }
        }
    };
    @Override
    public void onDestroy() {
        super.onDestroy();
        try {
            unregisterReceiver(onDownloadComplete);
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
