import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../generated/auth/user.pb.dart';
import '../services/auth_service.dart';
import '../services/theme_service.dart';
import 'auth_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    setState(() => _isLoading = true);
    final user = await AuthService().getProfile();
    if (mounted) {
      setState(() {
        _user = user;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF4A00E0)))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Profile Header
                    _buildProfileHeader(isDark, primaryTextColor),
                    const SizedBox(height: 40),

                    // Primary Settings Section
                    _buildSectionHeader("Account Status", primaryTextColor),
                    _buildSettingItem(
                      context,
                      icon: IconlyBold.discovery,
                      title: "Dark Mood",
                      color: const Color(0xFF6C5CE7),
                      trailing: ListenableBuilder(
                        listenable: ThemeService(),
                        builder: (context, _) {
                          return Switch(
                            value: ThemeService().isDarkMode,
                            onChanged: (val) {
                              ThemeService().toggleTheme(val);
                            },
                            activeColor: const Color(0xFF6C5CE7),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 16),
                    _buildSectionHeader("User Information", primaryTextColor),
                    _buildSettingItem(
                      context,
                      icon: IconlyBold.message,
                      title: "Email",
                      subtitle: _user?.email ?? "Not set",
                      color: const Color(0xFFFF7675),
                      showChevron: false,
                    ),
                    _buildSettingItem(
                      context,
                      icon: IconlyBold.call,
                      title: "Phone",
                      subtitle: _user?.phone ?? "Not set",
                      color: const Color(0xFFFDCB6E),
                      showChevron: false,
                    ),
                    _buildSettingItem(
                      context,
                      icon: IconlyBold.profile,
                      title: "Personal Details",
                      subtitle: "${_user?.gender}, ${_user?.age} years old",
                      color: const Color(0xFF00CEC9),
                      showChevron: false,
                    ),
                    _buildSettingItem(
                      context,
                      icon: IconlyBold.password,
                      title: "Role",
                      subtitle: _user?.role ?? "User",
                      color: const Color(0xFF0984E3),
                      showChevron: false,
                    ),
                    
                    if (_user != null && _user!.createdAt.isNotEmpty)
                      _buildSettingItem(
                        context,
                        icon: IconlyBold.calendar,
                        title: "Member Since",
                        subtitle: _user!.createdAt,
                        color: Colors.grey.shade400,
                        showChevron: false,
                      ),

                    const SizedBox(height: 40),

                    // Logout Section
                    _buildSettingItem(
                      context,
                      icon: IconlyBold.logout,
                      title: "Logout",
                      color: Colors.redAccent.withValues(alpha: 0.1),
                      iconColor: Colors.redAccent,
                      onTap: () async {
                        final navigator = Navigator.of(context);
                        await AuthService().logout();
                        navigator.pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const AuthScreen()),
                          (route) => false,
                        );
                      },
                      showChevron: false,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildProfileHeader(bool isDark, Color primaryTextColor) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: isDark ? Colors.white24 : Colors.grey.shade200),
          ),
          child: const CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xFFE0E0E0),
            child: Icon(IconlyBold.profile, size: 40, color: Colors.white),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _user?.username ?? "Guest",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "ID: ${_user?.id ?? 'N/A'}",
                style: TextStyle(
                  fontSize: 13,
                  color: isDark ? Colors.white38 : Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 4),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: color.withValues(alpha: 0.5),
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required Color color,
    Color? iconColor,
    VoidCallback? onTap,
    Widget? trailing,
    bool showChevron = true,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.03) : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor ?? Colors.white, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: isDark ? Colors.white38 : Colors.grey.shade600,
                        ),
                      ),
                  ],
                ),
              ),
              if (trailing != null)
                trailing
              else if (showChevron)
                Icon(IconlyLight.arrow_right_2,
                    color: isDark ? Colors.white38 : Colors.grey.shade400, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
