import 'package:flutter/material.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return NewTaskCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewTaskCard extends StatelessWidget {
  const NewTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        subtitle: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subtitle'),
            Text('Date: 11/11/2025'),
            Row(
              children: [
                Chip(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  label: Text('Cancel', style: TextStyle(color: Colors.white)),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.green),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
        title: Text('Title'),
      ),
    );
  }
}
