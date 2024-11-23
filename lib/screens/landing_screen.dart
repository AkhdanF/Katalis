import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:katalis2/screens/login_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPageContent(String title, String subtitle, BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final titleFontSize = isSmallScreen ? 28.0 : 42.0;
    final subtitleFontSize = isSmallScreen ? 18.0 : 28.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: subtitleFontSize,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    final padding = isSmallScreen ? 20.0 : 45.0;
    final logoSize = isSmallScreen ? size.width * 0.3 : size.width * 0.2;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Scrollable content
              SingleChildScrollView(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    scrollbars: false,
                    overscroll: false,
                    physics: kIsWeb
                        ? const NeverScrollableScrollPhysics()
                        : const ScrollPhysics(),
                  ),
                  child: Container(
                    // Minimal height to ensure content fills screen
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Top content
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(padding),
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: logoSize,
                                child: Image.asset('lib/assets/image/logo.png'),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.asset(
                                'lib/assets/image/gambar1.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        // Spacer to push bottom content down
                        SizedBox(
                          height: isSmallScreen ? 20 : 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom fixed content
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Container(
                    color: const Color(0xFFFFEB3B),
                    constraints: BoxConstraints(
                      maxHeight: isSmallScreen
                          ? size.height * 0.4  // 40% of screen height for small screens
                          : size.height * 0.3, // 30% of screen height for large screens
                    ),
                    padding: EdgeInsets.only(
                      left: isSmallScreen ? 20.0 : 30.0,
                      right: isSmallScreen ? 20.0 : 30.0,
                      top: isSmallScreen ? 20.0 : 30.0,
                      bottom: MediaQuery.of(context).padding.bottom + (isSmallScreen ? 20.0 : 30.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: SingleChildScrollView(
                            child: _buildCustomPageView(context),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildBottomNavigation(isSmallScreen),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigation(bool isSmallScreen) {
    return Row(
      children: [
        Row(
          children: List.generate(
            3,
                (index) => Container(
              margin: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 2.0 : 4.0,
              ),
              width: isSmallScreen ? 8.0 : 10.0,
              height: isSmallScreen ? 8.0 : 10.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? Colors.black
                    : const Color(0xFF388E3C),
              ),
            ),
          ),
        ),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF424242),
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 16 : 24,
              vertical: isSmallScreen ? 8 : 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Mulai',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 16 : 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'InstrumentSans',
                ),
              ),
              SizedBox(width: isSmallScreen ? 12 : 20),
              Container(
                padding: EdgeInsets.all(isSmallScreen ? 2 : 3),
                decoration: const BoxDecoration(
                  color: Color(0xFF388E3C),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: const Color(0xFFFFEB3B),
                  size: isSmallScreen ? 16 : 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCustomPageView(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          if (_currentPage > 0) {
            setState(() {
              _currentPage--;
            });
          }
        } else if (details.primaryVelocity! < 0) {
          if (_currentPage < 2) {
            setState(() {
              _currentPage++;
            });
          }
        }
      },
      child: IndexedStack(
        index: _currentPage,
        children: [
          _buildPageContent(
            'Sekarang kelola bisnis jadi lebih mudah!',
            'Temukan fitur-fitur canggih untuk usaha kamu disini',
            context,
          ),
          _buildPageContent(
            'Analisa bisnis dengan laporan real-time!',
            'Dapatkan laporan lengkap untuk semua transaksi kamu',
            context,
          ),
          _buildPageContent(
            'Analisa bisnis dengan laporan real-time!',
            'Kolaborasi lebih mudah dengan fitur manajemen tim',
            context,
          ),
        ],
      ),
    );
  }
}