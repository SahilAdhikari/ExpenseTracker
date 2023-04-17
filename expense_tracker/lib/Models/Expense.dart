class Expense {
  String? expenseId;
  String? userName;
  String? category;
  String? amount;
  String? dateTime;

  Expense(
      {this.expenseId,
      this.userName,
      this.category,
      this.amount,
      this.dateTime});

  Map<String, dynamic> toJson() {
    return {
      "expenseId": expenseId,
      "userName": userName,
      "category": category,
      "amount": amount,
      "dateTime": dateTime
    };
  }

  Expense.fromJson(Map<String, dynamic> json) {
    expenseId = json['expenseId'];
    userName = json['userName'];
    category = json['category'];
    amount = json['amount'];
    dateTime = json['dateTime'];
  }
}
