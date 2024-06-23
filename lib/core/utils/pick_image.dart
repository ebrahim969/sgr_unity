import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

Future<File?> pickImage() async {
  try {
    final xFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (xFile != null) {
      return File(xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}

Future<List<File>?> pickMultiImages() async {
  try {
    final xFile = await _picker.pickMultiImage(imageQuality: 50);
    if (xFile.isEmpty) {
      return null;
    }
    List<File> images = xFile.map((image) => File(image.path)).toList();
    return images;
  } catch (e) {
    log('Error picking images: $e');
    return null;
  }
}
