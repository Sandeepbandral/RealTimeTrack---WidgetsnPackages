import 'dart:io';

import 'package:image_picker/image_picker.dart';

class FileUtils {
  FileUtils._();

  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickImage(ImageSource source) async {
    try {
      XFile? xFile = await _picker.pickImage(source: source);
      if (xFile != null) return File(xFile.path);
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<List<File>> pickMultiImage() async {
    try {
      List<XFile> files = await _picker.pickMultiImage();
      return files.map((e) => File(e.path)).toList();
    } catch (e) {
      return <File>[];
    }
  }
}
