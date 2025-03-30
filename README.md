# 📋 ClipboardFlow

ClipboardFlow is a **super lightweight**, **blazing-fast** macOS menu bar utility that brings **structure, speed, and sanity** to your clipboard.

Designed for developers, designers, writers, and even your grandma, ClipboardFlow captures your copied items and lets you paste them **in perfect order** using **smart keyboard shortcuts**. It’s like command+V — but intelligent.

---

## ✨ Why ClipboardFlow?

Copying one thing at a time is painful. Copying multiple things and remembering what comes next? Even worse.

ClipboardFlow solves this by giving you:
- A visual buffer of your last 8 copied items
- Full keyboard control over how and when you paste them
- A HUD that keeps you informed (without being annoying)
- All wrapped in a minimal menu bar utility that just works

---

## 🚀 Features Overview

### 🔹 Smart Clipboard Buffer
- Stores up to 8 clipboard items in memory
- Supports: `Plain Text`, `Rich Text`, `Images`, `File URLs`
- Automatically adds new items on ⌘C (copy)
- Drops oldest items when full
- Nothing saved to disk (RAM-only)

### 🔄 Paste Modes
- **FIFO (First In, First Out):** Paste in the order you copied
- **LIFO (Last In, First Out):** Paste the newest copied item first
- Toggle instantly from the menu bar

### ⚡ Paste Interactions

#### 🔁 Cycle Paste
- Press `⌘⌥V` to paste the **next item** from your buffer
- Automatically cycles (wraps around)
- No more re-copying or context loss

#### 🎯 Slot Paste
- Use `⌘⌥1` through `⌘⌥8` to paste a **specific buffer slot**
- Slot 1 is always the top-most visible item in the dropdown
- Perfect for pasting API keys, emoji combos, filenames, etc.

### 🖥️ Minimal Menu Bar UI
- 📋 Menu bar icon with subtle active indicator
- Dropdown includes:
  - Visual buffer (1–8 items)
  - Paste mode toggle (FIFO / LIFO)
  - Highlight for next-to-paste item
  - Paste Next button
  - Clear button
  - Quit button

### 🧩 HUD Overlay
- Displays confirmation when pasting an item
- Shows buffer index and quick feedback
- Auto-dismisses in 2 seconds

### 🔐 Secure by Design
- All data is stored **in memory only**
- Nothing touches your disk
- 100% local processing
- Near-zero CPU use when idle

---

## 💻 For Developers

### ⚙️ Getting Started

```bash
git clone https://github.com/yourusername/ClipboardFlow.git
```

1. Open `ClipboardFlow.xcodeproj` in Xcode
2. Build & Run (⌘R)
3. Grant Accessibility permissions when prompted:
   > System Settings → Privacy & Security → Accessibility → Enable ClipboardFlow
4. Done! You’ll see 📋 in the menu bar

### 🧪 Testing
- Open TextEdit or Notes
- Copy multiple items (⌘C)
- Try `⌘⌥V` to cycle-paste
- Try `⌘⌥1` through `⌘⌥8` to slot-paste

✅ Paste order reflects FIFO/LIFO mode
✅ Slot paste matches visible list

---

## ⌨️ Keyboard Shortcuts

| Shortcut         | Action                                |
|------------------|-----------------------------------------|
| ⌘C               | Copy (auto-added to buffer)             |
| ⌘⌥V              | Paste next buffer item                  |
| ⌘⌥1–8            | Paste exact slot                        |
| ⌘Q               | Quit ClipboardFlow                      |
| ⌘⌫ (Delete)      | Clear buffer (from dropdown)           |

---

## 👥 Who It's For

- 💻 **Developers** copying tokens, configs, snippets
- 🎨 **Designers** copying values, color codes, assets
- 🧠 **Writers** managing quotes, headings, content blocks
- 🧪 **Testers** pasting test data into web forms
- 🙋‍♂️ **Anyone** who wants more control over copy/paste

---

## 🔜 Coming Soon

- Preferences Window
  - Launch at login
  - Custom max buffer size (3–8)
  - Toggle paste simulation
- Better image support (thumbnails + previews)
- Notifications: pasted to unsupported apps
- Customizable shortcuts

---

## 📷 Screenshots (Coming Soon)
- [x] Menu bar UI
- [x] Buffer preview
- [x] Paste mode toggle
- [x] HUD overlay in action

---

## 🙌 Credits

Created with 💛 by [@rohan-kiratsata](https://github.com/rohan-kiratsata) [@rahuldotbiz](https://github.com/rahuldotbiz)

Special thanks to the macOS community and everyone tired of copying the same thing twice.

Pull requests welcome!

---

## 📄 License

ClipboardFlow is licensed under the MIT License.
Use it. Fork it. Improve it. Just don’t be evil.

---

Clipboard
