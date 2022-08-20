
class AddressModel {
  final String title;
  final int debtSum;
  final int notEnteredMeterReadings;
  AddressModel({
    required this.title,
    required this.debtSum,
     this.notEnteredMeterReadings=1,
  });
}
