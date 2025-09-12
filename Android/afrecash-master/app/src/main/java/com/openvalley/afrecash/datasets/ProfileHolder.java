package com.openvalley.afrecash.datasets;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;

import androidx.appcompat.app.AlertDialog;

import com.openvalley.afrecash.activities.EnterPhone;
import com.openvalley.afrecash.activities.Launch;


/**
 * @author Geek Nat
 * On 9/15/2016.
 */
public class ProfileHolder {
    Context context;
    SharedPreferences userDetails;
    SharedPreferences.Editor editor;
    public static final String FIRST_NAME = "firstName";
    public static final String LAST_NAME = "lastName";
    public static final String Region_NAME = "RegionName";
    public static final String ELIGIBLE_AMOUNT = "EligibleAmount";
    public static final String _ADDRESS = "Address";
    public static final String USER_LOGGED_IN = "userLoggedIn";
    public static final String USER_ID = "userId";
    public static final String ACCESS_TOKEN = "accessToken";
    public static final String PHOTO = "photo";
    public static final String FULL_NAME = "full_name";
    public static final String GITHUB_ACCOUNT = "github_account";
    public static final String BIO = "bio";
    public static final String LANGUAGES = "languages";
    public static final String USERNAME = "userName";
    public static final String NOTIFICATIONS = "notifications";
    public static final String IS_VALID = "isValid";
    public static final String PREVIOUS_STORY = "previousStory";
    public static final String PASSWORD_CHANGED = "Password_changed";

    private String shopId, branchId, userId, accessToken, photo, fullName, githubAccount, bio,
            languages, userName, notifications, isValid, previousStory, companyName, companyId, type;

    public ProfileHolder(Context context) {
        this.context = context;
        this.userDetails = context.getSharedPreferences("userDetails", Context.MODE_PRIVATE);
        this.editor = this.userDetails.edit();
    }


    public void setPasswordChanged(String passwordChanged) {
        editor.putString(PASSWORD_CHANGED, passwordChanged);
        editor.apply();
    }
    public void setFirstName(String firstName) {
        editor.putString(FIRST_NAME, firstName);
        editor.apply();
    }

    public void setRegionName(String RegionName) {
        editor.putString(Region_NAME, RegionName);
        editor.apply();
    }

    public void setLastName(String lastName) {
        editor.putString(LAST_NAME, lastName);
        editor.apply();
    }

    public void setAddress(String Address) {
        editor.putString(_ADDRESS, Address);
        editor.apply();
    }

    public void setEligibleAmount(float EligibleAmount) {
        editor.putFloat(ELIGIBLE_AMOUNT, EligibleAmount);
        editor.apply();
    }


    public String getFirstName() {
        return this.userDetails.getString(FIRST_NAME, "");
    }

    public String getLastName() {
        return this.userDetails.getString(LAST_NAME, null);
    }

    public String getAddress() {
        return this.userDetails.getString(_ADDRESS, "");
    }

    public float getEligibleAmount() {
        return this.userDetails.getFloat(ELIGIBLE_AMOUNT, 0);
    }

    public String getRegionName() {
        return this.userDetails.getString(Region_NAME, null);
    }


    public void setUserLoggedIn(Boolean userLoggedIn) {
        this.editor.putBoolean(USER_LOGGED_IN, userLoggedIn);
        this.editor.apply();
    }

    public boolean userHasLoggedIn() {
        return this.userDetails.getBoolean(USER_LOGGED_IN, false);
    }

    public String getUserId() {
        return this.userDetails.getString(USER_ID, null);
    }

    public void setUserId(String userId) {
        editor.putString(USER_ID, userId);
        editor.apply();
    }

    public String getAccessToken() {
        return this.userDetails.getString(ACCESS_TOKEN, null);
    }

    public void setAccessToken(String accessToken) {
        editor.putString(ACCESS_TOKEN, accessToken);
        editor.apply();
    }

