-- ============================================================
-- CFO Dashboard — Supabase Schema
-- Run this in your Supabase SQL editor (one-time setup)
-- ============================================================

-- Config table (PIN hash + settings)
CREATE TABLE IF NOT EXISTS config (
  id TEXT PRIMARY KEY DEFAULT 'ron',
  pin_hash TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Monthly snapshots
CREATE TABLE IF NOT EXISTS snapshots (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  month TEXT NOT NULL UNIQUE,
  income NUMERIC DEFAULT 0,
  expenses NUMERIC DEFAULT 0,
  liquid_reserves NUMERIC DEFAULT 0,
  total_assets NUMERIC DEFAULT 0,
  total_liabilities NUMERIC DEFAULT 0,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Financial goals / targets
CREATE TABLE IF NOT EXISTS targets (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  target_amount NUMERIC DEFAULT 0,
  current_amount NUMERIC DEFAULT 0,
  deadline TEXT,
  category TEXT DEFAULT 'general',
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Financial decision log
CREATE TABLE IF NOT EXISTS decisions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  decision_date TEXT NOT NULL,
  title TEXT NOT NULL,
  reasoning TEXT,
  amount NUMERIC DEFAULT 0,
  category TEXT DEFAULT 'general',
  review_date TEXT,
  outcome TEXT,
  status TEXT DEFAULT 'pending',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- Row Level Security — DISABLE for personal use
-- (Since only you will access this via PIN, RLS adds friction
--  without meaningful security for a single-user tool)
-- ============================================================
ALTER TABLE config DISABLE ROW LEVEL SECURITY;
ALTER TABLE snapshots DISABLE ROW LEVEL SECURITY;
ALTER TABLE targets DISABLE ROW LEVEL SECURITY;
ALTER TABLE decisions DISABLE ROW LEVEL SECURITY;
