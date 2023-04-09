import 'package:app/common/const/colors.dart';
import 'package:app/restaurnt/model/restaurant_detail_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Image img;
  final String name;
  final String detail;
  final int price;

  const ProductCard({
    super.key,
    required this.img,
    required this.name,
    required this.detail,
    required this.price,
  });

  factory ProductCard.fromModel({
    required ProductModel model,
  }) {
    return ProductCard(
      img: Image.network(
        model.imgUrl,
        width: 110,
        height: 110,
        fit: BoxFit.cover,
      ),
      name: model.name,
      detail: model.detail,
      price: model.price,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: img,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                detail,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: BODY_TEXT_COLOR,
                ),
              ),
              Text(
                '$price',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 12,
                  color: PRIMARY_COLOR,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
