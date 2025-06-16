class MonitoringModel {
  final double? heartRate;
  final double? systolicBP;
  final double? diastolicBP;
  final double? oxygenSaturation;
  final double? temperature;

  MonitoringModel({
    this.heartRate,
    this.systolicBP,
    this.diastolicBP,
    this.oxygenSaturation,
    this.temperature,
  });

  factory MonitoringModel.fromJson(Map<String, dynamic> json) {
    return MonitoringModel(
      heartRate: _parseDouble(json['HR']),
      systolicBP: _parseDouble(json['SBP']),
      diastolicBP: _parseDouble(json['DBP']),
      oxygenSaturation: _parseDouble(json['SpO2']),
      temperature: _parseDouble(json['Temperature']),
    );
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return null;
  }

  String get heartRateString => heartRate?.toInt().toString() ?? '--';
  String get bloodPressure =>
      (systolicBP != null && diastolicBP != null)
          ? '${systolicBP!.toInt()}/${diastolicBP!.toInt()}'
          : '--/--';
  String get oxygenSaturationString =>
      oxygenSaturation?.toInt().toString() ?? '--';
  String get temperatureString => temperature?.toStringAsFixed(1) ?? '--';
}
