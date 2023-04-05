import '../../common/const/data.dart';

enum RestaurantPriceRange { expensive, medium, cheap }

class RestaurantModel {
  final String id;
  final String name;
  final String thumbUrl;
  final List<String> tags;
  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.ratings,
    required this.ratingsCount,
  });

  factory RestaurantModel.fromJson({required Map<String, dynamic> json}) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      thumbUrl: 'http://$ip${json['thumbUrl']}',
      tags: List<String>.from(json[
          'tags']), // List<dynamic> 에러가 나올때, 해결하는 방법 => List<String>.from(json)
      priceRange: RestaurantPriceRange.values
          .firstWhere((e) => e.name == json['priceRange']),
      deliveryFee: json['deliveryFee'],
      deliveryTime: json['deliveryTime'],
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
    );
  }
}
