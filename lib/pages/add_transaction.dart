import 'package:budgetexpenseapp/backend/datahome.dart';
// import 'package:budgetexpenseapp/provider/add_tranprovider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:provider/provider.dart';

class Add_transaction extends StatefulWidget {
  const Add_transaction({super.key});

  @override
  State<Add_transaction> createState() => _Add_transactionState();
}

class _Add_transactionState extends State<Add_transaction> {
  final box = Hive.box<Add_data>('data');
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedItem1;
  final List<String> _item = ['Food', 'Salary', 'Gift', 'Education', 'Clothes'];
  final List<String> _item1 = ['Income', 'Expenses'];

  final TextEditingController describe = TextEditingController();
  FocusNode desc = FocusNode();
  final TextEditingController amount = TextEditingController();
  FocusNode amt = FocusNode();

  @override
  void initState() {
    super.initState();
    desc.addListener(() {
      setState(() {});
    });
    amt.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    // final transactionModel = Provider.of<TransactionProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          background_column(context),
          Positioned(
            top: 150,
            child: middle_box(),
          )
        ],
      )),
    );
  }

  Container middle_box() {
    return Container(
      width: 340,
      height: 550,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            spreadRadius: 4,
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset.zero)
      ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: namee(),
          ),
          const SizedBox(
            height: 10,
          ),
          description(),
          const SizedBox(
            height: 25,
          ),
          budget(),
          const SizedBox(
            height: 25,
          ),
          details(),
          const SizedBox(
            height: 25,
          ),
          date_time(),
          const SizedBox(
            height: 70,
          ),
          done()
          //
        ],
      ),
    );
  }

  GestureDetector done() {
    return GestureDetector(
      onTap: () {
        var add = Add_data(
            selectedItem1!, amount.text, date, describe.text, selectedItem!);
        box.add(add);
        Navigator.of(context).pop();
      },
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 45,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFF3383CD), Color(0xFF11249F)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          'Done',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget date_time() {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.blueGrey)),
      width: 300,
      child: TextButton(
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2020),
                lastDate: DateTime(2200));
            if (newDate == Null) return;
            setState(() {
              date = newDate!;
            });
          },
          child: Text(
            'Date: ${date.year} / ${date.month} / ${date.day}',
            style: TextStyle(fontSize: 15, color: Colors.black),
          )),
    );
  }

  Widget details() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.blueGrey),
      ),
      child: DropdownButton<String>(
        value: selectedItem1,
        onChanged: ((value) {
          setState(() {
            selectedItem1 = value!;
          });
        }),
        items: _item1
            .map((e) => DropdownMenuItem(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Text(
                          e,
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  value: e,
                ))
            .toList(),
        selectedItemBuilder: (context) => _item1.map((e) => Text(e)).toList(),
        hint: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: const Text(
            'Option',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        dropdownColor: Colors.white,
        isExpanded: true,
        underline: Container(),
      ),
    );
  }

  Widget budget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amt,
        controller: amount,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: 'Budget',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 1, color: Colors.blueGrey))),
      ),
    );
  }

  Widget description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        focusNode: desc,
        controller: describe,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: 'Description',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 1, color: Colors.blueGrey))),
      ),
    );
  }

  Widget namee() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.blueGrey),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        items: _item
            .map((e) => DropdownMenuItem(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          child: Image.asset('images/${e}.png'),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          e,
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  value: e,
                ))
            .toList(),
        selectedItemBuilder: (context) => _item
            .map((e) => Row(
                  children: [
                    Container(
                      width: 32,
                      child: Image.asset('images/${e}.png'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(e)
                  ],
                ))
            .toList(),
        hint: const Text(
          'Name',
          style: TextStyle(color: Colors.grey),
        ),
        dropdownColor: Colors.white,
        isExpanded: true,
        underline: Container(),
        onChanged: ((value) {
          setState(() {
            selectedItem = value!;
          });
        }),
      ),
    );
  }

  Widget background_column(BuildContext context) {
    return Column(
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
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 85,
                  ),
                  const Text(
                    'Add transaction',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
