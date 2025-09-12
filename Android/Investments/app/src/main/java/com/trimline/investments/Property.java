package com.trimline.investments;

import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.Button;
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.ProgressBar;
import android.widget.RadioGroup;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import static android.text.Layout.JUSTIFICATION_MODE_INTER_WORD;

/**
 * A simple {@link Fragment} subclass.
 * Activities that contain this fragment must implement the
 * {@link Property.OnFragmentInteractionListener} interface
 * to handle interaction events.
 * Use the {@link Property#newInstance} factory method to
 * create an instance of this fragment.
 */
public class Property extends Fragment {
    // TODO: Rename parameter arguments, choose names that match
    // the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";

    ExpandableListView propertylist;
    ExpandableListAdapter expandableListAdapter;
    List<String> expandableListTitle;
    HashMap<String, List<properties>> expandableListDetail;

    RecyclerView mRecyclerView;
    Spinner location, propertyspinner;
    private static int firstVisibleInListview;
    RelativeLayout findlayout;

    RadioGroup rg ;

    List<properties> propertiesList;
    public static List<properties> originallist;
    properties.SalesAdapter mAdapter;
    // TODO: Rename and change types of parameters
    private String mParam1;
    private String mParam2;

    private OnFragmentInteractionListener mListener;

    public Property() {
        // Required empty public constructor
    }

    /**
     * Use this factory method to create a new instance of
     * this fragment using the provided parameters.
     *
     * @param param1 Parameter 1.
     * @param param2 Parameter 2.
     * @return A new instance of fragment Property.
     */
    // TODO: Rename and change types and number of parameters
    public static Property newInstance(String param1, String param2) {
        Property fragment = new Property();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.property, container, false);
        propertylist = (ExpandableListView)view.findViewById(R.id.propertylist);

