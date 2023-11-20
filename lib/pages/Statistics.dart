import 'package:budgetexpenseapp/backend/datahome.dart';
import 'package:budgetexpenseapp/data/utility.dart';
import 'package:budgetexpenseapp/widget/chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

ValueNotifier notify = ValueNotifier(0);

class _StatisticsState extends State<Statistics> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  List f = [today(), week(), month(), year()];
  List<Add_data> a = [];
  int index_color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: notify,
              builder: (BuildContext context, dynamic value, Widget? child) {
                a = f[value];
                return customdata();
              })),
    );
  }

  CustomScrollView customdata() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  '< Statistics >',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      4,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              index_color = index;
                              notify.value = index;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index_color == index
                                  ? Colors.blue[700]
                                  : Colors.white10,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              day[index],
                              style: TextStyle(
                                color: index_color == index
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 90,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0, left: 9),
                            child: Text(
                              'Income',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                          Icon(
                            Icons.arrow_upward,
                            size: 20,
                            color: Colors.green,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                color: Colors.green,
                                blurRadius: 10,
                                offset: Offset.zero)
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                    ),
                  ),

                  //expenses
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 96,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0, left: 9),
                            child: Text(
                              'Expenses',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          Icon(
                            Icons.arrow_downward,
                            size: 20,
                            color: Colors.red,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                color: Colors.red,
                                blurRadius: 10,
                                offset: Offset.zero)
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Chart(
                indexx: index_color,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Monthly Spending',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.swap_vert),
                  )
                ],
              )
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('images/${a[index].name}.png', height: 40),
              ),
              title: Text(
                a[index].name,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                ' ${a[index].datetime.year}-${a[index].datetime.month}-${a[index].datetime.day}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Text(
                a[index].budget,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                  color:
                      a[index].option == 'Income' ? Colors.green : Colors.red,
                ),
              ),
            );
          },
          childCount: a.length,
        ))
      ],
    );
  }
}
