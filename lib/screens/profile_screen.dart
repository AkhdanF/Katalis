import 'package:flutter/material.dart';
import 'package:katalis2/widgets/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void signOut(BuildContext context) async {
    final auth = AuthService();
    await auth.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'lib/assets/image/profile_background.jpeg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProfilePic(),
                        SizedBox(height: 10),
                        Text(
                          'Akmal Imani',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Katalis Consulting',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // Tambahkan aksi edit profil
                },
                icon: const Icon(Icons.edit, color: Colors.white),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              _buildSectionTitle('Akun'),
              ProfileMenu(
                text: "Informasi Pribadi",
                icon: Icons.person_outline,
                press: () {},
                color: Colors.blue,
              ),
              ProfileMenu(
                text: "Pengaturan Akun",
                icon: Icons.settings_outlined,
                press: () {},
                color: Colors.purple,
              ),
              _buildSectionTitle('Aktivitas'),
              ProfileMenu(
                text: "Postingan Saya",
                icon: Icons.article_outlined,
                press: () {},
                color: Colors.green,
              ),
              ProfileMenu(
                text: "Komunitas",
                icon: Icons.group_outlined,
                press: () {},
                color: Colors.orange,
              ),
              _buildSectionTitle('Lainnya'),
              ProfileMenu(
                text: "Pusat Bantuan",
                icon: Icons.help_outline,
                press: () {},
                color: Colors.teal,
              ),
              ProfileMenu(
                text: "Kebijakan Privasi",
                icon: Icons.privacy_tip_outlined,
                press: () {},
                color: Colors.indigo,
              ),
              ProfileMenu(
                text: "Keluar",
                icon: Icons.logout,
                press: () => signOut(context),
                color: Colors.red,
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("lib/assets/image/profile4.png"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: Colors.grey[700],
                ),
                onPressed: () {
                  // Tambahkan fungsi ganti foto profil
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    this.press,
    required this.color,
  });

  final String text;
  final IconData icon;
  final VoidCallback? press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.grey[400],
          ),
          onTap: press,
        ),
      ),
    );
  }
}
