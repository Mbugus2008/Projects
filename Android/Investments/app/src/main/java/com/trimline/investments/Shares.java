package com.trimline.investments;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.AsyncTask;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.recyclerview.widget.RecyclerView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.List;

public class Shares {
    public String Key ;
    public String Document_No ;

    public int getFloat_Type() {
        return Float_Type;
    }

    public void setFloat_Type(int float_Type) {
        Float_Type = float_Type;

    }

    public String getFloatType() {
        FloatType =   Float_Types.values()[Float_Type].name();
        return FloatType;
    }

    public void setFloatType(String floatType) {
Float_Type = Float_Types.valueOf(floatType).ordinal();
        FloatType = floatType;
    }

    public int Float_Type ;
    public String FloatType ;

    public Boolean Float_TypeSpecified ;
    public String Member_No ;
    public String Member_Name ;
    public String Share_Type;
    public String Account_Type;
    public String Account_No;

    public float getReserve_Price() {
        return Reserve_Price;
    }

    public void setReserve_Price(float reserve_Price) {
        Reserve_Price = reserve_Price;
    }

    public float getPar_Value() {
        return Par_Value;
    }

    public void setPar_Value(float par_Value) {
        Par_Value = par_Value;
    }

    public float getTotal_Shares() {
        return Total_Shares;
    }

    public void setTotal_Shares(float total_Shares) {
        Total_Shares = total_Shares;
    }

    public float getMinimum_Acceptable_Price() {
        return Minimum_Acceptable_Price;
    }

    public void setMinimum_Acceptable_Price(float minimum_Acceptable_Price) {
        Minimum_Acceptable_Price = minimum_Acceptable_Price;
    }

    public float getShares_to_Float() {
        return Shares_to_Float;
    }

    public void setShares_to_Float(float shares_to_Float) {
        Shares_to_Float = shares_to_Float;
    }

    public float getMinimum_Balance() {
        return Minimum_Balance;
    }

    public void setMinimum_Balance(float minimum_Balance) {
        Minimum_Balance = minimum_Balance;
    }

    public float getAccount_Balance() {
        return Account_Balance;
    }

    public void setAccount_Balance(float account_Balance) {
        Account_Balance = account_Balance;
    }

    public float getCurrent_Balance() {
        return Current_Balance;
    }

    public void setCurrent_Balance(float current_Balance) {
        Current_Balance = current_Balance;
    }

    public float getMaximum_Bid_Price() {
        return Maximum_Bid_Price;
    }

    public void setMaximum_Bid_Price(float maximum_Bid_Price) {
        Maximum_Bid_Price = maximum_Bid_Price;
    }

    public float Reserve_Price ;
    public Boolean Reserve_PriceSpecified ;
    public float Par_Value ;
    public Boolean Par_ValueSpecified ;
    public float Total_Shares;
    public Boolean Total_SharesSpecified ;
    public float Minimum_Acceptable_Price ;
    public Boolean Minimum_Acceptable_PriceSpecified ;
    public float Shares_to_Float ;
    public Boolean Shares_to_FloatSpecified ;
    public float Minimum_Balance ;
    public Boolean Minimum_BalanceSpecified ;
    public float Account_Balance ;
    public Boolean Account_BalanceSpecified ;
    public float Current_Balance ;
    public Boolean Current_BalanceSpecified ;
    public float Maximum_Bid_Price ;
    public Boolean Maximum_Bid_PriceSpecified ;
    public String Share_Life ;
    public On_No_Bid On_No_Bid ;
    public Boolean On_No_BidSpecified ;
    public java.util.Date Published_On ;
    public Boolean Published_OnSpecified ;
    public java.util.Date Exiry_Date ;
    public Boolean Exiry_DateSpecified ;
    public String Global_Dimension_1_Code ;
    public String Global_Dimension_2_Code ;
    public Payment_Type Payment_Type ;
    public Boolean Payment_TypeSpecified ;
    public String Payment_Account_No ;
    public String Payment_Method ;
    public String External_Refrence_No ;
    public java.util.Date Payment_Date ;
    public Boolean Payment_DateSpecified ;
    public float Payment_Amount ;
    public Boolean Payment_AmountSpecified ;
    public String Proceeds_Account ;
    public Share_Floating_Lines[] Share_Floating_Lines ;


    public enum Payment_Type {

        /// <remarks/>
        Bank_Deposit,

        /// <remarks/>
        FOSA_Deposit,
    }

    public enum Float_Types {

        /// <remarks/>
        Partial,

        /// <remarks/>
        Full;
       @Override
        public  String toString(){return  this.name();}
    }

    /// <remarks/>
    public enum On_No_Bid {

        /// <remarks/>
        Extend,

        /// <remarks/>
        Reverse,
    }
  public static class  Share_Floating_Lines {

      public String Key ;
      public String Member_No ;
      public String Member_Name ;
      public Double Bid_Price ;
      public Boolean Bid_PriceSpecified ;
      public java.util.Date Bid_Date ;
      public Boolean Bid_DateSpecified ;
      public String Account_No ;
      public float Account_Balance ;
      public Boolean Account_BalanceSpecified ;
      public Boolean Awarded ;
      public Boolean AwardedSpecified ;
      public float Shares ;
      public Boolean SharesSpecified ;
      public float Total_Amount ;
      public Boolean Total_AmountSpecified ;
      public Boolean Bought ;
      public Boolean BoughtSpecified ;
      public String Document_No;



  }

