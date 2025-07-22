import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class AppConstants {
  static final String localServerUrl = Platform.isAndroid
      ? dotenv.env['LOCAL_SERVER_URL_ANDROID'] ?? ''
      : dotenv.env['LOCAL_SERVER_URL_IOS'] ?? '';

  static final String imageFolderPath = '$localServerUrl${dotenv.env['IMAGE_FOLDER_PATH'] ?? ''}';

  static final  themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);


  static final Map<String, IconData> amenityIconMap = {
    "ac": Icons.ac_unit_rounded,
    "heater": Icons.wb_sunny_rounded,
    "pool": Icons.pool_rounded,
    "dogFriendly": Icons.pets_rounded,
    "washer": Icons.local_laundry_service_outlined,
    "dryer": Icons.local_laundry_service_outlined,
    "workOut": Icons.fitness_center,
    "hip": Icons.theater_comedy,
    "nightLife": Icons.nightlife,
    "extraOutlets": Icons.power_outlined,
    "evCharger": Icons.ev_station_rounded,
    // 여기에 AmenityModel에 추가될 수 있는 다른 어메니티들도 포함
  };
  static String formatPrice(dynamic price, {String locale = 'ko_KR', String symbol = '₩'}) {
    final formatCurrency = NumberFormat.currency(
      locale: locale,      // 국가 및 언어 설정 (예: 한국 'ko_KR', 미국 'en_US')
      symbol: symbol,      // 통화 심볼 (기본값은 locale에 따라 자동 설정)
      decimalDigits: 0,    // 소수점 이하 자릿수 (가격은 보통 정수이므로 0)
    );
    return formatCurrency.format(price);
  }
}

