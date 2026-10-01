package androidx.wear.widget.drawer;

/* JADX INFO: loaded from: classes.dex */
public class WearableDrawerController {
    private final WearableDrawerLayout mDrawerLayout;
    private final WearableDrawerView mDrawerView;

    WearableDrawerController(WearableDrawerLayout drawerLayout, WearableDrawerView drawerView) {
        this.mDrawerLayout = drawerLayout;
        this.mDrawerView = drawerView;
    }

    public void openDrawer() {
        this.mDrawerLayout.openDrawer(this.mDrawerView);
    }

    public void closeDrawer() {
        this.mDrawerLayout.closeDrawer(this.mDrawerView);
    }

    public void peekDrawer() {
        this.mDrawerLayout.peekDrawer(this.mDrawerView);
    }
}
