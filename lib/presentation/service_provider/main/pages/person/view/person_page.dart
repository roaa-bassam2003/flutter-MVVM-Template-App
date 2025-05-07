import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_list_tile.dart';
import 'package:iconsax/iconsax.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p8,
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Profile Picture
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/person.jpg'),
                ),
                const SizedBox(height: 10),
                // User Name
                Text(
                  'Mohamed Hassan',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                // User Handle
                Text(
                  '@sp_2025',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: AppSize.s10),
                // stars
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 4.0.floor() ? Icons.star : Icons.star_border,
                      color: ColorManager.myAmber,
                      size: 22,
                    );
                  }),
                ),
                const SizedBox(height: AppSize.s10),
                // List of Profile Options
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CustomListTile(
                      title: AppStrings.myInfo,
                      icon: Iconsax.user,
                      onTap: () => Navigator.pushNamed(
                          context, ProviderRoutes.pEditProfileView),
                    ),
                    CustomListTile(
                      title: AppStrings.theWorkFlow,
                      icon: Iconsax.coin,
                      onTap: () => Navigator.pushNamed(
                          context, ProviderRoutes.workFlowSpecification),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
