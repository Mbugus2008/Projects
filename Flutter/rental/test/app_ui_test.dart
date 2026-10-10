import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:rental/app/core/widgets/app_ui.dart';

Widget wrap(Widget child) =>
    GetMaterialApp(home: Scaffold(body: child));

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(Get.reset);

  group('AppCard', () {
    testWidgets('renders child and fires onTap', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(
          AppCard(
            onTap: () => tapped = true,
            child: const Text('card content'),
          ),
        ),
      );
      expect(find.text('card content'), findsOneWidget);
      await tester.tap(find.text('card content'));
      expect(tapped, isTrue);
    });
  });

  group('StatCard', () {
    testWidgets('renders value, label and caption', (tester) async {
      await tester.pumpWidget(
        wrap(
          const StatCard(
            icon: Icons.home_work_rounded,
            iconColor: Colors.blue,
            value: 'KSh 85,000.00',
            label: 'Rent Collected',
            caption: 'income recorded',
          ),
        ),
      );
      expect(find.text('KSh 85,000.00'), findsOneWidget);
      expect(find.text('Rent Collected'), findsOneWidget);
      expect(find.text('income recorded'), findsOneWidget);
    });

    testWidgets('does not overflow in tight grid tiles', (tester) async {
      // Regression test: StatCards placed in fixed-aspect grids on smaller
      // screens used to overflow by ~19px. The card must adapt instead.
      await tester.pumpWidget(
        wrap(
          Center(
            child: SizedBox(
              width: 148,
              height: 90,
              child: StatCard(
                icon: Icons.home_work_rounded,
                iconColor: Colors.blue,
                value: 'KSh 170,000.00',
                label: 'Rent Collected',
                caption: 'income recorded',
              ),
            ),
          ),
        ),
      );
      expect(tester.takeException(), isNull);
      expect(find.text('Rent Collected'), findsOneWidget);
    });
  });

  group('StatusChip', () {
    testWidgets('renders label', (tester) async {
      await tester.pumpWidget(
        wrap(const StatusChip(label: 'Expiring Soon', color: Colors.orange)),
      );
      expect(find.text('Expiring Soon'), findsOneWidget);
    });
  });

  group('SectionHeader', () {
    testWidgets('shows action and fires callback', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(
          SectionHeader(
            title: 'Recent Transactions',
            actionLabel: 'View All',
            onAction: () => tapped = true,
          ),
        ),
      );
      expect(find.text('Recent Transactions'), findsOneWidget);
      await tester.tap(find.text('View All'));
      expect(tapped, isTrue);
    });

    testWidgets('hides action when not provided', (tester) async {
      await tester.pumpWidget(wrap(const SectionHeader(title: 'Reports')));
      expect(find.byType(TextButton), findsNothing);
    });
  });

  group('EmptyState', () {
    testWidgets('renders message and action button', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(
          EmptyState(
            icon: Icons.home_work_outlined,
            title: 'No properties yet',
            message: 'Add your first property.',
            actionLabel: 'Add Property',
            onAction: () => tapped = true,
          ),
        ),
      );
      expect(find.text('No properties yet'), findsOneWidget);
      await tester.tap(find.text('Add Property'));
      expect(tapped, isTrue);
    });
  });

  group('LoadingView', () {
    testWidgets('shows spinner and label', (tester) async {
      await tester.pumpWidget(wrap(const LoadingView(label: 'Loading…')));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading…'), findsOneWidget);
    });
  });

  group('LoadingButton', () {
    testWidgets('fires onPressed when idle', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(LoadingButton(label: 'Sign In', onPressed: () => tapped = true)),
      );
      await tester.tap(find.text('Sign In'));
      expect(tapped, isTrue);
    });

    testWidgets('disables and shows spinner while loading', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(
          LoadingButton(
            label: 'Sign In',
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Sign In'), findsNothing);
      await tester.tap(find.byType(ElevatedButton));
      expect(tapped, isFalse);
    });
  });

  group('InitialsAvatar', () {
    testWidgets('renders initials', (tester) async {
      await tester.pumpWidget(wrap(const InitialsAvatar(initials: 'WK')));
      expect(find.text('WK'), findsOneWidget);
    });
  });

  group('AppLogo', () {
    testWidgets('renders brand icon', (tester) async {
      await tester.pumpWidget(wrap(const AppLogo()));
      expect(find.byIcon(Icons.apartment_rounded), findsOneWidget);
    });
  });

  group('DetailRow / LabeledValue', () {
    testWidgets('DetailRow renders label and value', (tester) async {
      await tester.pumpWidget(
        wrap(
          const DetailRow(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: '+254 712 345 678',
          ),
        ),
      );
      expect(find.text('Phone'), findsOneWidget);
      expect(find.text('+254 712 345 678'), findsOneWidget);
    });

    testWidgets('LabeledValue renders label and value', (tester) async {
      await tester.pumpWidget(
        wrap(const LabeledValue(label: 'Balance', value: 'KSh 85,000.00')),
      );
      expect(find.text('Balance'), findsOneWidget);
      expect(find.text('KSh 85,000.00'), findsOneWidget);
    });
  });

  group('showFormSheet', () {
    testWidgets('opens, renders fields, and submits', (tester) async {
      var submitted = false;
      final loading = false.obs;

      await tester.pumpWidget(
        wrap(
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => showFormSheet(
                context: context,
                title: 'New Property',
                subtitle: 'Fill in the details.',
                submitLabel: 'Add Property',
                isLoading: loading,
                onSubmit: () => submitted = true,
                fields: const [TextField()],
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('New Property'), findsOneWidget);
      expect(find.text('Fill in the details.'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);

      await tester.tap(find.text('Add Property'));
      expect(submitted, isTrue);
    });
  });

  group('showConfirmDialog', () {
    testWidgets('fires onConfirm when confirmed', (tester) async {
      var confirmed = false;
      await tester.pumpWidget(
        wrap(
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => showConfirmDialog(
                context: context,
                title: 'Delete Property',
                message: 'This cannot be undone.',
                confirmLabel: 'Delete',
                onConfirm: () => confirmed = true,
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.text('This cannot be undone.'), findsOneWidget);

      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      expect(confirmed, isTrue);
    });

    testWidgets('does not fire onConfirm when cancelled', (tester) async {
      var confirmed = false;
      await tester.pumpWidget(
        wrap(
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => showConfirmDialog(
                context: context,
                title: 'Delete Property',
                message: 'This cannot be undone.',
                confirmLabel: 'Delete',
                onConfirm: () => confirmed = true,
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(confirmed, isFalse);
    });
  });
}
