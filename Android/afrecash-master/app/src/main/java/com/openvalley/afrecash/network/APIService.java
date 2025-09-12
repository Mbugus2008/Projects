package com.openvalley.afrecash.network;

import com.openvalley.afrecash.datasets.GetMember;
import com.openvalley.afrecash.datasets.Loan;
import com.openvalley.afrecash.datasets.OTP;
import com.openvalley.afrecash.datasets.Repayment;
import com.openvalley.afrecash.datasets.User;

import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.POST;

public interface APIService {

    @POST("createmember")
    Call<ResponseBody> register(@Body User user);

    @POST("changepass")
    Call<ResponseBody> changePassword(@Body User user);

    @POST("member")
    Call<ResponseBody> login(@Body GetMember getMember);

    @POST("resetpass")
    Call<ResponseBody> resetpass(@Body GetMember getMember);

    @POST("Loans")
    Call<ResponseBody> requestLoan(@Body Loan loan);

    @POST("Repayment")
    Call<ResponseBody> payLoan(@Body Repayment repayment);

    @POST("otp")
    Call<ResponseBody> sendOTP(@Body OTP otp);

}
