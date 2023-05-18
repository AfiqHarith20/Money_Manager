import 'dart:math';

import 'package:money_manager/models/cost_model.dart';
import 'package:money_manager/models/type_model.dart';

final rand = Random();

final List<double> weeklySpending = [
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
];

_generalExpenses() {
  List<CostModel> costModel = [
    CostModel(name: 'Item 0', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 1', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 2', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 3', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 4', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 5', cost: rand.nextDouble() * 90),
  ];
  return costModel;
}

List<TypeModel> typeNames = [
  TypeModel(name: 'House', maxAmount: 2000, expenses: _generalExpenses()),
  TypeModel(name: 'Clothing', maxAmount: 200, expenses: _generalExpenses()),
  TypeModel(name: 'Food', maxAmount: 400, expenses: _generalExpenses()),
  TypeModel(name: 'Utilities', maxAmount: 200, expenses: _generalExpenses()),
  TypeModel(
      name: 'Entertainment', maxAmount: 100, expenses: _generalExpenses()),
  TypeModel(name: 'Transport', maxAmount: 100, expenses: _generalExpenses()),
];

class Money {
  late String image;
  late String name;
  late String time;
  late String fee;
  late bool buy;
}

List<Money> geter() {
  Money upwork = Money();
  upwork.name = 'Upwork';
  upwork.fee = '650';
  upwork.time = 'today';
  upwork.image = 'up.png';
  upwork.buy = false;
  Money starbucks = Money();
  starbucks.buy = true;
  starbucks.fee = '20';
  starbucks.image = 'starbuck.png';
  starbucks.name = 'Starbuck';
  starbucks.time = 'today';
  Money transfer = Money();
  transfer.buy = true;
  transfer.fee = '200';
  transfer.image = 'credit-card.png';
  transfer.name = 'Transfer for Adam';
  transfer.time = '20 April 2023';
  return [upwork, starbucks, transfer, upwork, starbucks, transfer];
}

List<Money> geter_top() {
  Money snap_food = Money();
  snap_food.time = '19 April 2023';
  snap_food.image = 'starbuck.png';
  snap_food.buy = true;
  snap_food.fee = '- \RM 30.00';
  snap_food.name = 'Snap Food';
  Money snap = Money();
  snap.image = 'credit card 2.png';
  snap.time = 'Today';
  snap.buy = true;
  snap.fee = '- \RM100.00';
  snap.name = 'Transfer';

  return [snap_food, snap];
}
