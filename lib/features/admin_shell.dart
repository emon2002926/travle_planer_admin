import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AdminShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF2F7),
      body: Row(
        children: [
          _Sidebar(navigationShell: navigationShell),
          Expanded(
            child: Column(
              children: [
                const _TopBar(),
                Expanded(child: navigationShell),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Sidebar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const _Sidebar({required this.navigationShell});

  void _go(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final current = navigationShell.currentIndex;
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
            isSelected: current == 0,
            onTap: () => _go(0),
          ),
          _SidebarItem(
            icon: Icons.groups_2_outlined,
            label: 'User Management',
            isSelected: current == 1,
            onTap: () => _go(1),
          ),
          _SidebarItem(
            icon: Icons.account_balance_wallet_outlined,
            label: 'Payment',
            isSelected: current == 2,
            onTap: () => _go(2),
          ),
          _SidebarItem(
            icon: Icons.shield_outlined,
            label: 'Administrators',
            isSelected: current == 3,
            onTap: () => _go(3),
          ),
          _SidebarItem(
            icon: Icons.settings_outlined,
            label: 'Settings',
            isSelected: current == 4,
            onTap: () => _go(4),
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
