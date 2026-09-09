import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../main.dart';
import '../navigation/app_tabs.dart';
import '../data/auth_session.dart';
import '../widgets/custom_drawer.dart';
import 'about_screen.dart';
import 'donation_screen.dart';
import 'home_screen.dart';
import 'programs_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    appTabIndex.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    appTabIndex.removeListener(_onTabChanged);
    super.dispose();
  }

  void _onTabChanged() {
    if (mounted) setState(() {});
  }

  void _selectTab(int index) {
    if (index == 1 && !AuthSession.instance.isLoggedIn) {
      return;
    }
    appTabIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentIndex = appTabIndex.value;
    final titles = [l10n.home, l10n.donate, l10n.programs, l10n.about];

    const screens = [
      HomeScreen(),
      DonationScreen(),
      ProgramsScreen(),
      AboutScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: (value) {
              CharityApp.of(context)?.setLocale(Locale(value));
            },
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'ar', child: Text('العربية')),
              PopupMenuItem(value: 'en', child: Text('English')),
            ],
          ),
        ],
      ),
      drawer: CustomDrawer(
        currentIndex: currentIndex,
        onIndexChanged: _selectTab,
      ),
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        height: MediaQuery.sizeOf(context).width < 360 ? 64 : 80,
        labelBehavior: MediaQuery.sizeOf(context).width < 360
            ? NavigationDestinationLabelBehavior.onlyShowSelected
            : NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: _selectTab,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l10n.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.volunteer_activism_outlined),
            selectedIcon: const Icon(Icons.volunteer_activism),
            label: l10n.donate,
          ),
          NavigationDestination(
            icon: const Icon(Icons.assignment_outlined),
            selectedIcon: const Icon(Icons.assignment),
            label: l10n.programs,
          ),
          NavigationDestination(
            icon: const Icon(Icons.info_outline),
            selectedIcon: const Icon(Icons.info),
            label: l10n.about,
          ),
        ],
      ),
    );
  }
}
