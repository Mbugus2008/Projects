package com.mobile.afrecash.handlers;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.util.Log;

import androidx.appcompat.app.AlertDialog;

import com.mobile.afrecash.activities.EnterName;
import com.mobile.afrecash.activities.Home;
import com.mobile.afrecash.activities.Verify;
import com.mobile.afrecash.datasets.Loan;
import com.mobile.afrecash.datasets.ProfileHolder;
import com.mobile.afrecash.listeners.PINListener;
import com.mobile.afrecash.uihelpers.EnterPINDialog;
import com.mobile.afrecash.utils.ResponseHandler;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;


/**
 * @author Geek Nat
 * On 9/20/2016.
 */
public class JSONHandler {

    private Context context;
    private ResponseHandler responseHandler;
    private String points;

    public JSONHandler(Context context) {
        this.context = context;
        responseHandler = new ResponseHandler(context);
    }


    public static boolean isValidToken(String result) {
        try {
            JSONObject jsonObject = new JSONObject(result);
            if (jsonObject.getInt("success") == -1) {
                return false;
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return true;
    }


    public boolean isSuccess(String result) {
        try {
            JSONObject jsonObject = new JSONObject(result);
            return jsonObject.getInt("success") == 1;

        } catch (JSONException e) {
            e.printStackTrace();
        }
        return true;
    }

    public void checkPhone(String result, String phone) {
        ProfileHolder profileHolder = new ProfileHolder(context);

        try {
            JSONObject jsonObject = new JSONObject(result);
            if (jsonObject.getInt("success") == 1) {
                profileHolder.setPhone("+254" + phone);
                context.startActivity(new Intent(context, Verify.class).putExtra("phone", "+254" + phone));
            } else {
                new AlertDialog.Builder(context)
                        .setTitle("Error")
                        .setMessage(jsonObject.getString("message"))
                        .setCancelable(true)
                        .setPositiveButton("OKAY", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                dialog.dismiss();
                            }
                        })
                        .show();
            }

        } catch (JSONException e) {
            e.printStackTrace();
            responseHandler.showToast("An error occurred");
        }


    }


    public void requestLoan(String result) {
        try {
            JSONObject jsonObject = new JSONObject(result);
            if (jsonObject.getInt("success") == 1) {
                new AlertDialog.Builder(context)
                        .setTitle("Loan Request Successful")
                        .setMessage(jsonObject.getString("message"))
                        .setCancelable(true)
                        .setPositiveButton("PROCEED", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                dialog.dismiss();
                                context.startActivity(new Intent(context, Home.class));
                            }
                        })
                        .show();
            } else {
                new AlertDialog.Builder(context)
                        .setTitle("Loan Request Unsuccessful")
                        .setMessage(jsonObject.getString("message"))
                        .setCancelable(true)
                        .setPositiveButton("PROCEED", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                dialog.dismiss();
                                context.startActivity(new Intent(context, Home.class));
                            }
                        })
                        .show();
            }

        } catch (JSONException e) {
            e.printStackTrace();
            new AlertDialog.Builder(context)
                    .setTitle("Error")
                    .setMessage("An error occurred")
                    .setCancelable(true)
                    .setPositiveButton("PROCEED", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.dismiss();
                            context.startActivity(new Intent(context, Home.class));
                        }
                    })
                    .show();
        }


    }


    public void login(String result, boolean showPIN) {
        try {
            final JSONObject jsonObject = new JSONObject(result);

            if (jsonObject.getInt("success") == 1) {

                final ProfileHolder profileHolder = new ProfileHolder(context);
                profileHolder.setAccessToken(jsonObject.getString("token"));
                profileHolder.setPhone(jsonObject.getString("phone"));

                if (!jsonObject.getString("full_name").isEmpty()) {
                    profileHolder.setIDNumber(jsonObject.getString("id_no"));
                    profileHolder.setFirstName(jsonObject.getString("full_name"));
                    profileHolder.setPhoto(jsonObject.getString("photo"));
                    profileHolder.setCounty(jsonObject.getString("county"));
                    profileHolder.setPFNumber(jsonObject.getString("pf_number"));
                    profileHolder.setAccountNumber(jsonObject.getString("account_no"));
                    profileHolder.setPIN(jsonObject.getString("pin"));
                    profileHolder.setUniversityID(jsonObject.getString("university"));
                    profileHolder.setUniversityName(jsonObject.getString("university_name"));
                    profileHolder.setFacID(jsonObject.getString("faculty"));
                    profileHolder.setFacName(jsonObject.getString("faculty_name"));
                    profileHolder.setDeptID(jsonObject.getString("department"));
                    profileHolder.setDeptName(jsonObject.getString("department_name"));
                    profileHolder.setLocation(jsonObject.getString("address"));
                    profileHolder.setUserLoggedIn(true);
                    profileHolder.setVerifying(false);
                    //REQUEST PIN

                    if (showPIN) {
                        new EnterPINDialog(context, new PINListener() {
                            @Override
                            public void onPINSet(String PIN) {

                            }

                            @Override
                            public void onPINCancelled() {

                            }
                        });
                    } else {
                        context.startActivity(new Intent(context, Home.class));
                    }

                    return;
                }

                context.startActivity(new Intent(context, EnterName.class));

                return;
            }

            responseHandler.showToast(jsonObject.getString("message"));

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Loan> getLoans(String result) {

        ArrayList<Loan> loanHolders = new ArrayList<>();

        try {

            JSONObject jsonObject = new JSONObject(result);


            JSONArray jsonArray = jsonObject.getJSONObject("content").getJSONArray("Loans_Mobile");

            for (int i = 0; i < jsonArray.length(); i++) {

                JSONObject object = jsonArray.getJSONObject(i);

                String[] splitDate = object.getString("Application_Date").split("T");

                Loan loanHolder = new Loan();
                loanHolder.setKey(object.getString("Key"));
                loanHolder.setApplicationDate(splitDate[0]);
                loanHolder.setApplicationDateSpecified(object.getBoolean("Application_DateSpecified"));
                loanHolder.setApprovedAmount(object.getDouble("Approved_Amount"));
                loanHolder.setApprovedAmountSpecified(object.getBoolean("Approved_AmountSpecified"));
                loanHolder.setClientCode(object.getString("Client_Code"));
                loanHolder.setClientName(object.getString("Client_Name"));
                loanHolder.setLoanNo(object.getString("Loan_No"));
                loanHolder.setLoanType(object.getString("Loan_Type"));
                loanHolder.setLoanTypeName(object.getString("Loan_Type_Name"));
                loanHolder.setOutstandingBalance(object.getDouble("Outstanding_Balance"));
                loanHolder.setOutstandingBalanceSpecified(object.getBoolean("Outstanding_BalanceSpecified"));
                loanHolder.setOutstandingInterest(object.getDouble("Outstanding_Interest"));
                loanHolder.setOutstandingInterestSpecified(object.getBoolean("Outstanding_InterestSpecified"));
                loanHolder.setStatus(object.getInt("Loan_Status"));
                if (object.has("Due_Date")) {
                    loanHolder.setDueDate(object.getString("Due_Date"));
                }
                loanHolders.add(loanHolder);
            }
        } catch (Exception e) {
            Log.d("HTTP", e.getMessage());
        }

        return loanHolders;

    }


}
