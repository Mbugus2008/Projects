import 'package:get/get.dart';
import '../models/customer.dart';
import 'd365_api_service.dart';

class D365CustomerService extends GetxService {
  static D365CustomerService get to => Get.find();

  final D365ApiService _apiService = D365ApiService.to;

  /// Get all customers (accounts and contacts)
  Future<List<Customer>> getCustomers({
    int? top,
    int? skip,
    String? searchTerm,
  }) async {
    try {
      final customers = <Customer>[];

      // Get business accounts
      final accountsQuery = _apiService.buildODataQuery(
        select: [
          'accountid',
          'name',
          'emailaddress1',
          'telephone1',
          'address1_line1',
          'address1_city',
          'address1_stateorprovince',
          'address1_postalcode',
          'address1_country',
          'createdon',
          'modifiedon'
        ],
        filter: searchTerm != null 
            ? "contains(name,'$searchTerm') or contains(emailaddress1,'$searchTerm')"
            : null,
        orderBy: ['name asc'],
        top: top,
        skip: skip,
      );

      final accountsResponse = await _apiService.get('/accounts$accountsQuery');
      final accountsData = accountsResponse.data['value'] as List;

      for (final account in accountsData) {
        customers.add(Customer.fromD365Account(account));
      }

      // Get individual contacts
      final contactsQuery = _apiService.buildODataQuery(
        select: [
          'contactid',
          'fullname',
          'emailaddress1',
          'telephone1',
          'address1_line1',
          'address1_city',
          'address1_stateorprovince',
          'address1_postalcode',
          'address1_country',
          'createdon',
          'modifiedon'
        ],
        filter: searchTerm != null 
            ? "contains(fullname,'$searchTerm') or contains(emailaddress1,'$searchTerm')"
            : null,
        orderBy: ['fullname asc'],
        top: top,
        skip: skip,
      );

      final contactsResponse = await _apiService.get('/contacts$contactsQuery');
      final contactsData = contactsResponse.data['value'] as List;

      for (final contact in contactsData) {
        customers.add(Customer.fromD365Contact(contact));
      }

      // Sort combined list by name
      customers.sort((a, b) => a.name.compareTo(b.name));

      return customers;
    } catch (e) {
      print('Error getting customers: $e');
      throw Exception('Failed to load customers');
    }
  }

  /// Get customer by ID
  Future<Customer?> getCustomer(String customerId, {bool isContact = false}) async {
    try {
      final entityName = isContact ? 'contacts' : 'accounts';
      final idField = isContact ? 'contactid' : 'accountid';
      final nameField = isContact ? 'fullname' : 'name';

      final query = _apiService.buildODataQuery(
        select: [
          idField,
          nameField,
          'emailaddress1',
          'telephone1',
          'address1_line1',
          'address1_city',
          'address1_stateorprovince',
          'address1_postalcode',
          'address1_country',
          'createdon',
          'modifiedon'
        ],
      );

      final response = await _apiService.get('/$entityName($customerId)$query');
      
      if (isContact) {
        return Customer.fromD365Contact(response.data);
      } else {
        return Customer.fromD365Account(response.data);
      }
    } catch (e) {
      print('Error getting customer: $e');
      return null;
    }
  }

  /// Create new customer
  Future<Customer?> createCustomer(Customer customer) async {
    try {
      // Determine if this should be an account or contact
      final isCompany = customer.companyName?.isNotEmpty == true;
      
      if (isCompany) {
        // Create as account
        final accountData = {
          'name': customer.companyName ?? customer.name,
          'emailaddress1': customer.email,
          'telephone1': customer.phone,
          'address1_line1': customer.address,
          'address1_city': customer.city,
          'address1_stateorprovince': customer.state,
          'address1_postalcode': customer.postalCode,
          'address1_country': customer.country,
        };

        final response = await _apiService.post('/accounts', data: accountData);
        final accountId = response.headers['odata-entityid']?.first?.split('(')[1].split(')')[0];
        
        if (accountId != null) {
          return await getCustomer(accountId, isContact: false);
        }
      } else {
        // Create as contact
        final contactData = {
          'fullname': customer.name,
          'emailaddress1': customer.email,
          'telephone1': customer.phone,
          'address1_line1': customer.address,
          'address1_city': customer.city,
          'address1_stateorprovince': customer.state,
          'address1_postalcode': customer.postalCode,
          'address1_country': customer.country,
        };

        final response = await _apiService.post('/contacts', data: contactData);
        final contactId = response.headers['odata-entityid']?.first?.split('(')[1].split(')')[0];
        
        if (contactId != null) {
          return await getCustomer(contactId, isContact: true);
        }
      }

      return null;
    } catch (e) {
      print('Error creating customer: $e');
      throw Exception('Failed to create customer');
    }
  }

