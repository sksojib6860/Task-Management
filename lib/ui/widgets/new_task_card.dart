import 'package:flutter/material.dart';

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
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  label: Text('New', style: TextStyle(color: Colors.white)),
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
