import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: bodyMethod(),
    );
  }

  AppBar appBarMethod() {
    return AppBar(
      title: Text("tlago"),
      centerTitle: true,
    );
  }

  Widget bodyMethod() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://pps.whatsapp.net/v/t61.24694-24/56106056_333757770828124_3034672429331906560_n.jpg?ccb=11-4&oh=01_AVxa2XNo0dzBnPXG7MD66Jn3t9TISvKLaJWZgDMCtNEq7w&oe=62AB3190"), 
              ),
            ),
            Text("harika Tolga :)", style: TextStyle(fontSize: 30),),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Container(
              color: Colors.limeAccent,
              child: Text("herkesin hayatına kimse karışamaz"),
            )
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 8,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
            ),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Image.network("https://picsum.photos/400/400?random=${index+1}");
            },
          ),
        ),
      ],
    );
  }
}