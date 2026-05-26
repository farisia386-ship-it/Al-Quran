import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/colors.dart';

class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({super.key});

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Assalamu\'alaikum! Saya adalah Asisten Muslim AI. Ada yang bisa saya bantu hari ini?', 'isMe': false},
  ];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isEmpty) return;
    final query = _controller.text.toLowerCase();
    
    setState(() {
      _messages.add({'text': _controller.text, 'isMe': true});
      _controller.clear();
      
      String response = "Maaf, saya masih belajar. Bisa Anda tanyakan hal lain tentang rukun Islam, sholat, atau zakat?";
      
      if (query.contains('sholat')) {
        response = "Sholat adalah tiang agama. Sebagai muslim kita wajib menunaikan sholat 5 waktu: Subuh, Dzuhur, Ashar, Maghrib, dan Isya.";
      } else if (query.contains('zakat')) {
        response = "Zakat adalah salah satu rukun Islam. Zakat terbagi dua: Zakat Fitrah (saat ramadan) dan Zakat Maal (zakat harta).";
      } else if (query.contains('puasa') || query.contains('ramadan')) {
        response = "Puasa Ramadan adalah wajib bagi setiap muslim yang baligh. Selain itu ada puasa sunnah seperti Senin-Kamis.";
      } else if (query.contains('kiblat')) {
        response = "Arah Kiblat adalah menuju Ka'bah di Makkah. Anda bisa menggunakan fitur Kompas di aplikasi ini untuk menemukannya.";
      }

      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _messages.add({
              'text': response,
              'isMe': false
            });
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Muslim Assistant'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(message['text'], message['isMe']);
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isMe ? AppColors.primary : (Theme.of(context).brightness == Brightness.dark ? AppColors.darkSurface : Colors.grey[200]),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMe ? 16 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.white : (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black87),
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Tanya tentang Islam...',
                border: InputBorder.none,
                filled: false,
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: AppColors.primary),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
