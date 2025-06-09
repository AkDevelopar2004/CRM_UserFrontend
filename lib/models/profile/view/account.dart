import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Profile Section with overlapping design
              _buildProfileSection(),
              const SizedBox(height: 20),
              // Menu Items
              Expanded(child: _buildMenuList(context))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // Background Container
        Container(
          width: double.infinity,
          height: 120,
          margin:
              const EdgeInsets.only(top: 60), // Space for half of profile image
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 40), // Space for overlapping profile image
              Text(
                'Nitish Tao',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        // Profile Picture - positioned to overlap
        Positioned(
          top: 0,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF6C63FF),
                width: 4,
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              size: 60,
              color: Color(0xFF6C63FF),
            ),
          ),
        ),
      ],
    );
  }
 

Widget _buildMenuList(BuildContext context) {
  final menuItems = [
    {'icon': Icons.edit_outlined, 'title': 'Edit Profile', 'route': '/edit-profile'},
    {'icon': Icons.room_service_outlined, 'title': 'Service Taken', 'route': '/service-taken'},
    {'icon': Icons.folder_outlined, 'title': 'My Projects', 'route': '/my-projects'},
    {'icon': Icons.trending_up_outlined, 'title': 'Work Progress', 'route': '/work-progress'},
    {'icon': Icons.receipt_outlined, 'title': 'Invoices', 'route': '/invoices'},
    {'icon': Icons.payment_outlined, 'title': 'Payments', 'route': '/payments'},
    {'icon': Icons.settings_outlined, 'title': 'App Settings', 'route': '/app-settings'},
    {'icon': Icons.support_agent_outlined, 'title': 'Raise Ticket', 'route': '/raise-ticket'},
  ];

  return ListView.separated(
    itemCount: menuItems.length,
    separatorBuilder: (context, index) => const SizedBox(height: 8),
    itemBuilder: (context, index) {
      final item = menuItems[index];
      return _buildMenuItem(
        icon: item['icon'] as IconData,
        title: item['title'] as String,
        onTap: () {
          // Navigate using context.push
          context.push(item['route'] as String);
        },
      );
    },
  );
}

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Icon(
          icon,
          color: const Color(0xFF6C63FF),
          size: 24,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2D2D2D),
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Color(0xFF9E9E9E),
          size: 20,
        ),
      ),
    );
  }
}
