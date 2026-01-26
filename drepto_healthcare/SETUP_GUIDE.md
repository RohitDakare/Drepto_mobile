# Quick Setup Guide

## 1. Install Inter Font

The app uses the Inter font family. Download it and add to your project:

### Option A: Download from Google Fonts
1. Visit: https://fonts.google.com/specimen/Inter
2. Click "Download family"
3. Extract the ZIP file
4. Create a `fonts/` directory in your project root
5. Copy these files to `fonts/`:
   - `Inter-Regular.ttf` (weight 400)
   - `Inter-Medium.ttf` (weight 500)
   - `Inter-SemiBold.ttf` (weight 600)
   - `Inter-Bold.ttf` (weight 700)

### Option B: Use System Default (Temporary)
If you want to test without downloading fonts:
1. Open `pubspec.yaml`
2. Comment out the entire `fonts:` section
3. The app will use the system default font

## 2. Run the App

```bash
# Get dependencies (already done)
flutter pub get

# Check for issues
flutter doctor

# Run on connected device or emulator
flutter run

# Or specify a device
flutter run -d windows
flutter run  -d chrome
```

## 3. Test User Flows

### Test Login Flow
1. Launch app → Onboarding → Skip or Next
2. At Login screen, select a role:
   - **Patient** → Patient Dashboard
   - **Doctor** → Doctor Dashboard
   - **Nurse** → Nurse Dashboard
3. Enter any email/password and click Login

### Test Registration Flow
1. From Login → Click "Sign Up"
2. Fill in Registration Step 1
3. Continue to Step 2
4. Complete registration

### Test Pharmacy Flow
1. Login as Patient
2. Dashboard → Click "Medicines"
3. Add products to cart
4. Go to Cart → Proceed to Checkout
5. Select address and payment
6. Complete order

### Test Ambulance Emergency
1. Login as Patient
2. Dashboard → Click "Ambulance"
3. Select ambulance type
4. Confirm booking
5. View live tracking

### Test AI Assistant
1. Login as Patient
2. Dashboard → Messages tab
3. Click "Drepto AI Assistant"
4. Send messages and test responses

## 4. Common Issues & Solutions

### Issue: Fonts not displaying correctly
**Solution**: Make sure font files are in the `fonts/` directory and pubspec.yaml is configured correctly

### Issue: App crashes on startup
**Solution**: Run `flutter clean` then `flutter pub get`

### Issue: Emulator not starting
**Solution**: Check `flutter doctor` for setup issues

### Issue: Import errors
**Solution**: Make sure all files are saved and run `flutter pub get`

## 5. Building for Release

### Android APK
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

### iOS App
```bash
flutter build ios --release
```

### Windows Desktop
```bash
flutter build windows --release
```

## 6. Development Resources

### Hot Reload
- Press `r` in terminal for hot reload
- Press `R` for hot restart
- Press `q` to quit

### Debug Tools
- Press `p` for "Paint Size" overlay
- Press `i` for Inspector
- Press `o` for Platform channel

### Useful Commands
```bash
# Format all Dart files
flutter format .

# Analyze code
flutter analyze

# Clean build artifacts
flutter clean

# Update dependencies
flutter pub upgrade
```

## 7. Project Structure Quick Reference

```
lib/
├── core/           # Design system (colors, typography, theme)
├── widgets/        # Reusable components (buttons, inputs, cards)
├── screens/        # All app screens
│   ├── onboarding/
│   ├── patient/
│   ├── doctor/
│   ├── nurse/
│   ├── pharmacy/
│   ├── lab/
│   ├── ambulance/
│   ├── health_records/
│   ├── chat/
│   └── profile/
└── main.dart       # App entry point
```

## 8. Customization

### Change Primary Color
Edit `lib/core/constants/app_colors.dart`:
```dart
static const Color primary = Color(0xFF007E85); // Change this
```

### Modify Theme
Edit `lib/core/theme/app_theme.dart`

### Add New Screen
1. Create screen file in `lib/screens/[category]/`
2. Import in navigation files
3. Add route

## 9. Next Steps

1. ✅ Setup fonts
2. ✅ Run `flutter pub get`
3. ✅ Test on emulator/device
4. 🔲 Connect to backend API
5. 🔲 Add real data
6. 🔲 Implement state management
7. 🔲 Add analytics
8. 🔲 Deploy to stores

## Need Help?

- Flutter Documentation: https://docs.flutter.dev
- Material Design 3: https://m3.material.io
- Stack Overflow: https://stackoverflow.com/questions/tagged/flutter

---

**Ready to run! 🚀**
