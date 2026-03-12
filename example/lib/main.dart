import 'package:aes_calendar/aes_calendar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AES Calendar Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2563EB)),
        useMaterial3: true,
      ),
      home: const AesCalendarExamplePage(),
    );
  }
}

class AesCalendarExamplePage extends StatelessWidget {
  const AesCalendarExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      /// Gradient header similar to the screenshot
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff58e7fb),
                Color(0xff2de1d0),
              ],
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
              child: Row(
                children: [
                  Center(
                      child: Image.asset(
                    "assets/calendar.png",
                    height: 32,
                    width: 32,
                    fit: BoxFit.fill,
                  )),
                  const SizedBox(width: 12),
                  Text(
                    'AES Calendar Example',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      /// Body with two mode cards
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),

                /// Dialog popup option
                _ModeCard(
                  icon: Icons.open_in_new_rounded,
                  iconColor: const Color(0xff2563EB),
                  title: 'Open Popup Window',
                  subtitle: 'Launch calendar popup',
                  onTap: () async {
                    final selected = await AesCalendar.show(
                      context,
                      endDate: DateTime(2030),
                    );

                    if (selected != null && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Selected date: ${selected.toLocal()}',
                          ),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 16),

                /// Full-screen / widget option
                _ModeCard(
                  icon: Icons.fullscreen,
                  iconColor: const Color(0xff16A34A),
                  title: 'Open Full Screen',
                  subtitle: 'Navigate to full screen widget',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FullScreenCalendarPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Card used for the two calendar modes.
class _ModeCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ModeCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 18,
              spreadRadius: 1,
              color: Colors.black.withValues(alpha: .06),
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: Color(0xff9CA3AF),
            ),
          ],
        ),
      ),
    );
  }
}

/// Full screen calendar page using the widget mode.
class FullScreenCalendarPage extends StatefulWidget {
  const FullScreenCalendarPage({super.key});

  @override
  State<FullScreenCalendarPage> createState() => _FullScreenCalendarPageState();
}

class _FullScreenCalendarPageState extends State<FullScreenCalendarPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Calendar'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: AesCalendar(
              selectedDate: _selectedDate,
              endDate: DateTime(2030),
              onDateSelected: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
          )),
    );
  }
}
