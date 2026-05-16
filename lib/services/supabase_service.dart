import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  const SupabaseService._();

  static bool get isConfigured => Supabase.instance.isInitialized;

  static SupabaseClient get client => Supabase.instance.client;
}
