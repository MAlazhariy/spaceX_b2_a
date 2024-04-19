import 'package:equatable/equatable.dart';

class CapsuleModel extends Equatable {
  final String id;
  final int reuseCount;
  final int waterLanding;
  final int landLanding;

  /// #### Last updated news about the capsule.
  ///
  /// i.e: 'Arrived at Port of LA after splashdown following CRS-19 mission'
  final String lastUpdate;

  /// list of launches IDs.
  final List<String> launches;
  final String serial;
  final String status;
  final String type;

  const CapsuleModel({
    required this.id,
    required this.reuseCount,
    required this.waterLanding,
    required this.landLanding,
    required this.lastUpdate,
    required this.launches,
    required this.serial,
    required this.status,
    required this.type,
  });

  factory CapsuleModel.fromJson(Map<String, dynamic> json) {
    return CapsuleModel(
      id: json['id'],
      reuseCount: json['reuse_count'] ?? 0,
      waterLanding: json['water_landings'] ?? 0,
      landLanding: json['land_landings'] ?? 0,
      lastUpdate: json['last_update'] ?? '',
      launches: json['launches'] != null ? List.from(json['launches']) : [],
      serial: json['serial'] ?? 'Unknown',
      status: json['status'] ?? 'Unknown',
      type: json['type'] ?? 'Unknown',
    );
  }

  @override
  List<Object> get props => [
        id,
        reuseCount,
        waterLanding,
        landLanding,
        lastUpdate,
        launches,
        serial,
        status,
        type,
      ];
}
