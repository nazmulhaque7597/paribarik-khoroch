import 'package:flutter/material.dart';
import 'add_expense.dart';

void main() {
  runApp(const ParibarikKhoroch());
}

class ParibarikKhoroch extends StatelessWidget {
  const ParibarikKhoroch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'পারিবারিক খরচ',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("💰 পারিবারিক খরচ"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),


      body: Column(

        children: [

          const SizedBox(height:20),


          Card(

            margin: const EdgeInsets.all(15),

            color: Colors.green.shade100,

            child: const ListTile(

              title: Text(
                "আজকের মোট খরচ",
                style: TextStyle(fontSize:20),
              ),

              trailing: Text(
                "৳ 0",
                style: TextStyle(
                  fontSize:22,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ),

          ),


          const SizedBox(height:30),


          const Text(
            "প্রতিদিনের খরচ এখানে রাখুন",
            style: TextStyle(
              fontSize:20,
            ),
          ),

        ],

      ),


      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.green,

        child: const Icon(Icons.add),


        onPressed: (){


          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (context)=> const AddExpense(),

            ),

          );


        },

      ),


    );

  }

}
