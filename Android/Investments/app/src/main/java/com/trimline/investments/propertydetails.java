package com.trimline.investments;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager.widget.ViewPager;

import android.app.DownloadManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.RequestQueue;
import com.google.android.material.button.MaterialButton;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.io.File;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class propertydetails extends AppCompatActivity {
    ViewPager viewPager;
    LinearLayout sliderDotspanel;
    private int dotscount;
    private ImageView[] dots;
    RequestQueue rq;
    List<SliderUtils> sliderImg;
    properties.ViewPagerAdapter viewPagerAdapter;
    TextView Name,desc,units,note,payment,paymentinfo,features;
    Button link;
    Spinner notobook;
    MaterialButton book;
    RecyclerView files;
    properties p;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_propertydetails);
        Name = (TextView)findViewById(R.id.name);
        desc = (TextView)findViewById(R.id.desc);
        units = (TextView)findViewById(R.id.units);
        note = (TextView)findViewById(R.id.note);
        features = (TextView)findViewById(R.id.features);
        payment = (TextView)findViewById(R.id.payment);
        link = (Button)findViewById(R.id.link);
        paymentinfo = (TextView)findViewById(R.id.paymentinfo);
        notobook=(Spinner) findViewById(R.id.notobook);
        book=(MaterialButton) findViewById(R.id.book);
        files = (RecyclerView)findViewById(R.id.files);
        files.setLayoutManager(new LinearLayoutManager(this));
       p = (properties) getIntent().getSerializableExtra("Propertyid");
       if (p!=null)
           if(p.Property_Image!=null)
               if (p.Property_Image.size()>0) {
                   System.out.println(new Gson().toJson(p.Property_Image));
                   List<Property_Image> i = new ArrayList<>();
                   for (Property_Image im : p.Property_Image
                   ) {
                       if (com.trimline.investments.Type.values()[im.Type] == com.trimline.investments.Type.Document)
                           i.add(im);
                   }
                   System.out.println(new Gson().toJson(i));
                   adapter s = new adapter(i, this);
                   files.setAdapter(s);
                   s.setOnItemClickListener(new adapter.OnItemClickListener() {
                       @Override
                       public void onItemClick(Property_Image note) {
                           Toast.makeText(propertydetails.this, note.Description, Toast.LENGTH_SHORT).show();
                       }
                   });
               }



        link.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(p.Google_Link!=null)
                {
                    String latitude,longtude;
                    latitude = p.Google_Link.split(",")[0];
                    longtude = p.Google_Link.split(",")[1];
                    System.out.println(latitude);
                    System.out.println(longtude);

//                    String uri = "http://maps.google.com/maps?saddr=" + sourceLatitude + "," + sourceLongitude + "&daddr=" + destinationLatitude + "," + destinationLongitude;
//                    Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
//                    intent.setPackage("com.google.android.apps.maps");
//                    startActivity(intent);


                String uri = String.format(Locale.ENGLISH, "geo:%s,%s?z=%d&q=%s,%s (%s)",
                        latitude, longtude, 15, latitude, longtude, p.Project_Name);
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
                startActivity(intent);
            }}
        });

        if (p!=null) {
            Name.setText(p.Project_Name);
            desc.setText(p.Description);
//            List<Sales_Setup_Lines> sl = new ArrayList<>();
//            if (p.Sales_Setup_Lines != null)
//                for (Sales_Setup_Lines s : p.Sales_Setup_Lines
//                ) {
//                    if (s.Available && s.Published)
//                        sl.add(s);
//                }
//            ArrayAdapter<Sales_Setup_Lines> adapter = new ArrayAdapter<Sales_Setup_Lines>(this, android.R.layout.simple_spinner_item, sl);
//            adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
//            notobook.setAdapter(adapter);
//            if (sl.size() == 0)
//                book.setVisibility(View.GONE);

            units.setText(Html.fromHtml(String.format("Remaining Units <b>%d<b/>", p.Total_Plots - p.Total_Sold)));
            note.setVisibility(View.GONE);
//            if (p.Property_Conditions != null)
//                if (p.Property_Conditions.size() > 0) {
//                    int i = 1;
//                    StringBuilder b = new StringBuilder();
//                    b.append(String.format("<b>NOTE:</b><br/>"));
//                    for (propert_conditions c : p.Property_Conditions
//                    ) {
//                        b.append(String.format("%d. %s<br/>", i, c.Condition));
//                        i += 1;
//                    }
//                    note.setText(Html.fromHtml(b.toString()));
//                }


            if (p.Property_Features != null)
                if (p.Property_Features.size() > 0) {
                    int i = 1;
                    StringBuilder b = new StringBuilder();
                    b.append(String.format("<b>FEATURES:</b><br/>"));
                    for (Property_Feature c : p.Property_Features
                    ) {
                        b.append(String.format("%d. %s<br/><br/>", i, c.Feature));
                        i += 1;
                    }
                    features.setText(Html.fromHtml(b.toString()));
                }
//            payment.setText(Html.fromHtml(String.format("Booking Price KES:     <b>%,.2f</b><br/>" +
//                    "Deposit Amount KES:    <b>%,.2f</b><br/>", p.Booking_Price, p.Deposit_Amount)));


            if (p.Payment_Method != null)
                if (p.Payment_Method.size() > 0) {
                    int i = 1;
                    StringBuilder b = new StringBuilder();
                    b.append(String.format("<b>Payment info:</b><br/>"));
                    for (payment_methods c : p.Payment_Method
                    ) {
                        b.append(String.format("%d. %s<br/>", i, c.Description));
                        i += 1;
                    }
                    paymentinfo.setText(Html.fromHtml(b.toString()));
                }


            book.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {



                    if (Investments.member != null) {

                        Intent payloan = new Intent(propertydetails.this, book.class);
                       // payloan.putExtra("list", s);
                        payloan.putExtra("properties", p);
                        startActivity(payloan);
                    }
                }
            });
        }
        rq = properties.CustomVolleyRequest.getInstance(this).getRequestQueue();
        sliderImg = new ArrayList<>();
        viewPager = (ViewPager) findViewById(R.id.viewPager);
        sliderDotspanel = (LinearLayout) findViewById(R.id.SliderDots);
        viewPager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            }
            @Override
            public void onPageSelected(int position) {
                for(int i = 0; i< dotscount; i++){
                    dots[i].setImageDrawable(ContextCompat.getDrawable(getApplicationContext(), R.drawable.myaccount));
                }
                dots[position].setImageDrawable(ContextCompat.getDrawable(getApplicationContext(), R.drawable.myaccount));
            }
            @Override
            public void onPageScrollStateChanged(int state) {
            }
        });
        images();
    }
    private class booking extends AsyncTask<Property_sales, Void, Property_sales> {
        @Override
        protected Property_sales doInBackground(Property_sales... agents) {
            Property_sales p = null;
            try {
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String result = JsonParser.postjson("book", "data", g.toJson(agents[0], Property_sales.class));
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


        }}
    public void images(){
        Log.i("Prop", new Gson().toJson(p));
        if (p.Property_Image!=null)
        if (p.Property_Image.size()>0){
            for (Property_Image pp : p.Property_Image
            ) {

                SliderUtils sliderUtils = new SliderUtils();
                try {
                    if(com.trimline.investments.Type.values()[pp.Type] == com.trimline.investments.Type.Image ||com.trimline.investments.Type.values()[pp.Type] == com.trimline.investments.Type.Video  )
                    sliderUtils.setSliderImageUrl(pp.Url);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                sliderImg.add(sliderUtils);
            }
            viewPagerAdapter = new properties.ViewPagerAdapter(sliderImg, propertydetails.this);
            viewPager.setAdapter(viewPagerAdapter);
            dotscount = viewPagerAdapter.getCount();
            dots = new ImageView[dotscount];

            for (int i = 0; i < dotscount; i++) {

                dots[i] = new ImageView(propertydetails.this);
                dots[i].setImageDrawable(ContextCompat.getDrawable(getApplicationContext(), R.drawable.myaccount));

                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);

                params.setMargins(8, 0, 8, 0);

                sliderDotspanel.addView(dots[i], params);

            }

            dots[0].setImageDrawable(ContextCompat.getDrawable(getApplicationContext(), R.drawable.myaccount));

        }
    }
    public static class adapter extends RecyclerView.Adapter<adapter.Holder> {
        private List<Property_Image> notes = new ArrayList<>();

        boolean isFABOpen = false;
        private OnItemClickListener listener;
        Context context;

        public adapter(List<Property_Image> image, Context context) {
            this.notes = image;
            this.context = context;
        }
        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
         View view  = LayoutInflater.from(parent.getContext()).inflate(R.layout.files, parent, false);
            Holder holder = new Holder(view);


            return new Holder(view);
        }

        @Override
        public void onBindViewHolder(@NonNull final Holder holder, int position) {
            final Property_Image currentNote = notes.get(position);
            holder.files.setText(currentNote.Description);
            holder.d.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    try {
                        beginDownload(currentNote.Url, currentNote.Description);
                    }
                    catch (Exception ex){

                        Toast.makeText(context, "Unable to download file", Toast.LENGTH_SHORT).show();
                    }
                    }
            });
        }


        @Override
        public int getItemCount() {
            return notes.size();
        }

        public Property_Image getTransAt(int position) {
            return notes.get(position);
        }

        public void setTrans(List<Property_Image> notes) {
            this.notes = notes;
            notifyDataSetChanged();
        }
        public  void beginDownload(String url,String name ) {
//        File file;
//        if (new CheckForSDCard().isSDCardPresent()) {
//
//            file = new  File(
//                    Environment.getExternalStorageDirectory() + "/"
//                            + Utils.downloadDirectory);
//        }
            //File file = new File(getExternalFilesDir(null), "Downloads");
        /*
        Create a DownloadManager.Request with all the information necessary to start the download
         */
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url))
                    .setTitle(name)// Title of the Download Notification
                    .setDescription("Downloading")// Description of the Download Notification
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)// Visibility of the download Notification
                    .setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS,name)
                    .setMimeType("*/*")
                    //.setDestinationUri(Uri.fromFile(file))// Uri of the destination file
                    .setRequiresCharging(false)// Set if charging is required to begin the download
                    .setAllowedOverMetered(true)// Set if download is allowed on Mobile network
                    .setAllowedOverRoaming(true);// Set if download is allowed on roaming network
            DownloadManager downloadManager = (DownloadManager) context. getSystemService(DOWNLOAD_SERVICE);
            Investments.downloadID = downloadManager.enqueue(request);// enqueue puts the download request in the queue.
        }
          class Holder extends RecyclerView.ViewHolder {
          TextView files;
    ImageView d ;
            ConstraintLayout grouptrans;
            public Holder(View itemView) {
                super(itemView);
            files=(TextView)itemView.findViewById(R.id.files) ;
           d = (ImageView) itemView.findViewById(R.id.download);
                itemView.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (listener != null && position != RecyclerView.NO_POSITION) {
                            listener.onItemClick(notes.get(position));
                        }
                    }
                });
            }

        }
        public interface OnItemClickListener {
            void onItemClick(Property_Image note);
        }
        public void setOnItemClickListener(OnItemClickListener listener) {
            this.listener = listener;
        }
    }
    private void openDownloadedFolder() {
        //First check if SD Card is present or not
        if (new CheckForSDCard().isSDCardPresent()) {

            //Get Download Directory File
            File apkStorage = new File(
                    Environment.getExternalStorageDirectory() + "/"
                            + Utils.downloadDirectory);

            //If file is not present then display Toast
            if (!apkStorage.exists())
                Toast.makeText(propertydetails.this, "Right now there is no directory. Please download some file first.", Toast.LENGTH_SHORT).show();

            else {

                //If directory is present Open Folder

                /** Note: Directory will open only if there is a app to open directory like File Manager, etc.  **/

                Intent intent = new Intent(Intent.ACTION_GET_CONTENT);
                Uri uri = Uri.parse(Environment.getExternalStorageDirectory().getPath()
                        + "/" + Utils.downloadDirectory);
                intent.setDataAndType(uri, "file/*");
                startActivity(Intent.createChooser(intent, "Open Download Folder"));
            }

        } else
            Toast.makeText(propertydetails.this, "Oops!! There is no SD Card.", Toast.LENGTH_SHORT).show();

    }

    private BroadcastReceiver onDownloadComplete = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            //Fetching the download id received with the broadcast
            long id = intent.getLongExtra(DownloadManager.EXTRA_DOWNLOAD_ID, -1);
            //Checking if the received broadcast is for our enqueued download by matching download id
            if (Investments. downloadID == id) {
                Toast.makeText(propertydetails.this, "Download Completed", Toast.LENGTH_SHORT).show();
            }
        }
    };
    @Override
    public void onDestroy() {
        super.onDestroy();
        try {
            unregisterReceiver(onDownloadComplete);
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }


}
