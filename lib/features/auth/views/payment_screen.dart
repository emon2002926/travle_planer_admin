import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/text/app_text.dart';
import '../controllers/admin_shell.dart';
import '../controllers/payment_controller.dart';


class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());

    return AdminShell(
      selected: AdminNav.payment,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(28),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sort dropdown
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFD0D5DD)),
                  ),
                  child: Obx(() => DropdownButton<String>(
                        value: controller.sortBy.value,
                        underline: const SizedBox(),
                        icon: Icon(Icons.keyboard_arrow_down,
                            color: Color(0xFF101828)),
                        items: controller.sortOptions
                            .map((o) => DropdownMenuItem(
                                  value: o,
                                  child: Text(o),
                                ))
                            .toList(),
                        onChanged: (v) {
                          if (v != null) controller.setSort(v);
                        },
                      )),
                ),
              ),
              const SizedBox(height: 16),
              _headerRow(),
              const Divider(height: 1, color: Color(0xFFEAECF0)),
              Obx(() => Column(
                    children:
                        controller.payments.map((p) => _dataRow(p)).toList(),
                  )),
              const SizedBox(height: 24),
              Center(
                child: InkWell(
                  onTap: controller.onExportCsv,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF1A56DB),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.file_download_outlined,
                            color: Color(0xFFFFFFFF), size: 20),
                        const SizedBox(width: 10),
                        AppText(
                          data: 'Export CSV',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerRow() {
    Widget h(String t, int flex) => Expanded(
          flex: flex,
          child: AppText(
            data: t,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF101828),
          ),
        );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          h('Date', 2),
          h('User Email', 3),
          h('Plan', 2),
          h('Amount', 2),
          h('Status', 2),
          h('Payment method', 2),
        ],
      ),
    );
  }

  Widget _dataRow(PaymentRow p) {
    Widget cell(String t, int flex) => Expanded(
          flex: flex,
          child: AppText(
            data: t,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xFF344054),
          ),
        );

    final bool failed = p.status == 'Failed';
    final Color badgeBg = failed ? Color(0xFFFEE2E2) : Color(0xFFDCFCE7);
    final Color badgeText = failed ? Color(0xFFB91C1C) : Color(0xFF166534);

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF2F4F7))),
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        children: [
          cell(p.date, 2),
          cell(p.email, 3),
          cell(p.plan, 2),
          cell(p.amount, 2),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: AppText(
                  data: p.status,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: badgeText,
                ),
              ),
            ),
          ),
          cell(p.method, 2),
        ],
      ),
    );
  }
}
