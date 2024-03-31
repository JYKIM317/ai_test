import 'package:ai_test/data/source/local/camera_local.dart';
import 'package:ai_test/data/source/local/gallery_local.dart';
import 'package:image_picker/image_picker.dart';

class ImageRepository {
  Future<String?> getCameraImageFilePath() async {
    XFile? image = await LocalCamera().getImgae();
    return image?.path;
  }

  Future<String?> getGarlleryImageFilePath() async {
    XFile? image = await LocalGallery().getImgae();
    return image?.path;
  }
}
