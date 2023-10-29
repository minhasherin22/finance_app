import 'package:finance_app/modal/add_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final box = Hive.box<Add_data>('data');
  DateTime date = new DateTime.now();
  String? selctedItem;
  String? selctedItemi;
  final TextEditingController explain_cntrl = TextEditingController();
  FocusNode ex = FocusNode();
  FocusNode amount_ = FocusNode();
  final TextEditingController amount_cntrl = TextEditingController();
  final List<String> _item = [
    "Food",
    "Transfer",
    "Transportation",
    "Education"
  ];
  final List<String> _itemei = [
    'Income',
    "Expense",
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          background_container(context),
          Positioned(top: 120, child: main_container())
        ],
      )),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: const BoxDecoration(
              color: Color(0xff5a9dee),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const Text(
                  'Adding',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Icon(
                  Icons.attach_file_outlined,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container main_container() {
    return Container(
      height: 550,
      width: 340,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          name(),
          SizedBox(
            height: 50,
          ),
          explain(),
          SizedBox(
            height: 50,
          ),
          amount(),
          SizedBox(
            height: 50,
          ),
          how(),
          SizedBox(
            height: 50,
          ),
          save(),
         
        ],
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
          ),
        ),
        child: DropdownButton<String>(
          value: selctedItem,
          onChanged: ((value) {
            setState(() {
              selctedItem = value;
            });
          }),
          items: _item
              .map((e) => DropdownMenuItem(
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            e,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    value: e,
                  ))
              .toList(),
          hint: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("name"),
          ),
        ),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        focusNode: ex,
        controller: explain_cntrl,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: "explain",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
  
 Padding amount() {
   return Padding(padding: EdgeInsets.symmetric(horizontal: 15),
   child: TextField(
         focusNode:amount_ ,
         controller: amount_cntrl,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: "amount",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
   ),
   );
  }
  
 Padding how() {
  return Padding(padding: EdgeInsets.symmetric(horizontal: 15),
  child: Container(
     width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
          ),
        ),
        child: DropdownButton<String>(
          value: selctedItemi,
          onChanged: ((value) {
            setState(() {
              selctedItemi = value;
            });
          }),
          items: _itemei
              .map((e) => DropdownMenuItem(
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            e,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    value: e,
                  ))
              .toList(),
          hint: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("How"),
          ),
        ),
  ),
  );
 }
 
GestureDetector  save() {
  return GestureDetector(
  onTap: (){
    var add = Add_data(selctedItemi!, amount_cntrl.text, explain_cntrl.text, selctedItem!);
    box.add(add);
    Navigator.of(context).pop();
  },
  child: Container(
    width: 120,
        height: 50,
     alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff5a9dee),
          
        ),
        child: Text("Save",style: TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold
        ),),
  ),
  );
}
}
