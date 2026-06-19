import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/text/app_text.dart';
import '../controllers/dashboard_controller.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const List<IconData> _icons = [
    Icons.check_circle,
    Icons.fiber_new,
    Icons.groups,
    Icons.workspace_premium,
    Icons.monetization_on,
  ];

  static const List<Color> _iconColors = [
    Color(0xFF22C55E),
    Color(0xFFF59E0B),
    Color(0xFF3B82F6),
    Color(0xFFF59E0B),
    Color(0xFFEAB308),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    data: 'Hi, Good Morning',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF667085),
                  ),
                  const SizedBox(height: 6),
                  AppText(
                    data: controller.adminName.value,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF101828),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    data: "User's Overview",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF101828),
                  ),
                  const SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final w = constraints.maxWidth;
                      final perRow = w >= 1100
                          ? 5
                          : w >= 800
                          ? 3
                          : w >= 500
                          ? 2
                          : 1;
                      const spacing = 16.0;
                      final cardW =
                          (w - spacing * (perRow - 1)) / perRow;
                      return Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: [
                          for (int i = 0; i < controller.stats.length; i++)
                            SizedBox(
                              width: cardW,
                              child: _StatCard(
                                icon: _icons[i],
                                iconColor: _iconColors[i],
                                value: controller.stats[i].value,
                                label: controller.stats[i].label,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;
  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 30),
          const SizedBox(height: 24),
          AppText(
            data: value,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF101828),
          ),
          const SizedBox(height: 6),
          AppText(
            data: label,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF667085),
          ),
        ],
      ),
    );
  }
}