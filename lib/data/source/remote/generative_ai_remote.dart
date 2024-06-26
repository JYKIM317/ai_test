import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:ai_test/properties.dart';

class RemoteGenerativeAI extends APIkeys {
  final String _modelName = 'gemini-pro';

  Future<GenerateContentResponse> promptResponse(
      {required String prompt}) async {
    final model =
        GenerativeModel(model: _modelName, apiKey: super.geminiApiKey);

    final content = [Content.text(prompt)];
    return await model.generateContent(content);
  }
}
