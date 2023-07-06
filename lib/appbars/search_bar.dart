import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SearchBarExample extends StatefulWidget {
  const SearchBarExample({Key? key}) : super(key: key);

  @override
  State<SearchBarExample> createState() => _SearchBarExampleState();
}

class _SearchBarExampleState extends State<SearchBarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Bar Demo"),
        actions: [
          IconButton(
            onPressed: (){
              showSearch(
                  context: context,
                  // to customize the search bar
                  delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: const Center(
        child: Text("Type to search something"),
      ),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate{
  // Demo List to show query
  List<String> searchTerms= [
    "Apple", "Arrow", "AirBase", "Batman", "Banana" , "Mango", "Pear", "Miya", "Layla", "Toyata", "Blueberry", "Marval Comis"
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: (){
          query= '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // to pop out search menu
  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: (){
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  //to show query result
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<String> matchQuery= [];

    for(var name in searchTerms){
      if(name.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder:(context, index){
        var result = matchQuery[index];
        return ListTile(
          title:  Text(result),
          onTap: ()=> Fluttertoast.showToast(msg: result ),
        );
      },
    );

  }

  // to show the query process at the run time
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery= [];
    for(var name in searchTerms){
      if(name.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder:(context, index){
        var result = matchQuery[index];
        return ListTile(
          title:  Text(result),
          onTap: ()=> Fluttertoast.showToast(msg: result ),
        );
      },
    );
  }

}
