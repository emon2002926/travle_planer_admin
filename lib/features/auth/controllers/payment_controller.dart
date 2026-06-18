import 'package:get/get.dart';

class PaymentRow {
  final String date;
  final String email;
  final String plan;
  final String amount;
  final String status; // Paid | Active | Failed
  final String method;
  const PaymentRow({
    required this.date,
    required this.email,
    required this.plan,
    required this.amount,
    required this.status,
    required this.method,
  });
}

class PaymentController extends GetxController {
  final RxString sortBy = 'By date'.obs;
  final List<String> sortOptions = const ['By date', 'By status', 'By plan'];

  final RxList<PaymentRow> payments = <PaymentRow>[
    PaymentRow(date: '22 Nov 2022', email: 'bockely@att.com', plan: 'Monthly', amount: '\$450', status: 'Paid', method: '\$450'),
    PaymentRow(date: '22 Nov 2022', email: 'csilvers@rizon.com', plan: 'Free', amount: '\$450', status: 'Active', method: '\$450'),
    PaymentRow(date: '22 Nov 2022', email: 'qamaho@mail.com', plan: 'Monthly', amount: '\$450', status: 'Active', method: '\$450'),
    PaymentRow(date: '22 Nov 2022', email: 'xterris@gmail.com', plan: 'Yearly', amount: '\$450', status: 'Failed', method: '\$450'),
    PaymentRow(date: '22 Nov 2022', email: 'xterris@gmail.com', plan: 'Yearly', amount: '\$450', status: 'Failed', method: '\$450'),
    PaymentRow(date: '22 Nov 2022', email: 'xterris@gmail.com', plan: 'Free', amount: '\$450', status: 'Active', method: '\$450'),
    PaymentRow(date: '22 Nov 2022', email: 'xterris@gmail.com', plan: 'Free', amount: '\$450', status: 'Active', method: '\$450'),
    PaymentRow(date: '22 Nov 2022', email: 'xterris@gmail.com', plan: 'Free', amount: '\$450', status: 'Active', method: '\$450'),
    PaymentRow(date: '22 Nov 2022', email: 'xterris@gmail.com', plan: 'Monthly', amount: '\$450', status: 'Active', method: '\$450'),
    PaymentRow(date: '22 Nov 2022', email: 'xterris@gmail.com', plan: 'Yearly', amount: '\$450', status: 'Failed', method: '\$450'),
  ].obs;

  void setSort(String value) {
    sortBy.value = value;
    // TODO: re-sort / re-query based on value.
  }

  void onExportCsv() {
    // TODO: build the CSV and trigger a download.
  }
}
