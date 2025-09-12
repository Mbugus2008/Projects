package com.example.agency;

import com.example.utils.Configuration;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.MultiplePermissionsReport;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.multi.MultiplePermissionsListener;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.provider.MediaStore;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TableRow;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import static com.example.agency.AgencyListActivity.p;
import static com.example.agency.AgencyListActivity.trans;

public class MemberRegistration extends Activity {
	private EditText EtAccName, EtNationalID, EtTelNo, EtSociety, EtMemberNo,
			EtAmount,tscno;
	private Button BtnCancel, BtnConfirm;
	String AccName, NationaID, TelNo, Society, MemberNo, Amount;

	private static final int CAMERA_CAPTURE_IMAGE_REQUEST_CODE = 100;
	private static final int CAMERA_CAPTURE_VIDEO_REQUEST_CODE = 200;

	// key to store image path in savedInstance state
	public static final String KEY_IMAGE_STORAGE_PATH = "image_path";

	public static final int MEDIA_TYPE_IMAGE = 1;
	public static final int MEDIA_TYPE_VIDEO = 2;

	// Bitmap sampling size
	public static final int BITMAP_SAMPLE_SIZE = 8;

	// Gallery directory name to store the images or videos
	public static final String GALLERY_DIRECTORY_NAME = "Hello Camera";

	// Image and Video file extensions
	public static final String IMAGE_EXTENSION = "jpg";
	public static final String VIDEO_EXTENSION = "mp4";

	private static String imageStoragePath;
ImageView photo ;
Button takephoto;


	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.member_registration);
		EtAccName = (EditText) findViewById(R.id.mrtxtaccountname);
		EtNationalID = (EditText) findViewById(R.id.mrtxtnationalid);
		EtTelNo = (EditText) findViewById(R.id.mrtxtphoneno);
		EtSociety = (EditText) findViewById(R.id.mrtxtsociety);
		EtMemberNo = (EditText) findViewById(R.id.mrtxtsocietyno);
		EtAmount = (EditText) findViewById(R.id.mrtxtamount);
		BtnCancel = (Button) findViewById(R.id.mrCancel);
		BtnConfirm = (Button) findViewById(R.id.mrConfirm);
tscno = (EditText)findViewById(R.id.txttscno);
photo =(ImageView)findViewById(R.id.Photo);

takephoto = (Button)findViewById(R.id.Takepicture);

		if (!CameraUtils.isDeviceSupportCamera(getApplicationContext())) {
			Toast.makeText(getApplicationContext(),
					"Sorry! Your device doesn't support camera",
					Toast.LENGTH_LONG).show();
			// will close the app if the device doesn't have camera
		}
