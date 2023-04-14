import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  Widget pageHeader(String userName) {
    double fontSize = 26;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Hello $userName, ",
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        Icon(
          Icons.account_circle,
          size: 30,
        )
      ],
    );
  }

  Widget TargetCard(
      Icon icon, String title, String amount, Color color, double width) {
    return Container(
      width: width,
      height: width,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 5,
            ),
          ],
          color: Colors.grey.shade100),
      child: Column(
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "RS " + amount,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget expenseListView() {
    Widget expenseViewListTile() {
      return ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Icons.medical_information_outlined,
            color: Colors.red,
          ),
        ),
        title: Text(
          "Health Check",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(DateFormat('yyyy-MM-dd').format(DateTime.now())),
        trailing: Text(
          'Rs 100',
          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Activities",
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            TextButton(onPressed: () {}, child: Text("View All"))
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => expenseViewListTile()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                pageHeader('Sahil'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TargetCard(
                        Icon(
                          Icons.balance,
                          color: Colors.green,
                          size: 30,
                        ),
                        "Monthly Target",
                        "10K",
                        Colors.greenAccent,
                        (width - 140) / 2),
                    TargetCard(
                        Icon(
                          Icons.balance,
                          color: Colors.red,
                          size: 30,
                        ),
                        "Expense",
                        "5K",
                        Colors.redAccent,
                        (width - 140) / 2),
                  ],
                ),
                expenseListView()
              ],
            ),
          ),
        ));
  }
}
