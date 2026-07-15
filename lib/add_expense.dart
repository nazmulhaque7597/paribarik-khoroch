import 'package:flutter/material.dart';
import 'database_helper.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {

  String selectedName = "আব্বু";
  String selectedCategory = "বাজার";

  final amountController = TextEditingController();
  final noteController = TextEditingController();

  final names = [
    "আব্বু",
    "আম্মু",
    "মিতু",
  ];

  final categories = [
    "বাজার",
    "ওষুধ",
    "যাতায়াত",
    "বিল",
    "অন্যান্য",
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("নতুন খরচ যোগ করুন"),
        backgroundColor: Colors.green,
      ),


      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            DropdownButtonFormField(
              value: selectedName,

              decoration: const InputDecoration(
                labelText: "নাম",
                border: OutlineInputBorder(),
              ),

              items: names.map((name){

                return DropdownMenuItem(
                  value: name,
                  child: Text(name),
                );

              }).toList(),


              onChanged: (value){

                setState(() {
                  selectedName = value!;
                });

              },

            ),


            const SizedBox(height:15),


            DropdownButtonFormField(
              value: selectedCategory,

              decoration: const InputDecoration(
                labelText: "ক্যাটাগরি",
                border: OutlineInputBorder(),
              ),

              items: categories.map((cat){

                return DropdownMenuItem(
                  value: cat,
                  child: Text(cat),
                );

              }).toList(),


              onChanged: (value){

                setState(() {
                  selectedCategory = value!;
                });

              },

            ),


            const SizedBox(height:15),


            TextField(
              controller: amountController,

              keyboardType: TextInputType.number,

              decoration: const InputDecoration(
                labelText: "টাকার পরিমাণ",
                border: OutlineInputBorder(),
              ),

            ),


            const SizedBox(height:15),


            TextField(
              controller: noteController,

              decoration: const InputDecoration(
                labelText: "বিবরণ",
                border: OutlineInputBorder(),
              ),

            ),


            const SizedBox(height:25),


            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(15),
                ),


                onPressed: () async {

  if(amountController.text.isEmpty){
    return;
  }


  await DatabaseHelper.instance.addExpense({

    'name': selectedName,

    'category': selectedCategory,

    'amount': double.parse(
      amountController.text
    ),

    'note': noteController.text,

    'date': DateTime.now()
        .toString(),

  });



  ScaffoldMessenger.of(context)
  .showSnackBar(

    const SnackBar(
      content: Text(
        "খরচ সফলভাবে সংরক্ষণ হয়েছে"
      ),
    ),

  );


  amountController.clear();

  noteController.clear();

},
