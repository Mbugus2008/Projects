package com.mobile.afrecash.activities;

import android.Manifest;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.browser.customtabs.CustomTabsIntent;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.mobile.afrecash.R;
import com.mobile.afrecash.datasets.ProfileHolder;
import com.mobile.afrecash.datasets.User;
import com.mobile.afrecash.listeners.PINListener;
import com.mobile.afrecash.network.Connect;
import com.mobile.afrecash.uihelpers.SetPINDialog;
import com.mobile.afrecash.utils.ResponseHandler;
import com.mobile.afrecash.utils.Utils;
import com.theartofdev.edmodo.cropper.CropImage;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;


public class EnterName extends AppCompatActivity {

    Button btnregister;
    ResponseHandler responseHandler;
    EditText eSurname, eOthername, eEmail, eID, ePhysicalAddress, eRefereeOne, eRefereeTwo;
    boolean hasChangedPhoto = false;
    String mainPath, filePath, pin;
    private static final int PERMISSION_WRITE_TO_STORAGE = 100;
    ImageView imageView;
    Context context;
    ProfileHolder profileHolder;
    String phone, region;
    Spinner eRegion;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);


        profileHolder = new ProfileHolder(this);
        context = this;
        responseHandler = new ResponseHandler(this);

        eSurname = findViewById(R.id.surname);
        eOthername = findViewById(R.id.othernames);
        eID = findViewById(R.id.idnumber);
        ePhysicalAddress = findViewById(R.id.address);
        eRegion = findViewById(R.id.sRegion);
        imageView = findViewById(R.id.userImage);
        eRefereeOne = findViewById(R.id.rPhoneOne);
        eRefereeTwo = findViewById(R.id.rPhoneTwo);

        findViewById(R.id.termsCheck).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openUrl();
            }
        });

        eRegion.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                region = parent.getItemAtPosition(position).toString();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        Intent intent = getIntent();

        phone = intent.getExtras().getString("phone");


        if (!profileHolder.getPhoto().equals("")) {
            Utils.displayImage(imageView, Connect.url + profileHolder.getPhoto());
        }

        imageView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                removePhoto();
            }
        });

        btnregister = findViewById(R.id.btnProceed);
        btnregister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if (Utils.isEmpty(eSurname)) {
                    responseHandler.showToast("Please enter your surname");
                    return;
                }

                if (Utils.isEmpty(eOthername)) {
                    responseHandler.showToast("Please enter your other names");
                    return;
                }

                if (Utils.isEmpty(eID)) {
                    responseHandler.showToast("Please enter your ID Number");
                    return;
                }

                if (Utils.isEmpty(eOthername)) {
                    responseHandler.showToast("Please enter your physical address");
                    return;
                }

                if (Utils.isEmpty(eRefereeOne)) {
                    responseHandler.showToast("Please enter your referee phone number");
                    return;
                }

