create extension if not exists pgcrypto;

create table public.brands (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  normalized_name text not null,
  website_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint brands_name_not_blank check (length(trim(name)) > 0),
  constraint brands_normalized_name_unique unique (normalized_name)
);

create table public.ingredients (
  id uuid primary key default gen_random_uuid(),
  inci_name text not null,
  common_name text,
  functions text[] not null default '{}',
  description text,
  irritation_risk smallint not null default 0,
  comedogenic_risk smallint not null default 0,
  pregnancy_caution boolean not null default false,
  fragrance_flag boolean not null default false,
  evidence_confidence text not null default 'limited',
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint ingredients_inci_name_not_blank check (length(trim(inci_name)) > 0),
  constraint ingredients_inci_name_unique unique (inci_name),
  constraint ingredients_irritation_risk_range check (irritation_risk between 0 and 5),
  constraint ingredients_comedogenic_risk_range check (comedogenic_risk between 0 and 5),
  constraint ingredients_evidence_confidence_valid check (
    evidence_confidence in ('strong', 'moderate', 'limited', 'precautionary')
  )
);

create table public.ingredient_aliases (
  id uuid primary key default gen_random_uuid(),
  ingredient_id uuid not null references public.ingredients(id) on delete cascade,
  alias text not null,
  normalized_alias text not null,
  created_at timestamptz not null default now(),
  constraint ingredient_aliases_alias_not_blank check (length(trim(alias)) > 0),
  constraint ingredient_aliases_normalized_alias_unique unique (normalized_alias)
);

create table public.products (
  id uuid primary key default gen_random_uuid(),
  brand_id uuid references public.brands(id) on delete set null,
  name text not null,
  normalized_name text not null,
  barcode text,
  category text not null default 'skincare',
  image_url text,
  raw_ingredients_text text,
  source text not null default 'manual',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint products_name_not_blank check (length(trim(name)) > 0),
  constraint products_barcode_unique unique (barcode),
  constraint products_source_valid check (source in ('manual', 'open_beauty_facts', 'user_submission', 'admin'))
);

create table public.product_ingredients (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete cascade,
  ingredient_id uuid references public.ingredients(id) on delete set null,
  raw_name text not null,
  normalized_raw_name text not null,
  position integer not null,
  match_status text not null default 'matched',
  created_at timestamptz not null default now(),
  constraint product_ingredients_raw_name_not_blank check (length(trim(raw_name)) > 0),
  constraint product_ingredients_position_positive check (position > 0),
  constraint product_ingredients_match_status_valid check (match_status in ('matched', 'alias_matched', 'unmatched')),
  constraint product_ingredients_product_position_unique unique (product_id, position)
);

create table public.analysis_rules (
  id uuid primary key default gen_random_uuid(),
  ingredient_id uuid references public.ingredients(id) on delete cascade,
  rule_type text not null,
  skin_type text,
  concern text,
  severity text not null default 'info',
  title text not null,
  explanation text not null,
  evidence_confidence text not null default 'limited',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint analysis_rules_title_not_blank check (length(trim(title)) > 0),
  constraint analysis_rules_explanation_not_blank check (length(trim(explanation)) > 0),
  constraint analysis_rules_rule_type_valid check (
    rule_type in ('warning', 'positive_signal', 'skin_type_note', 'concern_note', 'avoid_list')
  ),
  constraint analysis_rules_skin_type_valid check (
    skin_type is null or skin_type in ('oily', 'dry', 'combination', 'sensitive', 'acne_prone')
  ),
  constraint analysis_rules_severity_valid check (severity in ('info', 'low', 'medium', 'high')),
  constraint analysis_rules_evidence_confidence_valid check (
    evidence_confidence in ('strong', 'moderate', 'limited', 'precautionary')
  )
);

create table public.user_profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  skin_type text,
  concerns text[] not null default '{}',
  fragrance_sensitive boolean not null default false,
  avoid_ingredient_ids uuid[] not null default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint user_profiles_skin_type_valid check (
    skin_type is null or skin_type in ('oily', 'dry', 'combination', 'sensitive', 'acne_prone')
  )
);

