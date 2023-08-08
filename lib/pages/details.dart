import 'package:flutter/material.dart';

// class NewsDetailsPage extends StatefulWidget {
//   const NewsDetailsPage({super.key});

//   @override
//   State<NewsDetailsPage> createState() => _NewsDetailsPageState();
// }

class NewsDetailsPage extends StatelessWidget {
  final String newsTitle, detailImage, desc;
  const NewsDetailsPage({super.key, required this.newsTitle, required this.detailImage, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(        
        child:  Padding(padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color.fromARGB(255, 160, 145, 8),
            pinned: true,
            expandedHeight: 300.0,
            toolbarHeight: 85,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsetsDirectional.only(start: 16.0, bottom: 16.0),
              centerTitle: true,
              title: Text(newsTitle, style: TextStyle(color: Colors.white), textScaleFactor: 1,),
              background: Image.network(detailImage, fit: BoxFit.fill,),
            ),), 
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Text(desc);
            },
            childCount: 10
            ))          
        ],
      ),),
      ),
    );
  }
}