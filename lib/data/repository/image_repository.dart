import 'package:ai_test/data/source/local/camera_local.dart';
import 'package:ai_test/data/source/local/gallery_local.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageRepository {
  Future<String?> getCameraImageFilePath() async {
    String? imagePath;
    XFile? image = await LocalCamera().getImgae();
    if (image != null) {
      imagePath = await imageCropper(imagePath: image.path);
    }
    return imagePath;
  }

  Future<String?> getGarlleryImageFilePath() async {
    String? imagePath;
    XFile? image = await LocalGallery().getImgae();
    if (image != null) {
      imagePath = await imageCropper(imagePath: image.path);
    }
    return imagePath;
  }
}

//

Future<String?> imageCropper({required String imagePath}) async {
  String? path;
  CroppedFile? croppedImage = await ImageCropper().cropImage(
    sourcePath: imagePath,
    uiSettings: [
      AndroidUiSettings(
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      )
    ],
  );

  if (croppedImage != null) {
    path = croppedImage.path;
  }

  return path;
}
