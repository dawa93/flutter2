import 'package:app/common/layout/default_layout.dart';
import 'package:app/restaurnt/component/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '불타는 떡볶이',
      child: Column(
        children: [
          RestaurantCard(
              img: Image.asset('asset/img/food/ddeok_bok_gi.jpg'),
              name: '불타는',
              tags: const ['매움'],
              ratingsCount: 1000,
              deliveryTime: 2222,
              deliveryFee: 3333,
              ratings: 412,
              isDetail: true,
              detail: '맛있는 떡볶이'),
        ],
      ),
    );
  }
}
