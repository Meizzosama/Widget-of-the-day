import 'package:flutter/material.dart';

class SearchableTextFieldDemo extends StatefulWidget {
  const SearchableTextFieldDemo({super.key});

  @override
  _SearchableTextFieldDemoState createState() => _SearchableTextFieldDemoState();
}

class _SearchableTextFieldDemoState extends State<SearchableTextFieldDemo> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _data = [
    'Apple',
    'Banana',
    'Orange',
    'Grapes',
    'Pineapple',
    'Watermelon',
  ];
  List<String> _filteredData = [];

  @override
  void initState() {
    _filteredData.addAll(_data);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>.from(_data);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      for (var item in dummySearchList) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      setState(() {
        _filteredData = dummyListData;
      });
    } else {
      setState(() {
        _filteredData = List<String>.from(_data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Searchable TextField'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: "fruits",
                hintText: "Search for fruits",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              onChanged: (value) {
                filterSearchResults(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_filteredData[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}