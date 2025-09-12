package com.trimline.investments;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Parcelable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Spinner;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.databinding.BaseObservable;
import androidx.databinding.Bindable;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.InverseBindingMethod;
import androidx.databinding.InverseBindingMethods;
import androidx.databinding.ObservableArrayList;
import androidx.databinding.ObservableInt;
import androidx.lifecycle.AndroidViewModel;
import androidx.recyclerview.widget.RecyclerView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.investments.databinding.Funditems;


import java.io.Serializable;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class RealEstate extends BaseObservable implements Serializable {
    public String Key ;
    public String FD_No ;
    public String Member_No ;
    public String Account_No ;
    public String Source_Type ;
    public Boolean Source_TypeSpecified ;
    public String Payment_Type ;
    public Boolean Payment_TypeSpecified ;

    public float getFixed_Amount() {
        return Fixed_Amount;
    }

    public void setFixed_Amount(float fixed_Amount) {
        Fixed_Amount = fixed_Amount;
    }

    public int getFixed_Period_M() {
        return Fixed_Period_M;
    }

    public void setFixed_Period_M(int fixed_Period_M) {
        Fixed_Period_M = fixed_Period_M;
    }

    public float Fixed_Amount ;
    public Boolean Fixed_AmountSpecified ;
    public int Fixed_Period_M ;
    public Boolean Fixed_Period_MSpecified ;

    public String getMaturityAction() {
        Log.i("Maturity",String.valueOf( Maturity_Action));
        return  Maturity_Actions.values()[Maturity_Action].toString();
    }
    public void setMaturityAction(String maturityAction) {
        Maturity_Action =Maturity_Actions.valueOf(maturityAction).ordinal();
    }

    public String MaturityAction;

    public int getMaturity_Action() {

        return Maturity_Action;
    }

    public void setMaturity_Action(int maturity_Action) {

        Maturity_Action = maturity_Action;
    }

    public  int Maturity_Action ;
    public Boolean Maturity_ActionSpecified ;


    public String getFD_Type() {
        return FD_Type;
    }

    public void setFD_Type(String FD_Type) {

        this.FD_Type = FD_Type;
    }

    public String FD_Type ;
    public String E_Mail ;
    public float Interest_Rate ;
    public Boolean Interest_RateSpecified ;
    public String Member_Name ;
    public String Account_Name ;
    public float Account_Minimum_Balance ;
    public Boolean Account_Minimum_BalanceSpecified ;
    public String FD_Type_Description ;
    public float Account_Balance ;
    public Boolean Account_BalanceSpecified ;
    public String Member_Category ;
    public String Proceeds_Account ;
    public String Maturity_Date;
    public int Status ;
    public enum Source_Type {
        /// <remarks/>
        Member_Account,

        /// <remarks/>
        Bank_Account,
    }
   public enum Payment_Type {

        /// <remarks/>
        FOSA,

        /// <remarks/>
        Bank_Payment,
    }
    /// <remarks/>
    public enum Maturity_Actions {

        /// <remarks/>
        _blank_("None"),

        /// <remarks/>
        Roll_Over_Full_Amount("Roll_Over_Full_Amount"),

        /// <remarks/>
        Roll_Over_Interest("Roll_Over_Interest"),

        /// <remarks/>
        Roll_Over_Principle("Roll_Over_Principle"),

        /// <remarks/>
        Post_to_Source("Post_to_Source");


        private final String name;

        private Maturity_Actions(String s) {


            name = s;
        }

        public boolean equalsName(String otherName) {
            // (otherName == null) check is not needed because name.equals(null) returns false
            return name.equals(otherName);
        }

        public String toString() {
            return this.name;
        }
    }
    public static class Model extends AndroidViewModel {
        public RealEstate t;

        public final ObservableArrayList<FDTyes> fdTyes = new ObservableArrayList<>();

        public final ObservableInt selectedfdtype = new ObservableInt();

        public Model(@NonNull Application application) {
            super(application);

        }


        }

    public static class adapter extends RecyclerView.Adapter<adapter.Holder> implements IDataChangeListener {
        private List<RealEstate> advance = new ArrayList<>();
        private RealEstate.adapter.OnItemClickListener listener;

        Context c;
        Funditems binding;

        public adapter(Context cc) {

            this.c = cc;

        }

        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.fundsitem, parent, false);

            return new Holder(parent, binding);
        }

        @Override
        public void onBindViewHolder(@NonNull Holder holder, int position) {

            RealEstate current = advance.get(position);
            holder.bind(current);


        }

        @Override
        public void onEditTextChanged(String planetName) {

        }

        @Override
        public int getItemCount() {
            return advance.size();
        }

        public void sett_line(List<RealEstate> advance) {
            this.advance = advance;
            notifyDataSetChanged();
        }

        class Holder extends RecyclerView.ViewHolder {
            private Funditems binding;
            Spinner s, loanno;

            public Holder(@NonNull ViewGroup parent, Funditems itemView) {
                super(itemView.getRoot());
                this.binding = itemView;


                itemView.getRoot().setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (listener != null && position != RecyclerView.NO_POSITION) {
                            listener.onItemClick(advance.get(position));
                        }
                    }
                });
            }
            public void bind(RealEstate object) {
                binding.setFunds(object);
                binding.executePendingBindings();
                Log.i("Binding", new Gson().toJson(object));
            }

            public Funditems getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(RealEstate note);
        }

        public void setOnItemClickListener(RealEstate.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }
    }
}
