import 'package:flutter/material.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/cards/primary_card.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 37.5,
                        backgroundColor: Colors.blueGrey,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Noufal Rahim',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '2 Months',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: PrimaryCard(
                        items: [
                          Item(
                              icon: Icons.account_circle,
                              title: 'Switch Account',
                              onTap: () => print('Profile tapped')),
                          Item(
                              icon: Icons.add,
                              title: 'Add Account',
                              onTap: () => print('Add Account tapped')),
                          Item(
                              icon: Icons.edit,
                              title: 'Edit Profile',
                              onTap: () => print('Edit Profile tapped')),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    PrimaryCard(
                      items: [
                        Item(
                            icon: Icons.account_circle,
                            title: 'Liam Doe',
                            onTap: () => print('Liam Doe')),
                        Item(
                            icon: Icons.account_circle,
                            title: 'Olivia Jones',
                            onTap: () => print('Olivia Jones tapped')),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Footer Section
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    size: 20,
                  ),
                  title: const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    size: 20,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
