import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spotify_practice/pages/profile.dart';
import '../Lists.dart';
import '../widgets/CardWidget.dart';
import '../widgets/CarouselWidget.dart';
import '../widgets/HashtagWidget.dart';
import 'cardToHome.dart';
import 'details.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListsPage ls = ListsPage();

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


  List Imagess = [
    "https://www.politico.com/dims4/default/d7cb5ee/2147483647/strip/true/crop/5850x3900+0+0/resize/960x640!/quality/90/?url=https%3A%2F%2Fstatic.politico.com%2F51%2F56%2Fb9ca4851409299bf2d9e20d79f24%2Fhttps-delivery-gettyimages.com%2Fdownloads%2F1484904196",
    "https://media.cnn.com/api/v1/images/stellar/prod/230425175513-yosemite-snowpack-2023.jpg?c=16x9&q=h_720,w_1280,c_fill",
    "https://media.cnn.com/api/v1/images/stellar/prod/230425204136-mississippi-jimenez-dnt.jpg?c=16x9&q=w_850,c_fill",
    "https://media.cnn.com/api/v1/images/stellar/prod/230125102819-jacinda-ardern-012523.jpg?c=16x9&q=h_720,w_1280,c_fill",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                Row(children: const [
                  HashtagWidget(HashtagText: "#News 1",),
                  SizedBox( width: 10,),
                  HashtagWidget(HashtagText: "#News 2"),
                ],),
                const SizedBox(height: 30,),
                ListView(
                  shrinkWrap: true,
                  children: [
                  CaroulselW(imageList: Imagess, imageText: "This is text",)
                ],),                         
                SizedBox(height: 30,),
                SizedBox(height: 30,),
                for(var n in _items)
                Column(children: [
                  SizedBox(height: 30,),
                  CardWidget(imgUrl: n["imageUrl"], briefDesc: n["description"], desc: n["textList"], title: n["title"]),
                ],)],),
            ),),
        ),
      ],
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => ProfilePage()));
      },
      backgroundColor: Color.fromARGB(255, 0, 8, 23),
      child: Icon(Icons.person),
    ),
    );
  }

}