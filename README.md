# Chartd Trading Journal

A personalized build of the MIT-licensed [LuxAlgo Trade Journal](https://github.com/LuxAlgo/trade-journal), seeded from the `futures_trade_tracker` Google Sheet.

## What's included

- LuxAlgo Trade Journal UI, analytics, calendar, reports, journal, playbooks, replay hooks, and prop-firm tracking.
- 196 historical trades from the Raw Trade Log.
- Tracker P&L preserved exactly. Rows with a value in **Net P&L ($)** use net P&L; older rows fall back to the historical tracker P&L because commissions were not recorded.
- Setups, outcomes, context, session, rule-followed status, execution score, stop, trims, and runner exit are copied into trade notes.
- Futures are seeded with a synthetic weighted-average closing execution so the journal's calculated P&L matches the tracker. The original tracker details remain in each trade's notes.

## Run it

Requires Docker Desktop.

```bash
docker compose up --build
```

Open http://localhost:3000.

On the empty dashboard click **Load my trade tracker** once. The import is idempotent: the account is tagged `cody-trade-tracker`, so clicking again will not duplicate the history.

Journal data persists in `./data`.

## Updating from the Google Sheet

The generated seed currently reflects the Google Sheet through 2026-09-28. To refresh it, regenerate `overrides/demo.ts` from the `Raw Trade Log` source before rebuilding.

## Upstream

This wrapper pins LuxAlgo Trade Journal commit `949bca1993ee284e1facf2e26cfd1fa820b8f5cf` for reproducible builds. Review upstream changes before changing the pin.

LuxAlgo Trade Journal is MIT licensed. LuxAlgo trademarks remain subject to their trademark policy.


Seed validation: 8 rows use Net P&L and 188 rows use historical P&L fallback. Seeded total P&L: $5504.30.
