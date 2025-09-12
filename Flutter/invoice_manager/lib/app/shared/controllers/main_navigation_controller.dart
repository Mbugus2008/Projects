import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainNavigationController extends GetxController {
  static MainNavigationController get to => Get.find();

  // Current tab index
  final RxInt currentIndex = 0.obs;

  // Navigation items
  final List<NavigationItem> navigationItems = [
    NavigationItem(
      icon: Icons.dashboard_outlined,
      activeIcon: Icons.dashboard,
      label: 'Dashboard',
      route: '/dashboard',
    ),
    NavigationItem(
      icon: Icons.people_outline,
      activeIcon: Icons.people,
      label: 'Customers',
      route: '/customers',
    ),
    NavigationItem(
      icon: Icons.receipt_long_outlined,
      activeIcon: Icons.receipt_long,
      label: 'Invoices',
      route: '/invoices',
    ),
    NavigationItem(
      icon: Icons.payment_outlined,
      activeIcon: Icons.payment,
      label: 'Payments',
      route: '/payments',
    ),
    NavigationItem(
      icon: Icons.settings_outlined,
      activeIcon: Icons.settings,
      label: 'Settings',
      route: '/settings',
    ),
  ];

  // Change tab
  void changeTab(int index) {
    if (index != currentIndex.value) {
      currentIndex.value = index;
      Get.offAllNamed(navigationItems[index].route);
    }
  }

  // Get current route index
  int getCurrentRouteIndex() {
    final currentRoute = Get.currentRoute;
    for (int i = 0; i < navigationItems.length; i++) {
      if (navigationItems[i].route == currentRoute) {
        return i;
      }
    }
    return 0; // Default to dashboard
  }

  @override
  void onInit() {
    super.onInit();
    // Set initial index based on current route
    currentIndex.value = getCurrentRouteIndex();
  }
}

class NavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String route;

  NavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.route,
  });
}

