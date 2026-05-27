import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../config/colors.dart';
import '../../models/ai_chat.dart';
import '../../services/ai_service.dart';
import '../../providers/language_provider.dart';

class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({super.key});

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen>
    with TickerProviderStateMixin {
  final List<AiChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  bool _isTyping = false;
  bool _showSuggestions = true;
  late AnimationController _typingAnimController;
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _typingAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    // Welcome message
    _messages.add(AiChatMessage(
      id: 'welcome',
      text: '', // will be set based on language
      sender: MessageSender.ai,
      category: 'welcome',
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    _typingAnimController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  String _getWelcomeMessage(String lang) {
    switch (lang) {
      case 'ar':
        return "السلام عليكم ورحمة الله وبركاته! 🕌\n\nأنا المساعد الإسلامي الذكي. يمكنني مساعدتك في:\n\n📖 القرآن والتفسير\n🕌 الصلاة والعبادة\n🤲 الأدعية\n📜 الحديث\n📿 الذكر\n💪 التحفيز الإسلامي\n\nتفضل بسؤالك! 😊";
      case 'en':
        return "Assalamu'alaikum Warahmatullahi Wabarakatuh! 🕌\n\nI'm your Muslim AI Assistant. I can help you with:\n\n📖 Quran & Tafsir\n🕌 Prayer & Worship\n🤲 Duas & Supplications\n📜 Hadith\n📿 Dhikr & Tasbih\n💪 Islamic Motivation\n\nFeel free to ask anything! 😊";
      default:
        return "Assalamu'alaikum Warahmatullahi Wabarakatuh! 🕌\n\nSaya adalah Asisten Muslim AI yang siap membantu Anda. Saya bisa menjawab pertanyaan tentang:\n\n📖 Al-Quran & Tafsir\n🕌 Sholat & Ibadah\n🤲 Doa-doa\n📜 Hadits\n📿 Dzikir & Tasbih\n💪 Motivasi Islami\n\nSilakan bertanya apa saja! 😊";
    }
  }

  void _sendMessage([String? text]) async {
    final messageText = text ?? _controller.text;
    if (messageText.trim().isEmpty) return;

    final lang = Provider.of<LanguageProvider>(context, listen: false)
        .currentLocale
        .languageCode;

    setState(() {
      _messages.add(AiChatMessage(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        text: messageText.trim(),
        sender: MessageSender.user,
      ));
      _controller.clear();
      _isTyping = true;
      _showSuggestions = false;
    });

    _scrollToBottom();

    // Simulate typing delay for natural feel
    final delay = 800 + (messageText.length * 10).clamp(0, 1500);
    await Future.delayed(Duration(milliseconds: delay));

    try {
      final response = await AiService.getResponse(messageText, lang: lang);
      if (mounted) {
        setState(() {
          _isTyping = false;
          _messages.add(AiChatMessage(
            id: 'ai_${DateTime.now().millisecondsSinceEpoch}',
            text: response,
            sender: MessageSender.ai,
          ));
        });
        _scrollToBottom();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isTyping = false;
          _messages.add(AiChatMessage(
            id: 'error_${DateTime.now().millisecondsSinceEpoch}',
            text: lang == 'en'
                ? "Sorry, an error occurred. Please try again. 🤲"
                : lang == 'ar'
                    ? "عذراً، حدث خطأ. حاول مرة أخرى. 🤲"
                    : "Maaf, terjadi kesalahan. Silakan coba lagi. 🤲",
            sender: MessageSender.ai,
            type: MessageType.error,
          ));
        });
        _scrollToBottom();
      }
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 100,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
        );
      }
    });
  }

  void _clearChat() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(children: [
          Icon(Icons.delete_outline, color: AppColors.error),
          const SizedBox(width: 8),
          const Text('Hapus Chat'),
        ]),
        content: const Text('Apakah Anda yakin ingin menghapus semua riwayat chat?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () {
              Navigator.pop(ctx);
              setState(() {
                _messages.clear();
                _messages.add(AiChatMessage(
                  id: 'welcome',
                  text: '',
                  sender: MessageSender.ai,
                  category: 'welcome',
                ));
                _showSuggestions = true;
              });
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = Provider.of<LanguageProvider>(context).currentLocale.languageCode;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [AppColors.darkBg, const Color(0xFF0A1510)]
                : [AppColors.lightBg, const Color(0xFFF0FDF4)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(isDark, lang),
              Expanded(
                child: _messages.length <= 1 && _showSuggestions
                    ? _buildWelcomeView(isDark, lang)
                    : _buildChatList(isDark, lang),
              ),
              if (_isTyping) _buildTypingIndicator(isDark),
              _buildInputArea(isDark, lang),
            ],
          ),
        ),
      ),
    );
  }

  // ─── APP BAR ─────────────────────────────────────────────────────────────
  Widget _buildAppBar(bool isDark, String lang) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Back button
          _buildIconBtn(Icons.arrow_back_ios_new, isDark, () => Navigator.pop(context)),
          const SizedBox(width: 12),
          // AI Avatar
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Center(
              child: Text('🕌', style: TextStyle(fontSize: 22)),
            ),
          ),
          const SizedBox(width: 12),
          // Title & Status
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang == 'ar' ? 'المساعد الإسلامي' : lang == 'en' ? 'Islamic AI Helper' : 'AI Islamic Helper',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : AppColors.textPrimary,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: AppColors.success.withOpacity(0.4), blurRadius: 6)],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _isTyping
                          ? (lang == 'ar' ? 'يكتب...' : lang == 'en' ? 'Typing...' : 'Mengetik...')
                          : (lang == 'ar' ? 'متصل' : lang == 'en' ? 'Online' : 'Online'),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: _isTyping ? AppColors.primaryLight : AppColors.textMuted,
                        fontWeight: _isTyping ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Clear chat button
          _buildIconBtn(Icons.delete_outline, isDark, _clearChat),
        ],
      ),
    );
  }

  Widget _buildIconBtn(IconData icon, bool isDark, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface.withOpacity(0.6) : Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.05),
          ),
        ),
        child: Icon(icon, size: 20, color: isDark ? Colors.white70 : AppColors.textSecondary),
      ),
    );
  }

  // ─── WELCOME VIEW ────────────────────────────────────────────────────────
  Widget _buildWelcomeView(bool isDark, String lang) {
    final suggestions = AiService.getQuickSuggestions(lang);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // AI Logo
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.35),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Center(
              child: Text('🤖', style: TextStyle(fontSize: 44)),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            lang == 'ar' ? 'المساعد الإسلامي الذكي' : lang == 'en' ? 'Muslim AI Assistant' : 'Asisten Muslim AI',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            lang == 'ar'
                ? 'اسأل أي شيء عن الإسلام'
                : lang == 'en'
                    ? 'Ask anything about Islam'
                    : 'Tanyakan apa saja tentang Islam',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 32),
          // Quick Suggestions
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              lang == 'ar' ? '💡 اقتراحات سريعة' : lang == 'en' ? '💡 Quick Suggestions' : '💡 Saran Pertanyaan',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: suggestions.map((s) => _buildSuggestionChip(s, isDark)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionChip(String text, bool isDark) {
    return GestureDetector(
      onTap: () => _sendMessage(text),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark
                ? AppColors.primaryLight.withOpacity(0.2)
                : AppColors.primary.withOpacity(0.15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.15 : 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.white.withOpacity(0.85) : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  // ─── CHAT LIST ───────────────────────────────────────────────────────────
  Widget _buildChatList(bool isDark, String lang) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        final isMe = message.sender == MessageSender.user;

        // Replace welcome message text with localized version
        String text = message.text;
        if (message.category == 'welcome') {
          text = _getWelcomeMessage(lang);
        }

        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 300 + (index * 50).clamp(0, 200)),
          curve: Curves.easeOutCubic,
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, 20 * (1 - value)),
              child: Opacity(opacity: value, child: child),
            );
          },
          child: _buildMessageBubble(text, isMe, isDark, message),
        );
      },
    );
  }

  // ─── MESSAGE BUBBLE ──────────────────────────────────────────────────────
  Widget _buildMessageBubble(String text, bool isMe, bool isDark, AiChatMessage message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe) ...[
            // AI Avatar
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(right: 8, bottom: 2),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('🕌', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
          // Bubble
          Flexible(
            child: GestureDetector(
              onLongPress: () => _showBubbleMenu(context, text, isMe),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  gradient: isMe
                      ? AppColors.primaryGradient
                      : null,
                  color: isMe
                      ? null
                      : (isDark ? AppColors.darkCard : Colors.white),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                    bottomLeft: Radius.circular(isMe ? 20 : 4),
                    bottomRight: Radius.circular(isMe ? 4 : 20),
                  ),
                  border: isMe
                      ? null
                      : Border.all(
                          color: isDark
                              ? Colors.white.withOpacity(0.06)
                              : Colors.black.withOpacity(0.04),
                        ),
                  boxShadow: [
                    BoxShadow(
                      color: isMe
                          ? AppColors.primary.withOpacity(0.25)
                          : Colors.black.withOpacity(isDark ? 0.15 : 0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.78,
                ),
                child: _buildRichText(text, isMe, isDark, message),
              ),
            ),
          ),
          if (isMe) ...[
            // User Avatar
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(left: 8, bottom: 2),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkElevated : const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.person,
                size: 18,
                color: isDark ? Colors.white70 : AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRichText(String text, bool isMe, bool isDark, AiChatMessage message) {
    // Parse bold text (**text**) for AI responses
    if (isMe) {
      return Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.white,
          height: 1.5,
        ),
      );
    }

    final isError = message.type == MessageType.error;

    // Split text by **bold** markers and build rich text
    final List<InlineSpan> spans = [];
    final regex = RegExp(r'\*\*(.*?)\*\*');
    int lastEnd = 0;

    for (final match in regex.allMatches(text)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(
          text: text.substring(lastEnd, match.start),
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: isError
                ? AppColors.error
                : (isDark ? Colors.white.withOpacity(0.9) : AppColors.textPrimary),
            height: 1.6,
          ),
        ));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: isError
              ? AppColors.error
              : (isDark ? AppColors.primaryLight : AppColors.primary),
          height: 1.6,
        ),
      ));
      lastEnd = match.end;
    }
    if (lastEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastEnd),
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: isDark ? Colors.white.withOpacity(0.9) : AppColors.textPrimary,
          height: 1.6,
        ),
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }

  void _showBubbleMenu(BuildContext context, String text, bool isMe) {
    HapticFeedback.mediumImpact();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final isDark = Theme.of(ctx).brightness == Brightness.dark;
        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkCard : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40, height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textMuted.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.copy, color: AppColors.primary),
                title: const Text('Salin Teks'),
                onTap: () {
                  // Remove markdown bold markers for clipboard
                  final clean = text.replaceAll('**', '');
                  Clipboard.setData(ClipboardData(text: clean));
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Teks disalin! ✅'),
                      backgroundColor: AppColors.primary,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.share, color: AppColors.primary),
                title: const Text('Bagikan'),
                onTap: () {
                  final clean = text.replaceAll('**', '');
                  SharePlus.instance.share(ShareParams(text: '$clean\n\n— Muslim ID App'));
                  Navigator.pop(ctx);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  // ─── TYPING INDICATOR ────────────────────────────────────────────────────
  Widget _buildTypingIndicator(bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text('🕌', style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(4),
              ),
              border: Border.all(
                color: isDark ? Colors.white.withOpacity(0.06) : Colors.black.withOpacity(0.04),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isDark ? 0.15 : 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: AnimatedBuilder(
              animation: _typingAnimController,
              builder: (context, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (index) {
                    final offset = (_typingAnimController.value * 3 - index).clamp(0.0, 1.0);
                    final bounce = (offset < 0.5)
                        ? offset * 2
                        : 2 - offset * 2;
                    return Container(
                      margin: EdgeInsets.only(right: index < 2 ? 5 : 0),
                      child: Transform.translate(
                        offset: Offset(0, -bounce * 6),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight.withOpacity(0.4 + bounce * 0.6),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ─── INPUT AREA ──────────────────────────────────────────────────────────
  Widget _buildInputArea(bool isDark, String lang) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBg.withOpacity(0.9) : Colors.white.withOpacity(0.95),
        border: Border(
          top: BorderSide(
            color: isDark ? Colors.white.withOpacity(0.06) : Colors.black.withOpacity(0.04),
          ),
        ),
      ),
      child: Row(
        children: [
          // Input field
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : const Color(0xFFF0F4F3),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: _focusNode.hasFocus
                      ? AppColors.primary.withOpacity(0.4)
                      : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      maxLines: 4,
                      minLines: 1,
                      textInputAction: TextInputAction.send,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: isDark ? Colors.white : AppColors.textPrimary,
                      ),
                      decoration: InputDecoration(
                        hintText: lang == 'ar'
                            ? 'اسأل عن الإسلام...'
                            : lang == 'en'
                                ? 'Ask about Islam...'
                                : 'Tanya tentang Islam...',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.textMuted,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        isDense: true,
                      ),
                      onSubmitted: (_) => _sendMessage(),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Send Button
          GestureDetector(
            onTap: _controller.text.trim().isEmpty ? null : () => _sendMessage(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: _controller.text.trim().isNotEmpty
                    ? AppColors.primaryGradient
                    : null,
                color: _controller.text.trim().isEmpty
                    ? (isDark ? AppColors.darkSurface : const Color(0xFFE5E7EB))
                    : null,
                borderRadius: BorderRadius.circular(16),
                boxShadow: _controller.text.trim().isNotEmpty
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                Icons.send_rounded,
                size: 22,
                color: _controller.text.trim().isNotEmpty
                    ? Colors.white
                    : AppColors.textMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
