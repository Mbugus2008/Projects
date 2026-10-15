import 'package:flutter_test/flutter_test.dart';
import 'package:rental/app/core/widgets/app_ui.dart';

void main() {
  group('formatMoney', () {
    test('formats null as KSh 0.00', () {
      expect(formatMoney(null), 'KSh 0.00');
    });

    test('formats zero', () {
      expect(formatMoney(0), 'KSh 0.00');
    });

    test('adds thousand separators', () {
      expect(formatMoney(85000), 'KSh 85,000.00');
    });

    test('formats millions with decimals', () {
      expect(formatMoney(1250000.5), 'KSh 1,250,000.50');
    });

    test('formats negatives with sign first', () {
      expect(formatMoney(-4500), '-KSh 4,500.00');
    });

    test('rounds to two decimals', () {
      expect(formatMoney(99.999), 'KSh 100.00');
      expect(formatMoney(0.5), 'KSh 0.50');
    });

    test('supports custom symbol', () {
      expect(formatMoney(10, symbol: 'USD'), 'USD 10.00');
    });

    test('accepts int and double', () {
      expect(formatMoney(1000), 'KSh 1,000.00');
      expect(formatMoney(1000.0), 'KSh 1,000.00');
    });
  });

  group('formatDate', () {
    test('formats DateTime', () {
      expect(formatDate(DateTime(2026, 10, 8)), '8 Oct 2026');
    });

    test('formats ISO strings', () {
      expect(formatDate('2026-01-31'), '31 Jan 2026');
    });

    test('returns fallback for null', () {
      expect(formatDate(null), '—');
    });

    test('returns fallback for empty string', () {
      expect(formatDate(''), '—');
    });

    test('returns raw text when unparseable', () {
      expect(formatDate('N/A'), 'N/A');
    });

    test('honours custom fallback', () {
      expect(formatDate(null, fallback: 'never'), 'never');
    });
  });

  group('formatDateInput', () {
    test('formats DateTime as an ISO calendar date', () {
      expect(formatDateInput(DateTime(2026, 8, 10)), '2026-08-10');
    });

    test('strips the time component from API timestamps', () {
      expect(formatDateInput('2026-08-10T00:00:00'), '2026-08-10');
      expect(formatDateInput('2026-01-05T09:30:00'), '2026-01-05');
    });

    test('accepts date-only strings', () {
      expect(formatDateInput('2026-08-10'), '2026-08-10');
    });

    test('returns empty string for null', () {
      expect(formatDateInput(null), '');
    });

    test('returns empty string for empty input', () {
      expect(formatDateInput(''), '');
    });

    test('returns empty string when unparseable', () {
      expect(formatDateInput('N/A'), '');
    });
  });

  group('initialsOf', () {
    test('takes first letters of both names', () {
      expect(initialsOf('Wanjiru', 'Kamau'), 'WK');
    });

    test('uppercases', () {
      expect(initialsOf('alicia', 'gomez'), 'AG');
    });

    test('handles missing last name', () {
      expect(initialsOf('Otieno', null), 'O');
    });

    test('handles both empty', () {
      expect(initialsOf('', ''), '?');
    });

    test('trims whitespace', () {
      expect(initialsOf('  Aisha ', ' Hassan '), 'AH');
    });
  });
}
