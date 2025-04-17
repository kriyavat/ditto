# 📋 Ditto — Smarter Clipboard, Seamless Flow

**Ditto** is a lightning-fast, ultra-lightweight macOS menu bar utility that gives your clipboard superpowers.  
Effortlessly copy, manage, and paste multiple items — all from your keyboard.

> Like ⌘+V, but actually useful.

---

## ✨ Why Ditto?

Copying one item at a time is frustrating.  
Juggling multiple snippets, tokens, or notes? Even worse.

**Ditto** makes it effortless with:

- A live buffer of your last 8 clipboard items
- Full keyboard control over what and when you paste
- A heads-up display (HUD) for instant visual feedback
- A minimalist menu bar UI that stays out of your way

---

## 🚀 Features

### 🧠 Intelligent Clipboard Buffer
- Stores your **last 8** copied items (RAM-only, not saved to disk)
- Supports: Plain text, rich text, file URLs, images
- Automatically updates on ⌘C
- Oldest item drops off when full

### 🔄 Paste Modes
- **FIFO**: First In, First Out — paste in the order you copied
- **LIFO**: Last In, First Out — paste the most recent first
- Toggle instantly via the menu bar

### ⚡ Fast Keyboard Interactions
- **Cycle Paste**:  
  ⌘⌥V pastes the next item and wraps around seamlessly
- **Slot Paste**:  
  ⌘⌥1 through ⌘⌥8 pastes a specific item  
  Perfect for pasting API keys, email templates, emojis, or filenames

### 🖥️ Minimal Menu Bar UI
- Subtle 📋 icon with active state indicator
- Dropdown shows:
  - Visual buffer (slots 1–8)
  - Active paste mode (FIFO / LIFO)
  - Next item to be pasted
  - "Paste Next", "Clear", and "Quit" buttons

### 🧩 HUD Overlay
- Visual feedback on paste with slot index
- Auto-dismisses after 2 seconds
- Helps you stay focused without switching context

### 🔐 Privacy-First
- No files written to disk
- 100% local processing
- Near-zero CPU when idle

---

## 🧑‍💻 For Developers & Power Users

### Common Use Cases
- 💻 Copy/paste tokens, configs, snippets
- 🎨 Grab color values, design assets, and export paths
- ✍️ Manage quotes, headings, and content blocks
- 🧪 Paste test data into forms like a champ

### Keyboard Shortcuts

| Shortcut         | Action                      |
|------------------|-----------------------------|
| ⌘C               | Copy (auto-add to buffer)   |
| ⌘⌥V              | Paste next item             |
| ⌘⌥1 through ⌘⌥8  | Paste specific slot         |
| ⌘⌫ (Delete)      | Clear buffer                |
| ⌘Q               | Quit Ditto                  |

---

## 🛠️ Getting Started

```bash
git clone https://github.com/kriyavat/Ditto.git
cd Ditto
open Ditto.xcodeproj
```

1.  Build & Run using Xcode (⌘R)
    
2.  When prompted, grant Accessibility permissions:  
    `System Settings → Privacy & Security → Accessibility → Enable Ditto`

3.  Look for 📋 in the menu bar. You're good to go!

## 🧪 Testing It Out

1.  Open **Notes** or **TextEdit**
    
2.  Copy multiple items using ⌘C
    
3.  Press ⌘⌥V repeatedly to cycle through them
    
4.  Use ⌘⌥1–8 to paste a specific item from the buffer
    

✔️ Paste order updates in real-time  
✔️ Buffer updates automatically  
✔️ Visual and HUD feedback on every action

----------

## 🔜 Coming Soon

-   Preferences window
    
-   Launch at login
    
-   Adjustable buffer size (3–8 items)
    
-   Toggle paste simulation (for edge cases)
    
-   Rich image previews in dropdown
    
-   App-specific paste notifications
    
-   Fully customizable shortcuts
    


----------

## 🙌 Credits

Made with 💛 by  
[@rohan-kiratsata](https://github.com/rohan-kiratsata) & [@rahuldotbiz](https://github.com/rahuldotbiz)

Thanks to the macOS developer community and everyone tired of re-copying the same thing twice.

----------

## 📄 License

Ditto is released under the MIT License  
Feel free to use it, fork it, or improve it — just don’t be evil.