//                if (!checkTerms.isChecked()) {
//                    responseHandler.showToast("You need to agree to Africash's terms and conditions before proceeding");
//                    return;
//                }

                new SetPINDialog(context, new PINListener() {
                    @Override
                    public void onPINSet(String PIN) {
                        pin = PIN;
                        register();
                    }

                    @Override
                    public void onPINCancelled() {

                    }
                }, "Set Your PIN", true);

            }

        });


    }

    @Override
    public void onBackPressed() {
        startActivity(new Intent(this, EnterPhone.class));
    }

    void openUrl() {
        String url = "https://openvalleyinvestments.com/terms-and-conditions/";
        CustomTabsIntent.Builder builder = new CustomTabsIntent.Builder();
        CustomTabsIntent customTabsIntent = builder.build();
        customTabsIntent.launchUrl(this, Uri.parse(url));
    }


    void register() {
        final User user = new User();
        user.setAddress(Utils.getText(ePhysicalAddress));
        user.setIDNo(Utils.getText(eID));
        user.setName(Utils.getText(eSurname) + " " + Utils.getText(eOthername));
        user.setPassword(pin);
        user.setRegion(region);
        user.setPhoneNo(phone);
        user.setRef1(Utils.getText(eRefereeOne));
        user.setRef2(Utils.getText(eRefereeTwo));
        user.setDeviceID(Connect.getDeviceModelName());

        startActivity(new Intent(EnterName.this, Verify.class).putExtra("user", user));
    }

    void removePhoto() {

        final Dialog dialog = new Dialog(context, android.R.style.Theme_DeviceDefault_Light_Dialog_NoActionBar_MinWidth);
        dialog.setContentView(R.layout.dialog_attach_photo);
        dialog.setCancelable(true);
        dialog.show();

        Button btnCamera = dialog.findViewById(R.id.btnCamera);
        Button btnGallery = dialog.findViewById(R.id.btnGallery);
        Button btnRemove = dialog.findViewById(R.id.btnRemove);

        if (mainPath == null && profileHolder.getPhoto().equals("")) {
            btnRemove.setVisibility(View.GONE);
        } else {
            btnRemove.setVisibility(View.VISIBLE);
        }

        btnCamera.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
                takePhoto();
            }
        });

        btnGallery.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
                pickPhoto();
            }
        });

        btnRemove.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                imageView.setImageResource(R.drawable.ic_user_black);
                mainPath = null;
                hasChangedPhoto = true;
                dialog.dismiss();
            }
        });
    }

    private void pickPhoto() {
        if (checkWritePermission(PERMISSION_WRITE_TO_STORAGE)) {
            Intent fintent = new Intent(Intent.ACTION_GET_CONTENT);
            fintent.setType("image/jpeg");
            try {
                startActivityForResult(fintent, 200);
            } catch (ActivityNotFoundException e) {
                responseHandler.showDialog("Error", "Cannot start this process since your device has not chooser");
            }
        }
    }

    private void takePhoto() {
        try {
            if (checkWritePermission(PERMISSION_WRITE_TO_STORAGE)) {
                Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
                intent.putExtra(MediaStore.EXTRA_OUTPUT, getOutputMediaFileUri(1));
                startActivityForResult(intent, 100);
            }
        } catch (Exception e) {
            responseHandler.showToast(e.getMessage());
        }
    }

    public boolean checkWritePermission(int requestCode) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            return true;
        }

        if (ContextCompat.checkSelfPermission(context, Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED ||
                ContextCompat.checkSelfPermission(context, Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED ||
                ContextCompat.checkSelfPermission(context, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED) {

            ActivityCompat.requestPermissions(this,
                    new String[]{
                            Manifest.permission.WRITE_EXTERNAL_STORAGE,
                            Manifest.permission.READ_EXTERNAL_STORAGE,
                            Manifest.permission.CAMERA
                    },
                    requestCode);

            return false;
        }


        return true;
    }

    public void cropImage(Uri imageUri) {
        CropImage.activity(imageUri)
                .start(this);
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == RESULT_OK) {
            switch (requestCode) {
                case CropImage.CROP_IMAGE_ACTIVITY_REQUEST_CODE:
                    try {
                        CropImage.ActivityResult result = CropImage.getActivityResult(data);
                        Uri resultUri = result.getUri();
                        mainPath = Utils.compressImage(context, Utils.getFilePath(context, resultUri));
                        imageView.setImageURI(resultUri);
                        hasChangedPhoto = true;
                    } catch (Exception e) {
                        e.printStackTrace();
                        responseHandler.showDialog("Image error", "We have a problem finding your image.Please check your image path again");
                    }

                    break;
                case 100:
                    try {
                        imageView.setVisibility(View.VISIBLE);
                        mainPath = Utils.compressImage(context, filePath);
                        cropImage(Uri.fromFile(new File(mainPath)));
                    } catch (Exception e) {
                        e.printStackTrace();
                        responseHandler.showDialog("Image error", "We have a problem finding your image.Please check your image path again");
                    }
                    break;
                case 200:
                    try {
                        imageView.setVisibility(View.VISIBLE);
                        mainPath = Utils.compressImage(context, Utils.getFilePath(context, data.getData()));
                        cropImage(Uri.fromFile(new File(mainPath)));
                    } catch (Exception e) {
                        Log.d("IMAGE_PICKER", e.getMessage());
                        responseHandler.showDialog("Image error", "We have a problem finding your image.Please check your image path again");
                    }
                    break;
            }
        } else {
            responseHandler.showToast("Failed");
        }
        super.onActivityResult(requestCode, resultCode, data);
    }


    public Uri getOutputMediaFileUri(int type) {
        return Uri.fromFile(getOutputMediaFile(type));
    }

    /*
     * returning image / video
     */
    private File getOutputMediaFile(int type) {
        // External sdcard location
        File mediaStorageDir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES), Utils.IMAGE_DIRECTORY_NAME);

        if (!mediaStorageDir.exists()) {
            if (!mediaStorageDir.mkdirs()) {
                Log.d(Utils.IMAGE_DIRECTORY_NAME, "Oops! Failed create "
                        + Utils.IMAGE_DIRECTORY_NAME + " directory");
                return null;
            }
        }

        // Create a media file name
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.getDefault()).format(new Date());
        File mediaFile = new File(mediaStorageDir.getPath() + File.separator
                + "IMG_" + timeStamp + ".jpg");
        filePath = mediaFile.getPath();
        return mediaFile;
    }


    private boolean isDeviceSupportCamera() {
        return getApplicationContext().getPackageManager().hasSystemFeature(
                PackageManager.FEATURE_CAMERA);
    }


    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String permissions[], @NonNull int[] grantResults) {
        switch (requestCode) {
            case 100:
                // If request is cancelled, the result arrays are empty.
                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    removePhoto();
                } else {
                    //responseHandler.showDialog("Permission required", getString(R.string.camera_permission_required));
                }
                break;

        }
    }


}

