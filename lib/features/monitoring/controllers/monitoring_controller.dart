import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lively/features/monitoring/models/monitoring_model.dart';
import 'package:lively/utils/popups/snackbar.dart';

class MonitoringController extends GetxController {
  final Rx<MonitoringModel> _data = MonitoringModel().obs;
  final RxBool _isLoading = true.obs;
  final RxString _error = ''.obs;

  final DatabaseReference _ref = FirebaseDatabase.instance.ref(
    'tekanan_darah/latest',
  );
  StreamSubscription<DatabaseEvent>? _subscription;

  MonitoringModel get data => _data.value;
  bool get isLoading => _isLoading.value;
  String get error => _error.value;

  List<Map<String, dynamic>> get cards => [
    {
      'icon': Iconsax.activity,
      'value': data.heartRateString,
      'unit': 'bpm',
      'label': 'Heart Rate',
    },
    {
      'icon': Iconsax.heart_circle,
      'value': data.bloodPressure,
      'unit': 'mmHg',
      'label': 'Blood Pressure',
    },
    {
      'icon': Iconsax.cloud,
      'value': data.oxygenSaturationString,
      'unit': '%',
      'label': 'Oxygen',
    },
    {
      'icon': Iconsax.sun,
      'value': data.temperatureString,
      'unit': '°C',
      'label': 'Temperature',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    _startListening();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  void _startListening() {
    _subscription = _ref.onValue.listen(
      (event) {
        if (event.snapshot.exists) {
          final json = Map<String, dynamic>.from(event.snapshot.value as Map);
          _data.value = MonitoringModel.fromJson(json);
          _isLoading.value = false;
          _error.value = '';
        } else {
          _error.value = 'No data found';
          _isLoading.value = false;
          REYLoaders.warningSnackBar(
            title: 'Warning',
            message: 'No monitoring data found.',
          );
        }
      },
      onError: (error) {
        _error.value = error.toString();
        _isLoading.value = false;
        REYLoaders.errorSnackBar(
          title: 'Error',
          message: 'Failed to load monitoring data.',
        );
      },
    );
  }

  @override
  void refresh() {
    _isLoading.value = true;
    _error.value = '';
    _subscription?.cancel();
    _startListening();
  }
}
