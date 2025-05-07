import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import '../../../../day_specification/day_specification.dart';

enum WeekDay {
  saturday,
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
}

class ShedualPage extends StatefulWidget {
  const ShedualPage({super.key});

  @override
  State<ShedualPage> createState() => _ShedualPageState();
}

class _ShedualPageState extends State<ShedualPage> {
  String _getDayName(WeekDay day) {
    switch (day) {
      case WeekDay.saturday:
        return AppStrings.saturday;
      case WeekDay.sunday:
        return AppStrings.sunday;
      case WeekDay.monday:
        return AppStrings.monday;
      case WeekDay.tuesday:
        return AppStrings.tuesday;
      case WeekDay.wednesday:
        return AppStrings.wednesday;
      case WeekDay.thursday:
        return AppStrings.thursday;
      case WeekDay.friday:
        return AppStrings.friday;
    }
  }

  void _onDayTapped(WeekDay day) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DaySpecification(selectedDay: _getDayName(day)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const List<WeekDay> days = WeekDay.values;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            days.length,
            (index) => InkWell(
              onTap: () => _onDayTapped(days[index]),
              splashColor: ColorManager.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSize.s12),
                    child: Text(
                      _getDayName(days[index]),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Divider(
                    color: ColorManager.lightGrey,
                    height: AppSize.s0,
                    endIndent: AppSize.s20,
                    indent: AppSize.s10,
                    thickness: AppSize.s1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
