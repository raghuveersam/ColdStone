package com.example.chandra.coldstone;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

/**
 * Created by chandra on 2/9/2016.
 */
public class RequestParams {

    String base_url;
    String method;

    HashMap<String, String> params = new HashMap<String, String>();


    public void addParams(String key, String value) {
        params.put(key, value);
    }

    public RequestParams(String base_url, String method) {
        this.base_url = base_url;
        this.method = method;
    }

    public void setUrl(String function){
        StringBuilder sb = new StringBuilder();
        sb.append(EasyPayConstants.baseurl);
        sb.append("/");
        sb.append(function);
        this.base_url = sb.toString();
    }

    public String getEncodeParams() {


        StringBuilder sb = new StringBuilder();
        for (String key : params.keySet()) {
            try {
                String value = URLEncoder.encode(params.get(key), "UTF-8");

                if (sb.length() > 0) {
                    sb.append("&");
                }
                sb.append(key + "=" + value);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

        }
        return sb.toString();
    }




    public HttpURLConnection getConnection()throws IOException {

        URL url = new URL(this.base_url);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod(method);

        if(method.equals("GET")){
            return con;
        }
        if (method.equals("POST")) {
            con.setDoOutput(true);
            OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
            writer.write(getEncodeParams());
            writer.flush();
            return con;

        }
        return null;
    }
}
