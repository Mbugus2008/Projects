import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  
  // Mock data for dashboard
  final RxInt totalProperties = 5.obs;
  final RxInt totalUnits = 12.obs;
  final RxInt occupiedUnits = 10.obs;
  final RxInt vacantUnits = 2.obs;
  final RxDouble occupancyRate = 83.3.obs;
  final RxDouble totalRentCollected = 12500.0.obs;
  final RxDouble pendingMaintenance = 3.0.obs;
  final RxInt upcomingLeaseRenewals = 2.obs;
  
  // Navigation items
  final List<Map<String, dynamic>> navigationItems = [
    {'title': 'Dashboard', 'icon': Icons.dashboard, 'route': '/dashboard'},
    {'title': 'Properties', 'icon': Icons.home_work, 'route': '/properties'},
    {'title': 'Tenants', 'icon': Icons.people, 'route': '/tenants'},
    {'title': 'Leases', 'icon': Icons.description, 'route': '/leases'},
    {'title': 'Finances', 'icon': Icons.attach_money, 'route': '/finances'},
    {'title': 'Maintenance', 'icon': Icons.build, 'route': '/maintenance'},
    {'title': 'Documents', 'icon': Icons.folder, 'route': '/documents'},
    {'title': 'Reports', 'icon': Icons.bar_chart, 'route': '/reports'},
  ];
  
  void changeTab(int index) {
    selectedIndex.value = index;
    Get.toNamed(navigationItems[index]['route']);
  }
  
  void logout() {
    // Will be implemented during authentication integration
    Get.offAllNamed('/login');
  }
  
  @override
  void onInit() {
    super.onInit();
    // Will fetch data from API during backend integration
  }
}
