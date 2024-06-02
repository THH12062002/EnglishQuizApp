import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:englishquizapp/data/models/record.dart';

class RecordStorage extends GetxController {
  final box = GetStorage();

  void saveRecord(List<Record> records) {
    List<Map<String, dynamic>> recordMapList =
        records.map((record) => record.toJson()).toList();
    box.write('records', recordMapList);
  }

  List<Record> get records {
    final storedRecords = box.read<List<dynamic>>('records') ?? [];

    return storedRecords.map((record) {
      return Record.fromJson(Map<String, dynamic>.from(record));
    }).toList();
  }

  String get email => box.read('email') ?? '';
  String get score => box.read('score') ?? '';
  String get difficulty => box.read('difficulty') ?? '';
  String get datetime => box.read("datetime") ?? '';
}
