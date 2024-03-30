import 'package:ai_test/data/source/remote/generative_ai_remote.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GenerativeAIRepository {
  Future<String> getPromptResponse({required String prompt}) async {
    GenerateContentResponse response =
        await RemoteGenerativeAI().promptResponse(prompt: prompt);

    return response.text ?? '';
  }
}
