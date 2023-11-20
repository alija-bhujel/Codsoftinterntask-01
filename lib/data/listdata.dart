import 'package:budgetexpenseapp/data/content.dart';

List<content> geter() {
  content salary = content();
  salary.name = 'S A L A R Y';
  salary.time = 'Yesterday';
  salary.cash = 'Rs.20,000';
  salary.image = 'Salary.png';
  salary.buy = false;
  content clothes = content();
  clothes.name = 'C L O T H';
  clothes.time = 'Nov,15 2023';
  clothes.cash = 'Rs.2000';
  clothes.image = 'Clothes.png';
  clothes.buy = true;
  content gift = content();
  gift.name = 'G I F T';
  gift.time = 'Nov,1 2023';
  gift.cash = 'Rs.2000';
  gift.image = 'Gift.png';
  gift.buy = true;

  return [salary, clothes, gift];
}
