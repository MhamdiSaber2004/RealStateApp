import 'package:flutter/material.dart';
import 'package:flutterfront/core/constants/app_colors.dart';
import 'package:flutterfront/features/agents/views/list_agents_view.dart';
import 'package:flutterfront/features/auth/views/login_view.dart';
import 'package:flutterfront/features/auth/views/profil_view.dart';
import 'package:flutterfront/features/auth/views/registre_view.dart';
import 'package:flutterfront/features/chats/views/list_chat_view.dart';
import 'package:flutterfront/features/favorit/views/list_favorit_view.dart';
import 'package:flutterfront/features/home/views/home_view.dart';
import 'package:flutterfront/features/propertys/views/list_property_view.dart';

class RouterPage extends StatefulWidget {
  const RouterPage({super.key});

  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  // Current page index
  int _currentIndex = 0;
  bool isLogin = true;

  final List<Widget> _pages = [
    const HomeView(),
    const ListAgentsPage(),
    const ListPropertyPage(),
    const ListChatPage(),
    const ListFavoritPage(),
    const ProfilePage(),
  ];

  // --- Function to show Auth Modal (Login / Signup) ---
  void _showAuthModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: 220,
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.icon,
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.login, color: AppColors.icon),
                title: const Text(
                  "Login",
                  style: TextStyle(color: AppColors.icon),
                ),
                onTap: () {
                  setState(() {
                    Navigator.pop(context); // إغلاق الـ Modal
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AuthPage()),
                    );
                  });
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.app_registration,
                  color: AppColors.icon,
                ),
                title: const Text(
                  "Sign up",
                  style: TextStyle(color: AppColors.icon),
                ),
                onTap: () {
                  setState(() {
                    Navigator.pop(context); // إغلاق الـ Modal
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Registrer()),
                    );
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // --- Function to show Profile Modal (Settings / Logout) ---
  void _showProfileModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: 220,
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.icon,
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings, color: AppColors.icon),
                title: const Text(
                  "Settings",
                  style: TextStyle(color: AppColors.icon),
                ),
                onTap: () {
                  setState(() {
                    Navigator.pop(context); // إغلاق الـ Modal
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfilePage()),
                    );
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: AppColors.icon),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: AppColors.icon),
                ),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    isLogin = false;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // --- Handle when user taps a bottom nav item ---
  void _onTabSelected(int index) {
    // If user is not logged in and taps restricted pages
    if (!isLogin && (index == 3 || index == 4)) {
      _showAuthModal();
      return;
    }

    setState(() {
      _currentIndex = index;
    });
  }

  // --- Handle Profile icon tap ---
  void _onProfileTap() {
    if (isLogin) {
      _showProfileModal();
    } else {
      _showAuthModal();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "REAL ESTATE",
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.text),
        ),
        backgroundColor: AppColors.secondary,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white70),
            onPressed: _onProfileTap,
          ),
        ],
      ),

      body: _pages[_currentIndex],

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
                  onTap: _onTabSelected,
                  backgroundColor: AppColors.secondary,
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
                      label: 'Properties',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat_bubble),
                      label: 'Chats',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Saved',
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
