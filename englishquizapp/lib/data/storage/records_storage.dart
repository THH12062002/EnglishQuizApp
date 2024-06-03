import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:englishquizapp/data/models/record.dart';

class RecordStorage extends GetxController {
  final box = GetStorage();

  void saveRecord(List<Record> records) {
    List<Map<String, dynamic>> recordMapList = records
        .map((record) => {
              'email': record.email,
              'score': record.score,
              'difficulty': record.difficulty,
              'datetime': record.datetime,
            })
        .toList();

    box.write('records', recordMapList);
  }

  RxList<Record> get records {
    final storedRecords = box.read<List<dynamic>>('records') ?? [];
    return storedRecords
        .map((data) => Record.fromJson(Map<String, dynamic>.from(data)))
        .toList()
        .obs;
  }
}
