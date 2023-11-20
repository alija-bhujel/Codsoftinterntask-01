import 'package:budgetexpenseapp/pages/Statistics.dart';
import 'package:budgetexpenseapp/pages/add_transaction.dart';
import 'package:budgetexpenseapp/pages/categories.dart';
import 'package:budgetexpenseapp/pages/homepage.dart';
import 'package:budgetexpenseapp/pages/profile.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index_color = 0;
  List screen = [HomePage(), Statistics(), Categories(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index_color],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: Colors.blue[700],
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Add_transaction()));
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color = 0;
                    });
                  },
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color: index_color == 0 ? Color(0xFF3383CD) : Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color = 1;
                    });
                  },
                  child: Icon(
                    Icons.bar_chart_outlined,
                    size: 30,
                    color: index_color == 1 ? Color(0xFF3383CD) : Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color = 2;
                    });
                  },
                  child: Icon(
                    Icons.category,
                    size: 30,
                    color: index_color == 2 ? Color(0xFF3383CD) : Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_color = 3;
                    });
                  },
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: index_color == 3 ? Color(0xFF3383CD) : Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
