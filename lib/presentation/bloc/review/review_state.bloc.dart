part of 'review_bloc.bloc.dart';

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState.initial() = Initial;
  const factory ReviewState.loading() = Loading;
  const factory ReviewState.success() = Success;
  const factory ReviewState.error(String message) = Error;
  const factory ReviewState.loadedReviews(List<ReviewModel> reviews) = LoadedReviews;
}