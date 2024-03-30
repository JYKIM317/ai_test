import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<List<String>> getPromptHistoryFromLocalStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('promptHistory') ?? [];

    return history;
  }

  Future<void> updatePromptHistoryToLocalStorage(
      {required List<String> history}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('promptHistory', history);
  }
}
