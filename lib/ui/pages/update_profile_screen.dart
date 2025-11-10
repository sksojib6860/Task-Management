import 'package:flutter/material.dart';

import '../widgets/sceen_background.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});
  static String name = '/update-profile-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              const SizedBox(height: 60),
              Text(
                'Update Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              TextField(decoration: InputDecoration(hintText: 'Email')),
              TextField(decoration: InputDecoration(hintText: 'First Name')),
              TextField(decoration: InputDecoration(hintText: 'Last Name')),
              TextField(decoration: InputDecoration(hintText: 'Mobile Number')),
              TextField(decoration: InputDecoration(hintText: 'Password')),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: onTapUpdateProfile,
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void onTapUpdateProfile() {}
}
