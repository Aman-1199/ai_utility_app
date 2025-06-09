import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onTranslate;
  final VoidCallback onSummarize;
  final VoidCallback onGenerateEmail;

  const InputField({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onTranslate,
    required this.onSummarize,
    required this.onGenerateEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Type your message...",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.blue),
                onPressed: onSend,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              ElevatedButton.icon(
                onPressed: onTranslate,
                icon: const Icon(Icons.translate),
                label: const Text("Translate"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
              ),
              ElevatedButton.icon(
                onPressed: onSummarize,
                icon: const Icon(Icons.summarize),
                label: const Text("Summarize"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
              ),
              ElevatedButton.icon(
                onPressed: onGenerateEmail,
                icon: const Icon(Icons.email),
                label: const Text("Generate Email"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}