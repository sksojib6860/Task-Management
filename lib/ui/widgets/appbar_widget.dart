import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/controllers/auth_controller.dart';
import 'package:task_manager_app/ui/pages/signIn_screen.dart';
import 'package:task_manager_app/ui/pages/update_profile_screen.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key, this.updateProfile = false});
  final bool updateProfile;
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
          ///this updateProfile used only don't have update profile clickable///
          if (updateProfile) {
            return;
          }
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
      actions: [
        IconButton(
          onPressed: () async {
            await AuthController.clearUserData();
            Navigator.pushNamedAndRemoveUntil(
              context,
              SigninScreen.name,
              (predicate) => false,
            );
          },
          iconSize: 25,
          icon: Icon(Icons.login_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
