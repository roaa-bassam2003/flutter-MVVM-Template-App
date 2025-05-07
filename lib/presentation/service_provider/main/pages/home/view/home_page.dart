import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/service_provider/tabs/Bookings_tab.dart';
import 'package:flutter_advanced_course/presentation/service_provider/tabs/cancelled_tab.dart';
import 'package:flutter_advanced_course/presentation/service_provider/tabs/completed_tab.dart';
import 'package:flutter_advanced_course/presentation/service_provider/tabs/requests_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  backgroundColor: ColorManager.white,
                  automaticallyImplyLeading: false,
                  shape: Border(
                    bottom: BorderSide(
                      width: 4,
                      color: ColorManager.grey.withOpacity(.1),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0),
                    child: _tab(),
                  ),
                )
              ],
          body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                BookingsTab(),
                CancelledTab(),
                CompletedTab(),
                RequestsTab(),
              ])),
    );
  }

  TabBar _tab() {
    return TabBar(
        unselectedLabelColor: ColorManager.grey,
        labelColor: ColorManager.white,
        indicatorColor: ColorManager.primary,
        indicatorWeight: 3,
        // isScrollable: true,
        // padding: const EdgeInsets.only(left: 0, right: 24),
        // labelPadding: const EdgeInsets.only(left: 0, right: 20),
        // physics: const ClampingScrollPhysics(),
        tabs: [
          _tabItem(label: AppStrings.bookings),
          _tabItem(label: AppStrings.cancelled),
          _tabItem(label: AppStrings.completed),
          _tabItem(label: AppStrings.requests),
        ]);
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
