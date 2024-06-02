import 'package:get/get.dart';
import 'package:englishquizapp/data/models/record.dart';
import 'package:englishquizapp/data/storage/records_storage.dart';

class RecordController extends GetxController {
  final RecordStorage recordStorage = Get.put(RecordStorage());

  var filteredRecords = <Record>[].obs;
  var selectedDifficulty = 'All'.obs;
  var selectedDate = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Ensure that initial filtered records contain all records
    filteredRecords.value = recordStorage.records;
  }

  void filterRecords() {
    List<Record> allRecords = recordStorage.records;

    if (selectedDifficulty.value != 'All') {
      // Chuẩn hóa giá trị difficulty được chọn từ dropdown
      String normalizedSelectedDifficulty =
          selectedDifficulty.value.toLowerCase();

      allRecords = allRecords.where((record) {
        // Chuẩn hóa giá trị difficulty của record
        String normalizedRecordDifficulty =
            record.difficulty?.toLowerCase() ?? '';

        return normalizedRecordDifficulty == normalizedSelectedDifficulty;
      }).toList();
    }

    if (selectedDate.value.isNotEmpty) {
      allRecords = allRecords.where((record) {
        return record.datetime?.split(' ')[0] == selectedDate.value;
      }).toList();
    }

    filteredRecords.value = allRecords;
  }

  void updateDifficulty(String difficulty) {
    selectedDifficulty.value = difficulty;
    filterRecords();
  }

  void updateDate(String date) {
    selectedDate.value = date;
    filterRecords();
  }
}
