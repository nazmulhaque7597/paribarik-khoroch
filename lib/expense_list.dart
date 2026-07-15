import 'package:flutter/material.dart';
import 'database_helper.dart';


class ExpenseList extends StatefulWidget {

  const ExpenseList({super.key});


  @override
  State<ExpenseList> createState() => _ExpenseListState();

}


class _ExpenseListState extends State<ExpenseList> {


  List<Map<String,dynamic>> expenses = [];


  @override
  void initState(){

    super.initState();

    loadExpenses();

  }



  Future<void> loadExpenses() async {

    final data =
    await DatabaseHelper.instance.getExpenses();


    setState(() {

      expenses = data;

    });

  }




  @override
  Widget build(BuildContext context) {


    return ListView.builder(

      itemCount: expenses.length,


      itemBuilder: (context,index){


        final item = expenses[index];


        return Card(

          margin: const EdgeInsets.all(8),


          child: ListTile(

            leading: CircleAvatar(

              backgroundColor: Colors.green,

              child: Text(
                item['name']
                .toString()
                .substring(0,1),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),

            ),


            title: Text(
              item['name'],
            ),


            subtitle: Text(
              "${item['category']} - ${item['note']}",
            ),


            trailing: Text(

              "৳ ${item['amount']}",

              style: const TextStyle(

                fontSize:18,

                fontWeight: FontWeight.bold,

              ),

            ),


          ),

        );


      },

    );


  }


}
