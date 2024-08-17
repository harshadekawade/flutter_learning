import 'package:advanced_search/advanced_search.dart';
import 'package:flutter/material.dart';

class SearchableDropDown extends StatefulWidget {
  const SearchableDropDown({super.key});

  @override
  State<SearchableDropDown> createState() => _SearchableDropDownState();
}

class _SearchableDropDownState extends State<SearchableDropDown> {
  List<String> state = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Lakshadweep",
    "Puducherry"
  ];

  final List<String> searchableList = [
    "Orange",
    "Apple",
    "Banana",
    "Mango Orange",
    "Carrot Apple",
    "Yellow Watermelon",
    "Zhe Fruit",
    "White Oats",
    "Dates",
    "Raspberry Blue",
    "Green Grapes",
    "Red Grapes",
    "Dragon Fruit"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Advance Search'),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
            child: AdvancedSearch(
              hintText: 'Search here...',
              searchItems: state,
              maxElementsToDisplay: 10,
              inputTextFieldBgColor: Colors.white,
              onItemTap: (index, value) {
                // print("selected item Index is $index");
              },
              onSearchClear: () {
                //print("Cleared Search");
              },
              onSubmitted: (value, value2) {
                //print("Submitted: " + value);
              },
              onEditingProgress: (value, value2) {
                //print("TextEdited: " + value);
                //print("LENGTH: " + value2.length.toString());
              },
            ),
          ),
        ));
  }
}
