import 'package:flutter/material.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/cards/progress_card.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/drawer/app_drawer.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/grid/grid.dart';

class HomePage extends StatelessWidget {
  final Function(Locale) changeLocale;

  HomePage({Key? key, required this.changeLocale}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// ElevatedButton(
          //   onPressed: () => changeLocale(Locale('en')),
          //   child: const Text('Switch to English'),
          // ),
          // ElevatedButton(
          //   onPressed: () => changeLocale(Locale('ml')),
          //   child: const Text('Switch to Malayalam'),
          // ),
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gridData = [
      {
        'color': Color(0xFFB3E5FC),
        'icon': Icons.info,
        'title': 'When to act early'
      },
      {
        'color': Color(0xFFF8BBD0),
        'icon': Icons.star,
        'title': "My Child's Summary"
      },
      {
        'color': Color(0xFFAED581),
        'icon': Icons.abc,
        'title': 'Tips & Activities'
      },
      {
        'color': Color(0xFFD1C4E9),
        'icon': Icons.book,
        'title': 'Helpful Resources'
      },
      {
        'color': Color(0xFFFFCCBC),
        'icon': Icons.schedule,
        'title': 'Track Milestones' 
      },
      {'color': Color(0xFF80DEEA), 'icon': Icons.help, 'title': 'Get Support'},
    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        }, 
        icon: const Icon(Icons.menu)),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.child_care_outlined,
                        size: 100,
                        color: const Color.fromARGB(255, 213, 228, 255),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                  child: Column(
                children: [
                  Text(
                    'Noufal Rahim',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'is 2 months old!',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              )),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 225, 136),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            'The first checklist is for age 2 months. Click the menu button to take a look at the Milestone Overview for a peak ahead',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )),
              ProgressCard(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: ColoredGrid(
                    gridData: gridData,
                    crossAxisCount: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
