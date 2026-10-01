package com.trimline.metrocrew;

import android.app.Application;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.TextView;
import androidx.appcompat.app.AlertDialog;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.recyclerview.widget.RecyclerView;
import com.google.gson.Gson;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

/* JADX INFO: loaded from: classes5.dex */
public class theader implements Cloneable {
    public String Account_No;
    public float Amount_Recieved;
    public Boolean Amount_RecievedSpecified;
    public String Bank_Code;
    public String Bank_Name;
    public String Bank_Ref_No;
    public String Cashier;
    public Date Cheque_Deposit_Slip_Date;
    public Boolean Cheque_Deposit_Slip_DateSpecified;
    public String Cheque_Deposit_Slip_No;
    public String Cheque_No;
    public String Created_By;
    public Date Created_Date_Time;
    public Boolean Created_Date_TimeSpecified;
    public String Currency_Code;
    public float Currency_Factor;
    public Boolean Currency_FactorSpecified;
    public float DFLT;
    public Boolean DFLTSpecified;
    public Date Date;
    public Boolean DateSpecified;
    public Date Date_Posted;
    public Boolean Date_PostedSpecified;
    public String Dim1;
    public String Dim2;
    public String Dim3;
    public String Dim4;
    public int Dimension_Set_ID;
    public Boolean Dimension_Set_IDSpecified;
    public Date Document_Date;
    public Boolean Document_DateSpecified;
    public int From_Entry_No;
    public Boolean From_Entry_NoSpecified;
    public String Global_Dimension_1_Code;
    public String Group_Name;
    public String Key;
    public String Name;
    public String No;
    public int No_Printed;
    public Boolean No_PrintedSpecified;
    public String No_Series;
    public String On_Behalf_Of;
    public String PayMode;
    public Boolean Pay_ModeSpecified;
    public Boolean Posted;
    public Boolean PostedSpecified;
    public String Posted_By;
    public int Print_No;
    public Boolean Print_NoSpecified;
    public Boolean Receipt_TypeSpecified;
    public String Received_From;
    public String Reference_No;
    public int Register_No;
    public Boolean Register_NoSpecified;
    public String Responsibility_Center;
    public String Shortcut_Dimension_2_Code;
    public String Shortcut_Dimension_3_Code;
    public String Shortcut_Dimension_4_Code;
    public Boolean StatusSpecified;
    public Date Time_Posted;
    public Boolean Time_PostedSpecified;
    public int To_Entry_No;
    public Boolean To_Entry_NoSpecified;
    public float Total_Amount;
    public Boolean Total_AmountSpecified;
    public float Total_Amount_Guaranteed;
    public Boolean Total_Amount_GuaranteedSpecified;
    public boolean sent;
    public List<transaction> tlines;

    public enum Pay_Mode {
        _blank_,
        Cash,
        Cheque,
        EFT,
        Deposit_Slip,
        Banker_x0027_s_Cheque,
        RTGS,
        Custom3,
        Paybill
    }

    public enum Receipt_Type {
        Bank,
        Cash
    }

    public static abstract class dao {
        abstract void delete(theader entity);

        abstract long insert(theader entity);

        abstract LiveData<List<theader>> loadAll();

        abstract List<theader> loadAll(boolean sent);

        abstract LiveData<List<theader>> loadtodays();

        abstract List<tlines> transaction_n_lines();

        abstract List<tlines> transaction_n_linesdaily(long startOfDay, long endOfDay);

        abstract void update(theader entity);

        abstract void updateHeader(float total, String documentNo, String payMode, String accountNo);
    }

    public String Getdate() {
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
        return sd.format((java.util.Date) this.Date);
    }

    public String Getdatetime() {
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddhhmmss");
        return sd.format((java.util.Date) this.Date);
    }

    public enum Stat {
        _blank_(0),
        Normal(0),
        Post_Dated(0),
        Posted(0),
        Partial(0),
        Pending_Approval(0),
        Approved(0),
        Cancelled(0);

        private int mValue;

        Stat(int value) {
            this.mValue = value;
        }

        public int id() {
            return this.mValue;
        }

        public static Stat fromId(int value) {
            for (Stat status : values()) {
                if (status.mValue == value) {
                    return status;
                }
            }
            return _blank_;
        }
    }

    public static class Repository {
        private dao dao;
        private transaction.dao tdao;
        public LiveData<List<theader>> tranListLive;
        public LiveData<List<theader>> tranListLive_todays;
        private List<transaction> transList;

        public Repository(Application application) {
            this.tranListLive = new MutableLiveData();
            this.tranListLive_todays = new MutableLiveData();
            DB database = DB.getInstance(application);
            this.dao = database.thDao();
            this.tranListLive = this.dao.loadAll();
            this.tranListLive_todays = this.dao.loadtodays();
        }

