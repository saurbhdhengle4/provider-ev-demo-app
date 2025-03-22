class ChargingSession {
  final String location;
  final String power;
  final String time;
  final String duration;
  final String? secondaryPower;

  ChargingSession({
    required this.location,
    required this.power,
    required this.time,
    required this.duration,
    this.secondaryPower,
  });
}