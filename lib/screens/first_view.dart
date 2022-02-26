import 'package:code_challenge/screens/second_view.dart';
import 'package:flutter/material.dart';

class FirstView extends StatelessWidget {
  const FirstView({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBar(title), 
      body: SafeArea(
        child: Container(child:Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Center(
                child: Text(
                  "Hi,"
                      "\n\nthe tasks listed below should be done on the second view."
                      "\n\n1. Integrate the AnimatedContainer below to the next view "
                      "so it can be reordered there too and it should not stop changing "
                      "his size and should not overlap the other boxes. "
                      "The space between the boxes should stay at all time the same. "
                      "\n\n2. The overflowing text should be completely visible inside the "
                      "red box and the height of the box should be adjusted to his content."
                      "\n\n3. Thrown exceptions during the development must be solved."
                      "\n\n4. Refactoring the code can be done if wanted but the "
                      "ReorderableGridView cannot be replaced."
                      "\n\nInfo: You get to the second view via the button on the bottom.",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 18 / 14),
                ),
              ),
            ),

          ],
        )),
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>SecondView(title: title,),
                            fullscreenDialog: true));
        },
        child: const Icon(Icons.swap_horiz),
        backgroundColor: const Color(0xff5855DC),
      ),
    );
  }
}


AppBar appBar(String title){
  return AppBar(
      automaticallyImplyLeading:false,
    backgroundColor: const Color(0xff5855DC),
    title: Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
  );
}