  /// Update existing customer
  Future<Customer?> updateCustomer(Customer customer) async {
    try {
      final isContact = customer.isContact;
      final entityName = isContact ? 'contacts' : 'accounts';
      final nameField = isContact ? 'fullname' : 'name';

      final updateData = {
        nameField: isContact ? customer.name : (customer.companyName ?? customer.name),
        'emailaddress1': customer.email,
        'telephone1': customer.phone,
        'address1_line1': customer.address,
        'address1_city': customer.city,
        'address1_stateorprovince': customer.state,
        'address1_postalcode': customer.postalCode,
        'address1_country': customer.country,
      };

      await _apiService.patch('/$entityName(${customer.id})', data: updateData);
      
      return await getCustomer(customer.id!, isContact: isContact);
    } catch (e) {
      print('Error updating customer: $e');
      throw Exception('Failed to update customer');
    }
  }

  /// Delete customer
  Future<bool> deleteCustomer(String customerId, {bool isContact = false}) async {
    try {
      final entityName = isContact ? 'contacts' : 'accounts';
      await _apiService.delete('/$entityName($customerId)');
      return true;
    } catch (e) {
      print('Error deleting customer: $e');
      return false;
    }
  }

  /// Search customers
  Future<List<Customer>> searchCustomers(String searchTerm) async {
    return await getCustomers(searchTerm: searchTerm);
  }

  /// Get customer invoices
  Future<List<Map<String, dynamic>>> getCustomerInvoices(String customerId, {bool isContact = false}) async {
    try {
      final customerField = isContact ? '_customerid_value' : '_customerid_value';
      
      final query = _apiService.buildODataQuery(
        select: [
          'invoiceid',
          'invoicenumber',
          'name',
          'totalamount',
          'statecode',
          'statuscode',
          'createdon',
          'duedate'
        ],
        filter: "$customerField eq $customerId",
        orderBy: ['createdon desc'],
      );

      final response = await _apiService.get('/invoices$query');
      return List<Map<String, dynamic>>.from(response.data['value']);
    } catch (e) {
      print('Error getting customer invoices: $e');
      return [];
    }
  }

  /// Get customer statistics
  Future<Map<String, dynamic>> getCustomerStats(String customerId, {bool isContact = false}) async {
    try {
      final invoices = await getCustomerInvoices(customerId, isContact: isContact);
      
      double totalRevenue = 0;
      int paidInvoices = 0;
      int outstandingInvoices = 0;
      int overdueInvoices = 0;

      for (final invoice in invoices) {
        final amount = (invoice['totalamount'] as num?)?.toDouble() ?? 0;
        final stateCode = invoice['statecode'] as int?;
        final dueDate = invoice['duedate'] as String?;

        totalRevenue += amount;

        if (stateCode == 2) { // Paid
          paidInvoices++;
        } else if (stateCode == 1) { // Active
          outstandingInvoices++;
          
          if (dueDate != null) {
            final due = DateTime.parse(dueDate);
            if (due.isBefore(DateTime.now())) {
              overdueInvoices++;
            }
          }
        }
      }

      return {
        'totalRevenue': totalRevenue,
        'totalInvoices': invoices.length,
        'paidInvoices': paidInvoices,
        'outstandingInvoices': outstandingInvoices,
        'overdueInvoices': overdueInvoices,
      };
    } catch (e) {
      print('Error getting customer stats: $e');
      return {};
    }
  }
}

