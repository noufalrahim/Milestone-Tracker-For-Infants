import 'package:flutter/material.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/cards/primary_card.dart';

class SettingsPage extends StatelessWidget {
  final Function(Locale) changeLocale;

  const SettingsPage({super.key, required this.changeLocale});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settingsData1 = [
      {
        'icon': Icons.notification_add,
        'title': 'Notification',
        'onTap': () {
          // Add functionality for Notification
        },
      },
      {
        'icon': Icons.language,
        'title': 'Language',
        'onTap': () {
          // Add functionality for Language change
        },
      },
      {
        'icon': Icons.star,
        'title': 'Rate App',
        'onTap': () {
          // Add functionality for Rate App
        },
      },
      {
        'icon': Icons.share,
        'title': 'Share App',
        'onTap': () {
          // Add functionality for Share App
        },
      }
    ];

    final List<Map<String, dynamic>> settingsData2 = [
      {
        'icon': Icons.privacy_tip,
        'title': 'Privacy Policy',
        'onTap': () {
          // Add functionality for Privacy Policy
        },
      },
      {
        'icon': Icons.file_copy,
        'title': 'Terms & Conditions',
        'onTap': () {
          // Add functionality for Terms & Conditions
        },
      },
    ];

    final List<Map<String, dynamic>> settingsData3 = [
      {
        'icon': Icons.mail,
        'title': 'Contact Us',
        'onTap': () {
          // Add functionality for Contact Us
        },
      },
      {
        'icon': Icons.delete,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              PrimaryCard(
                items: settingsData1
                    .map((item) => Item(
                          icon: item['icon'],
                          title: item['title'],
                          onTap: item['onTap'],
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              PrimaryCard(
                items: settingsData2
                    .map((item) => Item(
                          icon: item['icon'],
                          title: item['title'],
                          onTap: item['onTap'],
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              PrimaryCard(
                items: settingsData3
                    .map((item) => Item(
                          icon: item['icon'],
                          title: item['title'],
                          onTap: item['onTap'],
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
