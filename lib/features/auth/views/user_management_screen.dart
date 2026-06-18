import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/text/app_text.dart';
import '../../../core/widgets/text/text_field/AppTextFiled.dart';
import '../controllers/admin_shell.dart';
import '../controllers/user_management_controller.dart';


class UserManagementScreen extends StatelessWidget {
  UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserManagementController());

    return AdminShell(
      selected: AdminNav.userManagement,
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
              // Role tabs
              Obx(() => Row(
                    children: controller.roles.map((role) {
                      final isSelected = controller.selectedRole.value == role;
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: InkWell(
                          onTap: () => controller.selectRole(role),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color(0xFF1A56DB)
                                  : Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFF1A56DB)),
                            ),
                            child: AppText(
                              data: role,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? Color(0xFFFFFFFF)
                                  : Color(0xFF1A56DB),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )),
              const SizedBox(height: 20),
              // Search bar
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFEDEFF2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: controller.searchController,
                        hintText: 'Search by email or name',
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: controller.onSearch,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 14),
                        decoration: BoxDecoration(
                          color: Color(0xFF1A56DB),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: AppText(
                          data: 'Search',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Header
              _headerRow(),
              const Divider(height: 1, color: Color(0xFFEAECF0)),
              // Rows
              Obx(() => Column(
                    children: controller.users
                        .map((u) => _dataRow(controller, u))
                        .toList(),
                  )),
              const SizedBox(height: 20),
              // Pagination
              Obx(() => _pagination(controller)),
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
          h('SL no.', 2),
          h('Full Name', 3),
          h('Email', 3),
          h('Current Plan', 2),
          h('Registration Date', 2),
          h('View', 2),
        ],
      ),
    );
  }

  Widget _dataRow(UserManagementController c, UserRow u) {
    Widget cell(String t, int flex) => Expanded(
          flex: flex,
          child: AppText(
            data: t,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xFF344054),
          ),
        );
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF2F4F7))),
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        children: [
          cell(u.sl, 2),
          cell(u.name, 3),
          cell(u.email, 3),
          cell(u.plan, 2),
          cell(u.registrationDate, 2),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => c.onViewDetails(u),
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: AppText(
                    data: 'View Details',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF166534),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pagination(UserManagementController c) {
    Widget pill(String label, VoidCallback onTap, bool filled,
        {bool outlined = false}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              color: filled ? Color(0xFF1A56DB) : Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: outlined ? Color(0xFF1A56DB) : Colors.transparent,
              ),
            ),
            child: AppText(
              data: label,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: filled ? Color(0xFFFFFFFF) : Color(0xFF1A56DB),
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pill('< Prev', c.prevPage, true),
        for (int p = 1; p <= c.totalPages; p++)
          pill('$p', () => c.goToPage(p), c.currentPage.value == p,
              outlined: c.currentPage.value != p),
        pill('Next >', c.nextPage, true),
      ],
    );
  }
}
