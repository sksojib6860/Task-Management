import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import 'cancel_task_screen.dart';
import 'complete_task_screen.dart';
import 'new-task-screen.dart';
import 'progress_task_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});
  static String name = '/navigation-bar-screen';

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    NewTaskListScreenN(),
    CompleteTaskScreen(),
    CancelTaskScreen(),
    ProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
        labelPadding: EdgeInsets.zero,
        onDestinationSelected: (int index) {
          selectedIndex = index;
          setState(() {});
        },
        backgroundColor: Colors.green[200],
        indicatorColor: Colors.green,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.task_rounded),
            label: 'New Task',
          ),
          NavigationDestination(
            icon: Icon(Icons.task_rounded),
            label: 'Complete',
          ),
          NavigationDestination(
            icon: Icon(Icons.task_rounded),
            label: 'Cancel',
          ),
          NavigationDestination(
            icon: Icon(Icons.task_rounded),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}
