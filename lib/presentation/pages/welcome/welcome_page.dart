import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/button/primary_button.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/iconContainer/icon_container.dart';


class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconContainer(),
                    const SizedBox(height: 30),
                    const Text(
                      'Tiny Steps',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 300,
                      child: Builder(
                        builder: (context) {
                          return Text(
                            '"Not just for newborn babies, but for newborn parents too!"',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  text: "Get Started",
                  onPressed: () {
                    context.push('/setup');
                  },
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  textColor: Colors.white,
                  borderRadius: 16,
                  elevation: 6.0,
                  shadowColor: Colors.white54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
