class ChargingStation {
  final String name;
  final String address;
  final double distance;
  final double pricePerHour;
  final String type;
  final double power;
  final String status;
  final String image;
  final String chargeId;

  ChargingStation( {
    required this.name,
    required this.address,
    required this.distance,
    required this.pricePerHour,
    required this.type,
    required this.power,
    required this.status,
    required this.image,
    required this.chargeId,
  });
}
