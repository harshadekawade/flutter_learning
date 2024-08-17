import 'package:flutter/material.dart';
import 'package:my_flutter_project/Model/BirdsDataModel.dart';

import '../Bird_preview.dart';

class GridViewImages extends StatefulWidget {
  const GridViewImages({super.key});

  @override
  State<GridViewImages> createState() => _GridViewImagesState();
}

class _GridViewImagesState extends State<GridViewImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gallery'),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            padding: const EdgeInsets.all(20.0),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: List.generate(
                birdsList.length,
                (index) => GridTile(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ShowBirdDetail(index: index),
                              ));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(
                              children: [
                                Image.network(
                                  birdsList[index].imageURL.toString(),
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress != null) {
                                      return const Center(
                                          child: Column(
                                        children: [
                                          CircularProgressIndicator(),
                                          Text('Loading...')
                                        ],
                                      ));
                                    }
                                    return ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: child);
                                  },
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    birdsList[index].name.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))));
  }
}
