# 🧠 AI Utility Tool (Flutter)

An AI-powered mock utility tool built using **Flutter**, designed as a frontend assignment for a placement project. It simulates smart interactions through a chat interface and includes multiple utility actions like Translate, Summarize, and Generate Email — all with a clean, modern UI and no backend.

---

## ✨ Features

- ✅ Simulated AI smart response
- 🔤 Translate input text (mock logic)
- 📝 Summarize input text (mock logic)
- 📧 Generate professional emails (mock logic)
- 💬 Chat-style screen with auto-scrolling
- 🎨 Material 3 UI with a polished custom AppBar
- 🌐 Tone switch dropdown (Friendly, Formal, Casual)

---

## 🛠️ Tech Stack

- **Flutter 3.x**
- **Dart**
- **Material 3 Design**
- **Stateless & Stateful Widgets**
- No backend (pure frontend mock logic)

---

## 📁 Folder Structure
lib/
│
├── models/
│ └── message.dart # Model for chat messages
│
├── screens/
│ └── home_page.dart # Main UI and interaction logic
│
├── widgets/
│ ├── chat_bubble.dart # UI widget for chat bubbles
│ └── input_field.dart # Text input and utility buttons
│
└── main.dart # Entry point and theme configuration

---

🔍 How the Mock Logic Works

Send Button: Simulates a smart AI response based on input.

Translate Button: Returns a fake translated version of the input.

Summarize Button: Returns a brief mock summary.

Generate Email Button: Generates a formal email using the input.

The tone dropdown can help control the style (e.g., Friendly, Formal) in a real AI model integration.

---

🧩 Ideas for Future Improvements

🔗 Integrate OpenAI GPT or Google Translate APIs

🌙 Add dark mode and theme toggle

💾 Save chat history using local storage

📲 Deploy to Android/iOS using Flutter build

