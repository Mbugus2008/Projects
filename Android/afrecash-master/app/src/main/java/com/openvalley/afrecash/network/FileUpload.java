package com.openvalley.afrecash.network;

import android.content.Context;
import android.os.Build;
import android.util.Log;

import com.openvalley.afrecash.listeners.ConnectionListener;
import com.openvalley.afrecash.utils.ResponseHandler;

import net.gotev.uploadservice.MultipartUploadRequest;
import net.gotev.uploadservice.ServerResponse;
import net.gotev.uploadservice.UploadInfo;
import net.gotev.uploadservice.UploadNotificationConfig;
import net.gotev.uploadservice.UploadStatusDelegate;

import java.util.Map;
import java.util.Set;
import java.util.UUID;

import static com.openvalley.afrecash.network.Connect.getDeviceModelName;


/**
 * Created by @GeekNat on 7/26/17.
 * All is possible
 */

public class FileUpload {

    private Context context;
    private ResponseHandler responseHandler;

    public FileUpload(Context context) {
        this.context = context;
        this.responseHandler = new ResponseHandler(context);
    }

    public void uploadFile(Context context, String filePath, final String request, Map<String, String> params, final ConnectionListener connectionListener) {
        //Uploading code
        params.put("app_id", "E0001");
        params.put("device_id", Build.ID + "-" + Build.SERIAL);
        params.put("device_name", getDeviceModelName());

        try {
            String uploadId = UUID.randomUUID().toString();

            MultipartUploadRequest multipartUploadRequest = new MultipartUploadRequest(context, uploadId, Connect.url + request);

            multipartUploadRequest.addFileToUpload(filePath, "file");

            Set<Map.Entry<String, String>> set = params.entrySet();
            for (Map.Entry<String, String> aSet : set) {
                multipartUploadRequest.addParameter(aSet.getKey(), aSet.getValue());
            }

            multipartUploadRequest.setNotificationConfig(new UploadNotificationConfig().setAutoClearOnSuccess(true).setAutoClearOnError(true));
            multipartUploadRequest.setMaxRetries(2);
            multipartUploadRequest.setDelegate(new UploadStatusDelegate() {
                @Override
                public void onProgress(Context context, UploadInfo uploadInfo) {
                    connectionListener.onStart();
                    // your code here
                    Log.d("HTTP_CALL", "Image Upload : Starting");
                }

                @Override
                public void onError(Context context, UploadInfo uploadInfo, Exception exception) {
                    // your code here
                    Log.d("HTTP_CALL", "Image Upload : " + exception.getMessage());
                    connectionListener.onComplete();
                    connectionListener.onError("An error occurred");
                }

                @Override
                public void onCompleted(Context context, UploadInfo uploadInfo, ServerResponse serverResponse) {
                    connectionListener.onComplete();
                    connectionListener.onSuccess(serverResponse.getBodyAsString());
                }

                @Override
                public void onCancelled(Context context, UploadInfo uploadInfo) {
                    // your code here
                    connectionListener.onComplete();
                    connectionListener.onError("Upload cancelled");
                }
            });
            multipartUploadRequest.startUpload();

        } catch (Exception exc) {
            Log.d("HTTP_CALL", "Image Upload : " + exc.getMessage());
        }
    }


}
