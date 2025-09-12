package com.trimline.paul.m_branch.jsonhandlers;

import android.util.Log;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

import java.lang.reflect.Type;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

public class UnparseableDateHandler implements JsonDeserializer<Date> {
    private final DateFormat dateFormat;

    public UnparseableDateHandler(String dateFormatPattern) {
        this.dateFormat = new SimpleDateFormat(dateFormatPattern);
    }

    @Override
    public Date deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
        String dateStr = json.getAsString();
        try {
            Log.i("Here","Here");
            return dateFormat.parse(dateStr);
        } catch (ParseException e) {
            // Handle unparseable date here
            // For example, return null or throw a custom exception

            return new Date();
        }
    }}