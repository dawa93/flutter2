import 'package:app/common/const/data.dart';
import 'package:app/restaurnt/component/restaurant_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> paginateRestaurant() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN);

    final res = await dio.get(
      'http://$ip/restaurant',
      options: Options(
        headers: {
          'authorization': 'Bearer $accessToken',
        },
      ),
    );

    return res.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder<List>(
          future: paginateRestaurant(),
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                final item = snapshot.data![index];

                return RestaurantCard(
                  img: Image.network(
                    'http://$ip${item['thumbUrl']}',
                    fit: BoxFit.cover,
                  ),
                  name: item['name'],
                  tags: List<String>.from(item[
                      'tags']), // List<dynamic> 에러가 나올때, 해결하는 방법 => List<String>.from(item)
                  ratingsCount: item['ratingsCount'],
                  deliveryTime: item['deliveryTime'],
                  deliveryFee: item['deliveryFee'],
                  ratings: item['ratings'],
                );
              },
              separatorBuilder: (_, index) {
                return const SizedBox(
                  height: 16,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
