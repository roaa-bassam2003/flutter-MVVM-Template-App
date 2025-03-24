import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';

class ProviderCard extends StatelessWidget {
  final Provider provider; // استقبال الـ Provider object
  final VoidCallback? onTap; // الـ onTap للتنقل

  const ProviderCard({
    super.key,
    required this.provider,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Card(
            color: Colors.transparent, // يجعل الخلفية شفافة
            elevation: 0, // يزيل الظل
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(provider.imagePath),
                radius: 20,
                child: provider.imagePath.isEmpty
                    ? const Icon(Icons.person, color: Colors.grey)
                    : null,
              ),
              title: Text(
                provider.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              subtitle: Row(
                children: _buildRatingStars(provider.rating),
              ),
              trailing: Text(
                '${provider.price.toInt()} LE/hr',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.primary,
                ),
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
