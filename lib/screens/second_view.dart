import 'package:code_challenge/reorderable_grid_view/reorderable_grid_item.dart';
import 'package:code_challenge/reorderable_grid_view/reorderable_grid_view.dart';
import 'package:code_challenge/screens/first_view.dart';
import 'package:flutter/material.dart';

class SecondView extends StatefulWidget {
  SecondView({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
   List<int?>?savedOrder;

   ScrollController? _scrollController;

   @override
  void initState() {
    _initScrollController();
    super.initState();
  }

   void _initScrollController() {
    _scrollController = ScrollController();
    _scrollController!.addListener(_scrollListener);

  }
  _scrollListener() {
    if (_scrollController!.offset >= _scrollController!.position.maxScrollExtent &&
        !_scrollController!.position.outOfRange) {
    }
    if (_scrollController!.offset <=_scrollController!.position.minScrollExtent &&
        !_scrollController!.position.outOfRange) {
    }
  }
  List<Widget> cashboardItems = [
    ReorderableGridItem(
      widthFlex: 1,
      key: GlobalKey(),
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Colors.red),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed "
                "diam nonumy eirmod tempor invidunt ut labore et dolore magna "
                "aliquyam erat, sed diam voluptua. At vero eos et accusam et "
                "justo duo dolores et ea rebum. Stet clita kasd gubergren, no "
                "sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem "
                "ipsum dolor sit amet, consetetur sadipscing elitr, sed diam "
                "nonumy eirmod tempor invidunt ut labore et dolore magna "
                "aliquyam erat, sed diam voluptua. At vero eos et accusam et "
                "justo duo dolores et ea rebum. Stet clita kasd gubergren, no "
                "sea takimata sanctus est Lorem ipsum dolor sit amet.",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      allowDrag: true,
    ),
    ReorderableGridItem(

      widthFlex: 1,
      key: GlobalKey(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: 75,
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Colors.blue),
      ),
      allowDrag: true,
    ),
    ReorderableGridItem(
      widthFlex: 1,
      key: GlobalKey(),
      child: Container(
        height: 75,
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Colors.yellow),
      ),
      allowDrag: true,
    ),
    ReorderableGridItem(
      widthFlex: 1,
      key: GlobalKey(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: const Center(
          child: Text(
            "Info: With a longPress on the boxes you can reorder them to "
                "different positions.",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, height: 18 / 14),
          ),
        ),
      ),
      allowDrag: true,
    ),
    ReorderableGridItem(
      widthFlex: 1,
      key: GlobalKey(),
      child:   Container(
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Color(0xff5855DC)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Good luck",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 36),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.white,
                size: 42,
              ),
            ],
          ),
        ),
      ),
      allowDrag: true,
      animate:true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBar(widget.title),
      body: ReorderableGridView(
        scrollController: _scrollController,
        orderedIndexes: savedOrder,
        onOrderChange: (newOrderedList) {
          savedOrder =
              newOrderedList.map((e) => e!.orderNumber).toList();
        },
        children: [
          cashboardItems[0] as ReorderableGridItem,
          cashboardItems[1] as ReorderableGridItem,
          cashboardItems[2] as ReorderableGridItem,
          cashboardItems[3] as ReorderableGridItem,
          cashboardItems[4] as ReorderableGridItem
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.swap_horiz),
        backgroundColor: const Color(0xff5855DC),
      ),
    );
  }
}
