import 'package:flutter/material.dart';
import 'package:flutterfront/core/constants/app_colors.dart';
import 'package:flutterfront/features/agents/views/list_agents_view.dart';
import 'package:flutterfront/features/home/views/home_view.dart';

// Import your pages

class RouterPage extends StatefulWidget {
  const RouterPage({super.key});

  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  // Current page index
  int _currentIndex = 0;

  // List of pages
  final List<Widget> _pages = [
    const HomeView(),
    const ListAgentsView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "REAL ESTATE",
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.text),
        ),
        backgroundColor: AppColors.accent,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white70),
            onPressed: () {
              // Open modal
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return SizedBox(
                    height: 250,
                    child: Column(
                      children: const [
                        SizedBox(height: 20),
                        Text(
                          "Profile Modal",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text("Settings"),
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text("Logout"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),

      body: _pages[_currentIndex], // Display selected page

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: PhysicalModel(
            color: Colors.transparent,
            shadowColor: Colors.black,
            elevation: 8,
            borderRadius: BorderRadius.circular(30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                height: 60,
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  backgroundColor: AppColors.accent,
                  selectedItemColor: AppColors.text,
                  unselectedItemColor: Colors.white70,
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_pin_circle_sharp),
                      label: 'Agents',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.location_city),
                      label: 'propertys',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat_bubble),
                      label: 'chats',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'saved',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
