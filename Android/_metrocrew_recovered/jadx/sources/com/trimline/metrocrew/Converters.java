package com.trimline.metrocrew;

import java.sql.Date;
import java.sql.Time;

/* JADX INFO: loaded from: classes5.dex */
public class Converters {

    public static class DateConverter {
        public static Date toDate(Long dateLong) {
            if (dateLong == null) {
                return null;
            }
            return new Date(dateLong.longValue());
        }

        public static Long fromDate(Date date) {
            if (date == null) {
                return null;
            }
            return Long.valueOf(date.getTime());
        }
    }

    public static class TimeConverter {
        public static Time toTime(Long dateLong) {
            if (dateLong == null) {
                return null;
            }
            return new Time(dateLong.longValue());
        }

        public static Long fromTime(Time date) {
            if (date == null) {
                return null;
            }
            return Long.valueOf(date.getTime());
        }
    }

    public static theader.Stat toStatus(int status) {
        return theader.Stat.fromId(status);
    }

    public static Integer toInteger(theader.Stat status) {
        return Integer.valueOf(status.id());
    }
}
