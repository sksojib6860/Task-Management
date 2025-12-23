import 'package:flutter/material.dart';
import 'package:task_manager_app/api/models/tasklist.dart';
import 'package:task_manager_app/api/service/network_caller.dart';
import 'package:task_manager_app/api/utils/urls.dart';
import 'package:task_manager_app/ui/widgets/show_snack_bar.dart';

import '../widgets/new_task_card.dart';
import '../widgets/top_task_summery_list.dart';
import 'add_new_task_screen.dart';

class NewTaskListScreenN extends StatefulWidget {
  const NewTaskListScreenN({super.key});

  @override
  State<NewTaskListScreenN> createState() => _NewTaskListScreenNState();
}

class _NewTaskListScreenNState extends State<NewTaskListScreenN> {
  bool _getTaskCountInProgress = false;
  List<TaskCountModel> _taskCountList = [];

  @override
  void initState() {
    _getNewTaskList();
    super.initState();
  }

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
              child: Visibility(
                visible: _getTaskCountInProgress == false,
                replacement: Center(child: CircularProgressIndicator()),
                child: ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return NewTaskCard(taskModel: _taskCountList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemCount: _taskCountList.length,
                ),
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

  Future<void> _getNewTaskList() async {
    _getTaskCountInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkClient.getRequest(
      Urls.newTaskListUrl,
    );
    if (response.isSuccess) {
      List<TaskCountModel> list = [];
      for (Map<String, dynamic> jsonData in response.body['data']) {
        list.add(TaskCountModel.fromJson(jsonData));
      }
      _taskCountList = list;
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }

    _getTaskCountInProgress = false;
    setState(() {});
  }
}
