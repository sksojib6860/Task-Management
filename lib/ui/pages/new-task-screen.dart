import 'package:flutter/material.dart';

import '../widgets/new_task_card.dart';
import '../widgets/top_task_summery_list.dart';
import 'add_new_task_screen.dart';

class NewTaskListScreenN extends StatefulWidget {
  const NewTaskListScreenN({super.key});

  @override
  State<NewTaskListScreenN> createState() => _NewTaskListScreenNState();
}

class _NewTaskListScreenNState extends State<NewTaskListScreenN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            const SizedBox(),
            SizedBox(height: 80, child: TopTaskSummeryLIstView()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return NewTaskCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: 10,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: _onTapAddNewTaskButton,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _onTapAddNewTaskButton() {
    Navigator.pushNamed(context, AddNewTaskScreen.name);
  }
}
