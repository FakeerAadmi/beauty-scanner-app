insert into public.brands (id, name, normalized_name, website_url) values
  ('00000000-0000-4000-8000-000000000001', 'CeraVe', 'cerave', 'https://www.cerave.com'),
  ('00000000-0000-4000-8000-000000000002', 'The Ordinary', 'the ordinary', 'https://theordinary.com'),
  ('00000000-0000-4000-8000-000000000003', 'La Roche-Posay', 'la roche-posay', 'https://www.laroche-posay.us'),
  ('00000000-0000-4000-8000-000000000004', 'Paula''s Choice', 'paulas choice', 'https://www.paulaschoice.com'),
  ('00000000-0000-4000-8000-000000000005', 'Neutrogena', 'neutrogena', 'https://www.neutrogena.com')
on conflict (normalized_name) do update set
  name = excluded.name,
  website_url = excluded.website_url;

insert into public.ingredients (
  id,
  inci_name,
  common_name,
  functions,
  description,
  irritation_risk,
  comedogenic_risk,
  pregnancy_caution,
  fragrance_flag,
  evidence_confidence,
  notes
) values
  (
    '10000000-0000-4000-8000-000000000001',
    'Aqua',
    'Water',
    array['solvent'],
    'Water is commonly used as the base solvent in skincare formulas.',
    0,
    0,
    false,
    false,
    'strong',
    'Often listed first because it makes up a large part of many formulas.'
  ),
  (
    '10000000-0000-4000-8000-000000000002',
    'Glycerin',
    'Glycerin',
    array['humectant', 'skin conditioning'],
    'Glycerin helps attract water to the skin surface and supports hydration.',
    0,
    0,
    false,
    false,
    'strong',
    'Generally well tolerated across skin types.'
  ),
  (
    '10000000-0000-4000-8000-000000000003',
    'Niacinamide',
    'Vitamin B3',
    array['skin conditioning', 'barrier support'],
    'Niacinamide is used to support the skin barrier and improve the look of uneven tone.',
    1,
    0,
    false,
    false,
    'strong',
    'Some sensitive users may prefer lower-strength formulas.'
  ),
  (
    '10000000-0000-4000-8000-000000000004',
    'Ceramide NP',
    'Ceramide NP',
    array['barrier support', 'skin conditioning'],
    'Ceramide NP is a lipid-like ingredient used to support the skin barrier.',
    0,
    0,
    false,
    false,
    'moderate',
    'Often paired with other ceramides and cholesterol.'
  ),
  (
    '10000000-0000-4000-8000-000000000005',
    'Hyaluronic Acid',
    'Hyaluronic acid',
    array['humectant', 'skin conditioning'],
    'Hyaluronic acid helps bind water and is used for hydration-focused products.',
    0,
    0,
    false,
    false,
    'moderate',
    'Works best in a formula that also includes emollients or occlusives.'
  ),
  (
    '10000000-0000-4000-8000-000000000006',
    'Salicylic Acid',
    'BHA',
    array['exfoliant', 'anti-acne'],
    'Salicylic acid is an oil-soluble exfoliant often used for blemish-prone skin.',
    3,
    0,
    true,
    false,
    'strong',
    'Can be drying or irritating, especially when layered with other exfoliants.'
  ),
  (
    '10000000-0000-4000-8000-000000000007',
    'Retinol',
    'Vitamin A',
    array['skin conditioning', 'renewal support'],
    'Retinol is used in products targeting texture, visible aging, and uneven tone.',
    4,
    0,
    true,
    false,
    'strong',
    'Often introduced slowly because it can irritate sensitive skin.'
  ),
  (
    '10000000-0000-4000-8000-000000000008',
    'Tocopherol',
    'Vitamin E',
    array['antioxidant', 'skin conditioning'],
    'Tocopherol is an antioxidant form of vitamin E used to support formula stability and skin conditioning.',
    1,
    2,
    false,
    false,
    'moderate',
    'Usually well tolerated, though very acne-prone users may want context from the whole formula.'
  ),
  (
    '10000000-0000-4000-8000-000000000009',
    'Fragrance',
    'Fragrance',
    array['fragrance'],
    'Fragrance is added for scent and may include multiple aroma compounds.',
    4,
    0,
    false,
    true,
    'precautionary',
    'Sensitive or fragrance-reactive users may prefer fragrance-free products.'
  ),
  (
    '10000000-0000-4000-8000-000000000010',
    'Dimethicone',
    'Dimethicone',
    array['emollient', 'skin protectant'],
    'Dimethicone is a silicone-based emollient used to reduce water loss and improve skin feel.',
    0,
    1,
    false,
    false,
    'strong',
    'Common in moisturizers and barrier-support products.'
  )
on conflict (inci_name) do update set
  common_name = excluded.common_name,
  functions = excluded.functions,
  description = excluded.description,
  irritation_risk = excluded.irritation_risk,
  comedogenic_risk = excluded.comedogenic_risk,
  pregnancy_caution = excluded.pregnancy_caution,
  fragrance_flag = excluded.fragrance_flag,
  evidence_confidence = excluded.evidence_confidence,
  notes = excluded.notes;

