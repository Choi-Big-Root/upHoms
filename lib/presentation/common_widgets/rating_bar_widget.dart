import 'package:flutter/material.dart';

class RatingBarWidget extends StatefulWidget {
  const RatingBarWidget({
    super.key,
    this.starCount = 5,
    this.initalRating = 0.0,
    this.starSize = 48.0,
    this.activeColor = const Color(0xFFFFA130),
    this.inactiveColor = const Color(0xFFD6D9DB),
    this.onRatingChanged,
  }) : assert(initalRating >= 0 && initalRating <= starCount);

  final int starCount; // 총 별 개수
  final double initalRating; // 초기 별점
  final double starSize; // 별 아이콘 크기
  final Color activeColor; // 선택된 색상
  final Color inactiveColor; // 선택되지 않은 색상
  final ValueChanged<double>? onRatingChanged; // 별점 변경시 호출

  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  late double _currentRating;
  @override
  void initState() {
    super.initState();
    _currentRating = widget.initalRating;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:
        List.generate(widget.starCount, (index){
          final int starValue = index + 1;
          return InkWell(
            onTap: (){
              setState(() {
                _currentRating = starValue.toDouble();
              });
              widget.onRatingChanged?.call(_currentRating);
            },
            child: Icon(starValue <= _currentRating? Icons.star_rounded : Icons.star_rounded,
            color: starValue <= _currentRating ? widget.activeColor : widget.inactiveColor,size: widget.starSize,),
          );
        }),

    );
  }
}
