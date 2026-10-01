package com.facebook.stetho.json.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* JADX INFO: loaded from: classes.dex */
@Retention(RetentionPolicy.RUNTIME)
public @interface JsonProperty {
    boolean required() default false;
}
