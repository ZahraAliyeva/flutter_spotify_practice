import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isVertical = false;
  final List<Language> languages = [Language('English'), Language('Azerbaijan'), Language('Russian')];

  final List<Appliance> appliances = [
  Appliance('notifications'),
  Appliance('dark mode'),
  Appliance('Download news'),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 145, 8),
        centerTitle: true,
        title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              const SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Stack(
                    alignment: Alignment.center,
                   children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 33, 168, 201),
                              borderRadius: BorderRadius.circular(100)
                              ),),   
                        const Text("Z", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),),                       
                  ],),
                  const SizedBox(width: 15,),
                  Column(                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [          
                      Text("Zahra Aliyeva", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                     SizedBox(height: 3,),
                    Text("View Profile", style: TextStyle(color: Color.fromARGB(255, 117, 113, 113)),),
                  ],),
                  ],),      
                  IconButton(onPressed: (){}, 
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                  iconSize: 15,),
              ],),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [                  
                  Text("Account", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ],),  
                  const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                    Text("Email", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("zhr@gmail.com", style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 117, 113, 113)),),
                  ],),                
              ],),
                  const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Languages:", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                  ],),
              const SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    activeColor: const Color.fromARGB(255, 160, 145, 8),
                    title: Text('${languages[index].name}'),
                    value: languages[index].isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        languages[index].isChecked = value!;
                      });
                    },
                    secondary: const Icon(Icons.language),
                  );
                },
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Settings", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                  ],),
              const SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: appliances.length,
                itemBuilder: (context, index) {
                  return SwitchListTile(
                    activeColor: const Color.fromARGB(255, 160, 145, 8),
                    title: Text('${appliances[index].name}'),
                    value: appliances[index].isOn,
                    onChanged: (bool value) {
                      setState(() {
                        appliances[index].isOn = value;
                      });
                    },
                 );
               },
              ),
            ],),), 
          ),          
        ),
      ],),
    );
  }
}

class Language {
  String name;
  bool isChecked;
  Language(this.name, {this.isChecked = false});
}

class Appliance {
  String name;
  bool isOn;
  Appliance(this.name, {this.isOn = false});
}