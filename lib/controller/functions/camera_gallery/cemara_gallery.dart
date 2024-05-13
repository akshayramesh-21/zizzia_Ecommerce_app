import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

//function for camera accesss
Future<XFile> imageCam() async {
  final ImagePicker _picker = ImagePicker();
  try {
     
    final imageData = await _picker.pickImage(source: ImageSource.camera);
    if (imageData != null) {
      log('Image captured from camera: ${imageData.path}');
      return imageData;
    } else {
      throw Exception("Request failed with status: ${imageData}");
    }
  } catch (e, stackTrace) {
    log('Exception: $e', error: e, stackTrace: stackTrace);
    rethrow; // Rethrow the exception to propagate it to the caller
  }
}



// Function for gallery access
Future<XFile> imageGallery() async {
  final ImagePicker _picker = ImagePicker();
  try {
    final imageData = await _picker.pickImage(source: ImageSource.gallery);
    if (imageData != null) {
      log('Image captured from camera: ${imageData.path}');
      return imageData;
    } else {
      throw Exception("Request failed with status: ${imageData}");
    }
  } catch (e, stackTrace) {
    log('Exception: $e', error: e, stackTrace: stackTrace);
    rethrow; // Rethrow the exception to propagate it to the caller
  }
}




Future<void> checkPermission() async {
  log('Permission');
  final PermissionStatus cameraPermissionStatus =
      await Permission.camera.request();
  final PermissionStatus storagePermissionStatus =
      await Permission.storage.request();

  if (cameraPermissionStatus.isGranted && storagePermissionStatus.isGranted) {
    print('Permissions granted');
  } else {
    print('Permissions not granted');
    await checkPermission(); // Request permissions again if not granted
  }
}


Future<void> checkPermissionStorage() async {
  log('Permission');
  
  final PermissionStatus storagePermissionStatus =
      await Permission.storage.request();

  if ( storagePermissionStatus.isGranted) {
    print('Permissions granted');
  } else {
    print('Permissions not granted');
    await checkPermission(); // Request permissions again if not granted
  }
}
