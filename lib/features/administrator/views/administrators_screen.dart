import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/text/app_text.dart';
import '../controllers/administrators_controller.dart';



class AdministratorsScreen extends StatelessWidget {
  const AdministratorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdministratorsController());

    return SingleChildScrollView(
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
            InkWell(
              onTap: controller.onInvite,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF1A56DB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: Color(0xFFFFFFFF), size: 20),
                    const SizedBox(width: 10),
                    AppText(
                      data: 'Invite new admin',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFFFFF),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                final tableWidth =
                constraints.maxWidth > 900 ? constraints.maxWidth : 900.0;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: tableWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _headerRow(),
                        const Divider(height: 1, color: Color(0xFFEAECF0)),
                        Obx(() => Column(
                          children: [
                            for (int i = 0;
                            i < controller.admins.length;
                            i++)
                              _dataRow(controller, i),
                          ],
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerRow() {
    Widget h(String t, int flex, {Alignment align = Alignment.centerLeft}) =>
        Expanded(
          flex: flex,
          child: Align(
            alignment: align,
            child: AppText(
              data: t,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF101828),
            ),
          ),
        );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          h('SL no.', 2),
          h('Name', 3),
          h('Email', 3),
          h('Has Access to', 2),
          h('Action', 2, align: Alignment.centerRight),
        ],
      ),
    );
  }

  Widget _dataRow(AdministratorsController c, int i) {
    final a = c.admins[i];
    Widget cell(String t, int flex) => Expanded(
      flex: flex,
      child: AppText(
        data: t,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Color(0xFF344054),
      ),
    );

    Widget actionBtn(IconData icon, Color color, VoidCallback onTap) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Color(0xFFFFFFFF), size: 20),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF2F4F7))),
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        children: [
          cell(a.sl, 2),
          cell(a.name, 3),
          cell(a.email, 3),
          cell(a.access, 2),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                actionBtn(Icons.edit_outlined, Color(0xFF1A56DB),
                        () => c.onEdit(i)),
                const SizedBox(width: 12),
                actionBtn(Icons.delete_outline, Color(0xFFEF4444),
                        () => c.confirmRemove(i)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}