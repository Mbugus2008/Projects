package com.trimline.metrocrew;

import android.app.DatePickerDialog;
import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.Html;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import androidx.lifecycle.ViewModelProviders;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.function.ToDoubleFunction;
import org.apache.commons.cli.HelpFormatter;

/* JADX INFO: loaded from: classes5.dex */
public class transaction_details extends AppCompatActivity implements View.OnClickListener {
    Date d;
    String date;
    ExpandableListAdapter expandableListAdapter;
    LinkedHashMap<theader, List<transaction>> expandableListDetail;
    List<theader> expandableListTitle;
    ExpandableListView expandableListView;
    private int mDay;
    private int mHour;
    private int mMinute;
    private int mMonth;
    private int mYear;
    List<tlines> masterdata;
    ProgressDialog progress;
    Button setdate;
    theader.Model theaderModel;
    transaction.Model tmodel;
    TextView total;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.transaction_details);
        this.theaderModel = (theader.Model) ViewModelProviders.of(this).get(theader.Model.class);
        this.tmodel = (transaction.Model) ViewModelProviders.of(this).get(transaction.Model.class);
        this.expandableListView = (ExpandableListView) findViewById(R.id.tdetails);
        this.total = (TextView) findViewById(R.id.total);
        this.progress = new ProgressDialog(this);
        this.progress.setMessage("Loading report");
        this.progress.setProgressStyle(1);
        this.progress.setIndeterminate(false);
        this.progress.setProgress(0);
        this.expandableListView.setOnGroupExpandListener(new ExpandableListView.OnGroupExpandListener() { // from class: com.trimline.metrocrew.transaction_details.1
            @Override // android.widget.ExpandableListView.OnGroupExpandListener
            public void onGroupExpand(int groupPosition) {
            }
        });
        this.expandableListView.setOnGroupCollapseListener(new ExpandableListView.OnGroupCollapseListener() { // from class: com.trimline.metrocrew.transaction_details.2
            @Override // android.widget.ExpandableListView.OnGroupCollapseListener
            public void onGroupCollapse(int groupPosition) {
            }
        });
        this.expandableListView.setOnChildClickListener(new ExpandableListView.OnChildClickListener() { // from class: com.trimline.metrocrew.transaction_details.3
            @Override // android.widget.ExpandableListView.OnChildClickListener
            public boolean onChildClick(ExpandableListView parent, View v, int groupPosition, int childPosition, long id) {
                return false;
            }
        });
        Calendar c = Calendar.getInstance();
        this.mYear = c.get(1);
        this.mMonth = c.get(2);
        this.mDay = c.get(5);
        int m = this.mMonth + 1;
        String date = this.mYear + HelpFormatter.DEFAULT_OPT_PREFIX + m + HelpFormatter.DEFAULT_OPT_PREFIX + this.mDay;
        this.d = Date.valueOf(date);
        this.setdate = (Button) findViewById(R.id.Date);
        this.setdate.setText(this.d.toString());
        this.setdate.setOnClickListener(this);
        Calendar cal = Calendar.getInstance();
        cal.set(2025, 9, 4, 0, 0, 0);
        cal.set(14, 0);
        cal.getTimeInMillis();
        cal.set(2025, 9, 4, 23, 59, 59);
        cal.set(14, 999);
        cal.getTimeInMillis();
        new getdatas().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, cal.getTime());
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        DatePickerDialog datePickerDialog = new DatePickerDialog(this, new DatePickerDialog.OnDateSetListener() { // from class: com.trimline.metrocrew.transaction_details.4
            @Override // android.app.DatePickerDialog.OnDateSetListener
            public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                int monthOfYear2 = monthOfYear + 1;
                String date = year + HelpFormatter.DEFAULT_OPT_PREFIX + monthOfYear2 + HelpFormatter.DEFAULT_OPT_PREFIX + dayOfMonth;
                Date d = Date.valueOf(date);
                transaction_details.this.setdate.setText(d.toString());
                Calendar cal = Calendar.getInstance();
                cal.set(year, monthOfYear2, dayOfMonth, 0, 0, 0);
                cal.set(14, 0);
                new getdatas().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, cal.getTime());
            }
        }, this.mYear, this.mMonth, this.mDay);
        datePickerDialog.show();
    }

    public void loaddata(Date date) {
        List<tlines> tt = new ArrayList<>();
        if (this.masterdata != null) {
            for (tlines t : this.masterdata) {
                try {
                    if (date.equals(t.theader.Date)) {
                        tt.add(t);
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            this.total.setText(Html.fromHtml(String.format("Total       : <b>%,.2f</b>", Double.valueOf(tt.stream().mapToDouble(new ToDoubleFunction() { // from class: com.trimline.metrocrew.transaction_details$$ExternalSyntheticLambda0
                @Override // java.util.function.ToDoubleFunction
                public final double applyAsDouble(Object obj) {
                    return ((tlines) obj).theader.Amount_Recieved;
                }
            }).sum()))));
        }
        this.expandableListDetail = getdata(tt);
        this.expandableListTitle = new ArrayList(this.expandableListDetail.keySet());
        this.expandableListTitle.sort(new Comparator() { // from class: com.trimline.metrocrew.transaction_details$$ExternalSyntheticLambda1
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return ((theader) obj).Getdatetime().compareTo(((theader) obj2).Getdatetime());
            }
        });
        this.expandableListAdapter = new theader.CustomExpandableListAdapter(this, this.expandableListTitle, this.expandableListDetail, this.theaderModel, this.tmodel);
        this.expandableListView.setAdapter(this.expandableListAdapter);
    }

    public LinkedHashMap<theader, List<transaction>> getdata(List<tlines> tlines) {
        LinkedHashMap<theader, List<transaction>> list = new LinkedHashMap<>();
        for (tlines t : tlines) {
            Log.d("Transss", t.theader.Date.toString());
            list.put(t.theader, t.transactionList);
        }
        return list;
    }

    /* JADX INFO: Access modifiers changed from: private */
    class getdatas extends AsyncTask<java.util.Date, Void, List<tlines>> {
        private getdatas() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public List<tlines> doInBackground(java.util.Date... date) {
            java.util.Date selectedDate = date[0];
            transaction_details.this.masterdata = transaction_details.this.theaderModel.gettransactionreportdaily(selectedDate);
            transaction_details.this.masterdata.sort(new Comparator() { // from class: com.trimline.metrocrew.transaction_details$getdatas$$ExternalSyntheticLambda0
                @Override // java.util.Comparator
                public final int compare(Object obj, Object obj2) {
                    return ((tlines) obj).theader.Getdatetime().compareTo(((tlines) obj2).theader.Getdatetime());
                }
            });
            return transaction_details.this.masterdata;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(List<tlines> l) {
            try {
                transaction_details.this.loaddata(transaction_details.this.d);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
