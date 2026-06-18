import 'package:get/get.dart';

class DashboardStat {
  final String value;
  final String label;
  const DashboardStat({required this.value, required this.label});
}

class DashboardController extends GetxController {
  final RxString adminName = 'Moni Roy'.obs;
  final RxString greeting = 'Good Morning'.obs;

  final RxList<DashboardStat> stats = <DashboardStat>[
    const DashboardStat(value: '1320', label: 'Active Users Today'),
    const DashboardStat(value: '8', label: 'New Users (Last 7 Days)'),
    const DashboardStat(value: '4,55,666', label: 'Total Users'),
    const DashboardStat(value: '41', label: 'Total Paying User'),
    const DashboardStat(value: '\$500', label: 'Monthly Revenue'),
  ].obs;
}
