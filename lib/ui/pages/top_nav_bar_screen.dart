import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/pages/add_new_task_screen.dart';

import '../../utils/appbar_widget.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});
  static String name = '/navigation-bar-screen';

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
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
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.green,
        onPressed: floatingActinButton,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void floatingActinButton() {
    Navigator.pushNamed(context, AddNewTaskScreen.name);
  }
}
