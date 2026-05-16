# Beauty Scanner App

Mobile-first skincare scanner app scaffold built with Flutter and Supabase.

## Phase 0 Decisions

- **Frontend:** Flutter.
- **Backend/database:** Supabase with Postgres.
- **Product direction:** Mobile first.
- **Initial scope:** Navigation shell only. No product lookup, scanner, parser, or database features are implemented yet.

## Core Flow

- Home
- Scan
- Search
- Product result
- Ingredient detail
- Saved shelf
- Profile
- Settings

## Project Structure

```text
lib/
  components/
  models/
  navigation/
  screens/
  services/
  theme/
  utils/
```

## Run Locally

Flutter is required.

```bash
flutter pub get
flutter run
```
