package com.example.agency;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;



import android.app.Activity;
import android.content.SharedPreferences;
import android.util.Log;

public class JsonParser {
	private static final String TAG = "HttpClient";
	static InputStream iStream = null;
	static String jarray = null;
	static String json = "";
	public static String WEBSERVICE_URL = "http://192.168.43.146:35051/Agency.asmx/";
	public static SharedPreferences preferences;
	/* Error */

	public static String postjson(Activity paramActivity,String Method,String json, String param ) {
		StringBuilder result = new StringBuilder();
		try {
			// String value = preferences.getString("IP", "");
			//URL url = new URL("Http://" + value + WEBSERVICE_URL + "/" + Method);
			//URL url = new URL("Http://192.168.8.100:806/Investment.asmx/" + Method);
			URL url = new URL("http://5.189.167.52:4007/Agency.asmx/" + Method);
			// URL url = new URL("Http://192.168.0.28:806/Investment.asmx/" + Method);
			//URL url = new URL("Http://192.168.1.104:806/Investment.asmx/" + Method);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			String urlParameters = param + "=" + json;
			connection.setInstanceFollowRedirects(true);
			connection.setRequestMethod("POST");
			connection.setRequestProperty("USER-AGENT", "Mozilla/5.0");
			connection.setRequestProperty("ACCEPT-LANGUAGE", "en-US,en;0.5");
			connection.setDoOutput(true);
			connection.setConnectTimeout(600000);
			connection.setReadTimeout(600000);

			DataOutputStream dStream = new DataOutputStream(connection.getOutputStream());
			dStream.writeBytes(urlParameters);
			dStream.flush();
			dStream.close();
			int responseCode = connection.getResponseCode();

			System.out.println("\nSending 'POST' request to URL : " + url);
			System.out.println("Post parameters : " + urlParameters);
			System.out.println("Response Group_No : " + responseCode);

			final StringBuilder output = new StringBuilder("Request URL " + url);
			output.append(System.getProperty("line.separator") + "Request Parameters " + urlParameters);
			output.append(System.getProperty("line.separator") + "Response Group_No " + responseCode);
			output.append(System.getProperty("line.separator") + "Type " + "POST");
			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line = "";
			StringBuilder responseOutput = new StringBuilder();
			System.out.println("output===============" + br);
			while ((line = br.readLine()) != null) {
				responseOutput.append(line);
			}
			br.close();
			output.append(System.getProperty("line.separator") + "Response " + System.getProperty("line.separator") + System.getProperty("line.separator") + responseOutput.toString());
			result = responseOutput;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				throw new Exception(e);
			} catch (Exception ex) {
			}
		} finally {

		}

		Log.i("data", result.toString());
		return result.toString();
	}


//	public static String postjson(Activity paramActivity,
//								  String MethodName, String myagent, String MethodParam) {
//		String value = preferences.getString("Endpoint", "");
//		//WEBSERVICE_URL = "http://"+value +":3000/Agency.asmx/";
//		WEBSERVICE_URL = "http://5.189.167.52:4000/Agency/Agency.asmx/";
//		Log.d("URL",  WEBSERVICE_URL + MethodName);Log.d("Data",  myagent);
//		// Creating HTTP client
//		HttpClient httpClient = new DefaultHttpClient();
//		// Creating HTTP Post
//		HttpPost httpPost = new HttpPost(
//				WEBSERVICE_URL + MethodName);
//		List<NameValuePair> nameValuePair = new ArrayList<NameValuePair>(2);
//		nameValuePair.add(new BasicNameValuePair(MethodParam, myagent));
//		try {
//			httpPost.setEntity(new UrlEncodedFormEntity(nameValuePair));
//		} catch (UnsupportedEncodingException e) {
//			// writing error to Log
//			e.printStackTrace();
//		}
//		// Making HTTP Request
//		try {
//			HttpResponse response = httpClient.execute(httpPost);
//			if (response.getStatusLine().getStatusCode() == 200)
//			{
//				HttpEntity entity = response.getEntity();
//				json = EntityUtils.toString(entity);
//			}
//			// writing response to log
//			Log.d("Http Response:", json);
//		} catch (ClientProtocolException e) {
//			// writing exception to log
//			e.printStackTrace();
//		} catch (IOException e) {
//			// writing exception to log
//			e.printStackTrace();
//		}
//		return json;
//	}
	private static String convertStreamToString(InputStream paramInputStream) {
		BufferedReader localBufferedReader = new BufferedReader(
				new InputStreamReader(paramInputStream));
		StringBuilder localStringBuilder = new StringBuilder();
		for (;;) {
			try {
				String str = localBufferedReader.readLine();
				if (str != null) {
					localStringBuilder.append(str + "\n");
					continue;
				}
			} catch (IOException localIOException) {
				localIOException = localIOException;
				localIOException.printStackTrace();
				try {
					paramInputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				continue;
			} finally {
			}
			try {
				paramInputStream.close();
				return localStringBuilder.toString();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		/*
		 * try { paramInputStream.close(); throw (""); } catch (IOException exc)
		 * { for (;;) { exc.printStackTrace(); }
		 */
	}

	
	//This method is to handle response
    private static String convertStreamToStrings(InputStream is) {
        /*
         * To convert the InputStream to String we use the BufferedReader.readLine()
         * method. We iterate until the BufferedReader return null which means
         * there's no more data to read. Each line will appended to a StringBuilder
         * and returned as String.
         */
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        StringBuilder sb = new StringBuilder();

        String line = null;
        try {
            while ((line = reader.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return sb.toString();
    }
	/* Error */
	public static String getJSONFromUrl(Activity paramActivity,
			String paramString) {
		String result = "";

		return result;
	}
}
