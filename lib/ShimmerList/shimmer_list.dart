import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatefulWidget {
  const ShimmerList({super.key});

  @override
  State<ShimmerList> createState() => _ShimmerListState();
}

class _ShimmerListState extends State<ShimmerList> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isLoading
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.white,
                child: ListView.builder(
                  itemBuilder: (_, index) => Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(index.toString()),
                  ),
                  itemCount: 10,
                ),
              )
            : ListView.builder(
                itemBuilder: (_, index) => Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(index.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                itemCount: 10,
              ),
      ),
    );
  }
}
