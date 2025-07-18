// lib/core/utils/validators.dart

class AppValidators {
  AppValidators._();

  //이메일 정규식
  static const String _emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  // 전화번호 정규식 숫자로만 구성되었는지 확인
  static const String _phoneNumberRegex = r'^[0-9]+$';

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '이메일을(를) 입력해주세요.';
    }
    if (!RegExp(_emailRegex).hasMatch(value)) {
      return '유효한 이메일 형식이 아닙니다.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return '전화번호을(를) 입력해주세요.';
    }
    // 하이픈이 포함될 수 있으므로, 검사 전에 제거합니다.
    final String cleanedValue = value.replaceAll('-', '');
    if (!RegExp(_phoneNumberRegex).hasMatch(cleanedValue)) {
      return '유효한 전화번호 형식이 아닙니다 (숫자만 입력).';
    }
    if (cleanedValue.length < 10 || cleanedValue.length > 11) {
      return '유효하지 않은 전화번호 길이입니다.';
    }
    return null;
  }

  /// 일반적인 필수 입력 필드 검사
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName을(를) 입력해주세요.';
    }
    return null;
  }
}