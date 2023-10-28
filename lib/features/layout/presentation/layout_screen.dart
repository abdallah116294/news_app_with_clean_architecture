import 'package:flutter/material.dart';
import 'package:news/features/layout/business/presentation/cubit/business_cubit.dart';
import 'package:news/features/layout/business/presentation/screens/business_screen.dart';
import 'package:news/features/layout/science/presentation/cubit/science_cubit.dart';
import 'package:news/features/layout/science/presentation/screens/science_screen.dart';
import 'package:news/features/layout/sports/presentation/screen/sports_screen.dart';
import 'package:news/features/search/presentation/screens/search_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List screen = [
    const BusinessScreen(),
    const SportScreen(),
    const ScienceScreen(),
  ];
  @override
  void initState() {
    super.initState();
    BusinessCubit.get(context).getBusinessData();
    ScienceCubit.get(context).getScienceData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const  SearchScreen()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.white),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: "business"),
            BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sports"),
            BottomNavigationBarItem(icon: Icon(Icons.science), label: "science")
          ]),
    );
  }
}
