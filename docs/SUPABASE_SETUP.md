# Supabase Setup

Phase 1 adds the database foundation for the skincare scanner app.

## Files

```text
supabase/
  config.toml
  migrations/
    20260516115300_create_beauty_scanner_schema.sql
  seed/
    001_starter_catalog.sql
```

## Schema

The migration creates:

- `brands`
- `products`
- `ingredients`
- `ingredient_aliases`
- `product_ingredients`
- `analysis_rules`
- `user_profiles`
- `saved_products`
- `scan_history`

It also adds:

- Primary keys and foreign keys.
- Useful unique constraints.
- Indexes for barcode, product, ingredient, and user lookups.
- `created_at` and `updated_at` timestamps.
- Update triggers for mutable tables.
- Row level security policies.

## Apply With Supabase CLI

Install the Supabase CLI, then from the project root:

```powershell
supabase start
supabase db reset
```

If you want to apply the seed manually after reset:

```powershell
supabase db query --file supabase/seed/001_starter_catalog.sql
```

## Hosted Project

This repo is linked to the hosted Supabase project:

```text
Project ref: qpozdusbiakyywungjvl
Project URL: https://qpozdusbiakyywungjvl.supabase.co
```

The migration and seed were applied with:

```powershell
npx supabase db push --include-seed
```

Remote verification query:

```powershell
npx supabase db query --linked "select (select count(*) from public.brands) as brands, (select count(*) from public.ingredients) as ingredients, (select count(*) from public.products) as products, (select count(*) from public.analysis_rules) as analysis_rules;"
```

Expected starter counts:

```text
brands: 5
ingredients: 10
products: 5
analysis_rules: 9
```

## Flutter Runtime Config

Do not commit real service-role secrets. For the app client, use the project URL and anon or publishable key.

Run Flutter with:

```powershell
flutter run `
  --dart-define=SUPABASE_URL=https://qpozdusbiakyywungjvl.supabase.co `
  --dart-define=SUPABASE_ANON_KEY=your-supabase-anon-or-publishable-key
```

You can find the client key in the Supabase dashboard under **Project Settings > API**.

## Apply In Hosted Supabase

1. Create a Supabase project.
2. Open **SQL Editor**.
3. Run the migration SQL from:

```text
supabase/migrations/20260516115300_create_beauty_scanner_schema.sql
```

4. Run the seed SQL from:

```text
supabase/seed/001_starter_catalog.sql
```

5. Copy your project URL and anon key into Flutter runtime config later.

## Notes

- Public catalog tables are readable by anonymous and authenticated users.
- User tables use row level security so users only access their own profile, saved products, and scan history.
- The seed data is deliberately small. It is for development and UI testing, not a final ingredient authority.
- Product and ingredient claims should remain educational and avoid medical diagnosis.
