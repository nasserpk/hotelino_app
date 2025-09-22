import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  List<Widget> widgetOption = [
    Center(child: Text('Home Screen', style: TextStyle(fontSize: 28))),
    Center(child: Text('Search Screen', style: TextStyle(fontSize: 28))),
    Center(child: Text('Setting Screen', style: TextStyle(fontSize: 28))),
    Center(child: Text('Verify Screen', style: TextStyle(fontSize: 28))),
  ];

  void onItemTapped(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOption[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        height: 76,
        backgroundColor: Colors.white,
        indicatorColor: Colors.amber,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Setting'),
          NavigationDestination(
            icon: Icon(Icons.verified_user),
            label: 'Verify',
          ),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: onItemTapped,
      ),
    );
  }
}
