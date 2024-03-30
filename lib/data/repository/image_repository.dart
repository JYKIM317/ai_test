import 'package:ai_test/data/source/local/camera_local.dart';
import 'package:ai_test/data/source/local/gallery_local.dart';
import 'package:image_picker/image_picker.dart';

class ImageRepository {
  void getCameraImage() async {
    XFile? image = await LocalCamera().getImgae();
  }

  void getGarlleryImage() async {
    XFile? image = await LocalGallery().getImgae();
  }
}
