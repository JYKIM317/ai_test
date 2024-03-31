import 'package:flutter/material.dart';
import 'package:ai_test/data/repository/storage_repository.dart';
import 'package:ai_test/data/repository/ai_repository.dart';
import 'package:ai_test/data/repository/image_repository.dart';

enum ImageType {
  camera,
  gallery,
}

class MainPageViewmodel extends ChangeNotifier {
  StorageRepository storage = StorageRepository();
  AIRepository ai = AIRepository();
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
    String answer = await ai.getGenerativeAIResponse(prompt: prompt);
    _promptList!.add(prompt);
    _promptList!.add(answer);
    isLoading = false;
    notifyListeners();
    storage.updateMyPromptHistory(history: _promptList!);
  }

  Future<void> promptingFromImage({required ImageType imageType}) async {
    String? filePath;
    if (imageType == ImageType.gallery) {
      filePath = await ImageRepository().getGarlleryImageFilePath();
    } else {
      filePath = await ImageRepository().getCameraImageFilePath();
    }

    if (filePath != null) {
      isLoading = true;
      notifyListeners();
      String prompt = await ai.getTextFromImage(filePath: filePath);
      String answer = await ai.getGenerativeAIResponse(prompt: prompt);
      _promptList!.add(prompt);
      _promptList!.add(answer);
      isLoading = false;
      notifyListeners();
      storage.updateMyPromptHistory(history: _promptList!);
    }
  }
}
