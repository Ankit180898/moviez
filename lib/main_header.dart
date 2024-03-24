import 'package:flutter/material.dart';
import 'package:moviez/profile_section.dart';
import 'package:moviez/search_bar_view.dart';
class MainHeader extends StatelessWidget{
    final Function(String) onSearch;
  const MainHeader({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        SearchBarView(
          onSearch:onSearch,
        ),
        ProfileSection()
      ],
    );
  }
}