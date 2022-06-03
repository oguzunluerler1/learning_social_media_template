import 'package:flutter/material.dart';
import 'package:togla_pratik/Screens/posts_detailed.dart';

class Search extends StatefulWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: bodyMethod(),
      
    );
  }

  Widget bodyMethod() {
    return GridView.builder(
      gridDelegate: 
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ), 
        itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        
        String rresim = "https://picsum.photos/400/200?random=${index+1}";
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => PostsDetailed(imgUrl: rresim)
              )
            );
          },
          child: Image.network(rresim,fit: BoxFit.cover,)
        );        
      }
    );
  }
}
