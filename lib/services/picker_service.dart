// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class PickerService {
  static const int IMAGE_QUALITY = 70;
  //DECLARANDO DUAS VAR JUNTAS
  static const double MAX_HEIGHT = 720, MAX_WIDTH = 480;

  Future<XFile?> getImage(ImageSource source) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: source,
      //configurações da image
      imageQuality: IMAGE_QUALITY,
      maxHeight: MAX_HEIGHT,
      maxWidth: MAX_WIDTH,
    );
    return image;
  }

  String base64(List<int> imageBytes) {
    return base64Encode(imageBytes);
  }

  Uint8List decodeBase64(String source) {
    return base64Decode(source);
  }
}
