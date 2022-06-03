import 'dart:math';

import 'package:flutter/material.dart';
import 'package:togla_pratik/models/user_post.dart';

class home extends StatefulWidget {
  const home({ Key? key }) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  double dynamicHeight(double val) {
    return val*MediaQuery.of(context).size.height;
  }  
  double dynamicWidth(double val) {
    return val*MediaQuery.of(context).size.width;
  }
  List<UserPost> LikedUser = [
    UserPost(name: "abc", liked: 0),
    UserPost(name: "abc222", liked: 2),
    UserPost(name: "abce", liked: 0),
    UserPost(name: "sdd", liked: 4),
    UserPost(name: "retr", liked: 3),
    UserPost(name: "12", liked: 4),
  ];
  Color bColor = Colors.brown;
  late int a,r,g,b;
  Random rnd = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: RenkDegistir,
        icon: Icon(Icons.arrow_back, color: bColor,)),
        centerTitle: true,
        title: Text("HOME SCREEN"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_applications_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.wifi_lock_sharp))
        ],
      ),
      body: bodyMethod(),
      
    );
  }

  Widget bodyMethod() {
    return RefreshIndicator(onRefresh: () {
      
      setState(() {
        
      });
      return Future.delayed(Duration(milliseconds: 400));
    },
      child: Column(
        children: [
          Container(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: LikedUser.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 40,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/$index.jpg"),
                      radius: 38,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: LikedUser.length,
              itemBuilder: (BuildContext context, int index) {
                return post(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding post(int index) {
    String resim = "https://randomuser.me/api/portraits/men/$index.jpg";
    String randomResim = "https://picsum.photos/400/200?random=$index";
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Color.fromARGB(255, 215, 219, 217),
          width: dynamicWidth(1),
          height: dynamicHeight(0.4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              AvatarAndUserName(resim, index),
              PostedImage(randomResim),
              DescrpitonAndLikeButton(index)
            ],
          ),
        ),
      );
  }

  Row AvatarAndUserName(String resim, int index) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(resim),
          ),
        ),
        Text(LikedUser[index].name, style: TextStyle(fontSize: 20),)
      ],
    );
  }
  Expanded PostedImage(String randomResim) {
    return Expanded(
      child: Container (
        width: double.infinity, 
        height: double.infinity,  
        child: Image.network(
          randomResim,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return CircularProgressIndicator();
          },
        )
        ),
      );
  }
  Row DescrpitonAndLikeButton(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text("Bu manzara harika"),
        ),
        ElevatedButton.icon(onPressed: () {
          setState(() {
            LikedUser[index].liked++;
          });
        }, icon: Icon(Icons.thumb_up_sharp), label: Text("${LikedUser[index].liked}")),
      ],
    );
  }
  void RenkDegistir() {
    r = rnd.nextInt(255);
          g = rnd.nextInt(255);
          b = rnd.nextInt(255);
          bColor = Color.fromARGB(a=255,r,g,b);
          setState(() {
            
          });
  }
}