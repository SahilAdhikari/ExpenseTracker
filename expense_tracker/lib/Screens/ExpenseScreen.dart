import 'package:expense_tracker/Controllers/ExpenseController.dart';
import 'package:expense_tracker/Controllers/UserController.dart';
import 'package:expense_tracker/Models/Tags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../Models/Expense.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  void initState() {
    // TODO: implement initState
    expenseController.getAllExpenses();
    super.initState();
  }

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
    Widget expenseViewListTile(Expense expense) {
      Tag? tag = tagData[expense.category!];
      return ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: tag!.secondaryColor!,
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            tag.icon!,
            color: tag.primaryColor!,
          ),
        ),
        title: Text(
          expense.category!,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(expense.dateTime!),
        trailing: Text(
          'Rs ${expense.amount}',
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
        Obx(
          () => ListView.builder(
              shrinkWrap: true,
              itemCount: expenseController.userExpenses.length,
              itemBuilder: (context, index) =>
                  expenseViewListTile(expenseController.userExpenses[index])),
        ),
      ],
    );
  }

  // build sliding sheet for adding an expense
  buildAddExpenseBottomSheet(BuildContext context) {
    return showSlidingBottomSheet(context,
        resizeToAvoidBottomInset: true,
        builder: (context) => SlidingSheetDialog(
              isDismissable: true,
              color: Colors.blueAccent.shade200,
              cornerRadius: 16,
              avoidStatusBar: true,
              snapSpec: const SnapSpec(
                snappings: [0.7],
              ),
              headerBuilder: (context, state) {
                return Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: Container(
                      width: 40, height: 6, color: Colors.grey.shade200),
                );
              },
              builder: (context, state) =>
                  Material(child: AddExpenseFormView()),
            ));
  }

  Widget AddExpenseFormView() {
    String _categorySelectedValue = "Health";
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "ADD YOUR EXPENSE",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_month_rounded,
              color: Colors.black,
            ),
            title: Text(DateFormat.yMMMd().format(DateTime.now())),
          ),
          ListTile(
              leading: Icon(Icons.category, color: Colors.black),
              title: DropdownButton(
                items: [
                  DropdownMenuItem(
                    child: Text("Health"),
                    value: "Health",
                  ),
                  DropdownMenuItem(
                    child: Text("Education"),
                    value: "Education",
                  ),
                  DropdownMenuItem(
                    child: Text("Food"),
                    value: "Food",
                  )
                ],
                hint: Text('Select your expense category'),
                value: _categorySelectedValue,
                onChanged: (value) {
                  _categorySelectedValue = value.toString();
                  setState(() {});
                },
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                minLines: 2,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'About Your Expense',
                  prefixIcon: Icon(
                    Icons.description,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsetsDirectional.all(16),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  hintText: 'Expense Amount',
                  prefixIcon: Icon(
                    Icons.currency_rupee_sharp,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsetsDirectional.all(16),
                )),
          ),
          ElevatedButton(onPressed: () {}, child: Text("SAVE EXPENSE"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            buildAddExpenseBottomSheet(context);
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
                pageHeader(
                    toBeginningOfSentenceCase(userController.userName!)!),
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
