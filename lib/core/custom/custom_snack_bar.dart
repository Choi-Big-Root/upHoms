// lib/core/custom/custom_snack_bar.dart (예시 경로)

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSnackBar {
  CustomSnackBar._();

  // CustomSnackBar의 싱글톤 인스턴스 (옵션)
  // static final CustomSnackBar _instance = CustomSnackBar._();
  // static CustomSnackBar get instance => _instance;
  /// [context] : Flushbar를 표시할 BuildContext.
  /// [message] : 스낵바에 표시될 메시지.
  /// [isError] : 에러 메시지인 경우 true로 설정하여 색상과 아이콘을 변경합니다. (선택 사항, 기본값 false)
  /// [duration] : 스낵바가 화면에 머무는 시간. (선택 사항, 기본값 3초)
  static void showTopSnackBar(
      BuildContext context,
      String message, {
        bool isError = false,
        Duration duration = const Duration(seconds: 3),
      }) {
    Flushbar(
      message: message,
      icon: Icon(
        isError ? Icons.error_outline : Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      duration: isError? duration : const Duration(seconds: 1),
      leftBarIndicatorColor: isError ? Colors.red.shade300 : Colors.blue.shade300,
      flushbarPosition: FlushbarPosition.TOP, // 상단에 표시
      flushbarStyle: FlushbarStyle.FLOATING, // 플로팅 스타일
      margin: const EdgeInsets.all(8), // 좌우상하 여백
      borderRadius: BorderRadius.circular(8), // 둥근 모서리
      backgroundColor: isError ? Colors.red.shade500 : Colors.blue.shade500, // 배경색
      // 제목이나 액션 버튼 등 추가적인 Flushbar 속성을 여기에 더할 수 있습니다.
      // title: isError ? 'Error' : 'Info',
      // mainButton: TextButton(
      //   onPressed: () {
      //     // 버튼 클릭 시 수행할 작업
      //     Navigator.of(context).pop(); // 스낵바 닫기
      //   },
      //   child: const Text('닫기', style: TextStyle(color: Colors.white)),
      // ),
        onStatusChanged: (status) {
          if (status == FlushbarStatus.DISMISSED){
            context.pop();
          }
        }
    ).show(context);
  }

  /// 앱 하단에 기본 스타일의 스낵바 메시지를 표시합니다.
  /// (기존 ScaffoldMessenger.of(context).showSnackBar와 유사)
  static void showBottomSnackBar(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 3),
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        behavior: SnackBarBehavior.floating, // 플로팅 스타일
        margin: const EdgeInsets.all(8), // 여백
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // 둥근 모서리
      ),
    );
  }
}