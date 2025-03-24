import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class CompletedTab extends StatefulWidget {
  const CompletedTab({super.key});

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          6,
          (index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _card(),
              if (index < 5)
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
    );
  }

  Widget _card() {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kalini Jithma',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Egypt, North Sini, Arish, See Street',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Saturday :\n7 am - 8 am\n8 am - 9 am',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}