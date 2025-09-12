package com.trimline.investments;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.opengl.Visibility;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

public class book extends AppCompatActivity {

    ImageView imageProductImage;
    TextView desc;
    TextView price,pricedisplay,accountname;
   // TextView bookingprice;
    properties p;
    Property_sales s;
    Button book , terms;
    ProgressDialog wait;
    Spinner notobook, accounts;
    RadioButton  note;
    Property_sales.Pre_Sale pre_sales;
    Sales_Setup_Prices memberprice;
    EditText ref;
    Spinner paymenttype,paymentmethod;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_book);
        p = (properties) getIntent().getSerializableExtra("properties");
        desc = (TextView) findViewById(R.id.desc);
        note = (RadioButton) findViewById(R.id.note);
        price = (TextView) findViewById(R.id.price);
        accountname = (TextView) findViewById(R.id.accountsname);
        pricedisplay = (TextView) findViewById(R.id.paymentprice);
        ref = (EditText) findViewById(R.id.reference);
        //bookingprice = (TextView) findViewById(R.id.bookingprice);
        book = (Button) findViewById(R.id.book);
        terms = (Button) findViewById(R.id.terms);
        wait = new ProgressDialog(this);
        notobook = (Spinner) findViewById(R.id.notobook);
        paymentmethod = (Spinner) findViewById(R.id.paymentmethod);
        new paymentMethods().execute();
        new paymenttypes().execute();
        s = new Property_sales();
        pre_sales = new Property_sales.Pre_Sale();
        paymentmethod.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                PaymentMethods p = (PaymentMethods) adapterView.getItemAtPosition(i);
                if (p != null) {
                    pre_sales.Payment_Method = p.Code;

                    switch (p.Code) {

                        case "F/TRANSFER":
                            //ref.setVisibility(View.GONE);
                            accountname.setText("Select Account");
                            accounts.setVisibility(View.VISIBLE);
                            accounts.performClick();
                            break;
                        default:
                            accountname.setText("Enter Payment reference");
                            accounts.setVisibility(View.GONE);
                            ref.setVisibility(View.VISIBLE);
                            pre_sales.Bal_Account_Type = Property_sales.Bal_Account_Type.Bank_Account;
                            pre_sales.Bal_Account_No = "";
                            break;

                    }
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });
        accounts = (Spinner) findViewById(R.id.account);
        notobook = (Spinner) findViewById(R.id.notobook);


        pre_sales.Allocation_Type = Property_sales.Allocation_Type.Booking;
        if (Investments.member.Member_Accounts != null) {
            List<members.Member_Accounts_Listpart> mm = new ArrayList<>();
            for (members.Member_Accounts_Listpart p : Investments.member.Member_Accounts
            ) {
                if (p.Cash_Withdrawal_Allowed)
                    mm.add(p);
            }
            ArrayAdapter<members.Member_Accounts_Listpart> m = new ArrayAdapter<>(this, R.layout.simple_spinner, mm);
            accounts.setAdapter(m);
        }
        if (p.Sales_Setup_Prices != null)
            for (Sales_Setup_Prices ss : p.Sales_Setup_Prices
            ) {
                if (ss.Member_Category.contentEquals(Investments.member.Member_Category)) {
                    memberprice = ss;
                    break;
                }
            }
        wait.setMessage("Booking...please wait");

        //  s = (Property_sales) getIntent().getSerializableExtra("list");
        desc.setText(p.Project_Name);
        paymenttype = (Spinner) findViewById(R.id.paymenttype);


        paymenttype.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                Payment_Types ss = (Payment_Types) adapterView.getItemAtPosition(i);
                if (ss != null)
                    s.Payment_Type = Property_sales.Payment_Types.values()[ss.Payment_Type];
                s.Payment_TypeSpecified = true;
                switch (s.Payment_Type) {
                    case Cash:

                        if (memberprice != null) {
                            pricedisplay.setText(Html.fromHtml(String.format("Price: <b>%,.2f<b/>", memberprice.Cash_Price)));
                            s.Selling_PriceSpecified = true;
                            s.Selling_Price = memberprice.Cash_Price;
                        }
                        break;

                    default:

                        if (memberprice != null) {
                            pricedisplay.setText(Html.fromHtml(String.format("Price: <b>%,.2f<b/>", memberprice.Installment_Price)));
                            s.Selling_PriceSpecified = true;
                            s.Selling_Price = memberprice.Installment_Price;
                        }
                        break;
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {
            }
        });
        accounts.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                members.Member_Accounts_Listpart a = (members.Member_Accounts_Listpart) adapterView.getItemAtPosition(i);
                if (a != null) {
                    if (accounts.getVisibility() == View.VISIBLE) {
                        pre_sales.Bal_Account_Type = Property_sales.Bal_Account_Type.Member_Account;
                        pre_sales.Bal_Account_No = a.No;
                    }
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {
            }
        });

        if (p != null) {

            terms.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    if (p.Property_Conditions != null)
                        if (p.Property_Conditions.size() > 0) {
                            terms(p.Property_Conditions);
                        }
                }
            });
            List<Sales_Setup_Lines> sl = new ArrayList<>();
            if (p.Sales_Setup_Lines != null)
                for (Sales_Setup_Lines s : p.Sales_Setup_Lines
                ) {
                    if (s.Available && s.Published)
                        sl.add(s);
                }
            adapter ad = new adapter(sl, this);
            notobook.setAdapter(ad);
            if (sl.size() == 0)
                book.setVisibility(View.GONE);


            price.setText(Html.fromHtml(String.format("Booking Price KES:     <b>%,.2f</b><br/>" +
                    "Deposit Amount KES:    <b>%,.2f</b><br/>", p.Booking_Price, p.Deposit_Amount)));

            // price.setText(String.format("KES. %,.2f", p.Actual_Selling_Price ));
            //bookingprice.setText(String.format("KES. %,.2f", Math.round(p.Booking_Price * 100) / 100));

