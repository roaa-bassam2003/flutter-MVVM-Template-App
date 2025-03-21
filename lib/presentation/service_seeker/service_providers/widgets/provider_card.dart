import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';

class ProviderCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final double rating;
  final double price;

  const ProviderCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.transparent, // يجعل الخلفية شفافة
          elevation: 0, // يزيل الظل
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 20,
              child: imagePath.isEmpty
                  ? const Icon(Icons.person, color: Colors.grey)
                  : null,
            ),
            title: Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            subtitle: Row(
              children: _buildRatingStars(rating),
            ),
            trailing: Text(
              '${price.toInt()} LE/hr',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorManager.primary,
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.grey,
          height: 0,
          endIndent: 20,
          indent: 10,
          thickness: 1,
        )
      ],
    );
  }

  List<Widget> _buildRatingStars(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    for (int i = 0; i < fullStars; i++) {
      stars.add(
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
      );
    }

    if (hasHalfStar) {
      stars.add(
        const Icon(
          Icons.star_half,
          color: Colors.yellow,
          size: 20,
        ),
      );
    }

    for (int i = 0; i < emptyStars; i++) {
      stars.add(
        const Icon(
          Icons.star_border,
          color: Colors.grey,
          size: 20,
        ),
      );
    }

    return stars;
  }
}
