import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final Function(Locale) changeLocale;

  const SettingsPage({Key? key, required this.changeLocale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settingsData = [
      {
        'leadingIcon': Icons.notification_add,
        'title': 'Notification',
        'onTap': () {
          // Add functionality for Notification
        },
      },
      {
        'leadingIcon': Icons.language,
        'title': 'Language',
        'onTap': () {
          // Add functionality for Language change
        },
      },
      {
        'leadingIcon': Icons.star,
        'title': 'Rate App',
        'onTap': () {
          // Add functionality for Rate App
        },
      },
      {
        'leadingIcon': Icons.share,
        'title': 'Share App',
        'onTap': () {
          // Add functionality for Share App
        },
      },
      {
        'leadingIcon': Icons.privacy_tip,
        'title': 'Privacy Policy',
        'onTap': () {
          // Add functionality for Privacy Policy
        },
      },
      {
        'leadingIcon': Icons.file_copy,
        'title': 'Terms & Conditions',
        'onTap': () {
          // Add functionality for Terms & Conditions
        },
      },
      {
        'leadingIcon': Icons.mail,
        'title': 'Contact Us',
        'onTap': () {
          // Add functionality for Contact Us
        },
      },
      {
        'leadingIcon': Icons.delete,
        'title': 'Delete Account',
        'onTap': () {
          // Add functionality for Delete Account
        },
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          itemCount: settingsData.length,
          itemBuilder: (context, index) {
            final item = settingsData[index];
            return Column(
              children: [
                ListTile(
                  leading: Icon(
                    item['leadingIcon'],
                    color: Colors.grey,
                  ),
                  title: Text(
                    item['title'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onTap: item['onTap'],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
