import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spotify_practice/pages/details.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String text ="";

  final newsTitle = <String>["Top Dem super PAC starts Biden ad blitz, pledges 75 million campaign effort", 
  "Most of Yosemite National Park to close Friday over flooding concerns",
  "Democratic elected officials in Jackson, Mississippi, call 2 controversial new laws a slap in the face of our city",
  "Former New Zealand leader Jacinda Ardern is heading to Harvard"
  ];

  var items =[];
  bool _isloading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   items = newsTitle;
  //   _searchController.addListener(_performSearch);
  // }

  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   super.dispose();
  // }

  // Future<void> _performSearch() async {
  //   setState(() {
  //     _isloading = true;
  //   });

  //   //Simulates waiting for an API call
  //   await Future.delayed(const Duration(milliseconds: 1000));

  //   setState(() {
  //     items = newsTitle
  //         .where((element) => element
  //             .toLowerCase()
  //             .contains(_searchController.text.toLowerCase()))
  //         .toList();
  //     _isloading = false;
  //   });
  // }

  //************************************************************** */

  List _items = [];
 
  Future<void> readJson() async{
    final String response = await rootBundle.loadString("assets/images/practice.json");
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
   margin: const EdgeInsets.symmetric(
       horizontal: 18, vertical: 16),
   decoration: BoxDecoration(
       color: Color.fromARGB(255, 216, 213, 213),
       borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _searchController,
                        textInputAction: TextInputAction.search,
             decoration: const InputDecoration(
                 border: InputBorder.none,
                 hintText: "Search News"),
                        onChanged: (value) {
                          text = value.trim().toLowerCase();
                          print(text);
                        },               
                      ),
                      ),
                  ),
                  Flexible(
         flex: 1,
         fit: FlexFit.tight,
         child: IconButton(
             padding: EdgeInsets.zero,
             color: Colors.black,
             onPressed: () {},
             icon: const Icon(Icons.search_sharp)),
       ),
                ],
              ),
            ),
            _isloading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Expanded(
              child:  ListView.builder(
      shrinkWrap: true,
      itemCount: _items.length,
      itemBuilder: (context, index) {
         return ListTile(
          onTap: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => NewsDetailsPage(newsTitle:_items[index]["title"], detailImage: _items[index]["imageUrl"], desc: _items[index]["textList"],))
                    );
                  },
                    leading: Image.network(_items[index]["imageUrl"]),
                    title: Text(_items[index]["title"]),
                    subtitle: Text(_items[index]["description"]),

                  );
      },
    ),

            )

          ],
        ),
      
      
    //   ListView.builder(
    //   shrinkWrap: true,
    //   itemCount: newsInfo.length,
    //   itemBuilder: (context, index) {
    //      return ListTile(
    //       onTap: (){
    //                 Navigator.push(context, 
    //                 MaterialPageRoute(builder: (context) => NewsDetailsPage(newsTitle: newsInfo[index]["title"], detailImage: newsInfo[index]["imageUrl"], desc: newsInfo[index]["textList"],))
    //                 );
    //               },
    //                 leading: Image.network(newsInfo[index]["imageUrl"]),
    //                 title: Text(newsInfo[index]["title"]),
    //                 subtitle: Text(newsInfo[index]["description"]),
    //               );
    //   },
    // ),

    );
  }
  
  }