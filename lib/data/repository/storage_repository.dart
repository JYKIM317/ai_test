import 'package:ai_test/data/source/local/storage_local.dart';

class StorageRepository {
  Future<List<String>> getMyPromptHistory() {
    return LocalStorage().getPromptHistoryFromLocalStorage();
  }

  Future<void> updateMyPromptHistory({required List<String> history}) async {
    await LocalStorage().updatePromptHistoryToLocalStorage(history: history);
  }
}
