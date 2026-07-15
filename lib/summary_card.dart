import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {

  final String title;
  final String amount;
  final Color color;


  const SummaryCard({

    super.key,

    required this.title,

    required this.amount,

    required this.color,

  });



  @override
  Widget build(BuildContext context) {


    return Card(

      elevation: 4,

      color: color,

      margin: const EdgeInsets.all(8),


      child: ListTile(

        leading: const Icon(

          Icons.account_balance_wallet,

          color: Colors.white,

          size: 35,

        ),


        title: Text(

          title,

          style: const TextStyle(

            color: Colors.white,

            fontSize: 18,

            fontWeight: FontWeight.bold,

          ),

        ),


        trailing: Text(

          amount,

          style: const TextStyle(

            color: Colors.white,

            fontSize: 22,

            fontWeight: FontWeight.bold,

          ),

        ),

      ),

    );

  }

}
