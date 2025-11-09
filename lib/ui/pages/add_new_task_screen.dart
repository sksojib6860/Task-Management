import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/appbar_widget.dart';
import 'package:task_manager_app/utils/sceen_background.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});
  static String name = '/add-new-task-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              const SizedBox(height: 40),
              Text('Add New Task', style: TextTheme.of(context).titleLarge),
              TextField(decoration: InputDecoration(hintText: 'Subject')),
              TextField(
                maxLines: 6,
                decoration: InputDecoration(
                  helperMaxLines: 10,
                  hintMaxLines: 10,
                  hintText: 'Description',
                ),
              ),
              const SizedBox(height: 30),
              FilledButton(
                onPressed: () {},
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
