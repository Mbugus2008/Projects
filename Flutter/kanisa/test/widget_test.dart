// Tests for the /dimensions flow.
//
// The app's only test used to be the Flutter counter boilerplate, which failed
// outright ("LoggerService" not found) because it pumped MyApp() without the
// GetX registrations performed in main().

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:kanisa/Network/results.dart';
import 'package:kanisa/controllers/dimension_controller.dart';
import 'package:kanisa/models/dimensions.dart';
import 'package:kanisa/services/logger.dart';

/// Trimmed but shape-accurate sample of the live POST /dimensions response,
/// including the extra server fields the app ignores and the duplicated LCC
/// entry that DimensionController filters out.
const String _liveDimensionsBody = '''
{"Code":0,"Desc":"Successful","Contents":[
 {"Key":"52;XQEAAAJ7/0QASQBTAFQAUgBJAEMAVAAAAAJ7/0IAQQBSAEEASwBB7;16907010;","Code":"BARAKA","Name":"Baraka","Dimension_Value_Type":0,"Dimension_Value_TypeSpecified":true,"Blocked":false,"BlockedSpecified":true,"Dimension_Code":"DISTRICT"},
 {"Key":"44;XQEAAAJ7/0QASQBTAFQAUgBJAEMAVAAAAAJ7/0wAQwBD7;23679350;","Code":"LCC","Name":"LCC","Dimension_Value_Type":0,"Dimension_Value_TypeSpecified":true,"Blocked":false,"BlockedSpecified":true,"Dimension_Code":"DISTRICT"},
 {"Key":"40;XQEAAAJ7/0cAUgBPAFUAUABTAAAAAnv/TABDAEM=7;31043190;","Code":"LCC","Name":"LCC","Dimension_Value_Type":0,"Dimension_Value_TypeSpecified":true,"Blocked":false,"BlockedSpecified":true,"Dimension_Code":"GROUPS"},
 {"Key":"44;XQEAAAJ7/0cAUgBPAFUAUABTAAAAAnv/RwBVAEkATABE7;17007820;","Code":"GUILD","Name":"GUILD","Dimension_Value_Type":0,"Dimension_Value_TypeSpecified":true,"Blocked":false,"BlockedSpecified":true,"Dimension_Code":"GROUPS"}
]}
''';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() => Get.reset());

  test('ListResults<Dimension> parses the live /dimensions payload', () {
    final results =
        ListResults<Dimension>.fromJson(_liveDimensionsBody, Dimension.fromMap);

    expect(results.Code, 0);
    expect(results.Desc, 'Successful');
    expect(results.Contents, isNotNull);
    expect(results.Contents!.length, 4);

    final first = results.Contents!.first;
    expect(first.Code, 'BARAKA');
    expect(first.Name, 'Baraka');
    expect(first.Dimension_Code, 'DISTRICT');
    expect(first.Key, isNotEmpty);
  });

  test('districts/groups are split and the duplicated LCC is excluded', () {
    final results =
        ListResults<Dimension>.fromJson(_liveDimensionsBody, Dimension.fromMap);
    final all = results.Contents!;

    final districts = all
        .where((d) => d.Dimension_Code == 'DISTRICT' && d.Code != 'LCC')
        .toList();
    final groups = all
        .where((d) => d.Dimension_Code == 'GROUPS' && d.Code != 'LCC')
        .toList();

    expect(districts.map((d) => d.Code), ['BARAKA']);
    expect(groups.map((d) => d.Code), ['GUILD']);
    // LCC appears once per dimension in the payload and must be dropped twice.
    expect(all.where((d) => d.Code == 'LCC').length, 2);
  });

  test('LoggerService.onInit survives a missing storage plugin', () async {
    // path_provider is unavailable in the test host; init() must swallow that
    // instead of rethrowing and aborting startup.
    Get.put(LoggerService(), permanent: true);
    await Future<void>.delayed(Duration.zero);

    final logger = Get.find<LoggerService>();
    logger.info('logger still usable without a log file');
    expect(Get.isRegistered<LoggerService>(), isTrue);
  });

  testWidgets('DimensionController reports a failed fetch instead of throwing',
      (tester) async {
    Get.put(LoggerService(), permanent: true);
    // Not registered via Get.put, so onInit() does not kick off a concurrent
    // fetch that the isLoading guard would then short-circuit.
    final controller = DimensionController();

    // flutter_test stubs all HTTP with a 400 response, so this exercises the
    // failure path that used to leave the dropdowns silently empty.
    await controller.fetchDimensions();

    expect(controller.isLoaded.value, isTrue);
    expect(controller.isLoading.value, isFalse);
    expect(controller.loadError.value, isNotNull);
    expect(controller.districtDimensions, isEmpty);
    expect(controller.groupDimensions, isEmpty);

    // A retry must also complete without throwing.
    await controller.retry();
    expect(controller.isLoaded.value, isTrue);
    expect(controller.isLoading.value, isFalse);
  });
}
