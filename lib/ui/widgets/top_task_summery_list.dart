import 'package:flutter/material.dart';

class TopTaskSummeryLIstView extends StatelessWidget {
  const TopTaskSummeryLIstView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(left: 8),
          elevation: 0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                Text('10', style: TextTheme.of(context).titleLarge),
                Text('New Task', style: TextTheme.of(context).labelSmall),
              ],
            ),
          ),
        );
      },
    );
  }
}
