import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanisa/Network/Apis.dart';
import 'package:kanisa/models/account_model.dart';
import 'package:kanisa/screens/payment_history_screen.dart';
import 'package:kanisa/screens/payment_screen.dart';
import 'package:kanisa/screens/registration_screen.dart';
import 'package:kanisa/services/logger.dart';
import 'package:kanisa/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccountScreen extends StatelessWidget {
  final Rx<Customer> customer = Rx<Customer>(Customer());
  Customer? cust;
  final ApiClient api = ApiClient();
  final LoggerService logger = Get.find();
  MyAccountScreen({
    super.key,
    this.cust,
  }) {
    customer.value = cust!;
  }

  @override
  Widget build(BuildContext context) {
    print(customer.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(customer.value.Name ?? 'My Account'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade200, Colors.green.shade200],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Responsive design based on screen height
              final isSmallScreen = constraints.maxHeight < 700;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Profile Bio Card
                      Obx(() => Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(isSmallScreen ? 12.0 : 20.0),
                              child: Column(
                                children: [
                                  // Avatar
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.blue.shade400,
                                          Colors.green.shade400
                                        ],
                                      ),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          isSmallScreen ? 12 : 16),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        size: isSmallScreen ? 40 : 50,
                                        color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: isSmallScreen ? 8 : 12),

                                  // Name
                                  Text(
                                    customer.value.Name ?? 'No Name Provided',
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 18 : 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade900,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 6),

                                  // Member Number Badge
                                  if (customer.value.No != null)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Colors.blue.shade200),
                                      ),
                                      child: Text(
                                        'Member #${customer.value.No}',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: isSmallScreen ? 8 : 12),

                                  // Contact Info in Compact Cards
                                  _buildCompactInfo(
                                    Icons.email_outlined,
                                    customer.value.E_Mail ?? 'No Email',
                                    Colors.orange,
                                  ),
                                  const SizedBox(height: 6),
                                  _buildCompactInfo(
                                    Icons.phone_outlined,
                                    customer.value.Phone_No ?? 'No Phone',
                                    Colors.green,
                                  ),
                                  const SizedBox(height: 6),
                                  _buildCompactInfo(
                                    Icons.location_on_outlined,
                                    customer.value.Global_Dimension_1_Code ??
                                        'No District',
                                    Colors.purple,
                                  ),

                                  // Groups Section (compact)
                                  if (customer.value.MembersGroups != null &&
                                      customer
                                          .value.MembersGroups!.isNotEmpty) ...[
                                    SizedBox(height: isSmallScreen ? 8 : 12),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade50,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.green.shade200),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.group,
                                                  size: 16,
                                                  color: Colors.green.shade700),
                                              const SizedBox(width: 6),
                                              Text(
                                                'My Groups',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6),
                                          Wrap(
                                            spacing: 6,
                                            runSpacing: 6,
                                            alignment: WrapAlignment.center,
                                            children: customer
                                                .value.MembersGroups!
                                                .map((group) => Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10,
                                                          vertical: 4),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        border: Border.all(
                                                            color: Colors.green
                                                                .shade300),
                                                      ),
                                                      child: Text(
                                                        group.Global_Dimension_2_Code ??
                                                            '',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors
                                                              .green.shade700,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          )),
                      SizedBox(height: isSmallScreen ? 8 : 12),

                      // Quick Actions Grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: isSmallScreen ? 1.4 : 1.5,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        children: [
                          _buildQuickActionCard(
                            icon: Icons.person,
                            title: 'Edit Profile',
                            color: Colors.blue,
                            onTap: () async {
                              Customer? updatedCustomer = await Get.to(() =>
                                  RegistrationScreen(customer: customer.value));
                              logger.info(updatedCustomer.toString());
                              if (updatedCustomer != null) {
                                customer.value = updatedCustomer;
                              }
                            },
                          ),
                          _buildQuickActionCard(
                            icon: Icons.payment,
                            title: 'Make Payment',
                            color: Colors.green,
                            onTap: () => Get.to(
                                () => PaymentScreen(customer: customer.value)),
                          ),
                          _buildQuickActionCard(
                            icon: Icons.history,
                            title: 'Payment History',
                            color: Colors.orange,
                            onTap: () => Get.to(() =>
                                PaymentHistoryScreen(customer: customer.value)),
                          ),
                          _buildQuickActionCard(
                            icon: Icons.exit_to_app,
                            title: 'Logout',
                            color: Colors.red,
                            onTap: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.remove('phone_number');
                              Get.offAll(() => Welcome());
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: isSmallScreen ? 8 : 12),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 28, color: color),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompactInfo(IconData icon, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class AccountOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const AccountOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue.shade700),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