takephoto.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v) {
				if (CameraUtils.checkPermissions(getApplicationContext())) {
					captureImage();
				} else {
					requestCameraPermission(MEDIA_TYPE_IMAGE);
				}
			}
		});


		BtnCancel.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				finish();
			}
		});

		BtnConfirm.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				AccName = EtAccName.getText().toString().trim();
				NationaID = EtNationalID.getText().toString().trim();
				TelNo = EtTelNo.getText().toString().trim();
				Society = EtSociety.getText().toString().trim();
				MemberNo = EtMemberNo.getText().toString().trim();
				Amount = EtAmount.getText().toString().trim();

				if (AccName.equals("") || AccName == null) {
					EtAccName.setError(getString(R.string.emptyfield));
					EtAccName.requestFocus();
				} else if (NationaID.equals("") || NationaID == null) {
					EtNationalID.setError(getString(R.string.emptyfield));
					EtNationalID.requestFocus();
				} else if (TelNo.equals("") || TelNo == null) {
					EtTelNo.setError(getString(R.string.emptyfield));
					EtTelNo.requestFocus();
				} else if (Amount.equals("") || Amount == null) {
					EtAmount.setError(getString(R.string.emptyfield));
					EtAmount.requestFocus();
				} else {
					trans.status = Transaction.Status.Pending;
					trans.amount = Double.valueOf(Amount).doubleValue();
					Member member = new Member();
					member.id_no = NationaID;
					member.telephone = TelNo;
					member.name = AccName;

					trans.member_1 = member;
					new Transsync(trans).execute();
				}
			}
		});

	}

	private void restoreFromBundle(Bundle savedInstanceState) {
		if (savedInstanceState != null) {
			if (savedInstanceState.containsKey(KEY_IMAGE_STORAGE_PATH)) {
				imageStoragePath = savedInstanceState.getString(KEY_IMAGE_STORAGE_PATH);
				if (!TextUtils.isEmpty(imageStoragePath)) {
					if (imageStoragePath.substring(imageStoragePath.lastIndexOf(".")).equals("." + IMAGE_EXTENSION)) {
						previewCapturedImage();
					}
				}
			}
		}
	}

	/**
	 * Requesting permissions using Dexter library
	 */
	private void requestCameraPermission(final int type) {
		Dexter.withActivity(this)
				.withPermissions(Manifest.permission.CAMERA,
						Manifest.permission.WRITE_EXTERNAL_STORAGE,
						Manifest.permission.RECORD_AUDIO)
				.withListener(new MultiplePermissionsListener() {
					@Override
					public void onPermissionsChecked(MultiplePermissionsReport report) {
						if (report.areAllPermissionsGranted()) {

							if (type == MEDIA_TYPE_IMAGE) {
								// capture picture
								captureImage();
							}

						} else if (report.isAnyPermissionPermanentlyDenied()) {
							showPermissionsAlert();
						}
					}

					@Override
					public void onPermissionRationaleShouldBeShown(List<PermissionRequest> permissions, PermissionToken token) {
						token.continuePermissionRequest();
					}
				}).check();
	}
	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		// if the result is capturing Image
		if (requestCode == CAMERA_CAPTURE_IMAGE_REQUEST_CODE) {
			if (resultCode == RESULT_OK) {
				// Refreshing the gallery
				CameraUtils.refreshGallery(getApplicationContext(), imageStoragePath);

				// successfully captured the image
				// display it in image view
				previewCapturedImage();
			} else if (resultCode == RESULT_CANCELED) {
				// user cancelled Image capture
				Toast.makeText(getApplicationContext(),
						"User cancelled image capture", Toast.LENGTH_SHORT)
						.show();
			} else {
				// failed to capture image
				Toast.makeText(getApplicationContext(),
						"Sorry! Failed to capture image", Toast.LENGTH_SHORT)
						.show();
			}
		}
	}

	/**
	 * Display image from gallery
	 */
	private void previewCapturedImage() {
		try {

			Bitmap bitmap = CameraUtils.optimizeBitmap(BITMAP_SAMPLE_SIZE, imageStoragePath);

			photo.setImageBitmap(bitmap);

		} catch (NullPointerException e) {
			e.printStackTrace();
		}
	}
	private void showPermissionsAlert() {
		AlertDialog.Builder builder = new AlertDialog.Builder(this);
		builder.setTitle("Permissions required!")
				.setMessage("Camera needs few permissions to work properly. Grant them in settings.")
				.setPositiveButton("GOTO SETTINGS", new DialogInterface.OnClickListener() {
					public void onClick(DialogInterface dialog, int which) {
						CameraUtils.openSettings(MemberRegistration.this);
					}
				})
				.setNegativeButton("CANCEL", new DialogInterface.OnClickListener() {
					public void onClick(DialogInterface dialog, int which) {

					}
				}).show();
	}
	/**
	 * Capturing Camera Image will launch camera app requested image capture
	 */
	private void captureImage() {
		Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);

		File file = CameraUtils.getOutputMediaFile(MEDIA_TYPE_IMAGE);
		if (file != null) {
			imageStoragePath = file.getAbsolutePath();
		}

		Uri fileUri = CameraUtils.getOutputMediaFileUri(getApplicationContext(), file);

		intent.putExtra(MediaStore.EXTRA_OUTPUT, fileUri);

		// start the image capture Intent
		startActivityForResult(intent, CAMERA_CAPTURE_IMAGE_REQUEST_CODE);
	}

	@Override
	protected void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);

		// save file url in bundle as it will be null on screen orientation
		// changes
		outState.putString(KEY_IMAGE_STORAGE_PATH, imageStoragePath);
	}

	/**
	 * Restoring image path from saved instance state
	 */
	@Override
	protected void onRestoreInstanceState(Bundle savedInstanceState) {
		super.onRestoreInstanceState(savedInstanceState);

		// get the file url
		imageStoragePath = savedInstanceState.getString(KEY_IMAGE_STORAGE_PATH);
	}
	private class Transsync extends AsyncTask<Transaction, Void, Transaction> {
		private final ProgressDialog dialog = new ProgressDialog(
				MemberRegistration.this);
		Transaction t;

		public Transsync(Transaction trans) {
			this.t = trans;
		}

		@Override
		protected void onPreExecute() {
			// Log.d("got here point 2", "yes");
			this.dialog.setMessage("Processing request...");
			this.dialog.show();
		}

		@Override
		protected Transaction doInBackground(Transaction... params) {
			//
			Transaction results = null;
			String result = null;
			try {
				Gson g = new Gson();
				result = g.toJson(this.t);
				result = JsonParser.postjson(MemberRegistration.this, "Transactions", result,
						"data");
				Type localType = new TypeToken<Transaction>() {
				}.getType();
				results = new Gson().fromJson(result, localType);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return results;
		}
		@Override
		protected void onPostExecute(Transaction res) {
			if (this.dialog.isShowing()) {
				this.dialog.dismiss();
			}
			trans = res;
			misc.debug(trans.status.toString());
			switch (trans.status) {
				case Confirmation: {
					ConfirmationBox(trans);
					break;
				}
				case Failed:
				case Successful:
					try{
						DB db = new DB(MemberRegistration. this);
						Calendar cdt = Calendar.getInstance();
						SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
						final String formattedDate = df.format(cdt.getTime());
						df = new SimpleDateFormat("HH:mm:ss");
						final String formattedtime = df.format(cdt.getTime());
						trans.Date = formattedDate;
						trans.Time = formattedtime;
						trans.Name = trans.account_1.Account_Name;
						db.insertTransaction(trans);}
					catch   (Exception ex){
						ex.printStackTrace();

					}
					ResultsBox(trans);
					break;


			}
		}
	}
	public void ConfirmationBox(Transaction t) {
		final String ref = t.code;
		LayoutInflater li = LayoutInflater.from(MemberRegistration.this);
		View promptsView = li.inflate(R.layout.confirmation_box, null);
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
				MemberRegistration.this);
		alertDialogBuilder.setView(promptsView);
		final TableRow trpin = (TableRow)promptsView.findViewById(R.id.trpin);
		final TextView tvTranType = (TextView) promptsView
				.findViewById(R.id.cbtxttranstype);
		final TextView tvAccNo = (TextView) promptsView
				.findViewById(R.id.cbtxtaccountno);
		final TextView tvAmount = (TextView) promptsView
				.findViewById(R.id.cbmyamount);
		final TextView tvAmount2 = (TextView) promptsView
				.findViewById(R.id.cbtxtamount);
		final EditText EtAC = (EditText) promptsView
				.findViewById(R.id.cbtxtcode);
		final EditText EtAgentPin = (EditText) promptsView
				.findViewById(R.id.cbtxtpin);

		tvTranType.setText(t.transactiontype.toString());
		tvAccNo.setText(t.member_1.name);
		tvAmount2.setText(String.valueOf(t.amount));

		trpin.setVisibility(View.INVISIBLE);
		SharedPreferences preferences = PreferenceManager
				.getDefaultSharedPreferences(this);
		final String storedAgentCode = preferences.getString("agentKey", "");
		Configuration config = new Configuration();
		final String MyagentPin = config.getAgentPin();
		// set dialog message
		alertDialogBuilder
				.setCancelable(false)
				.setTitle("Client Confirmation")
				.setPositiveButton("OK", new DialogInterface.OnClickListener() {
					@Override
					public void onClick(DialogInterface dialog, int id) {

					}
				})
				.setNegativeButton("Cancel",
						new DialogInterface.OnClickListener() {
							public void onClick(DialogInterface dialog, int id) {
								dialog.cancel();
							}
						});
		// create alert dialog
		final AlertDialog adialog = alertDialogBuilder.create();
		adialog.getWindow().setSoftInputMode(
				WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
		adialog.show();

		adialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {

				String cnfCode = EtAC.getText().toString().trim();

				if (cnfCode.equalsIgnoreCase(ref)) {
					// Toast("Correct code");

					new Transsync(trans).execute();
					adialog.dismiss();

				} else {
					// Log.d("AC", cnfCode);
					EtAC.setError("Incorrect authentication code");
					EtAC.requestFocus();

				}


			}
		});


	}
	public void ResultsBox(final Transaction t) {

		LayoutInflater li = LayoutInflater.from(MemberRegistration.this);
		View promptsView = li.inflate(R.layout.activity_results, null);
		AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(
				MemberRegistration.this);

		alertDialogBuilder.setView(promptsView);
		final TextView txtreference = (TextView) promptsView
				.findViewById(R.id.txtreference);
		final TextView tvTranType = (TextView) promptsView
				.findViewById(R.id.txttranstype);
		final TextView tvAccNo = (TextView) promptsView
				.findViewById(R.id.txtaccountno);
		final TextView tvAmount = (TextView) promptsView
				.findViewById(R.id.txtamount);
		final TextView tvstatus = (TextView) promptsView
				.findViewById(R.id.Info);
		final TextView tverrorinfo = (TextView) promptsView
				.findViewById(R.id.txterrors);

		txtreference.setText(t.reference);
		tvstatus.setText(t.status.toString());
		if (t.status != Transaction.Status.Successful)
			tverrorinfo.setText(t.message);
		tvTranType.setText(t.transactiontype.toString());
		tvAccNo.setText((t.account_1 == null ? "None" : t.account_1.Account_No));
		tvAmount.setText(String.valueOf(t.amount));
		alertDialogBuilder
				.setCancelable(false)
				.setTitle("Transaction Results")
				.setPositiveButton("OK", new DialogInterface.OnClickListener() {
					public void onClick(DialogInterface dialog, int id) {
						if (t.status == Transaction.Status.Successful)
						{p.printTransaction(t);
							finish();}
					}
				})
		;
		// create alert dialog
		AlertDialog alertDialog = alertDialogBuilder.create();
		alertDialog.getWindow().setSoftInputMode(
				WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);// show it
		alertDialog.show();
	}
}
