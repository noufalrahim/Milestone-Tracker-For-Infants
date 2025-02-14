import 'package:flutter/material.dart';

class PrimaryCard extends StatelessWidget {

  final List<Item> items;

  const PrimaryCard({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card (
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: items.map((item) {
              return ListTile(
                leading: Icon(item.icon),
                title: Text(item.title, style: const TextStyle(fontSize: 14)),
                onTap: item.onTap,
                trailing: const Icon(Icons.arrow_forward_ios, size: 10,),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class Item {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  Item({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}