        public LiveData<List<theader>> findAll() {
            return this.tranListLive;
        }

        public LiveData<List<theader>> findtodays() {
            return this.tranListLive_todays;
        }

        public void insert(theader theader) {
            new InserttheaderAsyncTask(this.dao, theader).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new theader[0]);
        }

        public void update(theader theader) {
            new UpdatetheaderAsyncTask(this.dao, theader).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new theader[0]);
        }

        public void delete(theader theader) {
            new DeletetheaderAsyncTask(this.dao).execute(theader);
        }

        public void updateHeader(theader theader) {
            new UpdateHeaderAsyncTask(this.dao).execute(theader);
        }

        private class InserttheaderAsyncTask extends AsyncTask<theader, Void, Void> {
            private dao dao;
            private theader theader;

            private InserttheaderAsyncTask(dao dao, theader theader1) {
                this.dao = dao;
                this.theader = theader1;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(theader... theaders) {
                this.dao.insert(this.theader);
                return null;
            }
        }

        private class UpdatetheaderAsyncTask extends AsyncTask<theader, Void, Void> {
            private dao dao;
            private theader theader;

            private UpdatetheaderAsyncTask(dao dao, theader theader1) {
                this.dao = dao;
                this.theader = theader1;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(theader... theaders) {
                Log.i("Updating", new Gson().toJson(this.theader));
                this.dao.update(this.theader);
                return null;
            }
        }

        private class UpdateHeaderAsyncTask extends AsyncTask<theader, Void, Void> {
            private dao dao;

            private UpdateHeaderAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(theader... theaders) {
                this.dao.updateHeader(theaders[0].Total_Amount, theaders[0].No, theaders[0].PayMode, theaders[0].Account_No);
                return null;
            }
        }

        private class DeletetheaderAsyncTask extends AsyncTask<theader, Void, Void> {
            private dao dao;

            private DeletetheaderAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(theader... theaders) {
                this.dao.delete(theaders[0]);
                return null;
            }
        }
    }

    public static class Model extends AndroidViewModel {
        public LiveData<List<theader>> livetrans;
        public LiveData<List<theader>> livetrans_todays;
        private Repository repository;
        public List<theader> trans;

        public Model(Application application) {
            super(application);
            this.trans = new ArrayList();
            this.repository = new Repository(application);
            this.livetrans = this.repository.findAll();
            this.livetrans_todays = this.repository.findtodays();
        }

        public void insert(theader theader) {
            this.repository.insert(theader);
        }

        public void update(theader theader) {
            this.repository.update(theader);
        }

        public void updateHeader(theader theader) {
            this.repository.updateHeader(theader);
        }

        public void delete(theader theader) {
            this.repository.delete(theader);
        }

        public LiveData<List<theader>> gettransactions() {
            return this.livetrans;
        }

        public LiveData<List<theader>> gettodaystransactions() {
            return this.livetrans_todays;
        }

        public List<tlines> gettransactionreport() {
            return this.repository.dao.transaction_n_lines();
        }

        public List<tlines> gettransactionreportdaily(java.util.Date selectedDate) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(selectedDate);
            cal.set(11, 0);
            cal.set(12, 0);
            cal.set(13, 0);
            cal.set(14, 0);
            long startOfDay = cal.getTimeInMillis();
            cal.set(11, 23);
            cal.set(12, 59);
            cal.set(13, 59);
            cal.set(14, 999);
            long endOfDay = cal.getTimeInMillis();
            return this.repository.dao.transaction_n_linesdaily(startOfDay, endOfDay);
        }
    }

    public static class adapter extends RecyclerView.Adapter<Holder> {
        private OnItemClickListener listener;
        private final LayoutInflater mInflater;
        private List<theader> theaders;

        public interface OnItemClickListener {
            void onItemClick(theader note);
        }

        adapter(Context context) {
            this.mInflater = LayoutInflater.from(context);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public Holder onCreateViewHolder(ViewGroup parent, int viewType) {
            View itemView = this.mInflater.inflate(R.layout.trans, parent, false);
            return new Holder(itemView);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public void onBindViewHolder(Holder holder, int position) {
            theader currentNote = this.theaders.get(position);
            SimpleDateFormat df = new SimpleDateFormat("dd-MM-yy HH:mm:ss");
            holder.member.setText(currentNote.Received_From + " (" + currentNote.Account_No + ")");
            holder.receipt.setText(currentNote.No + " | " + df.format((java.util.Date) currentNote.Created_Date_Time) + "  | " + currentNote.From_Entry_No);
            holder.amount.setText(String.valueOf(currentNote.Amount_Recieved));
            if (currentNote.Print_No != 1) {
                return;
            }
            holder.member.setPaintFlags(16);
            holder.receipt.setPaintFlags(16);
        }

        void setTransactions(List<theader> words) {
            this.theaders = words;
            notifyDataSetChanged();
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemCount() {
            if (this.theaders != null) {
                return this.theaders.size();
            }
            return 0;
        }

        class Holder extends RecyclerView.ViewHolder {
            private TextView amount;
            private TextView member;
            private TextView receipt;

            private Holder(View itemView) {
                super(itemView);
                this.member = (TextView) itemView.findViewById(R.id.member);
                this.receipt = (TextView) itemView.findViewById(R.id.receipt);
                this.amount = (TextView) itemView.findViewById(R.id.amount);
                itemView.getRootView().setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.theader.adapter.Holder.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View v) {
                        int position = Holder.this.getAdapterPosition();
                        if (adapter.this.listener != null && position != -1) {
                            adapter.this.listener.onItemClick((theader) adapter.this.theaders.get(position));
                        }
                    }
                });
            }
        }

        public void setOnItemClickListener(OnItemClickListener listener) {
            this.listener = listener;
        }
    }

    public static class CustomExpandableListAdapter extends BaseExpandableListAdapter {
        private Context context;
        private LinkedHashMap<theader, List<transaction>> expandableListDetail;
        private List<theader> expandableListTitle;
        Model thmodel;
        transaction.Model tmodel;

        public CustomExpandableListAdapter(Context context, List<theader> expandableListTitle, LinkedHashMap<theader, List<transaction>> expandableListDetail, Model thmodel, transaction.Model tmodel) {
            this.context = context;
            this.expandableListTitle = expandableListTitle;
            this.expandableListDetail = expandableListDetail;
            this.thmodel = thmodel;
            this.tmodel = tmodel;
        }

        @Override // android.widget.ExpandableListAdapter
        public Object getChild(int listPosition, int expandedListPosition) {
            return this.expandableListDetail.get(this.expandableListTitle.get(listPosition)).get(expandedListPosition);
        }

        @Override // android.widget.ExpandableListAdapter
        public long getChildId(int listPosition, int expandedListPosition) {
            return expandedListPosition;
        }

        @Override // android.widget.ExpandableListAdapter
        public View getChildView(int listPosition, final int expandedListPosition, boolean isLastChild, View convertView, ViewGroup parent) {
            transaction expandedListText = (transaction) getChild(listPosition, expandedListPosition);
            if (convertView == null) {
                LayoutInflater layoutInflater = (LayoutInflater) this.context.getSystemService("layout_inflater");
                convertView = layoutInflater.inflate(R.layout.report_item, (ViewGroup) null);
            }
            TextView expandedListTextView = (TextView) convertView.findViewById(R.id.Type);
            expandedListTextView.setText(expandedListText.transtype);
            TextView amount = (TextView) convertView.findViewById(R.id.Amount);
            amount.setText(Html.fromHtml(String.format("<b>%,.2f</b>", expandedListText.Amount)));
            return convertView;
        }

        @Override // android.widget.ExpandableListAdapter
        public int getChildrenCount(int listPosition) {
            return this.expandableListDetail.get(this.expandableListTitle.get(listPosition)).size();
        }

        @Override // android.widget.ExpandableListAdapter
        public Object getGroup(int listPosition) {
            return this.expandableListTitle.get(listPosition);
        }

        @Override // android.widget.ExpandableListAdapter
        public int getGroupCount() {
            return this.expandableListTitle.size();
        }

        @Override // android.widget.ExpandableListAdapter
        public long getGroupId(int listPosition) {
            return listPosition;
        }

        @Override // android.widget.ExpandableListAdapter
        public View getGroupView(final int listPosition, boolean isExpanded, View convertView, ViewGroup parent) {
            View convertView2;
            final theader _theader = (theader) getGroup(listPosition);
            if (convertView != null) {
                convertView2 = convertView;
            } else {
                LayoutInflater layoutInflater = (LayoutInflater) this.context.getSystemService("layout_inflater");
                convertView2 = layoutInflater.inflate(R.layout.report_group, (ViewGroup) null);
            }
            List<transaction> trnss = this.expandableListDetail.get(this.expandableListTitle.get(listPosition));
            String types = (String) trnss.stream().map(new Function() { // from class: com.trimline.metrocrew.theader$CustomExpandableListAdapter$$ExternalSyntheticLambda0
                @Override // java.util.function.Function
                public final Object apply(Object obj) {
                    return ((transaction) obj).getTranstype();
                }
            }).collect(Collectors.joining(", "));
            TextView time = (TextView) convertView2.findViewById(R.id.time);
            SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
            time.setText(_theader.No + " | " + df.format((java.util.Date) _theader.Created_Date_Time) + " | " + types);
            TextView listTitleTextView = (TextView) convertView2.findViewById(R.id.ReceiptNo);
            listTitleTextView.setText(_theader.Received_From);
            TextView sent = (TextView) convertView2.findViewById(R.id.sent);
            if (_theader.sent) {
                sent.setVisibility(0);
            } else {
                sent.setVisibility(8);
            }
            TextView amount = (TextView) convertView2.findViewById(R.id.amount);
            amount.setText(Html.fromHtml(String.format("<b>%,.2f</b>", Float.valueOf(_theader.Amount_Recieved))));
            final View finalConvertView = convertView2;
            TextView print = (TextView) convertView2.findViewById(R.id.print);
            print.setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.theader.CustomExpandableListAdapter.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    Printer.printer p = new Printer.printer();
                    Bitmap b = BitmapFactory.decodeResource(finalConvertView.getResources(), R.drawable.clear_24dp);
                    p.printcollection(b, _theader);
                }
            });
            if (_theader.Print_No == 0) {
                print.setVisibility(0);
            } else {
                print.setVisibility(8);
            }
            TextView reverse = (TextView) convertView2.findViewById(R.id.reverse);
            if (agent.Model.CurrentAgent.Account_type == 1 && _theader.Print_No == 0) {
                reverse.setVisibility(0);
            } else {
                reverse.setVisibility(8);
            }
            reverse.setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.theader.CustomExpandableListAdapter.2
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    AlertDialog.Builder builder = new AlertDialog.Builder(CustomExpandableListAdapter.this.context);
                    builder.setTitle(R.string.app_name);
                    builder.setMessage("Do you want to cancel this receipt for " + _theader.Received_From + " of KES " + _theader.Amount_Recieved + " ?");
                    builder.setIcon(R.drawable.erase);
                    builder.setPositiveButton("Yes", new DialogInterface.OnClickListener() { // from class: com.trimline.metrocrew.theader.CustomExpandableListAdapter.2.1
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int id) {
                            _theader.Print_No = 1;
                            _theader.Print_NoSpecified = true;
                            Log.i("Update", new Gson().toJson(_theader));
                            CustomExpandableListAdapter.this.thmodel.update(_theader);
                            theader theader = null;
                            try {
                                theader = (theader) _theader.clone();
                                theader.Amount_Recieved = _theader.Amount_Recieved * (-1.0f);
                                theader.No = _theader.No + "R";
                                theader.sent = false;
                                theader.Print_No = 1;
                                theader.Print_NoSpecified = true;
                                Log.i("Insert", new Gson().toJson(theader));
                                CustomExpandableListAdapter.this.expandableListTitle.add(theader);
                                CustomExpandableListAdapter.this.thmodel.insert(theader);
                            } catch (CloneNotSupportedException e) {
                                e.printStackTrace();
                            }
                            Log.i("MMMM", new Gson().toJson(CustomExpandableListAdapter.this.expandableListDetail.get(CustomExpandableListAdapter.this.expandableListTitle.get(listPosition))));
                            List<transaction> trns = (List) CustomExpandableListAdapter.this.expandableListDetail.get(CustomExpandableListAdapter.this.expandableListTitle.get(listPosition));
                            List<transaction> trl = new ArrayList<>();
                            for (transaction tr : trns) {
                                tr.No = theader.No;
                                tr.Amount = Double.valueOf(tr.Amount.doubleValue() * (-1.0d));
                                tr.sent = false;
                                trl.add(tr);
                            }
                            CustomExpandableListAdapter.this.tmodel.insert(trl);
                            CustomExpandableListAdapter.this.notifyDataSetChanged();
                            dialog.dismiss();
                        }
                    });
                    builder.setNegativeButton("No", new DialogInterface.OnClickListener() { // from class: com.trimline.metrocrew.theader.CustomExpandableListAdapter.2.2
                        @Override // android.content.DialogInterface.OnClickListener
                        public void onClick(DialogInterface dialog, int id) {
                            dialog.dismiss();
                        }
                    });
                    AlertDialog alert = builder.create();
                    alert.show();
                }
            });
            return convertView2;
        }

        @Override // android.widget.ExpandableListAdapter
        public boolean hasStableIds() {
            return false;
        }

        @Override // android.widget.ExpandableListAdapter
        public boolean isChildSelectable(int listPosition, int expandedListPosition) {
            return true;
        }
    }
}
