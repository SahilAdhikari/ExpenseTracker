import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../Models/Expense.dart';

String baseUrl = 'http://192.168.29.181:9090';

class ExpenseController extends GetxController {
  var userExpenses = <Expense>[].obs;
  ExpenseController() {
    userExpenses.value.add(Expense(
        amount: "100",
        category: "Health",
        dateTime: "2022-10-10",
        expenseId: "234567890",
        userName: "sahil"));

    userExpenses.value.add(Expense(
        amount: "200",
        category: "Food",
        dateTime: "2022-10-10",
        expenseId: "234567890",
        userName: "sahil"));

    userExpenses.value.add(Expense(
        amount: "100",
        category: "Education",
        dateTime: "2022-10-10",
        expenseId: "234567890",
        userName: "sahil"));

    userExpenses.value.add(Expense(
        amount: "10000",
        category: "Health",
        dateTime: "2022-10-10",
        expenseId: "234567890",
        userName: "sahil"));

    userExpenses.value.add(Expense(
        amount: "10000",
        category: "Education",
        dateTime: "2022-10-10",
        expenseId: "234567890",
        userName: "sahil"));
  }
  Dio dio = Dio();
  getAllExpenses() async {
    try {
      var res = await dio.get(baseUrl + '/expenses');
      Iterable l = res.data;
      List<Expense> expenses =
          List<Expense>.from(l.map((model) => Expense.fromJson(model)));
      userExpenses.value = expenses;
    } catch (e) {
      print('getAllExpensesException : ' + e.toString());
    }
  }

  addExpense(Expense expense) async {
    try {
      var res = await dio.post(baseUrl + '/addExpense', data: expense.toJson());
      expenseController.userExpenses.add(expense);
    } catch (e) {
      print('addExpenseExpention : ' + e.toString());
    }
  }
}

var expenseController = ExpenseController();
