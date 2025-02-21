import 'package:flutter/material.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/bar/progress_bar.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/cards/milestone_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/cards/question_card.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MilestonesPage extends StatefulWidget {
  const MilestonesPage({super.key});

  @override
  State<MilestonesPage> createState() => _MilestonePageState();
}

class _MilestonePageState extends State<MilestonesPage> {
  
  int currentIndex = 0;
  String currentCategory = 'social';
  int totalLength = 0;

  List<dynamic> questions = [];
  bool isLoading = true;
  
  void goToNextQuestion () {
    setState(() {
      currentIndex++;
    });
  }

  void goToPrevQuestion () {
    setState(() {
      if(currentIndex > 0) currentIndex--;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final url = Uri.parse('http://172.20.10.4:3000/questions');

    try {
      final response = await http.get(url, headers: {'Accept': 'application/json'});
      if (response.statusCode == 200) {
        final decodedString =
            Utf8Decoder().convert(response.bodyBytes); // Ensure UTF-8 decoding
        final Map<String, dynamic> data = jsonDecode(decodedString);

        // Extract 'social' questions only
        final List<dynamic> questionCategory = data[currentCategory] ?? [];

        setState(() {
          questions = questionCategory;
          isLoading = false;
          totalLength = data.length;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print('Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('An error occurred: $e');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Milestones'),
        automaticallyImplyLeading: false
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SizedBox(
              height: 30.0,
              child: ListView(
                scrollDirection:
                    Axis.horizontal,
                children: [
                  MilestonePageIndicator(
                      label: localizations.social, 
                      color: Colors.red.shade500,
                      onPressed: () {
                        setState(() {
                          currentCategory = 'social';
                          currentIndex = 0;
                        });
                      },
                  ),
                  MilestonePageIndicator(
                      label: localizations.language, 
                      color: Colors.blue.shade300,
                      onPressed: () {
                        setState(() {
                          currentCategory = 'language';
                          currentIndex = 0;
                        });
                      },
                  ),
                  MilestonePageIndicator(
                      label: localizations.cognitive, 
                      color: Colors.green,
                      onPressed: () {
                        setState(() {
                          currentCategory = 'cognitive';
                          currentIndex = 0;
                        });
                      },
                  ),
                  MilestonePageIndicator(
                      label: localizations.movement, 
                      color: Colors.orange.shade300,
                      onPressed: () {
                        setState(() {
                          currentCategory = 'movement';
                          currentIndex = 0;
                        });
                      },
                  ),
                  MilestonePageIndicator(
                      label: localizations.when_to_act_early,
                      color: Colors.purple.shade300,
                      onPressed: () {
                        setState(() {
                          currentCategory = 'when_to_act_early';
                          currentIndex = 0;
                        });
                      },
                  ),
                ],
              ),
            ),
          ),
          // Progress bar
          ProgressBar(
            category: currentCategory,
            currIndex: currentIndex + 1,
            totalLength: totalLength,
          ),
          // Correctly using Expanded for the remaining space
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuestionCard(
                    key: ValueKey('$currentCategory-$currentIndex-$isLoading-$questions'),
                    index: currentIndex,
                    category: currentCategory,
                    isLoading: isLoading,
                    questions: questions,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding:
                                EdgeInsets.zero, // Ensures no extra padding
                            shape: const CircleBorder(),
                            backgroundColor: Color(0xFFAED581),
                          ),
                          onPressed: goToPrevQuestion,
                          child: const Center(
                            // Ensures the icon is centered
                            child: Icon(
                              Icons.arrow_left,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Color(0xFFFFCCBC),
                          ),
                          onPressed: () {
                            // No button action
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Color(0xFFD1C4E9),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Yes',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const CircleBorder(),
                            backgroundColor: Color(0xFFAED581),
                          ),
                          onPressed: goToNextQuestion,
                          child: const Center(
                            child: Icon(
                              Icons.arrow_right,
                              size: 30, // Adjust size if needed
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
