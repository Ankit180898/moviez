import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:moviez/carousel_slider_view.dart';
import 'package:moviez/left_panel.dart';
import 'package:moviez/main_header.dart';
import 'package:moviez/main_pane.dart';
import 'package:moviez/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> data = topChart;
  List<Map<String, dynamic>> filteredData = [];
  int _currentPage = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left pane
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF181818).withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                width: 300,
                child: LeftPane(
                  mainNavAction: menuAction,
                  selected: _currentPage,
                ),
              ),
              // Right pane
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Main Header with search and profile
                    Container(
                      height: 120,
                      child: MainHeader(onSearch: handleSearch),
                    ),

                    // Main content with carousel and pane
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          CarouselSliderView(),
                          const SizedBox(
                            height: 16,
                          ),
                          MainPane(
                            data: filteredData.isNotEmpty ? filteredData : data,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleSearch(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredData = data
            .where((item) =>
                item['original_title']
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                item['release_date']
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                getGenre(item['genre_ids'])
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
      } else {
        filteredData = [];
      }
    });
  }

  String getGenre(List<int> gIndex) {
    final genreNames = gIndex
        .map((id) => genres.firstWhere((genre) => genre["id"] == id)["name"])
        .take(2)
        .toList();
    return genreNames.join(' ');
  }

  void menuAction(int page, List<Map<String, dynamic>> newdata) {
    setState(() {
      _currentPage = page;
      data = newdata;
    });
  }
}
