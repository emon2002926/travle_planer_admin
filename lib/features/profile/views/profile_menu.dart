import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/text/app_text.dart';
import '../controllers/profile_controller.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ProfileController>();
    final screenW = MediaQuery.of(context).size.width;
    final cardWidth = screenW - 48 < 380 ? screenW - 48 : 380.0;
    final topInset = screenW < 900 ? 64.0 : 84.0;

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        // sits just under the top bar, near the avatar
        padding: EdgeInsets.only(top: topInset, right: 16),
        child: Material(
          color: Color(0x00000000),
          child: Container(
            width: cardWidth,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Color(0x22101828),
                  blurRadius: 28,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    _avatar(c, 56),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(
                                () => AppText(
                              data: c.name.value,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF101828),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Obx(
                                () => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 7),
                              decoration: BoxDecoration(
                                color: Color(0xFF1A56DB),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: AppText(
                                data: c.role.value,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                const Divider(height: 1, color: Color(0xFFEAECF0)),
                const SizedBox(height: 6),
                _menuRow('Profile', c.openAccountSetting),
                _menuRow('Change Password', c.openPasswordChange),
                const SizedBox(height: 14),
                InkWell(
                  onTap: c.logout,
                  borderRadius: BorderRadius.circular(28),
                  child: Container(
                    height: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF1A56DB),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: AppText(
                      data: 'Logout',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _avatar(ProfileController c, double size) {
    return Obx(() {
      final url = c.avatarUrl.value;
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF1A56DB),
          image: url.isEmpty
              ? null
              : DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        child: url.isEmpty
            ? AppText(
          data: c.initials,
          fontSize: size * 0.34,
          fontWeight: FontWeight.w700,
          color: Color(0xFFFFFFFF),
        )
            : null,
      );
    });
  }

  Widget _menuRow(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: AppText(
                data: label,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF101828),
              ),
            ),
            Icon(Icons.chevron_right, color: Color(0xFF101828), size: 26),
          ],
        ),
      ),
    );
  }
}