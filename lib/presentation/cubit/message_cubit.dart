
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart'; // VoidCallback을 위해

part 'message_cubit.freezed.dart';

@freezed
abstract class MessageState with _$MessageState {
  const factory MessageState.initial() = _Initial;
  const factory MessageState.success(String message, {VoidCallback? onDismissed}) = _Success;
  const factory MessageState.error(String message) = _Error;
  const factory MessageState.none() = _None;
}

/// MessageCubit은 앱 전반의 스낵바 메시지 상태를 관리합니다.
class MessageCubit extends Cubit<MessageState> {
  // Cubit은 초기 상태로 `MessageState.initial()`을 가집니다.
  MessageCubit() : super(const MessageState.initial());

  /// 성공 메시지를 발행하고 스낵바를 표시하도록 합니다.
  /// 메시지 표시 후 상태를 `none`으로 초기화하여 중복 표시를 방지합니다.
  /// [message]: 스낵바에 표시할 성공 메시지.
  /// [onDismissed]: 스낵바가 닫힌 후 실행될 선택적 콜백 함수.
  void showSuccessMessage(String message, {VoidCallback? onDismissed}) {
    emit(MessageState.success(message, onDismissed: onDismissed));
  }

  /// 에러 메시지를 발행하고 스낵바를 표시하도록 합니다.
  /// 메시지 표시 후 상태를 `none`으로 초기화하여 중복 표시를 방지합니다.
  /// [message]: 스낵바에 표시할 에러 메시지.
  void showErrorMessage(String message) {
    emit(MessageState.error(message));
  }

  /// 현재 메시지 상태를 명시적으로 `none`으로 초기화합니다.
  void clearMessage() {
    emit(const MessageState.none());
  }
}