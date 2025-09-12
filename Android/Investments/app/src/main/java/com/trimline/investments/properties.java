package com.trimline.investments;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.collection.LruCache;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;

import com.android.volley.Cache;
import com.android.volley.Network;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.BasicNetwork;
import com.android.volley.toolbox.DiskBasedCache;
import com.android.volley.toolbox.HurlStack;
import com.android.volley.toolbox.ImageLoader;
import com.google.gson.annotations.SerializedName;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import static android.text.Layout.JUSTIFICATION_MODE_INTER_WORD;

public class properties implements Serializable {
    public String Key;
    public String Sales_Code;
    public String Description;
    public String Project_Code;
    public String Project_Name;

    @Override
    public String toString() {
        return this.Project_Name;
    }

    public String Subdivision_Code;
    public int Total_Plots;
    public Boolean Total_PlotsSpecified;
    public Date Launch_Date;
    public Boolean Launch_DateSpecified;
    public String Interest_Receivable_Account;
    public String Interest_Account;
    public Double Booking_Price;
    public Boolean Booking_PriceSpecified;
    public Double Minimum_Selling_Price;
    public Boolean Minimum_Selling_PriceSpecified;
    public Double Actual_Selling_Price;
    public Boolean Actual_Selling_PriceSpecified;
    public String Deposit_Type;
    public Boolean Deposit_TypeSpecified;
    public Investment_Types Investment_Type;
    public Boolean Investment_TypeSpecified;
    public String Cash_Sale_Charges;
    public Double Deposit_Amount;
    public Boolean Deposit_AmountSpecified;
    public int Max_Repayment_Period;
    public Boolean Max_Repayment_PeriodSpecified;
    public String Credit_Product_Code;
    public String Fixed_Inst_Product_Code;
    public Double Interest_Rate;
    public Boolean Interest_RateSpecified;
    public int Available_Plots;
    public int Total_Sold;
    public String Google_Link;
    public Property_Type Property_Type;
    public List<Property_Image> Property_Image;
    public List<Sales_Setup_Lines> Sales_Setup_Lines;
    public List<Sales_Setup_Prices> Sales_Setup_Prices;
    public List<propert_conditions> Property_Conditions;
    public List<payment_methods> Payment_Method;
    public List<Property_Feature> Property_Features;

    public enum Property_Type {

        /// <remarks/>
        Land,

        /// <remarks/>
        House,

        /// <remarks/>
        Agri_Business,
    }

    public static enum Investment_Types {
        /// <remarks/>
        @SerializedName("0")
        Property_Type("Property Type"),
        /// <remarks/>
        @SerializedName("1")
        Land("Land"),
        /// <remarks/>
        @SerializedName("2")
        Housing("Housing"),
        /// <remarks/>
        @SerializedName("3")
        Agri_Buisness("Agri Business");

        private String type;

        Investment_Types(String t) {
            type = t;
        }

        @Override
        public String toString() {
            return type;
        }
    }

    public static class SalesAdapter extends RecyclerView.Adapter<SalesAdapter.ProductViewHolder> {
        private List<properties> sales;
        Context context;

        public SalesAdapter(List<properties> grocderyItemList, Context context) {
            this.sales = grocderyItemList;
            this.context = context;
        }

        @Override
        public ProductViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            //inflate the layout file
            View groceryProductView = LayoutInflater.from(parent.getContext()).inflate(R.layout.propertylist, parent, false);
            ProductViewHolder gvh = new ProductViewHolder(groceryProductView);
            return gvh;
        }
        @Override
        public void onBindViewHolder(ProductViewHolder holder, final int position) {
            //holder.imageProductImage.setImageResource(sales.get(position).getProductImage());
            holder.name.setText(sales.get(position).Project_Name);
            holder.desc.setText(sales.get(position).Description);
            holder.desc.setJustificationMode(JUSTIFICATION_MODE_INTER_WORD);
            holder.size.setMin(0);
            holder.size.setMax(sales.get(position).Total_Plots);
            holder.size.setProgress(sales.get(position).Available_Plots, true);
            float f;
            if (sales.get(position).Total_Plots == 0)
                f = 1 * 100;
            else
                f = (((float) sales.get(position).Available_Plots / (float) sales.get(position).Total_Plots)) * 100;


            NumberFormat format = NumberFormat.getPercentInstance(Locale.US);
            String percentage = format.format(f);
            holder.progrespercent.setText(percentage);
            Log.i("Percentage", percentage);
            // holder.size.setText(String.valueOf(sales.get(position).Total_Plots));
//            try {
            if (sales.get(position).Sales_Setup_Lines != null)
                if (sales.get(position).Sales_Setup_Lines.size() > 0) {
                    com.trimline.investments.Sales_Setup_Prices s = null;
                    for (Sales_Setup_Prices ss : sales.get(position).Sales_Setup_Prices
                    ) {
                        if (Investments.member == null) {
                            return;
                        }
                        if (ss.Member_Category.contentEquals(Investments.member.Member_Category)) {
                            s = ss;
                            break;
                        }
                    }
                    if (s != null)
                        holder.price.setText(Html.fromHtml(
                                String.format("Cash Price:       KES.  <b>%,.2f</b>\n<br/>Installment Price:        KES.  <b>%,.2f</b>", s.Cash_Price, s.Installment_Price)));


                }
            if ((sales.get(position).Total_Plots - sales.get(position).Available_Plots) == 0)
                holder.book.setVisibility(View.GONE);
            holder.book.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Intent intent = new Intent(context, propertydetails.class);
                    intent.putExtra("Propertyid", sales.get(position));

                    context.startActivity(intent);
                }
            });
