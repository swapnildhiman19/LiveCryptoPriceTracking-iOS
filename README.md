Certainly! Here’s a clear and attractive `README.md` template for your Live Crypto Price app, tailored to a student-friendly, learning project based on the ByteCoin/Angela Yu pattern and your new use of CoinGecko API.

```markdown
# 📈 Live Crypto Price

An iOS app built with Swift, UIKit, and CoinGecko API to display the **real-time price of Bitcoin** in multiple currencies.  
Inspired by [appbrewery/ByteCoin-iOS13](https://github.com/appbrewery/ByteCoin-iOS13), rewritten to use a free, open CoinGecko API.

![screenshot](screenshot.png) 

---

## ⭐️ Features

- 🔍 Select from 20+ world currencies
- ⚡️ See the latest Bitcoin price instantly
- 🔁 Real-time price changes with every selection
- ✅ Built using UIKit, Swift, and REST networking

---

## 📲 How It Works

1. The app uses a `UIPickerView` to let you select your currency (USD, EUR, INR, etc.).
2. On selection, it fetches the latest Bitcoin price from the [CoinGecko public API](https://coingecko.com/en/api).
3. The current rate is displayed on the main screen.

---

## 🚀 Getting Started

### Prerequisites

- Xcode 13 or later
- iOS 13.0+ target (runs on iPhone and iPad)
- Internet connection (to fetch data from CoinGecko)

### Setup Instructions

```
git clone https://github.com/swapnildhiman19/ByteCoin-iOS13.git
cd ByteCoin-iOS13
open ByteCoin.xcodeproj
```
- Build and run on Simulator or a real device.
- **No API key required** — CoinGecko is free and open for this endpoint!

---

## 🛠️ Implementation Highlights

- **Swift Structs & Codable:**  
  Easily decodes CoinGecko JSON response for flexible currencies.
- **URLSession Networking:**  
  Fetches live data with each picker selection.
- **UIPickerView:**  
  User-friendly currency selection.
- **MVC Pattern:**  
  Clear separation of Model, View, and Controller for learning clarity.

---

## 🔗 API Documentation

- [CoinGecko API](https://coingecko.com/en/api)
  - Endpoint used:  
    ```
    https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd
    ```
  - Change `usd` to any code from our picker to view that price.

---

## 📸 Screenshots




---

## 🙋‍♂️ Credits

- Original Course: [Angela Yu - iOS App Brewery](https://www.appbrewery.co/)
- Crypto price feed from [CoinGecko](https://www.coingecko.com)
- App styling and improvements by [Swapnil Dhiman](https://github.com/swapnildhiman19)

---

## 📝 License

This project is for educational purposes.  
API data is provided by CoinGecko under their terms of use.

---

## 💡 Want to Contribute or Suggest Features?

Pull requests and issues are welcome!  
Feel free to fork and make it even better—for other coins, historical prices, charts, and more.

---
```

**How to use:**  
- Copy-paste above into your `README.md`
- Add your own screenshots (replace `screenshot.png`)
- Update or personalize as wanted!

Let me know if you want a more minimal or advanced version, or tips for making it even more professional! 🚀
