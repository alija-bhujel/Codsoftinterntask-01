import 'package:budgetexpenseapp/backend/datahome.dart';
import 'package:budgetexpenseapp/data/utility.dart';
// import 'package:budgetexpenseapp/data/content.dart';
// import 'package:budgetexpenseapp/data/listdata.dart';
// import 'package:budgetexpenseapp/pages/add_transaction.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var history;
  final box = Hive.box<Add_data>('data');

  @override
  Widget build(BuildContext context) {
    print('Is Hive box open? ${box.isOpen}');
    return Scaffold(
        // backgroundColor: Colors.transparent,

        body: SafeArea(
            child: ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, value, child) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 320, child: _head()),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent transaction',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            //
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  history = box.values.toList()[index];
                  return getList(history, index);
                },
                childCount: box.length,
              ),
            ),
          ],
        );
      },
    )));
  }

  Widget getList(
    Add_data history,
    int index,
  ) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          history.delete();
        },
        child: collection(index, history));
  }

  ListTile collection(int index, Add_data history) {
    return ListTile(
        tileColor: Colors.white60,
        title: Text(
          history.name,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          '${history.datetime.year}-${history.datetime.month}-${history.datetime.day}',
          style: TextStyle(fontSize: 12, color: Colors.grey[500]),
        ),
        trailing: Text(
          history.budget,
          style: TextStyle(
            color: history.option == 'Income' ? Colors.green : Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Container(
          width: 20,
          height: 20,
          child: Image.asset(
            'images/${history.name}.png',
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 11, color: Colors.grey, spreadRadius: 1),
            ],
          ),
        )
        //
        );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFF3383CD), Color(0xFF11249F)],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: const Stack(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://2.bp.blogspot.com/-rOsFHTGRetQ/UZrR_53ER6I/AAAAAAAAAFY/KuJRGXbT1QQ/s1600/Selena+Gomez+10.png'),
                          radius: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'W E L C O M E !!',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 120,
          left: 38,
          child: Container(
            width: 320,
            height: 190,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 11, color: Colors.grey, spreadRadius: 1),
                ],
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rs.${total()}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          width: 50,
                          height: 85,
                          decoration: BoxDecoration(
                              color: Colors.green[400],
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Income',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white70),
                                    ),
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.arrow_upward,
                                        color: Colors.white,
                                      ),
                                      radius: 13,
                                      backgroundColor:
                                          Color.fromRGBO(188, 100, 145, 170),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, right: 85),
                                  child: Text(
                                    'Rs.${income()}',
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 85,
                          decoration: BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Expenses',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.arrow_downward,
                                        color: Colors.white,
                                      ),
                                      radius: 13,
                                      backgroundColor:
                                          Color.fromRGBO(188, 100, 145, 170),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, right: 85),
                                  child: Text(
                                    'Rs.${expenses()}',
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        //
      ],
    );
  }
}
