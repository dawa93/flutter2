import 'package:app/common/const/colors.dart';
import 'package:app/restaurnt/model/restaurant_model.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Widget img; // 레스토랑 이미지
  final String name; // 레스토랑 이름
  final List<String> tags; // 레스토랑 태그
  final int ratingsCount; // 평점 갯수
  final int deliveryTime; //  배송시간
  final int deliveryFee; //  배송비
  final double ratings; // 평점
  final bool isDetail; // 상세카드 여부
  final String? detail; // 상세내용

  const RestaurantCard({
    super.key,
    required this.img, // 레스토랑 이미지
    required this.name, // 레스토랑 이름
    required this.tags, // 레스토랑 태그
    required this.ratingsCount, // 평점 갯수
    required this.deliveryTime, //  배송시간
    required this.deliveryFee, //  배송비
    required this.ratings, // 평점
    this.isDetail = false,
    this.detail,
  });

  factory RestaurantCard.fromModel(
      {required RestaurantModel model, bool isDetail = false}) {
    return RestaurantCard(
      img: Image.network(
        model.thumbUrl,
        fit: BoxFit.cover,
      ),
      name: model.name,
      tags: model.tags,
      ratingsCount: model.ratingsCount,
      deliveryTime: model.deliveryTime,
      deliveryFee: model.deliveryFee,
      ratings: model.ratings,
      isDetail: isDetail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isDetail) img,
        if (!isDetail)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: img,
          ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDetail ? 16 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                tags.join(' · '),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: BODY_TEXT_COLOR,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Row(
                children: [
                  _IconText(icon: Icons.star, label: ratings.toString()),
                  renderDot(),
                  _IconText(
                      icon: Icons.receipt, label: ratingsCount.toString()),
                  renderDot(),
                  _IconText(
                      icon: Icons.timelapse_outlined, label: '$deliveryTime분'),
                  renderDot(),
                  _IconText(
                      icon: Icons.monetization_on,
                      label: deliveryFee == 0 ? '무료' : '$deliveryFee원'),
                ],
              ),
              if (detail != null && isDetail)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Text(detail!),
                )
            ],
          ),
        )
      ],
    );
  }

  Widget renderDot() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Text(
        ' · ',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        ),
      ],
    );
  }
}
