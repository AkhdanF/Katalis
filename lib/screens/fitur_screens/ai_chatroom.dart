import 'package:flutter/material.dart';
import 'package:katalis2/widgets/shared_component.dart';

class AIChatRoomScreen extends StatefulWidget {
  const AIChatRoomScreen({super.key});

  @override
  _AIChatRoomScreenState createState() => _AIChatRoomScreenState();
}

class _AIChatRoomScreenState extends State<AIChatRoomScreen> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add({
          'text': _controller.text,
          'sender': 'You',
        });
        _controller.clear();
      });

      final List<Map<String, dynamic>> aiResponses = [
        {
          'text':
              'Halo! Saya KatalisMate, asisten virtual dari Katalis. Terima kasih telah menghubungi kami. Saya siap membantu Anda dengan segala kebutuhan atau pertanyaan yang Anda miliki!',
          'delay': 1000,
        },
        {
          'text':
              'Butuh bantuan dengan aplikasi, fitur baru, atau pertanyaan umum lainnya? Cukup beri tahu saya, dan saya akan segera memberikan solusi atau panduan yang Anda perlukan!',
          'delay': 1500,
        },
        {
          'text':
              'Jika Anda memiliki pertanyaan lebih spesifik atau kompleks, jangan khawatir! Tim ahli kami siap memberikan bantuan lebih lanjut dan akan segera merespons.',
          'delay': 2000,
        },
        {
          'text':
              'Semoga hari Anda menyenankan! Kami selalu siap untuk membantu kapan saja Anda membutuhkan bantuan.',
          'delay': 2500,
        },
      ];

      int cumulativeDelay = 0;
      for (final response in aiResponses) {
        cumulativeDelay += response['delay'] as int;
        Future.delayed(Duration(milliseconds: cumulativeDelay), () {
          if (mounted) {
            setState(() {
              messages.add({
                'text': response['text'],
                'sender': 'KatalisMate',
              });
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.smart_toy_outlined,
                color: Colors.blue.shade700,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'KatalisMate',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    color: Colors.green.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.grey[50],
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return ChatBubble(
                    message: message['text']!,
                    isUser: message['sender'] == 'You',
                    sender: message['sender']!,
                  );
                },
              ),
            ),
          ),
          ChatInputField(
            controller: _controller,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}
