import 'package:flutter/material.dart';
import 'package:ai_test/data/repository/storage_repository.dart';
import 'package:ai_test/data/repository/generative_ai_repository.dart';

class MainPageViewmodel extends ChangeNotifier {
  StorageRepository storage = StorageRepository();
  GenerativeAIRepository ai = GenerativeAIRepository();
  bool isLoading = false;
  List<String>? _promptList;

  List<String>? get promptList => _promptList;

  Future<void> fetchMyPromptHistory() async {
    isLoading = true;
    _promptList = await storage.getMyPromptHistory();
    isLoading = false;
    notifyListeners();
  }

  Future<void> prompting({required String prompt}) async {
    isLoading = true;
    notifyListeners();
    String answer = await ai.getPromptResponse(prompt: prompt);
    _promptList!.add(prompt);
    _promptList!.add(answer);
    isLoading = false;
    notifyListeners();
    storage.updateMyPromptHistory(history: _promptList!);
  }
}
