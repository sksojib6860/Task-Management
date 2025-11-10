import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/pages/update_profile_screen.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      toolbarHeight: 55,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      titleSpacing: 20,
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, UpdateProfileScreen.name);
        },
        child: Row(
          spacing: 12,
          children: [
            CircleAvatar(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Ready',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
                Text(
                  'example@gmail.com',
                  style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
