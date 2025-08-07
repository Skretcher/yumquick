# 🛠️ YumQuick Setup Instructions

Follow these steps to run YumQuick on your local machine:

---

## 1️⃣ Prerequisites

Ensure you have the following installed:

- ✅ [Flutter SDK](https://flutter.dev/docs/get-started/install)
- ✅ Dart SDK (comes with Flutter)
- ✅ Android Studio or VS Code
- ✅ An emulator or connected mobile device

---

## 2️⃣ Clone the Repo

```bash
git clone <your-repo-url>
cd yumquick
```

---

## 3️⃣ Install Dependencies

```bash
flutter pub get
```

---

## 4️⃣ Run on Emulator or Device

```bash
flutter run
```

> Ensure your emulator is running or device is connected.

---

## 🧪 Run Tests (Optional)

```bash
flutter test
```

---

## 🔍 Common Issues

- If Android build fails, try:
  ```bash
  flutter clean
  flutter pub get
  ```

- If assets are not loading, verify in `pubspec.yaml`:
  ```yaml
  assets:
    - assets/images/
    - assets/icons/
  ```

---

You’re all set to explore 🍔 YumQuick!
