import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProgressBar extends StatelessWidget {

  final category;
  final currIndex;
  final totalLength;

  const ProgressBar({super.key, required this.category, required this.currIndex, required this.totalLength});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.green.shade300
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$currIndex/$totalLength', style: TextStyle(color: Colors.black)),
                Text( localizations.social, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
                Text('0.9%', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}