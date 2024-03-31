import 'package:ai_test/data/source/remote/generative_ai_remote.dart';
import 'package:ai_test/data/source/remote/ml_kit_remote.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AIRepository {
  Future<String> getGenerativeAIResponse({required String prompt}) async {
    String? responseText;
    try {
      GenerateContentResponse response =
          await RemoteGenerativeAI().promptResponse(prompt: prompt);
      responseText = response.text;
    } catch (e) {
      responseText = e.toString();
    }

    return responseText ?? '';
  }

  Future<String> getTextFromImage({required String filePath}) async {
    return MLKitRemote().textRecognize(filePath: filePath);
  }
}
