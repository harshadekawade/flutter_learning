import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progressive_image/progressive_image.dart';

import '../../Bird_preview.dart';
import '../../Model/BirdsDataModel.dart';

class JsonListView extends StatefulWidget {
  const JsonListView({super.key});

  @override
  State<JsonListView> createState() => _JsonListViewState();
}

class _JsonListViewState extends State<JsonListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birds List'),
      ),
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<BirdsDataModel>;
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ShowBirdDetail(index: index),
                              ));
                        },
                        child: Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: ProgressiveImage(
                                    placeholder: const AssetImage(
                                        'assets/images/load.png'),
                                    // size: 1.87KB
                                    thumbnail: const AssetImage(
                                        'assets/images/load1.png'),
                                    // size: 1.29MB
                                    image: NetworkImage(
                                        items[index].imageURL.toString()),
                                    fit: BoxFit.fill,
                                    height: 300,
                                    width: 500,
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Text(
                                          items[index].name.toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        )),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<BirdsDataModel>?> readJsonData() async {
    final jsonData =
        await rootBundle.loadString('assets/jsonFile/birds_data.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => BirdsDataModel.fromJson(e)).toList();
  }
}