insert into public.ingredient_aliases (ingredient_id, alias, normalized_alias) values
  ('10000000-0000-4000-8000-000000000001', 'Water', 'water'),
  ('10000000-0000-4000-8000-000000000005', 'Sodium Hyaluronate', 'sodium hyaluronate'),
  ('10000000-0000-4000-8000-000000000006', 'Beta Hydroxy Acid', 'beta hydroxy acid'),
  ('10000000-0000-4000-8000-000000000009', 'Parfum', 'parfum'),
  ('10000000-0000-4000-8000-000000000010', 'Polydimethylsiloxane', 'polydimethylsiloxane')
on conflict (normalized_alias) do update set
  ingredient_id = excluded.ingredient_id,
  alias = excluded.alias;

insert into public.products (
  id,
  brand_id,
  name,
  normalized_name,
  barcode,
  category,
  image_url,
  raw_ingredients_text,
  source
) values
  (
    '20000000-0000-4000-8000-000000000001',
    '00000000-0000-4000-8000-000000000001',
    'Daily Moisturizing Lotion',
    'daily moisturizing lotion',
    '3606000537621',
    'moisturizer',
    null,
    'Aqua, Glycerin, Dimethicone, Ceramide NP, Hyaluronic Acid',
    'manual'
  ),
  (
    '20000000-0000-4000-8000-000000000002',
    '00000000-0000-4000-8000-000000000002',
    'Niacinamide 10% + Zinc 1%',
    'niacinamide 10 zinc 1',
    '769915190311',
    'serum',
    null,
    'Aqua, Niacinamide, Glycerin',
    'manual'
  ),
  (
    '20000000-0000-4000-8000-000000000003',
    '00000000-0000-4000-8000-000000000003',
    'Effaclar Medicated Gel Cleanser',
    'effaclar medicated gel cleanser',
    '3337872411991',
    'cleanser',
    null,
    'Aqua, Glycerin, Salicylic Acid, Fragrance',
    'manual'
  ),
  (
    '20000000-0000-4000-8000-000000000004',
    '00000000-0000-4000-8000-000000000004',
    '2% BHA Liquid Exfoliant',
    '2 bha liquid exfoliant',
    '655439020105',
    'exfoliant',
    null,
    'Aqua, Salicylic Acid, Glycerin',
    'manual'
  ),
  (
    '20000000-0000-4000-8000-000000000005',
    '00000000-0000-4000-8000-000000000005',
    'Retinol Regenerating Cream',
    'retinol regenerating cream',
    '070501110009',
    'treatment',
    null,
    'Aqua, Glycerin, Dimethicone, Retinol, Tocopherol, Fragrance',
    'manual'
  )
on conflict (barcode) do update set
  brand_id = excluded.brand_id,
  name = excluded.name,
  normalized_name = excluded.normalized_name,
  category = excluded.category,
  image_url = excluded.image_url,
  raw_ingredients_text = excluded.raw_ingredients_text,
  source = excluded.source;

insert into public.product_ingredients (
  product_id,
  ingredient_id,
  raw_name,
  normalized_raw_name,
  position,
  match_status
) values
  ('20000000-0000-4000-8000-000000000001', '10000000-0000-4000-8000-000000000001', 'Aqua', 'aqua', 1, 'matched'),
  ('20000000-0000-4000-8000-000000000001', '10000000-0000-4000-8000-000000000002', 'Glycerin', 'glycerin', 2, 'matched'),
  ('20000000-0000-4000-8000-000000000001', '10000000-0000-4000-8000-000000000010', 'Dimethicone', 'dimethicone', 3, 'matched'),
  ('20000000-0000-4000-8000-000000000001', '10000000-0000-4000-8000-000000000004', 'Ceramide NP', 'ceramide np', 4, 'matched'),
  ('20000000-0000-4000-8000-000000000001', '10000000-0000-4000-8000-000000000005', 'Hyaluronic Acid', 'hyaluronic acid', 5, 'matched'),
  ('20000000-0000-4000-8000-000000000002', '10000000-0000-4000-8000-000000000001', 'Aqua', 'aqua', 1, 'matched'),
  ('20000000-0000-4000-8000-000000000002', '10000000-0000-4000-8000-000000000003', 'Niacinamide', 'niacinamide', 2, 'matched'),
  ('20000000-0000-4000-8000-000000000002', '10000000-0000-4000-8000-000000000002', 'Glycerin', 'glycerin', 3, 'matched'),
  ('20000000-0000-4000-8000-000000000003', '10000000-0000-4000-8000-000000000001', 'Aqua', 'aqua', 1, 'matched'),
  ('20000000-0000-4000-8000-000000000003', '10000000-0000-4000-8000-000000000002', 'Glycerin', 'glycerin', 2, 'matched'),
  ('20000000-0000-4000-8000-000000000003', '10000000-0000-4000-8000-000000000006', 'Salicylic Acid', 'salicylic acid', 3, 'matched'),
  ('20000000-0000-4000-8000-000000000003', '10000000-0000-4000-8000-000000000009', 'Fragrance', 'fragrance', 4, 'matched'),
  ('20000000-0000-4000-8000-000000000004', '10000000-0000-4000-8000-000000000001', 'Aqua', 'aqua', 1, 'matched'),
  ('20000000-0000-4000-8000-000000000004', '10000000-0000-4000-8000-000000000006', 'Salicylic Acid', 'salicylic acid', 2, 'matched'),
  ('20000000-0000-4000-8000-000000000004', '10000000-0000-4000-8000-000000000002', 'Glycerin', 'glycerin', 3, 'matched'),
  ('20000000-0000-4000-8000-000000000005', '10000000-0000-4000-8000-000000000001', 'Aqua', 'aqua', 1, 'matched'),
  ('20000000-0000-4000-8000-000000000005', '10000000-0000-4000-8000-000000000002', 'Glycerin', 'glycerin', 2, 'matched'),
  ('20000000-0000-4000-8000-000000000005', '10000000-0000-4000-8000-000000000010', 'Dimethicone', 'dimethicone', 3, 'matched'),
  ('20000000-0000-4000-8000-000000000005', '10000000-0000-4000-8000-000000000007', 'Retinol', 'retinol', 4, 'matched'),
  ('20000000-0000-4000-8000-000000000005', '10000000-0000-4000-8000-000000000008', 'Tocopherol', 'tocopherol', 5, 'matched'),
  ('20000000-0000-4000-8000-000000000005', '10000000-0000-4000-8000-000000000009', 'Fragrance', 'fragrance', 6, 'matched')
