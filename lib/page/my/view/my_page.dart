import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/page/chat/view/chat_page.dart';
import 'package:untitled3/page/home/providers/home_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled3/page/home/view/home_page.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations strings() => AppLocalizations.of(context)!;

    return Center(
        child: Column(
      children: [
        Text(strings().helloWorld),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              strings().helloWorld,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              strings().localeName,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                print(strings().localeName);
                if (strings().localeName == "zh") {
                  ref.read(localeProvider.notifier).state = en;
                } else {
                  ref.read(localeProvider.notifier).state = zh;
                }
              },
              icon: const Icon(Icons.bar_chart, size: 18),
              label: const Text('切换语言'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[50],
                foregroundColor: Colors.blueGrey[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatPage()),
                );
              },
              label: const Text('聊天窗口'),
            )
          ],
        ),
      ],
    ));
  }
}
