import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/home/widgets/home_service_card.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: AppSize.s12,
              ),

              //Pet Care Card
              HomeServiceCard(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.addressDetailsRoute,
                    arguments: AppStrings.homeTitle1,
                  );
                },
                title: AppStrings.homeTitle1,
                // subtitle: AppStrings.homeSubTitle1,
                backgroundImage: ImageAssets.petCareImage,
              ),

              //Nurse Card
              HomeServiceCard(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.addressDetailsRoute,
                    arguments: AppStrings.homeTitle2,
                  );
                },
                title: AppStrings.homeTitle2,
                // subtitle: AppStrings.homeSubTitle2,
                backgroundImage: ImageAssets.nurseImage,
              ),
              //Elderly Care Card
              HomeServiceCard(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.addressDetailsRoute,
                    arguments: AppStrings.homeTitle3,
                  );
                },
                title: AppStrings.homeTitle3,
                // subtitle: AppStrings.homeSubTitle3,
                backgroundImage: ImageAssets.houseKeeperImage,
              ),
              //Babysitter Card
              HomeServiceCard(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.addressDetailsRoute,
                    arguments: AppStrings.homeTitle4,
                  );
                },
                title: AppStrings.homeTitle4,
                // subtitle: AppStrings.homeSubTitle4,
                backgroundImage: ImageAssets.babysitterImage,
              ),
              const SizedBox(
                height: AppSize.s5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center homeAppBar() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p8),
        child: Text(
          AppStrings.appBarHomeTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
