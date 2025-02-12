import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 40,

        // currentIndex: _currentIndex,
        // onTap: (index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Symbols.home, weight: 100, grade: 200, opticalSize: 48,color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.shopping_cart, weight: 100, grade: 200, opticalSize: 48,color: Colors.grey),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.shopping_bag, weight: 100, grade: 200, opticalSize: 48,color: Colors.grey),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.favorite, weight: 100, grade: 200, opticalSize: 48,color: Colors.grey),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.person_outline, weight: 100, grade: 200, opticalSize: 48,color: Colors.grey),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person_outline,color: Colors.grey),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}
