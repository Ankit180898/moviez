import 'package:flutter/material.dart';

class SearchBarView extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBarView({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: TextField(
          onChanged: onSearch, // Trigger search on text change
          decoration: InputDecoration(
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: const Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            hintText: 'Search By Title, Genre and Year',
            hintStyle: const TextStyle(color: Colors.black, fontSize: 20),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          ),
          cursorColor: Colors.black,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),

          cursorHeight: 25,
        ),
      ),
    );
  }
}
