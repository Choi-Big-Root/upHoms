import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/review/review_model.dart';
import '../../../domain/usecases/review/get_reviews_usecase.dart';

part 'review_state.bloc.dart';
part 'review_event.bloc.dart';

part 'review_bloc.bloc.freezed.dart';

class ReviewBloc extends Bloc<ReviewEvent,ReviewState> {
  final GetReviewsUsecase _getReviewsUsecase;

  ReviewBloc({required GetReviewsUsecase getReviewsUsecase,}): _getReviewsUsecase = getReviewsUsecase, super(const ReviewState.initial()){
    on<GetReviews>(_onGetReviews);
  }

  Future<void> _onGetReviews(GetReviews event, Emitter<ReviewState> emit) async {
    emit(const ReviewState.loading());
    try {
      final reviews = await _getReviewsUsecase(event.propertyId);
      emit(ReviewState.loadedReviews(reviews));
    } catch (e) {
      emit(ReviewState.error(e.toString()));
    }
  }
}