on conflict (product_id, position) do update set
  ingredient_id = excluded.ingredient_id,
  raw_name = excluded.raw_name,
  normalized_raw_name = excluded.normalized_raw_name,
  match_status = excluded.match_status;

insert into public.analysis_rules (
  id,
  ingredient_id,
  rule_type,
  skin_type,
  concern,
  severity,
  title,
  explanation,
  evidence_confidence
) values
  (
    '30000000-0000-4000-8000-000000000001',
    '10000000-0000-4000-8000-000000000002',
    'positive_signal',
    null,
    'dehydration',
    'info',
    'Hydration support',
    'Glycerin is a humectant that helps attract water to the skin surface.',
    'strong'
  ),
  (
    '30000000-0000-4000-8000-000000000002',
    '10000000-0000-4000-8000-000000000003',
    'positive_signal',
    null,
    'uneven_tone',
    'info',
    'Barrier and tone support',
    'Niacinamide is commonly used for barrier support and the look of uneven tone.',
    'strong'
  ),
  (
    '30000000-0000-4000-8000-000000000003',
    '10000000-0000-4000-8000-000000000004',
    'positive_signal',
    'dry',
    'barrier_support',
    'info',
    'Barrier-friendly lipid',
    'Ceramide NP can be useful in moisturizers aimed at supporting a compromised-feeling barrier.',
    'moderate'
  ),
  (
    '30000000-0000-4000-8000-000000000004',
    '10000000-0000-4000-8000-000000000006',
    'skin_type_note',
    'acne_prone',
    'blemishes',
    'info',
    'Acne-prone skin note',
    'Salicylic acid may suit some blemish-prone routines, but tolerance depends on concentration and frequency.',
    'strong'
  ),
  (
    '30000000-0000-4000-8000-000000000005',
    '10000000-0000-4000-8000-000000000006',
    'warning',
    'sensitive',
    'irritation',
    'medium',
    'Potential irritation',
    'Salicylic acid may irritate or dry sensitive skin, especially when layered with other exfoliants.',
    'strong'
  ),
  (
    '30000000-0000-4000-8000-000000000006',
    '10000000-0000-4000-8000-000000000007',
    'warning',
    'sensitive',
    'irritation',
    'high',
    'Introduce slowly',
    'Retinol can cause dryness, peeling, or irritation, especially for sensitive skin or new users.',
    'strong'
  ),
  (
    '30000000-0000-4000-8000-000000000007',
    '10000000-0000-4000-8000-000000000007',
    'warning',
    null,
    'pregnancy_caution',
    'high',
    'Pregnancy caution',
    'Retinoids are commonly flagged for pregnancy caution; users should check with a qualified clinician.',
    'precautionary'
  ),
  (
    '30000000-0000-4000-8000-000000000008',
    '10000000-0000-4000-8000-000000000009',
    'warning',
    'sensitive',
    'fragrance_sensitivity',
    'medium',
    'Contains fragrance',
    'Fragrance may be a concern for users with sensitive or fragrance-reactive skin.',
    'precautionary'
  ),
  (
    '30000000-0000-4000-8000-000000000009',
    '10000000-0000-4000-8000-000000000010',
    'positive_signal',
    'dry',
    'barrier_support',
    'info',
    'Helps reduce water loss',
    'Dimethicone can help soften skin feel and reduce moisture loss in barrier-focused products.',
    'strong'
  )
on conflict (id) do update set
  ingredient_id = excluded.ingredient_id,
  rule_type = excluded.rule_type,
  skin_type = excluded.skin_type,
  concern = excluded.concern,
  severity = excluded.severity,
  title = excluded.title,
  explanation = excluded.explanation,
  evidence_confidence = excluded.evidence_confidence;
