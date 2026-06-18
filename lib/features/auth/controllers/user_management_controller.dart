import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRow {
  final String sl;
  final String name;
  final String email;
  final String plan;
  final String registrationDate;
  const UserRow({
    required this.sl,
    required this.name,
    required this.email,
    required this.plan,
    required this.registrationDate,
  });
}

class UserManagementController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final RxString selectedRole = 'Owner'.obs;
  final RxInt currentPage = 1.obs;
  final int totalPages = 3;

  final List<String> roles = const ['Owner', 'Editor', 'Visitor'];

  final RxList<UserRow> users = <UserRow>[
    UserRow(sl: '#1233', name: 'Kathryn Murp', email: 'bockely@att.com', plan: 'Monthly', registrationDate: '22 Nov 2022'),
    UserRow(sl: '#1233', name: 'Devon Lane', email: 'csilvers@rizon.com', plan: 'Free', registrationDate: '22 Nov 2022'),
    UserRow(sl: '#1233', name: 'Foysal Rahman', email: 'qamaho@mail.com', plan: 'Monthly', registrationDate: '22 Nov 2022'),
    UserRow(sl: '#1233', name: 'Hari Danang', email: 'xterris@gmail.com', plan: 'Yearly', registrationDate: '22 Nov 2022'),
    UserRow(sl: '#1233', name: 'Floyd Miles', email: 'xterris@gmail.com', plan: 'Yearly', registrationDate: '22 Nov 2022'),
    UserRow(sl: '#1233', name: 'Eleanor Pena', email: 'xterris@gmail.com', plan: 'Free', registrationDate: '22 Nov 2022'),
    UserRow(sl: '#1233', name: 'Devon Lane', email: 'xterris@gmail.com', plan: 'Free', registrationDate: '22 Nov 2022'),
    UserRow(sl: '#1233', name: 'Hari Danang', email: 'xterris@gmail.com', plan: 'Free', registrationDate: '22 Nov 2022'),
    UserRow(sl: '#1233', name: 'Devon Lane', email: 'xterris@gmail.com', plan: 'Monthly', registrationDate: '22 Nov 2022'),
    UserRow(sl: '#1233', name: 'Hari Danang', email: 'xterris@gmail.com', plan: 'Yearly', registrationDate: '22 Nov 2022'),
  ].obs;

  void selectRole(String role) => selectedRole.value = role;

  void onSearch() {
    // TODO: query your API with searchController.text + selectedRole.
  }

  void goToPage(int page) {
    if (page < 1 || page > totalPages) return;
    currentPage.value = page;
    // TODO: fetch the page from your API.
  }

  void nextPage() => goToPage(currentPage.value + 1);
  void prevPage() => goToPage(currentPage.value - 1);

  void onViewDetails(UserRow user) {
    // TODO: open the user detail screen.
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
