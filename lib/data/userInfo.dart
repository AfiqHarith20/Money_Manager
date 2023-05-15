enum TransactionType {
  outflow,
  inflow,
}

enum ItemCategoryType {
  fashion,
  grocery,
}

class UserInfo {
  final String name;
  final String totalBalance;
  final String inflow;
  final String outflow;
  final List<Transaction> transactions;

  const UserInfo({
    required this.name,
    required this.totalBalance,
    required this.inflow,
    required this.outflow,
    required this.transactions,
  });
}

class Transaction {
  final ItemCategoryType categoryType;
  final TransactionType transactionType;
  final String itemCategoryName;
  final String itemName;
  final String amount;
  final String date;

  const Transaction(
    this.categoryType,
    this.transactionType,
    this.itemCategoryName,
    this.itemName,
    this.amount,
    this.date,
  );
}

const List<Transaction> transactions1 = [
  Transaction(
    ItemCategoryType.fashion,
    TransactionType.outflow,
    "Shoes",
    "Puma Sneaker",
    "\RM 540.80",
    "17, Sept",
  ),
  Transaction(
    ItemCategoryType.fashion,
    TransactionType.outflow,
    "Shirt",
    "Nike shirt",
    "\RM 240.40",
    "01, Oct",
  )
];

const List<Transaction> transactions2 = [
  Transaction(
    ItemCategoryType.fashion,
    TransactionType.inflow,
    "Payment",
    "Transfer from Adim",
    "\RM 1,240.30",
    "21, May",
  ),
  Transaction(
    ItemCategoryType.fashion,
    TransactionType.outflow,
    "Food",
    "Chicken Wings",
    "\RM 40.90",
    "19, July",
  )
];

const userdate = UserInfo(
  name: "Afiq Harith",
  totalBalance: "\RM5,620.00",
  inflow: "\RM4,050.00",
  outflow: "\RM2,030.00",
  transactions: transactions1,
);