//            }catch (Exception ex){
//
//                ex.printStackTrace();
//            }

        }

        @Override
        public int getItemCount() {
            return sales.size();
        }

        public class ProductViewHolder extends RecyclerView.ViewHolder {
            TextView name;
            TextView desc;
            ProgressBar size;
            TextView price,progrespercent;
            Button book;
            public ProductViewHolder(View view) {
                super(view);
                name = view.findViewById(R.id.name);
                desc = view.findViewById(R.id.desc);
                size = view.findViewById(R.id.size);
                price = view.findViewById(R.id.price);
                progrespercent = view.findViewById(R.id.progrespercent);
                book = (Button) view.findViewById(R.id.book);
            }
        }
    }
    public static class CustomVolleyRequest {
        private static CustomVolleyRequest customVolleyRequest;
        private static Context context;
        private RequestQueue requestQueue;
        private ImageLoader imageLoader;
        private CustomVolleyRequest(Context context) {
            this.context = context;
            this.requestQueue = getRequestQueue();
            imageLoader = new ImageLoader(requestQueue, new ImageLoader.ImageCache() {
                private final LruCache<String, Bitmap> cache = new LruCache<String, Bitmap>(20);
                @Override
                public Bitmap getBitmap(String url) {
                    return cache.get(url);
                }
                @Override
                public void putBitmap(String url, Bitmap bitmap) {
                    cache.put(url, bitmap);
                }
            });
        }
        public static synchronized CustomVolleyRequest getInstance(Context context) {

            if (customVolleyRequest == null) {
                customVolleyRequest = new CustomVolleyRequest(context);
            }
            return customVolleyRequest;
        }
        public RequestQueue getRequestQueue() {
            if (requestQueue == null) {
                Cache cache = new DiskBasedCache(context.getCacheDir(), 10 * 1024 * 1024);
                Network network = new BasicNetwork(new HurlStack());
                requestQueue = new RequestQueue(cache, network);
                requestQueue.start();
            }
            return requestQueue;
        }
        public void addToRequestQueue(Request req) {
            getRequestQueue().add(req);
        }
        public ImageLoader getImageLoader() {
            return imageLoader;
        }
    }
    public static class ViewPagerAdapter extends PagerAdapter {

        private Context context;
        private LayoutInflater layoutInflater;
        private List<SliderUtils> sliderImg;
        private ImageLoader imageLoader;


        public ViewPagerAdapter(List sliderImg, Context context) {
            this.sliderImg = sliderImg;
            this.context = context;
        }

        @Override
        public int getCount() {
            return sliderImg.size();
        }

        @Override
        public boolean isViewFromObject(View view, Object object) {
            return view == object;
        }

        @Override
        public Object instantiateItem(ViewGroup container, final int position) {

            layoutInflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            View view = layoutInflater.inflate(R.layout.propertyimage, null);
    try {
        SliderUtils utils = sliderImg.get(position);

        ImageView imageView = (ImageView) view.findViewById(R.id.imageView);

        imageLoader = CustomVolleyRequest.getInstance(context).getImageLoader();
        imageLoader.get(utils.getSliderImageUrl(), ImageLoader.getImageListener(imageView, R.mipmap.ic_launcher, android.R.drawable.ic_dialog_alert));


        view.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

//                if (position == 0) {
//                    Toast.makeText(context, "Slide 1 Clicked", Toast.LENGTH_SHORT).show();
//                } else if (position == 1) {
//                    Toast.makeText(context, "Slide 2 Clicked", Toast.LENGTH_SHORT).show();
//                } else {
//                    Toast.makeText(context, "Slide 3 Clicked", Toast.LENGTH_SHORT).show();
//                }

            }
        });

        ViewPager vp = (ViewPager) container;
        vp.addView(view, 0);
    }catch (Exception ex){ex.printStackTrace();}
            return view;

        }

        @Override
        public void destroyItem(ViewGroup container, int position, Object object) {

            ViewPager vp = (ViewPager) container;
            View view = (View) object;
            vp.removeView(view);

        }
    }
}