    public static class Adapter extends RecyclerView.Adapter<Adapter.SharesViewHolder>{
        private List<Shares> sales;
        Context context;

        public Adapter(List<Shares> grocderyItemList, Context context) {
            this.sales = grocderyItemList;
            this.context = context;
        }

        @Override
        public SharesViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            //inflate the layout file
            View groceryProductView = LayoutInflater.from(parent.getContext()).inflate(R.layout.sharesitem, parent, false);
            SharesViewHolder gvh = new SharesViewHolder(groceryProductView);
            return gvh;
        }
//        public void buyshares(Shares t) {
//            LayoutInflater li = LayoutInflater.from(book.this);
//            View promptsView = li.inflate(R.layout.book, null);
//            AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
//                    book.this);
//            alertDialogBuilder.setView(promptsView);
//            final TextView text1 = (TextView) promptsView
//                    .findViewById(R.id.book);
//
//            text1.setText(Html.fromHtml(String.format("Booking No: <b>%s</b><br/>Project: <b>%s</b><br/> Unit No: <b>%s</b>", t.Transaction_No, t.Project_Name, t.Asset_Code)));
//            // set dialog message
//            alertDialogBuilder
//                    .setCancelable(false)
//                    .setTitle("Booking Confirmation")
//                    .setPositiveButton("OK", new DialogInterface.OnClickListener() {
//                        @Override
//                        public void onClick(DialogInterface dialog, int id) {
//                            // get user input and set it to result
//                            // edit text
//                        }
//                    });
//            // create alert dialog
//            final AlertDialog adialog = alertDialogBuilder.create();
//            adialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
//            adialog.show();
//            adialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
//                @Override
//                public void onClick(View v) {
//                    adialog.dismiss();
//                    //else dialog stays open. Make sure you have an obvious way to close the dialog especially if you set cancellable to false.
//                }
//            });
//
//
//        }
        private class buyshares extends AsyncTask<Shares.Share_Floating_Lines, Void, Shares.Share_Floating_Lines> {
            private  String responce;
            @Override
            protected Shares.Share_Floating_Lines doInBackground(Shares.Share_Floating_Lines... agents) {
                Shares.Share_Floating_Lines p = null;
                try {
                    Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                   responce  = JsonParser.postjson("buyshares", "data", g.toJson(agents[0],Shares.Share_Floating_Lines.class));

                    Type localType = new TypeToken<Shares.Share_Floating_Lines>() {
                    }.getType();
                    p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(responce, localType);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return p;
            }
            @Override
            protected void onPostExecute(Shares.Share_Floating_Lines p) {
                if(p!=null) {
                    if (!p.Key.equals(""))
                        Toast.makeText(context, "Shares successful", Toast.LENGTH_LONG).show();
                }
                else
                    Toast.makeText(context, responce, Toast.LENGTH_SHORT).show();
            }
        }
        @Override
        public void onBindViewHolder(final SharesViewHolder holder, final int position) {
            //holder.imageProductImage.setImageResource(sales.get(position).getProductImage());
            holder.doc.setText(sales.get(position).Account_Type);
            holder.type.setText(Html.fromHtml(String.format("Shares %,.1f", sales.get(position).Shares_to_Float)));
            holder.shares.setText(Html.fromHtml(String.format("KES. <b>%,.2f</b>", sales.get(position).Minimum_Acceptable_Price)));

            // holder.size.setText(String.valueOf(sales.get(position).Total_Plots));
            holder.buy.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    if (holder.bid.getText().toString().equals("")) {
                        holder.bid.setError("Enter bid");
                        return;
                    }
                    if ((Double.valueOf(holder.bid.getText().toString()) < sales.get(position).Minimum_Acceptable_Price) || (Double.valueOf(holder.bid.getText().toString()) > sales.get(position).Par_Value)) {
                        holder.bid.setError(String.format("Bid amount must be between %,.2f and %,.2f", sales.get(position).Minimum_Acceptable_Price, sales.get(position).Par_Value));
                        return;
                    }
                    Shares.Share_Floating_Lines l = new Shares.Share_Floating_Lines();
                    l.Member_No = Investments.member.No;
                    l.Bid_Price = Double.valueOf(holder.bid.getText().toString());
                    l.Document_No = sales.get(position).Document_No;
                    new buyshares().execute(l);
                }
            });
        }

        @Override
        public int getItemCount() {
            return sales.size();
        }

        public class SharesViewHolder extends RecyclerView.ViewHolder {
            TextView doc;
            TextView type;
            TextView shares;
            EditText bid;
           Button buy;

            public SharesViewHolder(View view) {
                super(view);
                doc=view.findViewById(R.id.documetno);
                type=view.findViewById(R.id.Accounttype);
                shares = view.findViewById(R.id.sharetofloat);
bid= (EditText)view.findViewById(R.id.bid);
                buy=(Button)view.findViewById(R.id.buy);
            }
        }
    }
}
