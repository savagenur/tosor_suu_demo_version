import 'package:demo_version/models/check_date_model.dart';
import 'package:demo_version/models/date_model.dart';

final List<DateModel> allDates = [
  DateModel(month: "Апрель", amount: "3221", date: "(03.04.22)"),
  DateModel(month: "Май", amount: "4553", date: "(03.05.22)"),
  DateModel(month: "Июнь", amount: "3551", date: "(03.06.22)"),
  DateModel(month: "Июль", amount: "5212", date: "(03.07.22)"),
  DateModel(month: "Август", amount: "4625", date: "(03.08.22)"),
  DateModel(month: "Сентябрь", amount: "1132", date: "(03.09.22)"),
  DateModel(month: "Октябрь", amount: "1135", date: "(03.10.22)"),
  DateModel(month: "Ноябрь", amount: "985", date: "(03.11.22)"),
  DateModel(month: "Декабрь", amount: "6542", date: "(03.12.22)"),
  DateModel(month: "Январь", amount: "---", date: "---"),
];

final List<CheckDateModel> allCheckDates = [
  CheckDateModel(month: "Август", year: "2022", sum: "13000",accruedMoney: "3111"),
  CheckDateModel(month: "Июль", year: "2022", sum: "12000",accruedMoney: "3111"),
  CheckDateModel(month: "Июнь", year: "2022", sum: "11500",accruedMoney: "2112"),
  CheckDateModel(month: "Май", year: "2022", sum: "13000",accruedMoney: "3111"),
  CheckDateModel(month: "Апрель", year: "2022", sum: "12200",accruedMoney: "311"),
];
// Месяц                   Год                      Сумма

// Август                   2022              13000

// Июль                    2022           12000

// Июнь                    2022           11500

// Май                       2022          13000

// Апрель                 2022             12200