import 'package:google_ml_kit/google_ml_kit.dart';

class MLKitRemote {
  Future<String> textRecognize({required String filePath}) async {
    InputImage image = InputImage.fromFilePath(filePath);
    final textRecognizer =
        GoogleMlKit.vision.textRecognizer(script: TextRecognitionScript.korean);

    RecognizedText recognizedText = await textRecognizer.processImage(image);
    await textRecognizer.close();

    String scannedText = '';
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }

    return scannedText;
  }
}
