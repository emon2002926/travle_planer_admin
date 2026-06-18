import 'package:flutter/material.dart';
import '../../../core/util/app_navigation.dart';
import '../views/administrators_screen.dart';
import '../views/dashboard_screen.dart';
import '../views/payment_screen.dart';
import '../views/settings_screen.dart';
import '../views/user_management_screen.dart';


enum AdminNav { dashboard, userManagement, payment, administrators, settings }

class AdminShell extends StatelessWidget {
  final AdminNav selected;
  final Widget body;
  const AdminShell({super.key, required this.selected, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF2F7),
      body: Row(
        children: [
          _Sidebar(selected: selected),
          Expanded(
            child: Column(
              children: [
                const _TopBar(),
                Expanded(child: body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Sidebar extends StatelessWidget {
  final AdminNav selected;
  const _Sidebar({required this.selected});

  void _go(AdminNav target) {
    if (target == selected) return;
    switch (target) {
      case AdminNav.dashboard:
        AppNavigation.push(DashboardScreen());
        break;
      case AdminNav.userManagement:
        AppNavigation.push(UserManagementScreen());
        break;
      case AdminNav.payment:
        AppNavigation.push(PaymentScreen());
        break;
      case AdminNav.administrators:
        AppNavigation.push(AdministratorsScreen());
        break;
      case AdminNav.settings:
        AppNavigation.push(SettingsScreen());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: Color(0xFF1C1C24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
            child: ClipOval(
              child: Image.asset(
                'assets/images/tripnest_logo.png', // TODO: point at your logo asset
                width: 96,
                height: 96,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 96,
                  height: 96,
                  color: Color(0xFF1A56DB),
                  alignment: Alignment.center,
                  child: const Text(
                    'TN',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _SidebarItem(
            icon: Icons.speed_outlined,
            label: 'DashBoard',
            isSelected: selected == AdminNav.dashboard,
            onTap: () => _go(AdminNav.dashboard),
          ),
          _SidebarItem(
            icon: Icons.groups_2_outlined,
            label: 'User Management',
            isSelected: selected == AdminNav.userManagement,
            onTap: () => _go(AdminNav.userManagement),
          ),
          _SidebarItem(
            icon: Icons.account_balance_wallet_outlined,
            label: 'Payment',
            isSelected: selected == AdminNav.payment,
            onTap: () => _go(AdminNav.payment),
          ),
          _SidebarItem(
            icon: Icons.shield_outlined,
            label: 'Administrators',
            isSelected: selected == AdminNav.administrators,
            onTap: () => _go(AdminNav.administrators),
          ),
          _SidebarItem(
            icon: Icons.settings_outlined,
            label: 'Settings',
            isSelected: selected == AdminNav.settings,
            onTap: () => _go(AdminNav.settings),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF1A56DB) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? Colors.white : Color(0xFF9AA0AB),
            ),
            const SizedBox(width: 14),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Color(0xFF9AA0AB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      color: Color(0xFFFFFFFF),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFEAECF0)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Color(0xFF1A56DB),
              child: const Text(
                'MR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Moni Roy',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF101828),
                  ),
                ),
                Text(
                  'Super Admin',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF667085),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Icon(Icons.keyboard_arrow_down, color: Color(0xFF667085)),
          ],
        ),
      ),
    );
  }
}
