import 'package:flutter/material.dart';
import 'package:task_manager_app/api/service/network_caller.dart';
import 'package:task_manager_app/api/utils/urls.dart';
import 'package:task_manager_app/ui/pages/top_nav_bar_screen.dart';
import 'package:task_manager_app/ui/widgets/appbar_widget.dart';
import 'package:task_manager_app/ui/widgets/sceen_background.dart';

import '../widgets/show_snack_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});
  static String name = '/add-new-task-screen';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subjectTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _inProgressIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                const SizedBox(height: 40),
                Text('Add New Task', style: TextTheme.of(context).titleLarge),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Subject is required';
                    }
                    return null;
                  },
                  controller: _subjectTEController,
                  decoration: InputDecoration(hintText: 'Subject'),
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Description is required';
                    }
                    return null;
                  },
                  controller: _descriptionTEController,
                  maxLines: 6,
                  decoration: InputDecoration(
                    helperMaxLines: 10,
                    hintMaxLines: 10,
                    hintText: 'Description',
                  ),
                ),
                const SizedBox(height: 30),
                Visibility(
                  visible: _inProgressIndicator == false,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: FilledButton(
                    onPressed: onTapAddNewTask,
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapAddNewTask() {
    if (_formKey.currentState!.validate()) {
      ///call api
      _addNewTask();
    }
  }

  Future<void> _addNewTask() async {
    _inProgressIndicator = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "title": _subjectTEController.text.trim(),
      "description": _descriptionTEController.text.trim(),
      "status": "New",
    };

    final NetworkResponse response = await NetworkClient.postRequest(
      Urls.createTaskUrl,
      body: requestBody,
    );
    _inProgressIndicator = false;
    setState(() {});
    if (response.isSuccess) {
      clearCtr();
      showSnackBarMessage(context, 'Task added successfully');
      Navigator.pushNamed(context, NavigationBarScreen.name);
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }
  }

  void clearCtr() {
    _subjectTEController.clear();
    _descriptionTEController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subjectTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
