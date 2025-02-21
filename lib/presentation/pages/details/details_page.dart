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
  String selectedGender = "Girl"; // Default selection
  bool isPremature = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.chevron_left, color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: IconContainer()),
              const SizedBox(height: 10),
              const PrimaryTextField(label: 'First Name', hintText: 'John'),
              const SizedBox(height: 20),
              const PrimaryTextField(label: 'Last Name', hintText: 'Doe'),
              const SizedBox(height: 20),
              const PrimaryTextField(label: 'Date of Birth', hintText: '11/11/2025'),
              const SizedBox(height: 20),

              // Gender Selection
              const Text('Gender', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              _buildRadioTile("Girl"),
              _buildRadioTile("Boy"),
              const SizedBox(height: 20),

              // Checkbox
              Row(
                children: [
                  Checkbox(
                    value: isPremature,
                    onChanged: (value) => setState(() => isPremature = value!),
                  ),
                  const Expanded(child: Text("Was your baby born prematurely?", style: TextStyle(fontSize: 16))),
                ],
              ),
              if (isPremature) ...[
                const SizedBox(height: 20),
                const PrimaryTextField(label: 'No. of weeks of premature', hintText: '3'),
              ],
              const SizedBox(height: 20),

              PrimaryButton(text: 'Continue', onPressed: () => context.go('/')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioTile(String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(value),
      leading: Radio<String>(
        value: value,
        groupValue: selectedGender,
        onChanged: (newValue) => setState(() => selectedGender = newValue!),
      ),
    );
  }
}
