import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/service_provider/tabs/booking/bookings_tab.dart';
import 'package:flutter_advanced_course/presentation/service_provider/tabs/cancelled/cancelled_tab.dart';
import 'package:flutter_advanced_course/presentation/service_provider/tabs/complete/completed_tab.dart';
import 'package:flutter_advanced_course/presentation/service_provider/tabs/paid/paid_tab.dart';
import 'package:flutter_advanced_course/presentation/service_provider/tabs/rejected/rejected_tab.dart';
import 'package:flutter_advanced_course/presentation/service_provider/tabs/request/requests_tab.dart';

// lib\presentation\service_provider\tabs\booking\bookings_tab.dart

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
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
                      color: ColorManager.grey.withValues(alpha: 0.1),
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
                PaidTab(),
                RejectedTab(),
              ])),
    );
  }

  TabBar _tab() {
    return TabBar(
        unselectedLabelColor: ColorManager.grey,
        labelColor: ColorManager.white,
        indicatorColor: ColorManager.primary,
        indicatorWeight: 3,
        isScrollable: true,
        padding: const EdgeInsets.only(left: 12, right: 12),
        labelPadding: const EdgeInsets.only(left: 20, right: 20),
        physics: const ClampingScrollPhysics(),
        tabs: [
          _tabItem(label: AppStrings.bookings),
          _tabItem(label: AppStrings.cancelled),
          _tabItem(label: AppStrings.completed),
          _tabItem(label: AppStrings.requests),
          _tabItem(label: 'Paid'),
          _tabItem(label: 'Rejected'),
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
