package com.trimline.paul.m_branch.jsonhandlers;


import android.util.Log;

import com.google.gson.JsonElement;
import com.google.gson.JsonNull;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

import java.lang.reflect.Type;

public class Doublserializer implements JsonSerializer<Double> {
        @Override
        public JsonElement serialize(Double src, Type typeOfSrc, JsonSerializationContext context) {
            Log.i("doubles",src.toString());
           if (src == 0) {
                // Omit zero values
                return JsonNull.INSTANCE;
            } else {
                // Serialize non-zero values as doubles
                return new JsonPrimitive(src);
            }
        }
    }

