part of 'review_bloc.bloc.dart';

abstract class ReviewEvent {
  const ReviewEvent();
}

class GetReviews extends ReviewEvent {
  GetReviews(this.propertyId);

  final Map<String, dynamic> propertyId;
}


class AddReview extends ReviewEvent {
  AddReview(this.review);
  final ReviewModel review;
}