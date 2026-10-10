import '../widgets/app_ui.dart';

/// Ready-to-send SMS / WhatsApp templates for landlord–tenant communication.
///
/// All amounts are formatted as Kenyan Shillings through [formatMoney].
class RentMessages {
  RentMessages._();

  /// Gentle reminder that a rent balance is outstanding.
  static String reminder({
    required String tenant,
    required String property,
    required String unit,
    required double balance,
  }) {
    return 'Hello $tenant, this is a friendly reminder that your rent '
        'balance for ${_location(property, unit)} is ${formatMoney(balance)}. '
        'Kindly settle it via M-PESA at your earliest convenience. Asante!';
  }

  /// Monthly rent invoice text.
  static String invoice({
    required String tenant,
    required String property,
    required String unit,
    required double rent,
    DateTime? period,
  }) {
    final d = period ?? DateTime.now();
    return 'RENT INVOICE\n'
        'Tenant: $tenant\n'
        'Unit: ${_location(property, unit)}\n'
        'Period: ${formatDate(DateTime(d.year, d.month, 1))}\n'
        'Amount due: ${formatMoney(rent)}\n'
        'Please pay via M-PESA before the 5th of the month. Thank you.';
  }

  /// Tenant account statement: billed vs paid vs outstanding.
  static String statement({
    required String tenant,
    required String property,
    required String unit,
    required double expected,
    required double paid,
    required double balance,
  }) {
    return 'ACCOUNT STATEMENT\n'
        'Tenant: $tenant\n'
        'Unit: ${_location(property, unit)}\n'
        'Total billed: ${formatMoney(expected)}\n'
        'Total paid: ${formatMoney(paid)}\n'
        'Outstanding balance: ${formatMoney(balance)}\n'
        'Thank you for your business.';
  }

  /// Payment receipt text.
  static String receipt({
    required String tenant,
    required double amount,
    DateTime? date,
    String? reference,
  }) {
    final d = date ?? DateTime.now();
    return 'RENT RECEIPT\n'
        'Received from: $tenant\n'
        'Amount: ${formatMoney(amount)}\n'
        'Date: ${formatDate(d)}\n'
        'Ref: ${reference ?? 'RCPT-${d.millisecondsSinceEpoch}'}\n'
        'Asante for your payment.';
  }

  /// Itemised invoice message (rent, water, garbage, …).
  static String itemizedInvoice({
    required String tenant,
    required String invoiceNumber,
    required String property,
    required String unit,
    required List<Map<String, dynamic>> lines,
    required double total,
    DateTime? dueDate,
  }) {
    final buffer = StringBuffer()
      ..writeln('RENT INVOICE $invoiceNumber')
      ..writeln('Tenant: $tenant');
    final location = _location(property, unit);
    if (location.isNotEmpty) buffer.writeln('Unit: $location');
    for (final line in lines) {
      final description = line['description']?.toString() ?? '';
      if (description.isEmpty) continue;
      buffer.writeln('- $description: ${formatMoney(line['amount'] as num?)}');
    }
    buffer.writeln('Total: ${formatMoney(total)}');
    if (dueDate != null) buffer.writeln('Due: ${formatDate(dueDate)}');
    buffer.write('Please pay via M-PESA before the due date. Thank you.');
    return buffer.toString();
  }

  /// Receipt issued against a specific invoice.
  static String receiptForInvoice({
    required String tenant,
    required String invoiceNumber,
    required double amount,
    DateTime? date,
  }) {
    final d = date ?? DateTime.now();
    return 'RENT RECEIPT\n'
        'Against invoice: $invoiceNumber\n'
        'Received from: $tenant\n'
        'Amount: ${formatMoney(amount)}\n'
        'Date: ${formatDate(d)}\n'
        'Asante for your payment.';
  }

  static String _location(String property, String unit) {
    final hasUnit = unit.isNotEmpty && unit != 'N/A';
    if (property.isEmpty) {
      return hasUnit ? 'Unit $unit' : '';
    }
    return hasUnit ? '$property - Unit $unit' : property;
  }
}