create table public.saved_products (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  product_id uuid not null references public.products(id) on delete cascade,
  created_at timestamptz not null default now(),
  constraint saved_products_user_product_unique unique (user_id, product_id)
);

create table public.scan_history (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete set null,
  product_id uuid references public.products(id) on delete set null,
  barcode text,
  raw_input_text text,
  scan_type text not null,
  result_status text not null,
  created_at timestamptz not null default now(),
  constraint scan_history_scan_type_valid check (scan_type in ('barcode', 'manual_ingredients', 'ocr')),
  constraint scan_history_result_status_valid check (result_status in ('found', 'not_found', 'parsed', 'failed'))
);

create index brands_normalized_name_idx on public.brands using btree (normalized_name);
create index ingredients_inci_name_idx on public.ingredients using btree (inci_name);
create index ingredient_aliases_ingredient_id_idx on public.ingredient_aliases using btree (ingredient_id);
create index products_brand_id_idx on public.products using btree (brand_id);
create index products_normalized_name_idx on public.products using btree (normalized_name);
create index products_barcode_idx on public.products using btree (barcode);
create index product_ingredients_product_id_idx on public.product_ingredients using btree (product_id);
create index product_ingredients_ingredient_id_idx on public.product_ingredients using btree (ingredient_id);
create index analysis_rules_ingredient_id_idx on public.analysis_rules using btree (ingredient_id);
create index analysis_rules_rule_type_idx on public.analysis_rules using btree (rule_type);
create index saved_products_user_id_idx on public.saved_products using btree (user_id);
create index scan_history_user_id_idx on public.scan_history using btree (user_id);
create index scan_history_product_id_idx on public.scan_history using btree (product_id);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger set_brands_updated_at
before update on public.brands
for each row execute function public.set_updated_at();

create trigger set_ingredients_updated_at
before update on public.ingredients
for each row execute function public.set_updated_at();

create trigger set_products_updated_at
before update on public.products
for each row execute function public.set_updated_at();

create trigger set_analysis_rules_updated_at
before update on public.analysis_rules
for each row execute function public.set_updated_at();

create trigger set_user_profiles_updated_at
before update on public.user_profiles
for each row execute function public.set_updated_at();

alter table public.brands enable row level security;
alter table public.ingredients enable row level security;
alter table public.ingredient_aliases enable row level security;
alter table public.products enable row level security;
alter table public.product_ingredients enable row level security;
alter table public.analysis_rules enable row level security;
alter table public.user_profiles enable row level security;
alter table public.saved_products enable row level security;
alter table public.scan_history enable row level security;

create policy "Public read brands"
on public.brands for select
to anon, authenticated
using (true);

create policy "Public read ingredients"
on public.ingredients for select
to anon, authenticated
using (true);

create policy "Public read ingredient aliases"
on public.ingredient_aliases for select
to anon, authenticated
using (true);

create policy "Public read products"
on public.products for select
to anon, authenticated
using (true);

create policy "Public read product ingredients"
on public.product_ingredients for select
to anon, authenticated
using (true);

create policy "Public read analysis rules"
on public.analysis_rules for select
to anon, authenticated
using (true);

create policy "Users read own profile"
on public.user_profiles for select
to authenticated
using (auth.uid() = id);

create policy "Users insert own profile"
on public.user_profiles for insert
to authenticated
with check (auth.uid() = id);

create policy "Users update own profile"
on public.user_profiles for update
to authenticated
using (auth.uid() = id)
with check (auth.uid() = id);

create policy "Users delete own profile"
on public.user_profiles for delete
to authenticated
using (auth.uid() = id);

create policy "Users read own saved products"
on public.saved_products for select
to authenticated
using (auth.uid() = user_id);

create policy "Users save own products"
on public.saved_products for insert
to authenticated
with check (auth.uid() = user_id);

create policy "Users remove own saved products"
on public.saved_products for delete
to authenticated
using (auth.uid() = user_id);

create policy "Users read own scan history"
on public.scan_history for select
to authenticated
using (auth.uid() = user_id);

create policy "Users insert own scan history"
on public.scan_history for insert
to authenticated
with check (auth.uid() = user_id);
