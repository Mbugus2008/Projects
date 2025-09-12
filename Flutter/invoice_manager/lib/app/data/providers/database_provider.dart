import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._internal();
  factory DatabaseProvider() => _instance;
  DatabaseProvider._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'invoice_manager.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    // Create customers table
    await db.execute('''
      CREATE TABLE customers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT,
        phone TEXT,
        address TEXT,
        city TEXT,
        state TEXT,
        zip_code TEXT,
        country TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // Create invoices table
    await db.execute('''
      CREATE TABLE invoices (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        invoice_number TEXT UNIQUE NOT NULL,
        customer_id INTEGER NOT NULL,
        issue_date TEXT NOT NULL,
        due_date TEXT NOT NULL,
        subtotal REAL NOT NULL,
        tax_rate REAL DEFAULT 0,
        tax_amount REAL DEFAULT 0,
        discount_rate REAL DEFAULT 0,
        discount_amount REAL DEFAULT 0,
        total_amount REAL NOT NULL,
        status TEXT NOT NULL DEFAULT 'draft',
        notes TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE
      )
    ''');

    // Create invoice_items table
    await db.execute('''
      CREATE TABLE invoice_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        invoice_id INTEGER NOT NULL,
        description TEXT NOT NULL,
        quantity REAL NOT NULL,
        unit_price REAL NOT NULL,
        total_price REAL NOT NULL,
        FOREIGN KEY (invoice_id) REFERENCES invoices (id) ON DELETE CASCADE
      )
    ''');

    // Create payments table
    await db.execute('''
      CREATE TABLE payments (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        invoice_id INTEGER NOT NULL,
        amount REAL NOT NULL,
        payment_method TEXT NOT NULL,
        payment_date TEXT NOT NULL,
        reference_number TEXT,
        notes TEXT,
        created_at TEXT NOT NULL,
        FOREIGN KEY (invoice_id) REFERENCES invoices (id) ON DELETE CASCADE
      )
    ''');

    // Create indexes for better performance
    await db.execute('CREATE INDEX idx_invoices_customer_id ON invoices(customer_id)');
    await db.execute('CREATE INDEX idx_invoices_status ON invoices(status)');
    await db.execute('CREATE INDEX idx_invoices_due_date ON invoices(due_date)');
    await db.execute('CREATE INDEX idx_invoice_items_invoice_id ON invoice_items(invoice_id)');
    await db.execute('CREATE INDEX idx_payments_invoice_id ON payments(invoice_id)');
    await db.execute('CREATE INDEX idx_customers_name ON customers(name)');
    await db.execute('CREATE INDEX idx_customers_email ON customers(email)');

    // Insert sample data for testing
    await _insertSampleData(db);
  }

  Future<void> _upgradeDatabase(Database db, int oldVersion, int newVersion) async {
    // Handle database upgrades here
    if (oldVersion < 2) {
      // Add new columns or tables for version 2
    }
  }

  Future<void> _insertSampleData(Database db) async {
    // Insert sample customers
    await db.insert('customers', {
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'phone': '+1-555-0123',
      'address': '123 Main St',
      'city': 'New York',
      'state': 'NY',
      'zip_code': '10001',
      'country': 'USA',
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    });

    await db.insert('customers', {
      'name': 'Jane Smith',
      'email': 'jane.smith@example.com',
      'phone': '+1-555-0456',
      'address': '456 Oak Ave',
      'city': 'Los Angeles',
      'state': 'CA',
      'zip_code': '90210',
      'country': 'USA',
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    });

    await db.insert('customers', {
      'name': 'ABC Corporation',
      'email': 'billing@abccorp.com',
      'phone': '+1-555-0789',
      'address': '789 Business Blvd',
      'city': 'Chicago',
      'state': 'IL',
      'zip_code': '60601',
      'country': 'USA',
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    });

    // Insert sample invoice
    final invoiceId = await db.insert('invoices', {
      'invoice_number': 'INV-001',
      'customer_id': 1,
      'issue_date': DateTime.now().toIso8601String(),
      'due_date': DateTime.now().add(Duration(days: 30)).toIso8601String(),
      'subtotal': 1000.00,
      'tax_rate': 8.5,
      'tax_amount': 85.00,
      'discount_rate': 0.0,
      'discount_amount': 0.0,
      'total_amount': 1085.00,
      'status': 'sent',
      'notes': 'Sample invoice for testing',
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    });

    // Insert sample invoice items
    await db.insert('invoice_items', {
      'invoice_id': invoiceId,
      'description': 'Web Development Services',
      'quantity': 40.0,
      'unit_price': 25.00,
      'total_price': 1000.00,
    });

    // Insert sample payment
    await db.insert('payments', {
      'invoice_id': invoiceId,
      'amount': 500.00,
      'payment_method': 'banktransfer',
      'payment_date': DateTime.now().subtract(Duration(days: 5)).toIso8601String(),
      'reference_number': 'TXN-12345',
      'notes': 'Partial payment received',
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  // Database utility methods
  Future<void> closeDatabase() async {
    final db = await database;
    await db.close();
    _database = null;
  }

  Future<void> deleteDatabase() async {
    String path = join(await getDatabasesPath(), 'invoice_manager.db');
    await databaseFactory.deleteDatabase(path);
    _database = null;
  }

  Future<void> resetDatabase() async {
    await deleteDatabase();
    _database = await _initDatabase();
  }

  // Get database statistics
  Future<Map<String, int>> getDatabaseStats() async {
    final db = await database;
    
    final customerCount = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM customers')
    ) ?? 0;
    
    final invoiceCount = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM invoices')
    ) ?? 0;
    
    final paymentCount = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM payments')
    ) ?? 0;
    
    final draftInvoiceCount = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM invoices WHERE status = ?', ['draft'])
    ) ?? 0;
    
    final paidInvoiceCount = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM invoices WHERE status = ?', ['paid'])
    ) ?? 0;
    
    final overdueInvoiceCount = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM invoices WHERE status = ? OR (status = ? AND due_date < ?)', 
        ['overdue', 'sent', DateTime.now().toIso8601String()])
    ) ?? 0;

    return {
      'customers': customerCount,
      'invoices': invoiceCount,
      'payments': paymentCount,
      'draftInvoices': draftInvoiceCount,
      'paidInvoices': paidInvoiceCount,
      'overdueInvoices': overdueInvoiceCount,
    };
  }

  // Execute raw query
  Future<List<Map<String, dynamic>>> rawQuery(String sql, [List<dynamic>? arguments]) async {
    final db = await database;
    return await db.rawQuery(sql, arguments);
  }

  // Execute raw insert/update/delete
  Future<int> rawExecute(String sql, [List<dynamic>? arguments]) async {
    final db = await database;
    return await db.rawInsert(sql, arguments);
  }

  // Backup database (export to JSON)
  Future<Map<String, dynamic>> exportData() async {
    final db = await database;
    
    final customers = await db.query('customers');
    final invoices = await db.query('invoices');
    final invoiceItems = await db.query('invoice_items');
    final payments = await db.query('payments');
    
    return {
      'customers': customers,
      'invoices': invoices,
      'invoice_items': invoiceItems,
      'payments': payments,
      'exported_at': DateTime.now().toIso8601String(),
    };
  }

  // Restore database (import from JSON)
  Future<void> importData(Map<String, dynamic> data) async {
    final db = await database;
    
    await db.transaction((txn) async {
      // Clear existing data
      await txn.delete('payments');
      await txn.delete('invoice_items');
      await txn.delete('invoices');
      await txn.delete('customers');
      
      // Import customers
      if (data['customers'] != null) {
        for (var customer in data['customers']) {
          await txn.insert('customers', customer);
        }
      }
      
      // Import invoices
      if (data['invoices'] != null) {
        for (var invoice in data['invoices']) {
          await txn.insert('invoices', invoice);
        }
      }
      
      // Import invoice items
      if (data['invoice_items'] != null) {
        for (var item in data['invoice_items']) {
          await txn.insert('invoice_items', item);
        }
      }
      
      // Import payments
      if (data['payments'] != null) {
        for (var payment in data['payments']) {
          await txn.insert('payments', payment);
        }
      }
    });
  }
}

