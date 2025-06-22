import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sharecars/core/constant/const_text.dart';
import 'package:sharecars/core/them/my_colors.dart';
import 'package:sharecars/core/utils/functions/get_token.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final _pageController = PageController();

  final List<IconData> _navIcons = [
    Icons.home_rounded,
    Icons.search_rounded,
    Icons.favorite_rounded,
    Icons.person_rounded,
  ];

  final List<Color> _activeColors = [
    MyColors.primary,
    MyColors.primaryBackground,
    MyColors.primary,
    MyColors.primaryBackground,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryBackground,

      // extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Center(child: Text("Home Page")),
          Center(child: Text("Search Page")),
          Center(child: Text("Favorites Page")),
          Center(child: Text("Profile Page")),
        ],
      ),
      bottomNavigationBar: _buildFloatingNavBar(),
    );
  }

  Widget _buildFloatingNavBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.primaryBackground, width: 0.2),
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 16.0,
              spreadRadius: 2.0,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: Container(
            height: 77.h,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromRGBO(158, 158, 158, 0.1),
                width: 1.5,
              ),
            ),
            child: SalomonBottomBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() => _currentIndex = index);
                _pageController.jumpToPage(index);
              },
              selectedItemColor: _activeColors[_currentIndex],
              unselectedItemColor: Colors.grey[400],
              margin:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              itemPadding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              items: _navIcons.asMap().entries.map((entry) {
                final index = entry.key;
                final icon = entry.value;
                return SalomonBottomBarItem(
                  icon: Icon(icon, size: 26),
                  title: Text(
                    botomBarHomeTitles(index),
                    style: const TextStyle(fontSize: 12),
                  ),
                  selectedColor: _activeColors[index],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
