import 'package:flutter/material.dart';
import 'package:moviez/data.dart';

class MainPane extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const MainPane({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        maxCrossAxisExtent: 300,
        childAspectRatio: 2.8 / 5,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/bg.jpg", // Placeholder image asset path
                  image: pImageBase + data[index]["poster_path"],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              data[index]["original_title"] ?? 'Unknown Title',
              style: const TextStyle(fontSize: 16, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              getGenre(data[index]["genre_ids"]),
              style: const TextStyle(fontSize: 14, color: Colors.white60),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  String getGenre(List<int> gIndex) {
    final genreNames = gIndex
        .map((id) => genres.firstWhere((genre) => genre["id"] == id)["name"])
        .take(2)
        .toList();
    return genreNames.join(' ');
  }
}
