import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/button/primary_button.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/iconContainer/icon_container.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/input/primary_text_field.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String selectedValue = "Girl"; // Default radio selection
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_left,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Prevent unnecessary stretching
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to start
            children: [
              const Center(child: IconContainer()),
              const SizedBox(height: 10),
              const PrimaryTextField(
                label: 'First Name',
                hintText: 'John',
              ),
              const SizedBox(height: 20),
              const PrimaryTextField(
                label: 'Last Name',
                hintText: 'Doe',
              ),
              const SizedBox(height: 20),
              const PrimaryTextField(
                label: 'Date of Birth',
                hintText: '11/11/2025',
              ),
              const SizedBox(height: 20),

              // Gender Selection
              const Text(
                'Gender',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Girl"),
                    leading: Radio(
                      value: "Girl",
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value.toString();
                        });
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Boy"),
                    leading: Radio(
                      value: "Boy",
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Checkbox
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "Was your baby born prematurely?",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              PrimaryTextField(label: 'No. of weeks of premature', hintText: '3',),
              SizedBox(height: 20,),
              PrimaryButton(text: 'Continue', onPressed: () {
                context.go('/');
              })
            ],
          ),
        ),
      ),
    );
  }
}
