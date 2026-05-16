# Beauty Scanner Implementation Plan

## Current Stage

Phase 0 is complete.

- Stack: Flutter.
- Backend/database choice: Supabase with Postgres.
- Product direction: mobile first.
- Project structure: `lib/screens`, `lib/components`, `lib/services`, `lib/models`, `lib/utils`, `lib/theme`, and `lib/navigation`.
- Core navigation flow: Home, Scan, Search, Product Result, Ingredient Detail, Saved Shelf, Profile, and Settings.
- Native project files generated for Android, iOS, web, and Windows.
- Verification: `flutter analyze` and `flutter test` pass.

No feature logic is implemented yet. Barcode scanning, Supabase schema, product search, ingredient parsing, analysis, saved shelf persistence, and profile personalization begin in later phases.

## Android Setup Status

Flutter is installed at:

```text
C:\tmp\flutter
```

The Flutter binary path has been added to the Windows user PATH:

```text
C:\tmp\flutter\bin
```

`flutter doctor` currently reports one missing category: Android SDK/toolchain. Android Studio should be installed next, then its setup wizard should install the Android SDK, Android SDK Platform-Tools, Android SDK Command-line Tools, Android Emulator, and a virtual device.

## Android Studio Setup Steps

1. Download Android Studio from the official Android Developers page:
   <https://developer.android.com/studio>

2. Run the Windows installer.
   Use the default install path unless you have a reason to change it.

3. Open Android Studio.
   Let the Setup Wizard install the standard Android SDK components.

4. In Android Studio, open **More Actions > SDK Manager > SDK Tools** and confirm these are installed:
   - Android SDK Command-line Tools
   - Android SDK Platform-Tools
   - Android SDK Build-Tools
   - Android Emulator

5. Open **More Actions > Virtual Device Manager** and create a phone emulator.
   A recent Pixel device with a current stable Android image is a good default.

6. In a new terminal, run:

```powershell
flutter doctor
flutter doctor --android-licenses
```

Accept the Android licenses when prompted.

7. If Flutter still cannot find Android Studio's bundled JDK, run:

```powershell
flutter config --jdk-dir "C:\Program Files\Android\Android Studio\jbr"
```

8. From this project folder, verify Android support:

```powershell
flutter devices
flutter run
```

## Next Build Phases

### Phase 1: Database Foundation

- Add Supabase migration files.
- Create tables for brands, products, ingredients, ingredient aliases, product ingredients, analysis rules, user profiles, saved products, and scan history.
- Add seed data for starter ingredients and products.

### Phase 2: Parsing And Analysis

- Build an INCI ingredient text cleaner.
- Build a parser that returns ordered ingredient tokens.
- Match tokens against canonical ingredients and aliases.
- Add unit tests for messy real-world ingredient strings.
- Add transparent product analysis output based on stored rules.

### Phase 3: App Basics

- Connect Supabase client initialization.
- Build product search with loading, empty, and error states.
- Build product result UI with ingredients and analysis sections.
- Build ingredient detail UI from database records.

### Phase 4: Scanning

- Add barcode scanner package.
- Query Supabase by barcode.
- Add not-found handling.
- Add manual ingredient entry fallback.

### Phase 5: Profile And Saved Shelf

- Add skin profile setup.
- Save profile preferences in Supabase.
- Save and remove products from shelf.
- Add profile-aware ingredient notes without medical claims.

### Phase 6: Trust And Polish

- Add educational disclaimers.
- Add evidence/source labels.
- Add "Why this result?" explanations.
- Add polished loading, empty, error, and offline states.