    public void logOut() {

        new AlertDialog.Builder(context)
                .setTitle("Log out")
                .setMessage("Are you sure you want to log out?")
                .setCancelable(true)
                .setPositiveButton("NOT NOW", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                })
                .setNegativeButton("YES", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                        editor.clear();
                        editor.apply();
                        context.startActivity(new Intent(context, Launch.class));
                    }
                })
                .show();

    }

    public void logOutSilently() {
        editor.clear();
        editor.apply();
        context.startActivity(new Intent(context, EnterPhone.class));
    }

    public String getPhoto() {
        return this.userDetails.getString(PHOTO, "");
    }

    public void setPhoto(String photo) {
        editor.putString(PHOTO, photo);
        editor.apply();
    }

    public String getGithubAccount() {
        return this.userDetails.getString(GITHUB_ACCOUNT, null);
    }
    public String getPasswordChanged() {
        return this.userDetails.getString(PASSWORD_CHANGED, null);
    }

    public void setGithubAccount(String githubAccount) {
        editor.putString(GITHUB_ACCOUNT, githubAccount);
        editor.apply();
    }

    public String getBio() {
        return this.userDetails.getString(BIO, null);
    }

    public void setBio(String bio) {
        editor.putString(BIO, bio);
        editor.apply();
    }

    public String getLanguages() {
        return this.userDetails.getString(LANGUAGES, null);
    }

    public void setLanguages(String languages) {
        editor.putString(LANGUAGES, languages);
        editor.apply();
    }

    public String getUserName() {
        return this.userDetails.getString(USERNAME, "");
    }

    public void setUserName(String userName) {
        editor.putString(USERNAME, userName);
        editor.apply();
    }

    public String getNotifications() {
        return this.userDetails.getString(NOTIFICATIONS, "0");
    }

    public void setNotifications(String notifications) {
        editor.putString(NOTIFICATIONS, notifications);
        editor.apply();
    }

    public boolean isValid() {
        return this.userDetails.getBoolean(IS_VALID, false);
    }

    public void setIsValid(boolean isValid) {
        editor.putBoolean(IS_VALID, isValid);
        editor.apply();
    }

    public String getPreviousStory() {
        return this.userDetails.getString(PREVIOUS_STORY, null);
    }

    public void setPreviousStory(String previousStory) {
        editor.putString(PREVIOUS_STORY, previousStory);
        editor.apply();
    }

    public String getCompanyName() {
        return this.userDetails.getString("companyName", null);
    }

    public void setCompanyName(String companyName) {
        editor.putString("companyName", companyName);
        editor.apply();
    }

    public String getCompanyId() {
        return this.userDetails.getString("companyId", null);
    }

    public void setCompanyId(String companyId) {
        editor.putString("companyId", companyId);
        editor.apply();
    }

    public boolean isVerifying() {
        return this.userDetails.getBoolean("verifying", false);
    }

    public void setVerifying(boolean verifying) {
        editor.putBoolean("verifying", verifying);
        editor.apply();
    }

    public String getType() {
        return this.userDetails.getString("type", null);
    }

    public void setType(String type) {
        editor.putString("type", type);
        editor.apply();
    }

    public boolean isBTLAgent() {
        return getType().equals("sub");
    }

    public void setLocation(String type) {
        editor.putString("location", type);
        editor.apply();
    }

    public String getLocation() {
        return this.userDetails.getString("location", null);
    }

    public void setZone(String type) {
        editor.putString("zone", type);
        editor.apply();
    }

    public String getZone() {
        return this.userDetails.getString("zone", null);
    }

    public void setPickUpPoint(String type) {
        editor.putString("pick_up", type);
        editor.apply();
    }

    public String getPickUp() {
        return this.userDetails.getString("pick_up", null);
    }

    public void setIDNumber(String type) {
        editor.putString("id_number", type);
        editor.apply();
    }

    public String getIDNumber() {
        return this.userDetails.getString("id_number", null);
    }

    public void setConstituency(String type) {
        editor.putString("constituency", type);
        editor.apply();
    }

    public String getConstituency() {
        return this.userDetails.getString("constituency", null);
    }

    public void setCounty(String type) {
        editor.putString("county", type);
        editor.apply();
    }

    public String getCounty() {
        return this.userDetails.getString("county", null);
    }

    public void setSubCounty(String type) {
        editor.putString("sub_county", type);
        editor.apply();
    }

    public String getSubCounty() {
        return this.userDetails.getString("sub_county", null);
    }

    public void setWard(String type) {
        editor.putString("ward", type);
        editor.apply();
    }

    public String getWard() {
        return this.userDetails.getString("ward", null);
    }

    public void setStreet(String type) {
        editor.putString("street", type);
        editor.apply();
    }

    public String getStreet() {
        return this.userDetails.getString("street", null);
    }

    public void setPOBox(String type) {
        editor.putString("po_box", type);
        editor.apply();
    }

    public String getPOBox() {
        return this.userDetails.getString("po_box", null);
    }

    public void setPhone(String type) {
        editor.putString("phone", type);
        editor.apply();
    }

    public String getPhone() {
        return this.userDetails.getString("phone", null);
    }

    public void setAccountNumber(String type) {
        editor.putString("acc_no", type);
        editor.apply();
    }

    public String getAccountNumber() {
        return this.userDetails.getString("acc_no", null);
    }


    public void setPFNumber(String type) {
        editor.putString("pf_number", type);
        editor.apply();
    }

    public String getPFNumber() {
        return this.userDetails.getString("pf_number", null);
    }

    public void setPIN(String type) {
        editor.putString("pin", type);
        editor.apply();
    }

    public String getPIN() {
        return this.userDetails.getString("pin", null);
    }

    public void setUniversityID(String type) {
        editor.putString("uni_id", type);
        editor.apply();
    }

    public String getUniversityID() {
        return this.userDetails.getString("uni_id", null);
    }


    public void setUniversityName(String type) {
        editor.putString("uni_name", type);
        editor.apply();
    }

    public String getUniversityName() {
        return this.userDetails.getString("uni_name", null);
    }

    public void setFacID(String type) {
        editor.putString("fac_id", type);
        editor.apply();
    }

    public String getFacID() {
        return this.userDetails.getString("fac_id", null);
    }


    public void setFacName(String type) {
        editor.putString("fac_name", type);
        editor.apply();
    }

    public String getFacName() {
        return this.userDetails.getString("fac_name", null);
    }

    public void setDeptID(String type) {
        editor.putString("dept_id", type);
        editor.apply();
    }

    public String getDeptID() {
        return this.userDetails.getString("dept_id", null);
    }


    public void setDeptName(String type) {
        editor.putString("dept_name", type);
        editor.apply();
    }

    public String getDeptName() {
        return this.userDetails.getString("dept_name", null);
    }
}
