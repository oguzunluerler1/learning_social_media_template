import 'package:flutter/material.dart';

class PostsDetailed extends StatefulWidget {
  PostsDetailed({ Key? key, required this.imgUrl }) : super(key: key);
  final String imgUrl;
  @override
  State<PostsDetailed> createState() => _PostsDetailedState();
}

class _PostsDetailedState extends State<PostsDetailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("naber"),
        actions: [
          DropdownButton(items: [
            DropdownMenuItem(
              child: Text("sext"), value: "sfd",
              ),            
              DropdownMenuItem(
              child: Text("sext"), value: "ds",
              ),            
              DropdownMenuItem(
              child: Text("sext"), value: "asd",
              ),
          ], 
          onChanged: (index){
            index;
          }
            )
        ],
      ),
      body: bodyMethod(),
    );
  }

  Widget bodyMethod() {
    return Column(
      children: [
        Image.network(widget.imgUrl),
      ],
    );
  }
}