class AddressModel {
  final String title;
  final int debtSum;
  final int notEnteredMeterReadings;
  final String nameSurname;
  final int phoneNumber;
  final int personalAccount;
  String? priority;
  List<String> subAddresses;
  bool isExpanded;

  AddressModel({
    required this.title,
    required this.debtSum,
    this.notEnteredMeterReadings = 1,
    required this.nameSurname,
    required this.phoneNumber,
    required this.personalAccount,
    this.priority = "Нормалный",
    required this.subAddresses,
     this.isExpanded=false,
  });
}
