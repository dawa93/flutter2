import 'package:app/common/const/colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'asset/img/food/ddeok_bok_gi.jpg',
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '떡볶이',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '전통 떡복이의 정석\n맛있습니다. 네네 너무너무 너무너무 맛있어요 ~~~~~ ㅎㅎㅎ 너도 먹어보세요 ~~',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: BODY_TEXT_COLOR,
                ),
              ),
              Text(
                '\$100',
                textAlign: TextAlign.right,
                style: TextStyle(
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
