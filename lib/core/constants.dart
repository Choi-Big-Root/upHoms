import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static final String localServerUrl = Platform.isAndroid
      ? dotenv.env['LOCAL_SERVER_URL_ANDROID'] ?? ''
      : dotenv.env['LOCAL_SERVER_URL_IOS'] ?? '';
  static final String imageFolderPath = '$localServerUrl${dotenv.env['IMAGE_FOLDER_PATH'] ?? ''}';
}