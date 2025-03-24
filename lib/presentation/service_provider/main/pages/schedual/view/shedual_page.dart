import 'package:flutter/material.dart';
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
        return 'Saturday';
      case WeekDay.sunday:
        return 'Sunday';
      case WeekDay.monday:
        return 'Monday';
      case WeekDay.tuesday:
        return 'Tuesday';
      case WeekDay.wednesday:
        return 'Wednesday';
      case WeekDay.thursday:
        return 'Thursday';
      case WeekDay.friday:
        return 'Friday';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          days.length,
          (index) => InkWell(
            onTap: () => _onDayTapped(days[index]),
            splashColor: Colors.grey.withOpacity(0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSize.s12),
                  child: Text(
                    _getDayName(days[index]),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  indent: 16,
                  endIndent: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}