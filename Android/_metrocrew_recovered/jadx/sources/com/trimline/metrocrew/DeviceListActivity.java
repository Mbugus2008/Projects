package com.trimline.metrocrew;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import java.util.Set;

/* JADX INFO: loaded from: classes5.dex */
public class DeviceListActivity extends Activity {
    public static String EXTRA_DEVICE_ADDRESS = "device_address";
    public static final int REQUEST_CONNECT_BT = 8960;
    private static final String TAG = "DeviceListActivity";
    String SP;
    private BluetoothAdapter mBtAdapter;
    private ArrayAdapter<String> mNewDevicesArrayAdapter;
    private AdapterView.OnItemClickListener mDeviceClickListener = new AdapterView.OnItemClickListener() { // from class: com.trimline.metrocrew.DeviceListActivity.3
        @Override // android.widget.AdapterView.OnItemClickListener
        public void onItemClick(AdapterView<?> av, View v, int arg2, long arg3) {
            DeviceListActivity.this.mBtAdapter.cancelDiscovery();
            String info = ((TextView) v).getText().toString();
            String address = info.substring(info.length() - 17);
            Intent intent = new Intent();
            intent.putExtra(DeviceListActivity.EXTRA_DEVICE_ADDRESS, address);
            intent.putExtra("SP", DeviceListActivity.this.SP);
            DeviceListActivity.this.setResult(-1, intent);
            DeviceListActivity.this.finish();
        }
    };
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() { // from class: com.trimline.metrocrew.DeviceListActivity.4
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if ("android.bluetooth.device.action.FOUND".equals(action)) {
                BluetoothDevice device = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                if (device.getBondState() != 12) {
                    DeviceListActivity.this.mNewDevicesArrayAdapter.add(device.getName() + "\n" + device.getAddress());
                    return;
                }
                return;
            }
            if ("android.bluetooth.adapter.action.DISCOVERY_FINISHED".equals(action)) {
                DeviceListActivity.this.setProgressBarIndeterminateVisibility(false);
                DeviceListActivity.this.setTitle(R.string.select_device);
                if (DeviceListActivity.this.mNewDevicesArrayAdapter.getCount() == 0) {
                    String noDevices = DeviceListActivity.this.getResources().getText(R.string.none_found).toString();
                    DeviceListActivity.this.mNewDevicesArrayAdapter.add(noDevices);
                }
            }
        }
    };

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(5);
        setContentView(R.layout.activity_device_list);
        Bundle bundle = getIntent().getExtras();
        this.SP = bundle.getString("SP");
        setResult(0);
        Button scanButton = (Button) findViewById(R.id.button_scan);
        scanButton.setOnClickListener(new View.OnClickListener() { // from class: com.trimline.metrocrew.DeviceListActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                DeviceListActivity.this.doDiscovery();
                v.setVisibility(8);
            }
        });
        ArrayAdapter<String> pairedDevicesArrayAdapter = new ArrayAdapter<>(this, R.layout.device_name);
        this.mNewDevicesArrayAdapter = new ArrayAdapter<>(this, R.layout.device_name);
        ListView pairedListView = (ListView) findViewById(R.id.paired_devices);
        pairedListView.setAdapter((ListAdapter) pairedDevicesArrayAdapter);
        pairedListView.setOnItemClickListener(this.mDeviceClickListener);
        pairedListView.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.trimline.metrocrew.DeviceListActivity.2
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                Toast.makeText(DeviceListActivity.this.getApplicationContext(), "Selected", 1).show();
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        ListView newDevicesListView = (ListView) findViewById(R.id.new_devices);
        newDevicesListView.setAdapter((ListAdapter) this.mNewDevicesArrayAdapter);
        newDevicesListView.setOnItemClickListener(this.mDeviceClickListener);
        IntentFilter filter = new IntentFilter("android.bluetooth.device.action.FOUND");
        registerReceiver(this.mReceiver, filter);
        IntentFilter filter2 = new IntentFilter("android.bluetooth.adapter.action.DISCOVERY_FINISHED");
        registerReceiver(this.mReceiver, filter2);
        this.mBtAdapter = BluetoothAdapter.getDefaultAdapter();
        Set<BluetoothDevice> pairedDevices = this.mBtAdapter.getBondedDevices();
        if (pairedDevices.size() > 0) {
            findViewById(R.id.title_paired_devices).setVisibility(0);
            for (BluetoothDevice device : pairedDevices) {
                pairedDevicesArrayAdapter.add(device.getName() + "\n" + device.getAddress());
            }
            return;
        }
        String noDevices = getResources().getText(R.string.none_paired).toString();
        pairedDevicesArrayAdapter.add(noDevices);
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        if (this.mBtAdapter != null) {
            this.mBtAdapter.cancelDiscovery();
        }
        unregisterReceiver(this.mReceiver);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doDiscovery() {
        Log.d(TAG, "doDiscovery()");
        setProgressBarIndeterminateVisibility(true);
        setTitle(R.string.scanning);
        findViewById(R.id.title_new_devices).setVisibility(0);
        if (this.mBtAdapter.isDiscovering()) {
            this.mBtAdapter.cancelDiscovery();
        }
        this.mBtAdapter.startDiscovery();
    }
}
