import 'package:flutter/material.dart';
import 'package:my_flutter_project/Model/BirdsDataModel.dart';

class ShowBirdDetail extends StatefulWidget {
  final int index;
  const ShowBirdDetail({super.key, required this.index});

  @override
  State<ShowBirdDetail> createState() => _ShowBirdDetailState();
}

class _ShowBirdDetailState extends State<ShowBirdDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        birdsList[widget.index].imageURL.toString(),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        loadingBuilder: (BuildContext context, Widget child,
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
                          return child;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          birdsList[widget.index].name.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(birdsList[widget.index].description.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
