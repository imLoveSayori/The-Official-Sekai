# 🌸 Sekai - The Programming Language

> "Sekai" means "world" in Japanese. This is my world.

## 📱 The Story

I'm a **beginner developer from Brazil**. I have anxiety and sometimes feel overwhelmed, but programming calms me down.

I created **Sekai** in just **1 day** on my **tablet** using **Termux** and **Nim**. 

With help from **DeepSeek AI** and **ChatGPT**, I built a language with:
- ✅ 10 commands
- ✅ Variables
- ✅ Math operations
- ✅ Memory storage

**If I can do it on a tablet in 1 day, anyone can!**

---

## 🎮 Commands

| Command | What it does | Example |
|---------|--------------|---------|
| `cuts` | Display text | `cuts "Hello!"` |
| `min` | Minimum of 2 numbers | `min 10 3` → `3` |
| `sum` | Sum of 2 numbers | `sum 5 3` → `8` |
| `meet` | Compare 2 numbers | `meet 5 3` → `5 is greater than 3` |
| `tag` | Save a variable | `tag name = Sekai` |
| `set` | Save variable (alias) | `set x = 10` |
| `use` | Show variable value | `use name` |
| `list` | Show all variables | `list` |
| `del` | Delete a variable | `del name` |
| `calc` | Calculate with variables | `calc x + y` |
| `sair` | Exit program | `sair` |

---

## 🚀 How to Run

### Requirements:
- **Termux** (Android) or **Linux/Mac/Windows** with Nim installed
- **Nim** programming language

### Installation:

```bash
# 1. Install Nim (on Termux)
pkg install nim

# 2. Clone the repository
git clone https://github.com/imLoveSayori/The-Official-Sekai.git

# 3. Enter the folder
cd The-Official-Sekai

# 4. Run Sekai
nim c -r sekai.nim
