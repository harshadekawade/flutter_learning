import 'package:flutter/material.dart';
import 'package:my_flutter_project/ShimmerList/shimmer_list.dart';

import 'Constants/colors.dart';
import 'FormWithValidation/simple_form.dart';
import 'SearchableDropdown/advance_search.dart';
import 'ShowDataInGridView/home_page.dart';
import 'ShowDataInListView/UsingJsonFile/listview_using_json.dart';
import 'ShowDataInListView/UsingList/listview_using_list.dart';
import 'StatefulWidget/stateful_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MyColors.greenish,
        scaffoldBackgroundColor: const Color(0xFFD2DBE0),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.white,
              fontFamily: 'Ubuntu',
            ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter project'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      navigateTo(context, widget: const StatefulWidgets());
                    },
                    child: const Text('Stateful widgets')),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      navigateTo(context, widget: const GridViewImages());
                    },
                    child: const Text('Show Data in GridView')),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      navigateTo(context, widget: const JsonListView());
                    },
                    child:
                        const Text('Show Data in ListView(Using Json file)')),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      navigateTo(context, widget: const LListView());
                    },
                    child:
                        const Text('Show Data in ListView(Using Array list)')),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      navigateTo(context, widget: const ShimmerList());
                    },
                    child: const Text('Listview using shimmer load')),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      navigateTo(context, widget: const SearchableDropDown());
                    },
                    child: const Text('Searchable Dropdown')),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      navigateTo(context, widget: const SaleProductForm());
                    },
                    child: const Text('Form With Validation')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void navigateTo(context, {required Widget widget}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}
