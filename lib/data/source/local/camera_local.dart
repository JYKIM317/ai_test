import 'package:image_picker/image_picker.dart';

class LocalCamera {
  final ImagePicker picker = ImagePicker();

  Future<XFile?> getImgae() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    return image;
  }
}
