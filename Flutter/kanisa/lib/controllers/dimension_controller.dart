import 'package:get/get.dart';
import 'package:kanisa/Network/Apis.dart';
import 'package:kanisa/models/dimensions.dart';

class DimensionController extends GetxController {
  var isLoading = false.obs;

  /// True once the first fetch has completed (success or failure).
  var isLoaded = false.obs;

  /// Reason the last fetch failed, null when it succeeded. Lets the UI show a
  /// retry prompt instead of silently rendering empty dropdowns.
  var loadError = RxnString();

  var districtDimensions = <Dimension>[].obs;
  var groupDimensions = <Dimension>[].obs;

  // Observable properties for selected dimensions
  var selectedDistrictDimension = Rx<Dimension?>(null);
  var selectedGroupDimension = Rx<Dimension?>(null);
  // For multiple group selections
  var selectedGroupDimensions = <Dimension>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDimensions();
  }

  /// Loads district/group dimensions.
  ///
  /// Never throws: failures are recorded in [loadError] so the UI can surface
  /// them, instead of the exception escaping as an unhandled async error and
  /// leaving the dropdowns permanently empty with no diagnostics.
  Future<void> fetchDimensions() async {
    if (isLoading.value) return; // guard against overlapping requests
    isLoading(true);
    loadError.value = null;
    try {
      var fetchedDimensions = await ApiClient().fetchDimensions();

      if (fetchedDimensions.isEmpty) {
        loadError.value = 'No dimensions returned by the server';
        Get.log('DimensionController: server returned 0 dimensions');
      } else {
        // Filter out dimensions with the code "LCC"
        var filteredDistricts = fetchedDimensions
            .where((d) => d.Dimension_Code == 'DISTRICT' && d.Code != 'LCC')
            .toList();
        var filteredGroups = fetchedDimensions
            .where((d) => d.Dimension_Code == 'GROUPS' && d.Code != 'LCC')
            .toList();
        districtDimensions.assignAll(filteredDistricts);
        groupDimensions.assignAll(filteredGroups);
        Get.log('DimensionController: loaded '
            '${filteredDistricts.length} districts / '
            '${filteredGroups.length} groups');
      }
    } catch (e, st) {
      loadError.value = e.toString();
      Get.log('DimensionController.fetchDimensions failed: $e\n$st');
    } finally {
      isLoaded(true);
      isLoading(false);
    }
  }

  /// Manual retry, e.g. from a "Retry" button on a failed registration form.
  Future<void> retry() => fetchDimensions();
}
