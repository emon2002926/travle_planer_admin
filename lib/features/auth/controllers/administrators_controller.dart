import 'package:get/get.dart';

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

  void onInvite() {
    // TODO: open the invite-admin form.
  }

  void onEdit(int index) {
    // TODO: open the edit form for admins[index].
  }

  void deleteAdmin(int index) {
    // TODO: confirm, then remove via API. Local removal for now:
    admins.removeAt(index);
  }
}
