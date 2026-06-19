import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/confirm_remove_access_dialog.dart';
import '../widgets/edit_administrator_dialog.dart';
import '../widgets/new_administrator_dialog.dart';

class AdminRow {
  final String sl;
  final String name;
  final String email;
  final String access; // Super Admin | Admin
  const AdminRow({
    required this.sl,
    required this.name,
    required this.email,
    required this.access,
  });
}

class AdministratorsController extends GetxController {
  final RxList<AdminRow> admins = <AdminRow>[
    AdminRow(sl: '#1233', name: 'Kathryn Murp', email: 'bockely@att.com', access: 'Super Admin'),
    AdminRow(sl: '#1233', name: 'Devon Lane', email: 'csilvers@rizon.com', access: 'Admin'),
    AdminRow(sl: '#1233', name: 'Foysal Rahman', email: 'qamaho@mail.com', access: 'Admin'),
    AdminRow(sl: '#1233', name: 'Hari Danang', email: 'xterris@gmail.com', access: 'Admin'),
    AdminRow(sl: '#1233', name: 'Floyd Miles', email: 'xterris@gmail.com', access: 'Admin'),
    AdminRow(sl: '#1233', name: 'Eleanor Pena', email: 'xterris@gmail.com', access: 'Admin'),
    AdminRow(sl: '#1233', name: 'Devon Lane', email: 'xterris@gmail.com', access: 'Admin'),
    AdminRow(sl: '#1233', name: 'Hari Danang', email: 'xterris@gmail.com', access: 'Admin'),
    AdminRow(sl: '#1233', name: 'Hari Danang', email: 'xterris@gmail.com', access: 'Admin'),
  ].obs;

  // ---- Shared form state for the create / edit dialogs ----
  final TextEditingController formName = TextEditingController();
  final TextEditingController formEmail = TextEditingController();
  final RxString formRole = 'Owner'.obs;
  final RxString formImageName = ''.obs;

  // Options include the table's access values so seeding never crashes the dropdown.
  final List<String> roles = const [
    'Owner',
    'Admin',
    'Super Admin',
    'Editor',
    'Visitor',
  ];

  // null = creating, otherwise = editing this row index
  int? editingIndex;

  // ---- Open dialogs ----
  void onInvite() {
    editingIndex = null;
    formName.clear();
    formEmail.clear();
    formRole.value = 'Owner';
    formImageName.value = '';
    Get.dialog(const NewAdministratorDialog());
  }

  void onEdit(int index) {
    editingIndex = index;
    final a = admins[index];
    formName.text = a.name;
    formEmail.text = a.email;
    formRole.value = roles.contains(a.access) ? a.access : 'Admin';
    formImageName.value = '';
    Get.dialog(const EditAdministratorDialog());
  }

  void confirmRemove(int index) {
    Get.dialog(ConfirmRemoveAccessDialog(index: index));
  }

  // ---- Form actions ----
  Future<void> pickImage() async {
    try {
      final picked =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) formImageName.value = picked.name;
    } catch (_) {
      // ignore picker errors / cancellation
    }
  }

  void saveEdit() {
    final i = editingIndex;
    if (i == null) return;
    // TODO: send the update to your API.
    admins[i] = AdminRow(
      sl: admins[i].sl,
      name: formName.text.trim(),
      email: formEmail.text.trim(),
      access: formRole.value,
    );
    Get.back();
  }

  void createAdmin() {
    final name = formName.text.trim();
    final email = formEmail.text.trim();
    if (name.isEmpty || email.isEmpty) {
      Get.snackbar('Missing info', 'Please enter a name and email.');
      return;
    }
    // TODO: send the new admin to your API.
    admins.add(AdminRow(sl: '#1233', name: name, email: email, access: formRole.value));
    Get.back();
  }

  void deleteAdmin(int index) {
    // TODO: remove via API. Local removal for now:
    admins.removeAt(index);
    Get.back();
  }

  @override
  void onClose() {
    formName.dispose();
    formEmail.dispose();
    super.onClose();
  }
}
