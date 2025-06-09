import 'package:flutter/material.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/input_field.dart';
import '../models/message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> messages = [];
  String selectedTone = 'Friendly';

  void addMessage(String content, bool isUser) {
    setState(() {
      messages.add(Message(content: content, isUser: isUser));
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void handleSend() {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    addMessage(input, true);

    Future.delayed(const Duration(milliseconds: 300), () {
      addMessage("This is a smart response to: \"$input\"", false);
    });

    _controller.clear();
  }

  void handleTranslate() {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    addMessage(input, true);

    Future.delayed(const Duration(milliseconds: 300), () {
      addMessage("Translated: \"$input\" in Spanish (mock)", false);
    });

    _controller.clear();
  }

  void handleSummarize() {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    addMessage(input, true);

    Future.delayed(const Duration(milliseconds: 300), () {
      addMessage("Summary: This is a short summary of \"$input\" (mock)", false);
    });

    _controller.clear();
  }

  void handleGenerateEmail() {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    addMessage(input, true);

    Future.delayed(const Duration(milliseconds: 300), () {
      addMessage("Email: Dear Sir/Madam,\n\n$input\n\nRegards,\nUser", false);
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              const Text(
                "AI Utility Tool",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton<String>(
                  value: selectedTone,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.tune, color: Colors.black),
                  dropdownColor: Colors.white,
                  style: const TextStyle(color: Colors.black),
                  items: ['Friendly', 'Formal', 'Casual'].map((String tone) {
                    return DropdownMenuItem<String>(
                      value: tone,
                      child: Text(tone),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        selectedTone = value;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ChatBubble(
                  text: message.content,
                  isUser: message.isUser,
                );
              },
            ),
          ),
          InputField(
            controller: _controller,
            onSend: handleSend,
            onTranslate: handleTranslate,
            onSummarize: handleSummarize,
            onGenerateEmail: handleGenerateEmail,
          ),
        ],
      ),
    );
  }
}