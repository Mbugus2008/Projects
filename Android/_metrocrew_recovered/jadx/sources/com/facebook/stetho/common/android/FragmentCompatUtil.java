package com.facebook.stetho.common.android;

import android.app.Activity;
import android.view.View;
import java.util.List;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public final class FragmentCompatUtil {
    private FragmentCompatUtil() {
    }

    public static boolean isDialogFragment(Object fragment) {
        FragmentCompat supportLib = FragmentCompat.getSupportLibInstance();
        if (supportLib != null && supportLib.getDialogFragmentClass().isInstance(fragment)) {
            return true;
        }
        FragmentCompat framework = FragmentCompat.getFrameworkInstance();
        if (framework != null && framework.getDialogFragmentClass().isInstance(fragment)) {
            return true;
        }
        return false;
    }

    @Nullable
    public static Object findFragmentForView(View view) {
        Activity activity = ViewUtil.tryGetActivity(view);
        if (activity == null) {
            return null;
        }
        return findFragmentForViewInActivity(activity, view);
    }

    @Nullable
    private static Object findFragmentForViewInActivity(Activity activity, View view) {
        Object fragment;
        Object fragment2;
        FragmentCompat supportLib = FragmentCompat.getSupportLibInstance();
        if (supportLib != null && supportLib.getFragmentActivityClass().isInstance(activity) && (fragment2 = findFragmentForViewInActivity(supportLib, activity, view)) != null) {
            return fragment2;
        }
        FragmentCompat framework = FragmentCompat.getFrameworkInstance();
        if (framework != null && (fragment = findFragmentForViewInActivity(framework, activity, view)) != null) {
            return fragment;
        }
        return null;
    }

    private static Object findFragmentForViewInActivity(FragmentCompat compat, Activity activity, View view) {
        Object fragmentManager = compat.forFragmentActivity().getFragmentManager(activity);
        if (fragmentManager != null) {
            return findFragmentForViewInFragmentManager(compat, fragmentManager, view);
        }
        return null;
    }

    @Nullable
    private static Object findFragmentForViewInFragmentManager(FragmentCompat compat, Object fragmentManager, View view) {
        List<?> fragments = compat.forFragmentManager2().getAddedFragments(fragmentManager);
        if (fragments != null) {
            int N = fragments.size();
            for (int i = 0; i < N; i++) {
                Object fragment = fragments.get(i);
                Object result = findFragmentForViewInFragment(compat, fragment, view);
                if (result != null) {
                    return result;
                }
            }
            return null;
        }
        return null;
    }

    @Nullable
    private static Object findFragmentForViewInFragment(FragmentCompat compat, Object fragment, View view) {
        FragmentAccessor accessor = compat.forFragment();
        if (accessor.getView(fragment) == view) {
            return fragment;
        }
        Object childFragmentManager = accessor.getChildFragmentManager(fragment);
        if (childFragmentManager != null) {
            return findFragmentForViewInFragmentManager(compat, childFragmentManager, view);
        }
        return null;
    }
}