        mRecyclerView = (RecyclerView) view.findViewById(R.id.properties);
        mRecyclerView.setLayoutManager(new LinearLayoutManager(getContext()));
        rg = (RadioGroup) view.findViewById(R.id.availability);
        rg.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup radioGroup, int i) {
                switch(i)
                {
                    case R.id.All:
                        expandablelist(originallist);
                       // getproperties(originallist);

                        break;
                    case R.id.Current:
                        List<properties> p = new ArrayList<properties>();
                        if (originallist!=null)
                        for (properties pp : originallist
                        ){
                            if (pp.Total_Plots > pp.Available_Plots)
                                p.add(pp);}
                            //getproperties(p);
                        expandablelist(p);
                        break;
                    case R.id.Past:
                         p = new ArrayList<properties>();
                        if (originallist!=null)
                        for (properties pp : originallist
                        )
                            if (pp.Total_Plots == pp.Available_Plots)
                                p.add(pp);
                        expandablelist(p);
                        //getproperties(p);
                        break;
                }
            }
        });

        new getproperties().execute();

        //expandable list







        return view;
    }

    // TODO: Rename method, update argument and hook method into UI event
    public void onButtonPressed(Uri uri) {
        if (mListener != null) {
            mListener.onFragmentInteraction(uri);
        }
    }
    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
        if (context instanceof OnFragmentInteractionListener) {
            mListener = (OnFragmentInteractionListener) context;
        } else {
            //throw new RuntimeException(context.toString()
                 //   + " must implement OnFragmentInteractionListener");
        }
    }

    @Override
    public void onDetach() {
        super.onDetach();
        mListener = null;
    }

    /**
     * This interface must be implemented by activities that contain this
     * fragment to allow an interaction in this fragment to be communicated
     * to the activity and potentially other fragments contained in that
     * activity.
     * <p>
     * See the Android Training lesson <a href=
     * "http://developer.android.com/training/basics/fragments/communicating.html"
     * >Communicating with Other Fragments</a> for more information.
     */
    public interface OnFragmentInteractionListener {
        // TODO: Update argument type and name
        void onFragmentInteraction(Uri uri);
    }

    private  void getproperties(List<properties> p){

        mAdapter= new properties.SalesAdapter(p, getContext());
        mRecyclerView.setAdapter(mAdapter);

    }
    private  void expandablelist(List<properties> p){
        Log.i("prosss", "expandablelist: ");
System.out.println(new Gson().toJson(p));
        expandableListDetail = getData(p);
        expandableListTitle = new ArrayList<String>(expandableListDetail.keySet());
        expandableListAdapter = new CustomExpandableListAdapter(getContext(), expandableListTitle, expandableListDetail);
        propertylist.setAdapter(expandableListAdapter);
        propertylist.setOnGroupExpandListener(new ExpandableListView.OnGroupExpandListener() {

            @Override
            public void onGroupExpand(int groupPosition) {
//                Toast.makeText(getContext(),
//                        expandableListTitle.get(groupPosition) + " List Expanded.",
//                        Toast.LENGTH_SHORT).show();
            }
        });

        propertylist.setOnGroupCollapseListener(new ExpandableListView.OnGroupCollapseListener() {

            @Override
            public void onGroupCollapse(int groupPosition) {
//                Toast.makeText(getContext(),
//                        expandableListTitle.get(groupPosition) + " List Collapsed.",
//                        Toast.LENGTH_SHORT).show();

            }
        });

        propertylist.setOnChildClickListener(new ExpandableListView.OnChildClickListener() {
            @Override
            public boolean onChildClick(ExpandableListView parent, View v,
                                        int groupPosition, int childPosition, long id) {
//                Toast.makeText(
//                        getContext(),
//                        expandableListTitle.get(groupPosition)
//                                + " -> "
//                                + expandableListDetail.get(
//                                expandableListTitle.get(groupPosition)).get(
//                                childPosition), Toast.LENGTH_SHORT
//                ).show();
                return false;
            }
        });

    }
    public static HashMap<String, List<properties>> getData(List<properties> pro) {
        Log.i("data",new Gson().toJson(pro) );
        HashMap<String, List<properties>> expandableListDetail = new HashMap<String, List<properties>>();
        List<property_header> pg = new ArrayList<>();

        for (properties p :pro
             ) {

            String key  = p.Project_Name;
            if(expandableListDetail.containsKey(key)){
                List<properties> list = expandableListDetail.get(key);
                list.add(p);

            }else{
                List<properties> list = new ArrayList<properties>();
                list.add(p);
                expandableListDetail.put(key, list);
            }

//
//            for (property_header ph : pg
//            ) {
//                if (!ph.project_Code.contains(p.Project_Code)) {
//                    property_header phh = new property_header();
//                    phh.project_Code = p.Project_Code;
//                    phh.Project_Name = p.Project_Name;
//                    if (phh.properties==null)
//                        phh.properties = new ArrayList<>();
//                    phh.properties.add(p);
//                    pg.add(phh);
//
//                }
//                else
//                {
//                    ph.properties.add(p);
//pg.add(ph);
//                }
//            }}
//            for (property_header ppp:pg
//                 ) {
//                expandableListDetail.put(ppp,ppp.properties);
          }

System.out.println(new Gson().toJson(expandableListDetail));
        return expandableListDetail;
    }
    private class getproperties extends AsyncTask<Void, Void, List<properties>> {
        @Override
        protected List<properties> doInBackground(Void... agents) {
            List<properties> p = null;
            try {
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String result = JsonParser.postjson("properties", null, null);
                Type localType = new TypeToken<List<properties>>() {
                }.getType();
                Log.i("received",result);
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
                Log.i("Converted", new Gson().toJson(p.get(0).Property_Image));
            } catch (Exception e) {
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(List<properties> p) {

            propertiesList = p;
            originallist = p;
            if (propertiesList== null)
                Toast.makeText(getContext(), "No Properties found", Toast.LENGTH_LONG).show();
            else {

                //getproperties(propertiesList);
                expandablelist(propertiesList);
            }

        }

    }
    public class CustomExpandableListAdapter extends BaseExpandableListAdapter {

        private Context context;
        private List<String> expandableListTitle;
        private HashMap<String, List<properties>> expandableListDetail;

        public CustomExpandableListAdapter(Context context, List<String> expandableListTitle,
                                           HashMap<String, List<properties>> expandableListDetail) {
            this.context = context;
            this.expandableListTitle = expandableListTitle;
            this.expandableListDetail = expandableListDetail;
        }

        @Override
        public Object getChild(int listPosition, int expandedListPosition) {
            return this.expandableListDetail.get(this.expandableListTitle.get(listPosition))
                    .get(expandedListPosition);
        }

        @Override
        public long getChildId(int listPosition, int expandedListPosition) {
            return expandedListPosition;
        }

        @Override
        public View getChildView(int listPosition, final int expandedListPosition,
                                 boolean isLastChild, View convertView, ViewGroup parent) {
            final properties sales = (properties) getChild(listPosition, expandedListPosition);
            if (convertView == null) {
                LayoutInflater layoutInflater = (LayoutInflater) this.context
                        .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                convertView = layoutInflater.inflate(R.layout.propertylist, null);
            }
            TextView name;
            TextView desc;
            ProgressBar size;
            TextView price,progrespercent;
            Button book;
            name = convertView.findViewById(R.id.name);
            desc = convertView.findViewById(R.id.desc);
            size = convertView.findViewById(R.id.size);
            price = convertView.findViewById(R.id.price);
            progrespercent = convertView.findViewById(R.id.progrespercent);
            book = (Button) convertView.findViewById(R.id.book);

            //name.setText(sales.Description);
            desc.setText(sales.Description);
            desc.setJustificationMode(JUSTIFICATION_MODE_INTER_WORD);
            size.setMin(0);
            size.setMax(sales.Total_Plots);
            size.setProgress(sales.Available_Plots, true);
            float f;
            if (sales.Total_Plots == 0)
                f = 1;
            else
                f = (((float) sales.Available_Plots / (float) sales.Total_Plots)) ;

            NumberFormat format = NumberFormat.getPercentInstance(Locale.US);
            String percentage = format.format(f);
            progrespercent.setText(percentage);
            // holder.size.setText(String.valueOf(sales.get(position).Total_Plots));
//            try {
            if (sales.Sales_Setup_Lines != null)
                if (sales.Sales_Setup_Lines.size() > 0) {
                    com.trimline.investments.Sales_Setup_Prices s = null;
                    for (Sales_Setup_Prices ss : sales.Sales_Setup_Prices
                    ) {

                        if (ss.Member_Category.contentEquals(Investments.member.Member_Category)) {
                            s = ss;
                            break;
                        }
                    }
                    if (s != null)
                        price.setText(Html.fromHtml(
                                String.format("Cash Price:       KES.  <b>%,.2f</b><br/>Installment Price:        KES.  <b>%,.2f</b>", s.Cash_Price, s.Installment_Price)));


                }
            if ((sales.Total_Plots - sales.Available_Plots) == 0)
                book.setVisibility(View.GONE);
            book.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Intent intent = new Intent(context, propertydetails.class);
                    intent.putExtra("Propertyid", sales);

                    context.startActivity(intent);
                }
            });


            return convertView;
        }

        @Override
        public int getChildrenCount(int listPosition) {
            return this.expandableListDetail.get(this.expandableListTitle.get(listPosition))
                    .size();
        }

        @Override
        public Object getGroup(int listPosition) {
            return this.expandableListTitle.get(listPosition);
        }

        @Override
        public int getGroupCount() {
            return this.expandableListTitle.size();
        }

        @Override
        public long getGroupId(int listPosition) {
            return listPosition;
        }

        @Override
        public View getGroupView(int listPosition, boolean isExpanded,
                                 View convertView, ViewGroup parent) {
            String listTitle = (String) getGroup(listPosition);
            if (convertView == null) {
                LayoutInflater layoutInflater = (LayoutInflater) this.context.
                        getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                convertView = layoutInflater.inflate(R.layout.property_group, null);
            }
            TextView listTitleTextView = (TextView) convertView
                    .findViewById(R.id.propertgroup);
            listTitleTextView.setTypeface(null, Typeface.BOLD);
            listTitleTextView.setText(listTitle);
            return convertView;
        }

        @Override
        public boolean hasStableIds() {
            return false;
        }

        @Override
        public boolean isChildSelectable(int listPosition, int expandedListPosition) {
            return true;
        }
    }
}
