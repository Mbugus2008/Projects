import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanisa/models/account_model.dart';
import 'package:kanisa/Network/Apis.dart';
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
    Key? key,
    this.cust,
  }) : super(key: key){
    customer.value = cust!;
  }

  @override
  Widget build(BuildContext context) {
    print(customer.toString());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade200, Colors.green.shade200],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(customer.value.Name ?? 'My Account'),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue.shade400, Colors.green.shade400],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Obx(() => Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 100,
                              color: Colors.blue.shade700,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              customer.value.Name ?? 'No Name Provided',
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              customer.value.E_Mail ?? 'No Email Provided',
                              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                            ),
                       
                             RichText(
                              text: TextSpan(
                                style: const TextStyle(fontSize: 16, color: Colors.black), // Default text style for the whole RichText
                                children: [
                                  const TextSpan(
                                    text: 'DISTRICT: ',
                                    style: TextStyle(fontWeight: FontWeight.bold), // Bold style for 'Group:'
                                  ),
                                  TextSpan(
                                    text: customer.value.Global_Dimension_1_Code ?? 'No District Provided',
                                    // Inherits default style, no additional styling needed
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(fontSize: 16, color: Colors.black), // Default text style for the whole RichText
                                children: [
                                  const TextSpan(
                                    text: 'My Groups: ',
                                    style: TextStyle(fontWeight: FontWeight.bold), // Bold style for 'Group:'
                                  ),
                                  for (var group in customer.value.MembersGroups ?? [])
                                    TextSpan(
                                      text: '\n${group.Global_Dimension_2_Code}',
                                      // Inherits default style, no additional styling needed
                                    ),
                                ],
                              ),
                            ),],
                        ),
                      )),
                      const SizedBox(height: 32),
                      const Text(
                        'Account',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      AccountOptionCard(
                        icon: Icons.person,
                        title: 'Edit Profile',
                        onTap: () async {
                          Customer? updatedCustomer = await Get.to(() => RegistrationScreen(customer: customer.value));
                          logger.info(updatedCustomer.toString());
                          if (updatedCustomer != null) {
                            customer.value = updatedCustomer;
                          }
                        },
                      ),
                      AccountOptionCard(
                        icon: Icons.settings,
                        title: 'Preferences',
                        onTap: () => Get.snackbar('Preferences', 'Feature coming soon!'),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Security',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      AccountOptionCard(
                        icon: Icons.lock,
                        title: 'Change Password',
                        onTap: () => Get.snackbar('Change Password', 'Feature coming soon!'),
                      ),
                      AccountOptionCard(
                        icon: Icons.security,
                        title: 'Two-Factor Authentication',
                        onTap: () => Get.snackbar('Two-Factor Authentication', 'Feature coming soon!'),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Support',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      AccountOptionCard(
                        icon: Icons.help,
                        title: 'Help & Support',
                        onTap: () => Get.snackbar('Help & Support', 'Feature coming soon!'),
                      ),
                      AccountOptionCard(
                        icon: Icons.info,
                        title: 'About',
                        onTap: () => Get.snackbar('About', 'Feature coming soon!'),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.remove('phone_number');
                            Get.offAll(() => Welcome());  

                          } , 
                          icon: const Icon(Icons.exit_to_app),
                          label: const Text('Logout'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade400,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }

  void _registerCustomerIfNeeded() async {
    try {
      Customer? exists = await api.checkCustomerExists(customer.value.Phone_No ?? '');
      if (exists == null) {
        await api.registerCustomer(customer.value);
        Get.snackbar('Success', 'Customer registered successfully!');
      } else {
        Get.snackbar('Notice', 'Customer already exists.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to register customer: $e');
    }
  }
}

class AccountOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const AccountOptionCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

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
