# CFO Dashboard — Deployment Guide

## What you're deploying
A personal financial decision engine. PIN-gated, cloud-synced via Supabase,
installable on phone and PC from the same URL. No subscription, no monthly cost.

---

## Step 1 — Supabase Setup (5 minutes)

1. Go to https://supabase.com → Sign Up (free)
2. Create a new project. Name it anything (e.g. "cfo-dashboard"). Pick a region nearest to PH (e.g. Singapore). Save your database password.
3. Wait ~2 minutes for the project to provision.
4. Go to the SQL Editor (left sidebar) → New Query
5. Copy-paste everything from `schema.sql` → Run
6. Go to Project Settings → API
7. Copy two values:
   - Project URL (looks like: https://xxxxxxxxxxxx.supabase.co)
   - anon public key (long JWT string)

---

## Step 2 — Configure the App (2 minutes)

Open `index.html` in any text editor.

Find these two lines near the top of the script:

```
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
```

Replace the placeholder values with your actual values from Step 1.

Save the file.

---

## Step 3 — Deploy to GitHub Pages (3 minutes)

1. Go to github.com → your account → New Repository
2. Name it: `cfo-dashboard`
3. Make it **Private** (recommended for a personal finance tool)
4. Upload both files:
   - `index.html`
   - `manifest.json`
5. Go to Settings → Pages → Source: Deploy from branch → main → / (root) → Save
6. Wait ~60 seconds. Your URL will be:
   `https://[your-github-username].github.io/cfo-dashboard/`

---

## Step 4 — Install on Phone

**iPhone (Safari):**
1. Open the URL in Safari
2. Tap Share → Add to Home Screen
3. Name it "CFO" → Add
4. It opens fullscreen like a native app

**Android (Chrome):**
1. Open the URL in Chrome
2. Tap the three-dot menu → Add to Home Screen
3. Done

**PC:**
- Just bookmark the URL. Works in any browser.

---

## First Launch

On first open, you'll see the PIN setup screen.
Set your 6-digit PIN. It's hashed (SHA-256) before storage.
Anthropic or anyone else cannot see it. You set it live, privately.

---

## Monthly Routine (5 minutes on the 1st)

1. Open PIES → pull monthly totals
2. Open CFO Dashboard → Snapshot → Update
3. Enter: Income / Expenses / Reserves / Assets / Liabilities
4. Review your Health Score
5. Check Targets progress, update current amounts
6. Log any financial decisions made that month

---

## Upgrading Later

When Claude builds a new version for you:
- Download the new `index.html`
- Replace the Supabase URL and key (same values, just copy them back in)
- Upload to GitHub, replacing the old file
- GitHub Pages updates automatically within 60 seconds

Your data in Supabase is untouched by app updates.

---

## Notes

- The insurance checklist (Protection screen) resets on page reload by design.
  It's a prompt, not a database record. A future version can make it persistent.
- Scenario D (Dry Quarter) uses your current expenses from Snapshot.
  Update your Snapshot first for accurate modeling.
- Decisions with a Review Date that has passed will show "Review Due" with
  Yes/No buttons. Marking them builds your reasoning track record over time.