//            if (p.Payment_Method != null)
//                if (p.Payment_Method.size() > 0) {
//                    int i = 1;
//                    StringBuilder b = new StringBuilder();
//                    b.append(String.format("<b>Payment info:</b><br/>"));
//                    for (payment_methods c : p.Payment_Method
//                    ) {
//                        b.append(String.format("%d. %s<br/>", i, c.Description));
//                        i += 1;
//                    }
//                    //if (b != null)
//                    // bookingprice.setText(Html.fromHtml(b.toString()));
//                }
        }
        book.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (!note.isChecked()) {
                    Toast.makeText(book.this, "Please read and acccept the terms and conditions before making payment", Toast.LENGTH_SHORT).show();
                    return;
                }
//                if (pre_sales.Bal_Account_Type == Property_sales.Bal_Account_Type.Bank_Account) {
//                    if (ref.getText().toString().equals("")) {
//                        ref.setError("Please enter payment reference");
//                        ref.requestFocus();
//                        return;
//                    }
//                    pre_sales.Refrence_No = ref.getText().toString();
//                }
                s.Sales_Code = p.Sales_Code;
                s.Member_No = Investments.member.No;
                s.Asset_Code = notobook.getSelectedItem().toString();
                s.Member_Category = Investments.member.Member_Category;
                s.Booking_Price = p.Booking_Price;
                s.Booking_PriceSpecified = true;
                s.Minimum_Deposit = p.Deposit_Amount;
                s.Minimum_DepositSpecified = true;

                System.out.println(new Gson().toJson(s));
                pre_sales.Amount = p.Booking_Price;
                pre_sales.Member_No = s.Member_No;
                pre_sales.AmountSpecified = true;
                pre_sales.Refrence_No = ref.getText().toString();
                pre_sales.Posting_Date = Calendar.getInstance().getTime();
                pre_sales.Posting_DateSpecified = true;

                System.out.println(new Gson().toJson(s));
                wait.show();
                new booking().execute(s);
            }
        });
    }
    private class booking extends AsyncTask<Property_sales, Void, Property_sales> {
        @Override
        protected Property_sales doInBackground(Property_sales... agents) {
            Property_sales p = null;
            try {
                System.out.println(new Gson().toJson(agents[0]));
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String result = JsonParser.postjson("book", "data", g.toJson(agents[0]));
                Type localType = new TypeToken<Property_sales>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {

                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(Property_sales p) {

            if (p != null) {
                s= p;
                //Toast.makeText(book.this, "Booking successful", Toast.LENGTH_SHORT).show();
                if (pre_sales!=null){
                    pre_sales.Transaction_No= p.Transaction_No;
                    new bookingdetails().execute(pre_sales);
            }}
            else
            {
                wait.hide();
                Toast.makeText(book.this, "Booking Failed", Toast.LENGTH_SHORT).show();

            }
        }
    }
    private class bookingdetails extends AsyncTask<Property_sales.Pre_Sale, Void, Property_sales.Pre_Sale> {
        @Override
        protected Property_sales.Pre_Sale doInBackground(Property_sales.Pre_Sale... agents) {
            Property_sales.Pre_Sale p = null;
            try {
                System.out.println(new Gson().toJson(agents[0]));
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String result = JsonParser.postjson("bookdetails", "data", g.toJson(agents[0]));
                Type localType = new TypeToken<Property_sales.Pre_Sale>() {
                }.getType();

                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {

                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(Property_sales.Pre_Sale p) {
            wait.hide();
            if (p != null) {
                Toast.makeText(book.this, "Booking successful", Toast.LENGTH_SHORT).show();
                List<Property_sales.Pre_Sale> pp = Arrays.asList(p);

                s.Pre_Sales = pp.toArray(new Property_sales.Pre_Sale[pp.size()]);

                ConfirmationBox(s);
            }
            else
            {
                wait.hide();
                Toast.makeText(book.this, "Booking Failed", Toast.LENGTH_SHORT).show();

            }
        }
    }
    private class paymentMethods extends AsyncTask<Void, Void, List<PaymentMethods>> {
        @Override
        protected List<PaymentMethods> doInBackground(Void... agents) {
            List<PaymentMethods> p = null;
            try {
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String result = JsonParser.postjson("paymentmethods", null, null);
                Type localType = new TypeToken<List<PaymentMethods>>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(List<PaymentMethods> p) {
            if (p != null) {
                List<PaymentMethods> pp = new ArrayList<>();
                for (PaymentMethods pm:p
                     ) {
                    if (pm.Available_on_channel)
                        pp.add(pm);
                }
                paymentmethod.setAdapter(new ArrayAdapter<>(book.this,R.layout.simple_spinner,pp));
            }
        }
    }
    private class paymenttypes extends AsyncTask<Void, Void, List<Payment_Types>> {
        @Override
        protected List<Payment_Types> doInBackground(Void... agents) {
            List<Payment_Types> p = null;
            try {
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String result = JsonParser.postjson("paymenttypes", null, null);
                Type localType = new TypeToken<List<Payment_Types>>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(List<Payment_Types> p) {

            if (p != null) {
                ArrayAdapter<Payment_Types> a = new ArrayAdapter<Payment_Types>(book.this, R.layout.paymenttype, p);
                paymenttype.setAdapter(a);
            }
        }
    }

    public void ConfirmationBox(Property_sales t) {
        LayoutInflater li = LayoutInflater.from(book.this);
        View promptsView = li.inflate(R.layout.book, null);
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
                book.this);
        alertDialogBuilder.setView(promptsView);
        final TextView text1 = (TextView) promptsView
                .findViewById(R.id.book);

        text1.setText(Html.fromHtml(String.format("Booking No: <b>%s</b><br/>Project: <b>%s</b><br/> Unit No: <b>%s</b>", t.Transaction_No, t.Project_Name, t.Asset_Code)));
        // set dialog message
        alertDialogBuilder
                .setCancelable(false)
                .setTitle("Booking Confirmation")
                .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        // get user input and set it to result
                        // edit text
                    }
                });
        // create alert dialog
        final AlertDialog adialog = alertDialogBuilder.create();
        adialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        adialog.show();
        adialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                adialog.dismiss();
                finish();
                //else dialog stays open. Make sure you have an obvious way to close the dialog especially if you set cancellable to false.
            }
        });


    }
    public void terms(List<propert_conditions> t) {
        LayoutInflater li = LayoutInflater.from(book.this);
        View promptsView = li.inflate(R.layout.terms, null);
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
                book.this);
        alertDialogBuilder.setView(promptsView);
        final TextView text1 = (TextView) promptsView
                .findViewById(R.id.terms);
                      int i = 1;
                StringBuilder b = new StringBuilder();
                b.append(String.format("<b>NOTE:</b><br/>"));
                for (propert_conditions c : t
                ) {
                    b.append(String.format("%d. %s<br/>", i, c.Condition));
                    i += 1;
                }
                text1.setText(Html.fromHtml(b.toString()));


        alertDialogBuilder
                .setCancelable(false)
                .setTitle("Terms and Conditions")
                .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        // get user input and set it to result
                        // edit text
                    }
                });
        // create alert dialog
        final AlertDialog adialog = alertDialogBuilder.create();
        adialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        adialog.show();
        adialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                adialog.dismiss();
                //else dialog stays open. Make sure you have an obvious way to close the dialog especially if you set cancellable to false.
            }
        });

    }
    public class adapter  extends BaseAdapter implements SpinnerAdapter {

        List<Sales_Setup_Lines> sales_setup_lines;
        Context context;


        public adapter( List<Sales_Setup_Lines>  s,Context context) {
            this.sales_setup_lines = s;
            this.context = context;
        }
       @Override
        public int getCount() {
            return sales_setup_lines.size();
        }

        @Override
        public Object getItem(int position) {
            return sales_setup_lines.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            Sales_Setup_Lines setup_lines = sales_setup_lines.get(position);
            View view =  View.inflate(context, R.layout.selectunits, null);
            TextView textView = (TextView) view.findViewById(R.id.assetcode);
            textView.setText(setup_lines.Asset_Name);
            return view;
        }

//        @Override
//        public View getDropDownView(int position, View convertView, ViewGroup parent) {
//
//            View view;
//            view =  View.inflate(context, R.layout.company_dropdown, null);
//            final TextView textView = (TextView) view.findViewById(R.id.dropdown);
//            textView.setText(company[position]);
//
//            textView.setTextColor(Color.parseColor(colors[position]));
//            textView.setBackgroundColor(Color.parseColor(colorsback[position]));
//
//
//            return view;
//        }
    }
}
