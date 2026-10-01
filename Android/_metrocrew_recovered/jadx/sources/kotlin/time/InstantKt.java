package kotlin.time;

import java.io.IOException;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Typography;

/* JADX INFO: compiled from: Instant.kt */
/* JADX INFO: loaded from: classes7.dex */
@Metadata(d1 = {"\u0000@\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\t\n\u0002\b\u0005\n\u0002\u0010\r\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0010\u0001\n\u0002\b\f\n\u0002\u0010\u0015\n\u0002\b\u0006\u001a\u0010\u0010\r\u001a\u00020\u00022\u0006\u0010\u000e\u001a\u00020\u000fH\u0003\u001a\u0010\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0002H\u0003\u001a'\u0010\u0016\u001a\u00020\t2\u0006\u0010\u0017\u001a\u00020\t2\u0006\u0010\u0018\u001a\u00020\t2\f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u001b0\u001aH\u0082\b\u001a'\u0010\u001c\u001a\u00020\t2\u0006\u0010\u0017\u001a\u00020\t2\u0006\u0010\u0018\u001a\u00020\t2\f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u001b0\u001aH\u0082\b\u001a\u0010\u0010$\u001a\u00020\u00012\u0006\u0010%\u001a\u00020\u0014H\u0000\u001a\u0014\u0010&\u001a\u00020\u0014*\u00020\u00142\u0006\u0010$\u001a\u00020\u0001H\u0002\u001a\u0014\u0010,\u001a\u00020\u0011*\u00020\u000f2\u0006\u0010-\u001a\u00020\u0014H\u0002\"\u001f\u0010\u0000\u001a\u00020\u0001*\u00020\u00028Æ\u0002X\u0087\u0004¢\u0006\f\u0012\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0000\u0010\u0005\"\u001f\u0010\u0006\u001a\u00020\u0001*\u00020\u00028Æ\u0002X\u0087\u0004¢\u0006\f\u0012\u0004\b\u0007\u0010\u0004\u001a\u0004\b\u0006\u0010\u0005\"\u000e\u0010\b\u001a\u00020\tX\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\n\u001a\u00020\tX\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u000b\u001a\u00020\tX\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\f\u001a\u00020\tX\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0013\u001a\u00020\u0014X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0015\u001a\u00020\u0014X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u001d\u001a\u00020\u0014X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u001e\u001a\u00020\u0014X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u001f\u001a\u00020\u0014X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010 \u001a\u00020\u0014X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010!\u001a\u00020\u0014X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\"\u001a\u00020\u0014X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010#\u001a\u00020\u0014X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010'\u001a\u00020(X\u0082\u0004¢\u0006\u0002\n\u0000\"\u000e\u0010)\u001a\u00020(X\u0082\u0004¢\u0006\u0002\n\u0000\"\u000e\u0010*\u001a\u00020(X\u0082\u0004¢\u0006\u0002\n\u0000\"\u000e\u0010+\u001a\u00020(X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006."}, d2 = {"isDistantPast", "", "Lkotlin/time/Instant;", "isDistantPast$annotations", "(Lkotlin/time/Instant;)V", "(Lkotlin/time/Instant;)Z", "isDistantFuture", "isDistantFuture$annotations", "DISTANT_PAST_SECONDS", "", "DISTANT_FUTURE_SECONDS", "MIN_SECOND", "MAX_SECOND", "parseIso", "isoString", "", "formatIso", "", "instant", "DAYS_PER_CYCLE", "", "DAYS_0000_TO_1970", "safeAddOrElse", "a", "b", "action", "Lkotlin/Function0;", "", "safeMultiplyOrElse", "SECONDS_PER_HOUR", "SECONDS_PER_MINUTE", "HOURS_PER_DAY", "SECONDS_PER_DAY", "NANOS_PER_SECOND", "NANOS_PER_MILLI", "MILLIS_PER_SECOND", "isLeapYear", "year", "monthLength", "POWERS_OF_TEN", "", "asciiDigitPositionsInIsoStringAfterYear", "colonsInIsoOffsetString", "asciiDigitsInIsoOffsetString", "truncateForErrorMessage", "maxLength", "kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
public final class InstantKt {
    private static final int DAYS_0000_TO_1970 = 719528;
    private static final int DAYS_PER_CYCLE = 146097;
    private static final long DISTANT_FUTURE_SECONDS = 3093527980800L;
    private static final long DISTANT_PAST_SECONDS = -3217862419201L;
    private static final int HOURS_PER_DAY = 24;
    private static final long MAX_SECOND = 31556889864403199L;
    private static final int MILLIS_PER_SECOND = 1000;
    private static final long MIN_SECOND = -31557014167219200L;
    private static final int NANOS_PER_MILLI = 1000000;
    private static final int SECONDS_PER_DAY = 86400;
    private static final int SECONDS_PER_HOUR = 3600;
    private static final int SECONDS_PER_MINUTE = 60;
    public static final int NANOS_PER_SECOND = 1000000000;
    private static final int[] POWERS_OF_TEN = {1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, NANOS_PER_SECOND};
    private static final int[] asciiDigitPositionsInIsoStringAfterYear = {1, 2, 4, 5, 7, 8, 10, 11, 13, 14};
    private static final int[] colonsInIsoOffsetString = {3, 6};
    private static final int[] asciiDigitsInIsoOffsetString = {1, 2, 4, 5, 7, 8};

    public static /* synthetic */ void isDistantFuture$annotations(Instant instant) {
    }

    public static /* synthetic */ void isDistantPast$annotations(Instant instant) {
    }

    private static final boolean isDistantPast(Instant $this$isDistantPast) {
        Intrinsics.checkNotNullParameter($this$isDistantPast, "<this>");
        return $this$isDistantPast.compareTo(Instant.INSTANCE.getDISTANT_PAST()) <= 0;
    }

    private static final boolean isDistantFuture(Instant $this$isDistantFuture) {
        Intrinsics.checkNotNullParameter($this$isDistantFuture, "<this>");
        return $this$isDistantFuture.compareTo(Instant.INSTANCE.getDISTANT_FUTURE()) >= 0;
    }

    private static final Void parseIso$parseFailure(CharSequence $isoString, String error) {
        throw new InstantFormatException(error + " when parsing an Instant from \"" + truncateForErrorMessage($isoString, 64) + Typography.quote);
    }

    private static final void parseIso$expect(CharSequence $isoString, String what, int where, Function1<? super Character, Boolean> function1) {
        char c = $isoString.charAt(where);
        if (!function1.invoke(Character.valueOf(c)).booleanValue()) {
            parseIso$parseFailure($isoString, "Expected " + what + ", but got '" + c + "' at position " + where);
            throw new KotlinNothingValueException();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:103:0x0276  */
    /* JADX WARN: Code duplicated, block: B:106:0x0285  */
    /* JADX WARN: Code duplicated, block: B:108:0x028f  */
    /* JADX WARN: Code duplicated, block: B:111:0x0295 A[ADDED_TO_REGION] */
    /* JADX WARN: Code duplicated, block: B:114:0x029a A[LOOP:4: B:102:0x0274->B:114:0x029a, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:119:0x02dc  */
    /* JADX WARN: Code duplicated, block: B:120:0x02e3  */
    /* JADX WARN: Code duplicated, block: B:123:0x02e7  */
    /* JADX WARN: Code duplicated, block: B:124:0x02ee  */
    /* JADX WARN: Code duplicated, block: B:127:0x02f3 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:128:0x02f5  */
    /* JADX WARN: Code duplicated, block: B:130:0x02f9  */
    /* JADX WARN: Code duplicated, block: B:137:0x032e A[ADDED_TO_REGION, REMOVE] */
    /* JADX WARN: Code duplicated, block: B:140:0x033a  */
    /* JADX WARN: Code duplicated, block: B:141:0x033c  */
    /* JADX WARN: Code duplicated, block: B:148:0x0348  */
    /* JADX WARN: Code duplicated, block: B:150:0x034b  */
    /* JADX WARN: Code duplicated, block: B:155:0x035b  */
    /* JADX WARN: Code duplicated, block: B:157:0x035f  */
    /* JADX WARN: Code duplicated, block: B:159:0x0363  */
    /* JADX WARN: Code duplicated, block: B:161:0x0367 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:162:0x0369  */
    /* JADX WARN: Code duplicated, block: B:164:0x0381  */
    /* JADX WARN: Code duplicated, block: B:166:0x039e  */
    /* JADX WARN: Code duplicated, block: B:168:0x03ba  */
    /* JADX WARN: Code duplicated, block: B:170:0x03d6  */
    /* JADX WARN: Code duplicated, block: B:172:0x0409  */
    /* JADX WARN: Code duplicated, block: B:174:0x0425  */
    /* JADX WARN: Code duplicated, block: B:176:0x0445  */
    /* JADX WARN: Code duplicated, block: B:178:0x0465  */
    /* JADX WARN: Code duplicated, block: B:180:0x0497  */
    /* JADX WARN: Code duplicated, block: B:182:0x04d3  */
    /* JADX WARN: Code duplicated, block: B:184:0x04de  */
    /* JADX WARN: Code duplicated, block: B:186:0x04eb  */
    /* JADX WARN: Code duplicated, block: B:188:0x050d  */
    /* JADX WARN: Code duplicated, block: B:196:0x015c A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:197:0x023e A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:199:0x0270 A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:200:0x02a1 A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:202:0x02d3 A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:23:0x004c  */
    /* JADX WARN: Code duplicated, block: B:31:0x007e  */
    /* JADX WARN: Code duplicated, block: B:44:0x00a4  */
    /* JADX WARN: Code duplicated, block: B:45:0x00a6  */
    /* JADX WARN: Code duplicated, block: B:48:0x00b1  */
    /* JADX WARN: Code duplicated, block: B:50:0x00ed A[LOOP:1: B:49:0x00eb->B:50:0x00ed, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:53:0x012a  */
    /* JADX WARN: Code duplicated, block: B:56:0x0134  */
    /* JADX WARN: Code duplicated, block: B:61:0x0144  */
    /* JADX WARN: Code duplicated, block: B:63:0x0147 A[LOOP:2: B:54:0x012e->B:63:0x0147, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:67:0x0161  */
    /* JADX WARN: Code duplicated, block: B:70:0x0167  */
    /* JADX WARN: Code duplicated, block: B:72:0x016a  */
    /* JADX WARN: Code duplicated, block: B:73:0x0172  */
    /* JADX WARN: Code duplicated, block: B:75:0x0194  */
    /* JADX WARN: Code duplicated, block: B:78:0x01a0  */
    /* JADX WARN: Code duplicated, block: B:80:0x01a9  */
    /* JADX WARN: Code duplicated, block: B:82:0x01d9  */
    /* JADX WARN: Code duplicated, block: B:84:0x01e1  */
    /* JADX WARN: Code duplicated, block: B:85:0x01ea  */
    /* JADX WARN: Code duplicated, block: B:87:0x0208  */
    /* JADX WARN: Code duplicated, block: B:89:0x0212  */
    /* JADX WARN: Code duplicated, block: B:91:0x0216  */
    /* JADX WARN: Code duplicated, block: B:93:0x0220  */
    /* JADX WARN: Code duplicated, block: B:96:0x022f  */
    /* JADX WARN: Code duplicated, block: B:98:0x0239 A[LOOP:3: B:92:0x021e->B:98:0x0239, LOOP_END] */
    /* JADX WARN: Instruction removed from duplicated block: B:48:0x00b1, please report this as an issue */
    public static final Instant parseIso(CharSequence isoString) {
        int yearStrLength;
        int i;
        int year;
        int i2;
        int month;
        int day;
        int hour;
        int minute;
        int second;
        int i3;
        int nanosecond;
        char sign;
        int offsetStrLength;
        int[] iArr;
        int yearStart;
        int absYear;
        int[] iArr2;
        int length;
        int i4;
        int offsetHour;
        int offsetMinute;
        int offsetSecond;
        int i5;
        int nanosecond2;
        int j;
        int[] iArr3;
        int i6;
        char cCharAt;
        int j2;
        int i7;
        int i8;
        boolean z;
        boolean z2;
        int fraction;
        int fractionStrLength;
        boolean z3;
        char cCharAt2;
        char yearSign;
        boolean z4;
        int i9 = 0;
        if (!(isoString.length() > 0)) {
            throw new IllegalArgumentException("An empty string is not a valid Instant".toString());
        }
        char c = isoString.charAt(0);
        switch (c) {
            case '+':
            case '-':
                i9 = 0 + 1;
                break;
            case ',':
            default:
                c = ' ';
                break;
        }
        int yearStart2 = i9;
        int absYear2 = 0;
        while (i9 < isoString.length()) {
            char cCharAt3 = isoString.charAt(i9);
            if ('0' <= cCharAt3 && cCharAt3 < ':') {
                absYear2 = (absYear2 * 10) + (isoString.charAt(i9) - '0');
                i9++;
            } else {
                yearStrLength = i9 - yearStart2;
                if (yearStrLength <= 10) {
                    parseIso$parseFailure(isoString, "Expected at most 10 digits for the year number, got " + yearStrLength + " digits");
                    throw new KotlinNothingValueException();
                }
                if (yearStrLength != 10 && Intrinsics.compare((int) isoString.charAt(yearStart2), 50) >= 0) {
                    parseIso$parseFailure(isoString, "Expected at most 9 digits for the year number or year 1000000000, got " + yearStrLength + " digits");
                    throw new KotlinNothingValueException();
                }
                if (yearStrLength >= 4) {
                    parseIso$parseFailure(isoString, "The year number must be padded to 4 digits, got " + yearStrLength + " digits");
                    throw new KotlinNothingValueException();
                }
                if (c != '+' && yearStrLength == 4) {
                    parseIso$parseFailure(isoString, "The '+' sign at the start is only valid for year numbers longer than 4 digits");
                    throw new KotlinNothingValueException();
                }
                if (c != ' ' && yearStrLength != 4) {
                    parseIso$parseFailure(isoString, "A '+' or '-' sign is required for year numbers longer than 4 digits");
                    throw new KotlinNothingValueException();
                }
                if (c == '-') {
                    i = -absYear2;
                } else {
                    i = absYear2;
                }
                year = i;
                if (isoString.length() >= i9 + 16) {
                    parseIso$expect(isoString, "'-'", i9, new Function1() { // from class: kotlin.time.InstantKt$$ExternalSyntheticLambda0
                        @Override // kotlin.jvm.functions.Function1
                        public final Object invoke(Object obj) {
                            return Boolean.valueOf(InstantKt.parseIso$lambda$1(((Character) obj).charValue()));
                        }
                    });
                    parseIso$expect(isoString, "'-'", i9 + 3, new Function1() { // from class: kotlin.time.InstantKt$$ExternalSyntheticLambda1
                        @Override // kotlin.jvm.functions.Function1
                        public final Object invoke(Object obj) {
                            return Boolean.valueOf(InstantKt.parseIso$lambda$2(((Character) obj).charValue()));
                        }
                    });
                    parseIso$expect(isoString, "'T' or 't'", i9 + 6, new Function1() { // from class: kotlin.time.InstantKt$$ExternalSyntheticLambda2
                        @Override // kotlin.jvm.functions.Function1
                        public final Object invoke(Object obj) {
                            return Boolean.valueOf(InstantKt.parseIso$lambda$3(((Character) obj).charValue()));
                        }
                    });
                    parseIso$expect(isoString, "':'", i9 + 9, new Function1() { // from class: kotlin.time.InstantKt$$ExternalSyntheticLambda3
                        @Override // kotlin.jvm.functions.Function1
                        public final Object invoke(Object obj) {
                            return Boolean.valueOf(InstantKt.parseIso$lambda$4(((Character) obj).charValue()));
                        }
                    });
                    parseIso$expect(isoString, "':'", i9 + 12, new Function1() { // from class: kotlin.time.InstantKt$$ExternalSyntheticLambda4
                        @Override // kotlin.jvm.functions.Function1
                        public final Object invoke(Object obj) {
                            return Boolean.valueOf(InstantKt.parseIso$lambda$5(((Character) obj).charValue()));
                        }
                    });
                    for (int i10 : asciiDigitPositionsInIsoStringAfterYear) {
                        parseIso$expect(isoString, "an ASCII digit", i9 + i10, new Function1() { // from class: kotlin.time.InstantKt$$ExternalSyntheticLambda5
                            @Override // kotlin.jvm.functions.Function1
                            public final Object invoke(Object obj) {
                                return Boolean.valueOf(InstantKt.parseIso$lambda$6(((Character) obj).charValue()));
                            }
                        });
                    }
                    month = parseIso$twoDigitNumber(isoString, i9 + 1);
                    day = parseIso$twoDigitNumber(isoString, i9 + 4);
                    hour = parseIso$twoDigitNumber(isoString, i9 + 7);
                    minute = parseIso$twoDigitNumber(isoString, i9 + 10);
                    second = parseIso$twoDigitNumber(isoString, i9 + 13);
                    if (isoString.charAt(i9 + 15) == '.') {
                        int fractionStart = i9 + 16;
                        i3 = fractionStart;
                        fraction = 0;
                        while (i3 < isoString.length()) {
                            cCharAt2 = isoString.charAt(i3);
                            yearSign = c;
                            if ('0' <= cCharAt2 || cCharAt2 >= ':') {
                                z4 = false;
                            } else {
                                z4 = true;
                            }
                            if (z4) {
                                fraction = (fraction * 10) + (isoString.charAt(i3) - '0');
                                i3++;
                                c = yearSign;
                            } else {
                                fractionStrLength = i3 - fractionStart;
                                if (1 <= fractionStrLength || fractionStrLength >= 10) {
                                    z3 = false;
                                } else {
                                    z3 = true;
                                }
                                if (z3) {
                                    parseIso$parseFailure(isoString, "1..9 digits are supported for the fraction of the second, got " + fractionStrLength + " digits");
                                    throw new KotlinNothingValueException();
                                }
                                nanosecond = POWERS_OF_TEN[9 - fractionStrLength] * fraction;
                            }
                        }
                        fractionStrLength = i3 - fractionStart;
                        if (1 <= fractionStrLength) {
                            z3 = false;
                        } else {
                            z3 = false;
                        }
                        if (z3) {
                            parseIso$parseFailure(isoString, "1..9 digits are supported for the fraction of the second, got " + fractionStrLength + " digits");
                            throw new KotlinNothingValueException();
                        }
                        nanosecond = POWERS_OF_TEN[9 - fractionStrLength] * fraction;
                    } else {
                        i3 = i9 + 15;
                        nanosecond = 0;
                    }
                    if (i3 < isoString.length()) {
                        parseIso$parseFailure(isoString, "The UTC offset at the end of the string is missing");
                        throw new KotlinNothingValueException();
                    }
                    sign = isoString.charAt(i3);
                    switch (sign) {
                        case '+':
                        case '-':
                            offsetStrLength = isoString.length() - i3;
                            if (offsetStrLength <= 9) {
                                parseIso$parseFailure(isoString, "The UTC offset string \"" + truncateForErrorMessage(isoString.subSequence(i3, isoString.length()).toString(), 16) + "\" is too long");
                                throw new KotlinNothingValueException();
                            }
                            if (offsetStrLength % 3 == 0) {
                                parseIso$parseFailure(isoString, "Invalid UTC offset string \"" + isoString.subSequence(i3, isoString.length()).toString() + Typography.quote);
                                throw new KotlinNothingValueException();
                            }
                            iArr = colonsInIsoOffsetString;
                            yearStart = iArr.length;
                            absYear = 0;
                            while (absYear < yearStart) {
                                j2 = iArr[absYear];
                                i7 = yearStart;
                                i8 = absYear;
                                if (i3 + j2 >= isoString.length()) {
                                    if (isoString.charAt(i3 + j2) == ':') {
                                        parseIso$parseFailure(isoString, "Expected ':' at index " + (i3 + j2) + ", got '" + isoString.charAt(i3 + j2) + '\'');
                                        throw new KotlinNothingValueException();
                                    }
                                    absYear = i8 + 1;
                                    yearStart = i7;
                                } else {
                                    iArr2 = asciiDigitsInIsoOffsetString;
                                    length = iArr2.length;
                                    i4 = 0;
                                    while (i4 < length) {
                                        j = iArr2[i4];
                                        iArr3 = iArr2;
                                        i6 = length;
                                        if (i3 + j >= isoString.length()) {
                                            cCharAt = isoString.charAt(i3 + j);
                                            if ('0' > cCharAt && cCharAt < ':') {
                                                parseIso$parseFailure(isoString, "Expected an ASCII digit at index " + (i3 + j) + ", got '" + isoString.charAt(i3 + j) + '\'');
                                                throw new KotlinNothingValueException();
                                            }
                                            i4++;
                                            iArr2 = iArr3;
                                            length = i6;
                                        } else {
                                            offsetHour = parseIso$twoDigitNumber(isoString, i3 + 1);
                                            if (offsetStrLength > 3) {
                                                offsetMinute = parseIso$twoDigitNumber(isoString, i3 + 4);
                                            } else {
                                                offsetMinute = 0;
                                            }
                                            if (offsetStrLength > 6) {
                                                offsetSecond = parseIso$twoDigitNumber(isoString, i3 + 7);
                                            } else {
                                                offsetSecond = 0;
                                            }
                                            if (offsetMinute <= 59) {
                                                parseIso$parseFailure(isoString, "Expected offset-minute-of-hour in 0..59, got " + offsetMinute);
                                                throw new KotlinNothingValueException();
                                            }
                                            if (offsetSecond <= 59) {
                                                parseIso$parseFailure(isoString, "Expected offset-second-of-minute in 0..59, got " + offsetSecond);
                                                throw new KotlinNothingValueException();
                                            }
                                            if (offsetHour <= 17 && (offsetHour != 18 || offsetMinute != 0 || offsetSecond != 0)) {
                                                parseIso$parseFailure(isoString, "Expected an offset in -18:00..+18:00, got " + isoString.subSequence(i3, isoString.length()).toString());
                                                throw new KotlinNothingValueException();
                                            }
                                            int nanosecond3 = offsetHour * SECONDS_PER_HOUR;
                                            int i11 = nanosecond3 + (offsetMinute * 60) + offsetSecond;
                                            if (sign == '-') {
                                                i5 = -1;
                                            } else {
                                                i5 = 1;
                                            }
                                            nanosecond2 = i11 * i5;
                                        }
                                        break;
                                    }
                                    offsetHour = parseIso$twoDigitNumber(isoString, i3 + 1);
                                    if (offsetStrLength > 3) {
                                        offsetMinute = parseIso$twoDigitNumber(isoString, i3 + 4);
                                    } else {
                                        offsetMinute = 0;
                                    }
                                    if (offsetStrLength > 6) {
                                        offsetSecond = parseIso$twoDigitNumber(isoString, i3 + 7);
                                    } else {
                                        offsetSecond = 0;
                                    }
                                    if (offsetMinute <= 59) {
                                        parseIso$parseFailure(isoString, "Expected offset-minute-of-hour in 0..59, got " + offsetMinute);
                                        throw new KotlinNothingValueException();
                                    }
                                    if (offsetSecond <= 59) {
                                        parseIso$parseFailure(isoString, "Expected offset-second-of-minute in 0..59, got " + offsetSecond);
                                        throw new KotlinNothingValueException();
                                    }
                                    if (offsetHour <= 17) {
                                    }
                                    int nanosecond4 = offsetHour * SECONDS_PER_HOUR;
                                    int i12 = nanosecond4 + (offsetMinute * 60) + offsetSecond;
                                    if (sign == '-') {
                                        i5 = -1;
                                    } else {
                                        i5 = 1;
                                    }
                                    nanosecond2 = i12 * i5;
                                }
                                break;
                            }
                            iArr2 = asciiDigitsInIsoOffsetString;
                            length = iArr2.length;
                            i4 = 0;
                            while (i4 < length) {
                                j = iArr2[i4];
                                iArr3 = iArr2;
                                i6 = length;
                                if (i3 + j >= isoString.length()) {
                                    cCharAt = isoString.charAt(i3 + j);
                                    if ('0' > cCharAt && cCharAt < ':') {
                                        parseIso$parseFailure(isoString, "Expected an ASCII digit at index " + (i3 + j) + ", got '" + isoString.charAt(i3 + j) + '\'');
                                        throw new KotlinNothingValueException();
                                    }
                                    i4++;
                                    iArr2 = iArr3;
                                    length = i6;
                                } else {
                                    offsetHour = parseIso$twoDigitNumber(isoString, i3 + 1);
                                    if (offsetStrLength > 3) {
                                        offsetMinute = parseIso$twoDigitNumber(isoString, i3 + 4);
                                    } else {
                                        offsetMinute = 0;
                                    }
                                    if (offsetStrLength > 6) {
                                        offsetSecond = parseIso$twoDigitNumber(isoString, i3 + 7);
                                    } else {
                                        offsetSecond = 0;
                                    }
                                    if (offsetMinute <= 59) {
                                        parseIso$parseFailure(isoString, "Expected offset-minute-of-hour in 0..59, got " + offsetMinute);
                                        throw new KotlinNothingValueException();
                                    }
                                    if (offsetSecond <= 59) {
                                        parseIso$parseFailure(isoString, "Expected offset-second-of-minute in 0..59, got " + offsetSecond);
                                        throw new KotlinNothingValueException();
                                    }
                                    if (offsetHour <= 17) {
                                    }
                                    int nanosecond5 = offsetHour * SECONDS_PER_HOUR;
                                    int i13 = nanosecond5 + (offsetMinute * 60) + offsetSecond;
                                    if (sign == '-') {
                                        i5 = -1;
                                    } else {
                                        i5 = 1;
                                    }
                                    nanosecond2 = i13 * i5;
                                }
                                break;
                            }
                            offsetHour = parseIso$twoDigitNumber(isoString, i3 + 1);
                            if (offsetStrLength > 3) {
                                offsetMinute = parseIso$twoDigitNumber(isoString, i3 + 4);
                            } else {
                                offsetMinute = 0;
                            }
                            if (offsetStrLength > 6) {
                                offsetSecond = parseIso$twoDigitNumber(isoString, i3 + 7);
                            } else {
                                offsetSecond = 0;
                            }
                            if (offsetMinute <= 59) {
                                parseIso$parseFailure(isoString, "Expected offset-minute-of-hour in 0..59, got " + offsetMinute);
                                throw new KotlinNothingValueException();
                            }
                            if (offsetSecond <= 59) {
                                parseIso$parseFailure(isoString, "Expected offset-second-of-minute in 0..59, got " + offsetSecond);
                                throw new KotlinNothingValueException();
                            }
                            if (offsetHour <= 17) {
                            }
                            int nanosecond6 = offsetHour * SECONDS_PER_HOUR;
                            int i14 = nanosecond6 + (offsetMinute * 60) + offsetSecond;
                            if (sign == '-') {
                                i5 = -1;
                            } else {
                                i5 = 1;
                            }
                            nanosecond2 = i14 * i5;
                            break;
                            break;
                        case 'Z':
                        case 'z':
                            if (isoString.length() == i3 + 1) {
                                parseIso$parseFailure(isoString, "Extra text after the instant at position " + (i3 + 1));
                                throw new KotlinNothingValueException();
                            }
                            nanosecond = nanosecond;
                            nanosecond2 = 0;
                            break;
                            break;
                        default:
                            parseIso$parseFailure(isoString, "Expected the UTC offset at position " + i3 + ", got '" + sign + '\'');
                            throw new KotlinNothingValueException();
                    }
                    if (1 <= month || month >= 13) {
                        z = false;
                    } else {
                        z = true;
                    }
                    if (z) {
                        parseIso$parseFailure(isoString, "Expected a month number in 1..12, got " + month);
                        throw new KotlinNothingValueException();
                    }
                    if (1 <= day || day > monthLength(month, isLeapYear(year))) {
                        z2 = false;
                    } else {
                        z2 = true;
                    }
                    if (z2) {
                        parseIso$parseFailure(isoString, "Expected a valid day-of-month for month " + month + " of year " + year + ", got " + day);
                        throw new KotlinNothingValueException();
                    }
                    if (hour <= 23) {
                        parseIso$parseFailure(isoString, "Expected hour in 0..23, got " + hour);
                        throw new KotlinNothingValueException();
                    }
                    if (minute <= 59) {
                        parseIso$parseFailure(isoString, "Expected minute-of-hour in 0..59, got " + minute);
                        throw new KotlinNothingValueException();
                    }
                    if (second <= 59) {
                        parseIso$parseFailure(isoString, "Expected second-of-minute in 0..59, got " + second);
                        throw new KotlinNothingValueException();
                    }
                    return new UnboundLocalDateTime(year, month, day, hour, minute, second, nanosecond).toInstant(nanosecond2);
                }
                parseIso$parseFailure(isoString, "The input string is too short");
                throw new KotlinNothingValueException();
            }
        }
        yearStrLength = i9 - yearStart2;
        if (yearStrLength <= 10) {
            parseIso$parseFailure(isoString, "Expected at most 10 digits for the year number, got " + yearStrLength + " digits");
            throw new KotlinNothingValueException();
        }
        if (yearStrLength != 10) {
        }
        if (yearStrLength >= 4) {
            parseIso$parseFailure(isoString, "The year number must be padded to 4 digits, got " + yearStrLength + " digits");
            throw new KotlinNothingValueException();
        }
        if (c != '+') {
        }
        if (c != ' ') {
        }
        if (c == '-') {
            i = -absYear2;
        } else {
            i = absYear2;
        }
        year = i;
        if (isoString.length() >= i9 + 16) {
            parseIso$expect(isoString, "'-'", i9, new Function1() { // from class: kotlin.time.InstantKt$$ExternalSyntheticLambda0
                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    return Boolean.valueOf(InstantKt.parseIso$lambda$1(((Character) obj).charValue()));
                }
            });
            parseIso$expect(isoString, "'-'", i9 + 3, new Function1() { // from class: kotlin.time.InstantKt$$ExternalSyntheticLambda1
                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    return Boolean.valueOf(InstantKt.parseIso$lambda$2(((Character) obj).charValue()));
                }
            });
            parseIso$expect(isoString, "'T' or 't'", i9 + 6, new Function1() { // from class: kotlin.time.InstantKt$$ExternalSyntheticLambda2
                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    return Boolean.valueOf(InstantKt.parseIso$lambda$3(((Character) obj).charValue()));
                }
            });
            parseIso$expect(isoString, "':'", i9 + 9, new Function1() { // from class: kotlin.time.InstantKt$$ExternalSyntheticLambda3
                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    return Boolean.valueOf(InstantKt.parseIso$lambda$4(((Character) obj).charValue()));
                }
            });
            parseIso$expect(isoString, "':'", i9 + 12, new Function1() { // from class: kotlin.time.InstantKt$$ExternalSyntheticLambda4
                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    return Boolean.valueOf(InstantKt.parseIso$lambda$5(((Character) obj).charValue()));
                }
            });
            while (i2 < r14) {
                parseIso$expect(isoString, "an ASCII digit", i9 + i10, new Function1() { // from class: kotlin.time.InstantKt$$ExternalSyntheticLambda5
                    @Override // kotlin.jvm.functions.Function1
                    public final Object invoke(Object obj) {
                        return Boolean.valueOf(InstantKt.parseIso$lambda$6(((Character) obj).charValue()));
                    }
                });
            }
            month = parseIso$twoDigitNumber(isoString, i9 + 1);
            day = parseIso$twoDigitNumber(isoString, i9 + 4);
            hour = parseIso$twoDigitNumber(isoString, i9 + 7);
            minute = parseIso$twoDigitNumber(isoString, i9 + 10);
            second = parseIso$twoDigitNumber(isoString, i9 + 13);
            if (isoString.charAt(i9 + 15) == '.') {
                int fractionStart2 = i9 + 16;
                i3 = fractionStart2;
                fraction = 0;
                while (i3 < isoString.length()) {
                    cCharAt2 = isoString.charAt(i3);
                    yearSign = c;
                    if ('0' <= cCharAt2) {
                        z4 = false;
                    } else {
                        z4 = false;
                    }
                    if (z4) {
                        fraction = (fraction * 10) + (isoString.charAt(i3) - '0');
                        i3++;
                        c = yearSign;
                    } else {
                        fractionStrLength = i3 - fractionStart2;
                        if (1 <= fractionStrLength) {
                            z3 = false;
                        } else {
                            z3 = false;
                        }
                        if (z3) {
                            parseIso$parseFailure(isoString, "1..9 digits are supported for the fraction of the second, got " + fractionStrLength + " digits");
                            throw new KotlinNothingValueException();
                        }
                        nanosecond = POWERS_OF_TEN[9 - fractionStrLength] * fraction;
                    }
                }
                fractionStrLength = i3 - fractionStart2;
                if (1 <= fractionStrLength) {
                    z3 = false;
                } else {
                    z3 = false;
                }
                if (z3) {
                    parseIso$parseFailure(isoString, "1..9 digits are supported for the fraction of the second, got " + fractionStrLength + " digits");
                    throw new KotlinNothingValueException();
                }
                nanosecond = POWERS_OF_TEN[9 - fractionStrLength] * fraction;
            } else {
                i3 = i9 + 15;
                nanosecond = 0;
            }
            if (i3 < isoString.length()) {
                parseIso$parseFailure(isoString, "The UTC offset at the end of the string is missing");
                throw new KotlinNothingValueException();
            }
            sign = isoString.charAt(i3);
            switch (sign) {
                case '+':
                case '-':
                    offsetStrLength = isoString.length() - i3;
                    if (offsetStrLength <= 9) {
                        parseIso$parseFailure(isoString, "The UTC offset string \"" + truncateForErrorMessage(isoString.subSequence(i3, isoString.length()).toString(), 16) + "\" is too long");
                        throw new KotlinNothingValueException();
                    }
                    if (offsetStrLength % 3 == 0) {
                        parseIso$parseFailure(isoString, "Invalid UTC offset string \"" + isoString.subSequence(i3, isoString.length()).toString() + Typography.quote);
                        throw new KotlinNothingValueException();
                    }
                    iArr = colonsInIsoOffsetString;
                    yearStart = iArr.length;
                    absYear = 0;
                    while (absYear < yearStart) {
                        j2 = iArr[absYear];
                        i7 = yearStart;
                        i8 = absYear;
                        if (i3 + j2 >= isoString.length()) {
                            if (isoString.charAt(i3 + j2) == ':') {
                                parseIso$parseFailure(isoString, "Expected ':' at index " + (i3 + j2) + ", got '" + isoString.charAt(i3 + j2) + '\'');
                                throw new KotlinNothingValueException();
                            }
                            absYear = i8 + 1;
                            yearStart = i7;
                        } else {
                            iArr2 = asciiDigitsInIsoOffsetString;
                            length = iArr2.length;
                            i4 = 0;
                            while (i4 < length) {
                                j = iArr2[i4];
                                iArr3 = iArr2;
                                i6 = length;
                                if (i3 + j >= isoString.length()) {
                                    cCharAt = isoString.charAt(i3 + j);
                                    if ('0' > cCharAt) {
                                        break;
                                    }
                                    if ('0' > cCharAt && cCharAt < ':') {
                                        parseIso$parseFailure(isoString, "Expected an ASCII digit at index " + (i3 + j) + ", got '" + isoString.charAt(i3 + j) + '\'');
                                        throw new KotlinNothingValueException();
                                    }
                                    i4++;
                                    iArr2 = iArr3;
                                    length = i6;
                                } else {
                                    offsetHour = parseIso$twoDigitNumber(isoString, i3 + 1);
                                    if (offsetStrLength > 3) {
                                        offsetMinute = parseIso$twoDigitNumber(isoString, i3 + 4);
                                    } else {
                                        offsetMinute = 0;
                                    }
                                    if (offsetStrLength > 6) {
                                        offsetSecond = parseIso$twoDigitNumber(isoString, i3 + 7);
                                    } else {
                                        offsetSecond = 0;
                                    }
                                    if (offsetMinute <= 59) {
                                        parseIso$parseFailure(isoString, "Expected offset-minute-of-hour in 0..59, got " + offsetMinute);
                                        throw new KotlinNothingValueException();
                                    }
                                    if (offsetSecond <= 59) {
                                        parseIso$parseFailure(isoString, "Expected offset-second-of-minute in 0..59, got " + offsetSecond);
                                        throw new KotlinNothingValueException();
                                    }
                                    if (offsetHour <= 17) {
                                    }
                                    int nanosecond7 = offsetHour * SECONDS_PER_HOUR;
                                    int i15 = nanosecond7 + (offsetMinute * 60) + offsetSecond;
                                    if (sign == '-') {
                                        i5 = -1;
                                    } else {
                                        i5 = 1;
                                    }
                                    nanosecond2 = i15 * i5;
                                }
                                break;
                            }
                            offsetHour = parseIso$twoDigitNumber(isoString, i3 + 1);
                            if (offsetStrLength > 3) {
                                offsetMinute = parseIso$twoDigitNumber(isoString, i3 + 4);
                            } else {
                                offsetMinute = 0;
                            }
                            if (offsetStrLength > 6) {
                                offsetSecond = parseIso$twoDigitNumber(isoString, i3 + 7);
                            } else {
                                offsetSecond = 0;
                            }
                            if (offsetMinute <= 59) {
                                parseIso$parseFailure(isoString, "Expected offset-minute-of-hour in 0..59, got " + offsetMinute);
                                throw new KotlinNothingValueException();
                            }
                            if (offsetSecond <= 59) {
                                parseIso$parseFailure(isoString, "Expected offset-second-of-minute in 0..59, got " + offsetSecond);
                                throw new KotlinNothingValueException();
                            }
                            if (offsetHour <= 17) {
                            }
                            int nanosecond8 = offsetHour * SECONDS_PER_HOUR;
                            int i16 = nanosecond8 + (offsetMinute * 60) + offsetSecond;
                            if (sign == '-') {
                                i5 = -1;
                            } else {
                                i5 = 1;
                            }
                            nanosecond2 = i16 * i5;
                        }
                        break;
                    }
                    iArr2 = asciiDigitsInIsoOffsetString;
                    length = iArr2.length;
                    i4 = 0;
                    while (i4 < length) {
                        j = iArr2[i4];
                        iArr3 = iArr2;
                        i6 = length;
                        if (i3 + j >= isoString.length()) {
                            cCharAt = isoString.charAt(i3 + j);
                            if ('0' > cCharAt) {
                                break;
                            }
                            if ('0' > cCharAt && cCharAt < ':') {
                                parseIso$parseFailure(isoString, "Expected an ASCII digit at index " + (i3 + j) + ", got '" + isoString.charAt(i3 + j) + '\'');
                                throw new KotlinNothingValueException();
                            }
                            i4++;
                            iArr2 = iArr3;
                            length = i6;
                        } else {
                            offsetHour = parseIso$twoDigitNumber(isoString, i3 + 1);
                            if (offsetStrLength > 3) {
                                offsetMinute = parseIso$twoDigitNumber(isoString, i3 + 4);
                            } else {
                                offsetMinute = 0;
                            }
                            if (offsetStrLength > 6) {
                                offsetSecond = parseIso$twoDigitNumber(isoString, i3 + 7);
                            } else {
                                offsetSecond = 0;
                            }
                            if (offsetMinute <= 59) {
                                parseIso$parseFailure(isoString, "Expected offset-minute-of-hour in 0..59, got " + offsetMinute);
                                throw new KotlinNothingValueException();
                            }
                            if (offsetSecond <= 59) {
                                parseIso$parseFailure(isoString, "Expected offset-second-of-minute in 0..59, got " + offsetSecond);
                                throw new KotlinNothingValueException();
                            }
                            if (offsetHour <= 17) {
                            }
                            int nanosecond9 = offsetHour * SECONDS_PER_HOUR;
                            int i17 = nanosecond9 + (offsetMinute * 60) + offsetSecond;
                            if (sign == '-') {
                                i5 = -1;
                            } else {
                                i5 = 1;
                            }
                            nanosecond2 = i17 * i5;
                        }
                        break;
                    }
                    offsetHour = parseIso$twoDigitNumber(isoString, i3 + 1);
                    if (offsetStrLength > 3) {
                        offsetMinute = parseIso$twoDigitNumber(isoString, i3 + 4);
                    } else {
                        offsetMinute = 0;
                    }
                    if (offsetStrLength > 6) {
                        offsetSecond = parseIso$twoDigitNumber(isoString, i3 + 7);
                    } else {
                        offsetSecond = 0;
                    }
                    if (offsetMinute <= 59) {
                        parseIso$parseFailure(isoString, "Expected offset-minute-of-hour in 0..59, got " + offsetMinute);
                        throw new KotlinNothingValueException();
                    }
                    if (offsetSecond <= 59) {
                        parseIso$parseFailure(isoString, "Expected offset-second-of-minute in 0..59, got " + offsetSecond);
                        throw new KotlinNothingValueException();
                    }
                    if (offsetHour <= 17) {
                    }
                    int nanosecond10 = offsetHour * SECONDS_PER_HOUR;
                    int i18 = nanosecond10 + (offsetMinute * 60) + offsetSecond;
                    if (sign == '-') {
                        i5 = -1;
                    } else {
                        i5 = 1;
                    }
                    nanosecond2 = i18 * i5;
                    break;
                    break;
                case 'Z':
                case 'z':
                    if (isoString.length() == i3 + 1) {
                        parseIso$parseFailure(isoString, "Extra text after the instant at position " + (i3 + 1));
                        throw new KotlinNothingValueException();
                    }
                    nanosecond = nanosecond;
                    nanosecond2 = 0;
                    break;
                    break;
                default:
                    parseIso$parseFailure(isoString, "Expected the UTC offset at position " + i3 + ", got '" + sign + '\'');
                    throw new KotlinNothingValueException();
            }
            if (1 <= month) {
                z = false;
            } else {
                z = false;
            }
            if (z) {
                parseIso$parseFailure(isoString, "Expected a month number in 1..12, got " + month);
                throw new KotlinNothingValueException();
            }
            if (1 <= day) {
                z2 = false;
            } else {
                z2 = false;
            }
            if (z2) {
                parseIso$parseFailure(isoString, "Expected a valid day-of-month for month " + month + " of year " + year + ", got " + day);
                throw new KotlinNothingValueException();
            }
            if (hour <= 23) {
                parseIso$parseFailure(isoString, "Expected hour in 0..23, got " + hour);
                throw new KotlinNothingValueException();
            }
            if (minute <= 59) {
                parseIso$parseFailure(isoString, "Expected minute-of-hour in 0..59, got " + minute);
                throw new KotlinNothingValueException();
            }
            if (second <= 59) {
                parseIso$parseFailure(isoString, "Expected second-of-minute in 0..59, got " + second);
                throw new KotlinNothingValueException();
            }
            return new UnboundLocalDateTime(year, month, day, hour, minute, second, nanosecond).toInstant(nanosecond2);
        }
        parseIso$parseFailure(isoString, "The input string is too short");
        throw new KotlinNothingValueException();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean parseIso$lambda$1(char it) {
        return it == '-';
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean parseIso$lambda$2(char it) {
        return it == '-';
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean parseIso$lambda$3(char it) {
        return it == 'T' || it == 't';
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean parseIso$lambda$4(char it) {
        return it == ':';
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean parseIso$lambda$5(char it) {
        return it == ':';
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean parseIso$lambda$6(char it) {
        return '0' <= it && it < ':';
    }

    private static final int parseIso$twoDigitNumber(CharSequence s, int index) {
        return ((s.charAt(index) - '0') * 10) + (s.charAt(index + 1) - '0');
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String formatIso(Instant instant) throws IOException {
        StringBuilder $this$formatIso_u24lambda_u248 = new StringBuilder();
        UnboundLocalDateTime ldt = UnboundLocalDateTime.INSTANCE.fromInstant(instant);
        int number = ldt.getYear();
        if (Math.abs(number) < 1000) {
            StringBuilder innerBuilder = new StringBuilder();
            if (number >= 0) {
                Intrinsics.checkNotNullExpressionValue(innerBuilder.append(number + 10000).deleteCharAt(0), "deleteCharAt(...)");
            } else {
                Intrinsics.checkNotNullExpressionValue(innerBuilder.append(number - 10000).deleteCharAt(1), "deleteCharAt(...)");
            }
            $this$formatIso_u24lambda_u248.append((CharSequence) innerBuilder);
        } else {
            if (number >= 10000) {
                $this$formatIso_u24lambda_u248.append('+');
            }
            $this$formatIso_u24lambda_u248.append(number);
        }
        $this$formatIso_u24lambda_u248.append('-');
        formatIso$lambda$8$appendTwoDigits($this$formatIso_u24lambda_u248, $this$formatIso_u24lambda_u248, ldt.getMonth());
        $this$formatIso_u24lambda_u248.append('-');
        formatIso$lambda$8$appendTwoDigits($this$formatIso_u24lambda_u248, $this$formatIso_u24lambda_u248, ldt.getDay());
        $this$formatIso_u24lambda_u248.append('T');
        formatIso$lambda$8$appendTwoDigits($this$formatIso_u24lambda_u248, $this$formatIso_u24lambda_u248, ldt.getHour());
        $this$formatIso_u24lambda_u248.append(':');
        formatIso$lambda$8$appendTwoDigits($this$formatIso_u24lambda_u248, $this$formatIso_u24lambda_u248, ldt.getMinute());
        $this$formatIso_u24lambda_u248.append(':');
        formatIso$lambda$8$appendTwoDigits($this$formatIso_u24lambda_u248, $this$formatIso_u24lambda_u248, ldt.getSecond());
        if (ldt.getNanosecond() != 0) {
            $this$formatIso_u24lambda_u248.append('.');
            int zerosToStrip = 0;
            while (ldt.getNanosecond() % POWERS_OF_TEN[zerosToStrip + 1] == 0) {
                zerosToStrip++;
            }
            int zerosToStrip2 = zerosToStrip - (zerosToStrip % 3);
            int numberToOutput = ldt.getNanosecond() / POWERS_OF_TEN[zerosToStrip2];
            String strValueOf = String.valueOf(POWERS_OF_TEN[9 - zerosToStrip2] + numberToOutput);
            Intrinsics.checkNotNull(strValueOf, "null cannot be cast to non-null type java.lang.String");
            String strSubstring = strValueOf.substring(1);
            Intrinsics.checkNotNullExpressionValue(strSubstring, "substring(...)");
            $this$formatIso_u24lambda_u248.append(strSubstring);
        }
        $this$formatIso_u24lambda_u248.append('Z');
        return $this$formatIso_u24lambda_u248.toString();
    }

    private static final void formatIso$lambda$8$appendTwoDigits(Appendable $this$formatIso_u24lambda_u248_u24appendTwoDigits, StringBuilder $this_buildString, int number) throws IOException {
        if (number < 10) {
            $this$formatIso_u24lambda_u248_u24appendTwoDigits.append('0');
        }
        $this_buildString.append(number);
    }

    private static final long safeAddOrElse(long a, long b, Function0 action) {
        long sum = a + b;
        if ((a ^ sum) < 0 && (a ^ b) >= 0) {
            action.invoke();
            throw new KotlinNothingValueException();
        }
        return sum;
    }

    private static final long safeMultiplyOrElse(long a, long b, Function0 action) {
        if (b == 1) {
            return a;
        }
        if (a == 1) {
            return b;
        }
        if (a == 0 || b == 0) {
            return 0L;
        }
        long total = a * b;
        if (total / b != a || ((a == Long.MIN_VALUE && b == -1) || (b == Long.MIN_VALUE && a == -1))) {
            action.invoke();
            throw new KotlinNothingValueException();
        }
        return total;
    }

    public static final boolean isLeapYear(int year) {
        return (year & 3) == 0 && (year % 100 != 0 || year % 400 == 0);
    }

    private static final int monthLength(int $this$monthLength, boolean isLeapYear) {
        switch ($this$monthLength) {
            case 2:
                return isLeapYear ? 29 : 28;
            case 4:
            case 6:
            case 9:
            case 11:
                return 30;
            default:
                return 31;
        }
    }

    private static final String truncateForErrorMessage(CharSequence $this$truncateForErrorMessage, int maxLength) {
        return $this$truncateForErrorMessage.length() <= maxLength ? $this$truncateForErrorMessage.toString() : $this$truncateForErrorMessage.subSequence(0, maxLength).toString() + "...";
    }
}
