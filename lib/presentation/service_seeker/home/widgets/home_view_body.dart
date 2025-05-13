import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/home/widgets/home_service_card.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //AppBar
            homeAppBar(),

            //Pet Care Card
            HomeServiceCard(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.addressDetailsRoute,
                  arguments: 'Pet Care',
                );
              },
              title: AppStrings.homeTitle1,
              subtitle: AppStrings.homeSubTitle1,
              backgroundImage: ImageAssets.petCareImage,
            ),

            //Nurse Card
            HomeServiceCard(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.addressDetailsRoute,
                  arguments: 'Nurse',
                );
              },
              title: AppStrings.homeTitle2,
              subtitle: AppStrings.homeSubTitle2,
              backgroundImage: ImageAssets.nurseImage,
            ),
            //Elderly Care Card
            HomeServiceCard(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.addressDetailsRoute,
                  arguments: 'Elderly Care',
                );
              },
              title: AppStrings.homeTitle3,
              subtitle: AppStrings.homeSubTitle3,
              backgroundImage: ImageAssets.elderlyCareImage,
            ),
            //Babysitter Card
            HomeServiceCard(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.addressDetailsRoute,
                  arguments: 'Babysitter',
                );
              },
              title: AppStrings.homeTitle4,
              subtitle: AppStrings.homeSubTitle4,
              backgroundImage: ImageAssets.babysitterImage,
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Center homeAppBar() {
    return Center(
        child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: Text(
            AppStrings.appBarHomeTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 5),
        //homeMainTitle
        Text(
          AppStrings.homeMainTitle,
          style: TextStyle(
            color: ColorManager.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ));
  }
}
