import 'package:flutter/material.dart';
import 'package:xtremesports/src/features/Profile/presentation/profile_page.dart';
import 'package:xtremesports/src/features/Search/presentation/search_page.dart';
import 'package:xtremesports/src/features/groups/presentation/groups_and_events_page.dart';
import 'src/features/home/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const ImageSplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SearchPage(),
    const GroupsAndEventsPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color.fromARGB(255, 184, 184, 184),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  const Icon(Icons.home),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: selectedIndex == 0 ? const Color.fromARGB(255, 0, 0, 0) : Colors.white,
                    ),
                  ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  const Icon(Icons.search),
                  Text(
                    'Search',
                    style: TextStyle(
                      color: selectedIndex == 1 ? const Color.fromARGB(255, 0, 0, 0) : Colors.white,
                    ),
                  ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  const Icon(Icons.camera),
                  Text(
                    'Groups/Events/Tricks',
                    style: TextStyle(
                      color: selectedIndex == 2 ? const Color.fromARGB(255, 0, 0, 0) : Colors.white,
                    ),
                  ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  const Icon(Icons.person),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: selectedIndex == 3 ? const Color.fromARGB(255, 0, 0, 0) : Colors.white,
                    ),
                  ),
                ],
              ),
              label: '',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 244, 173, 115),
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class ImageSplashScreen extends StatefulWidget {
  const ImageSplashScreen({super.key});

  @override
  State<ImageSplashScreen> createState() => _ImageSplashScreenState();
}

class _ImageSplashScreenState extends State<ImageSplashScreen> {
  final List<String> images = [
    'assets/01-Yellow2.png',
    'assets/02-Blue.png',
    'assets/Splashscreengreen.png',
    'assets/04-Orange.png',
  ];
  final PageController _pageController = PageController();

  void _nextImage() {
    final nextPage = (_pageController.page ?? 0) + 1;
    if (nextPage < images.length) {
      _pageController.animateToPage(
        nextPage.toInt(),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: _nextImage,
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
