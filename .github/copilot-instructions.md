<!--
Guidance for AI coding agents working in this Salesforce DX repository.
Keep this file concise and actionable — reference real files and commands.
-->
# Copilot / AI Agent Instructions

Purpose: Quickly orient an AI coding assistant to be productive in this Salesforce DX codebase.

- **Project type:** Salesforce DX source-format project. Primary source lives under `force-app/main/default`.
- **Key folders:**
  - `force-app/main/default/lwc` — Lightning Web Components (LWC).
  - `force-app/main/default/aura` — Aura components.
  - `force-app/main/default/classes` — Apex classes.
  - `manifest/package.xml` — package manifest for deployments.

- **Local dev & test commands (from `package.json`):**
  - Run unit tests: `npm test` (invokes `sfdx-lwc-jest`). See `jest.config.js`.
  - Run lint: `npm run lint` (ESLint targets `**/{aura,lwc}/**/*.js`).
  - Prettier formatting: `npm run prettier` and verify with `npm run prettier:verify`.
  - Watch unit tests: `npm run test:unit:watch`.

- **Git hooks / staged checks:** `husky` + `lint-staged` are configured. Commits will auto-run Prettier, ESLint and related `sfdx-lwc-jest` checks.

- **Lint & test specifics:**
  - ESLint config lives in `eslint.config.js` and applies different rules for `lwc`, `aura`, and test/mock files. Honor those file globs when making edits.
  - Jest is configured via `jest.config.js` which extends `@salesforce/sfdx-lwc-jest`.

- **Salesforce CLI / source flow:**
  - Project config: `sfdx-project.json` (packageDirectories, api version).
  - Typical developer flows (discoverable patterns): use SFDX to authenticate and push/ deploy source. Common commands you may suggest or use: `sfdx auth:web:login`, `sfdx force:source:push`, `sfdx force:source:deploy --manifest manifest/package.xml`.

- **Where to place new code:** follow the existing layout under `force-app/main/default` (LWC→`lwc/`, Aura→`aura/`, Apex→`classes/`). Keep component folder names matching component names.

- **Tests & mocks:**
  - Unit tests for LWC use `__tests__` / `*.test.js` conventions and sfdx-lwc-jest. Test-related globals and overrides are in `eslint.config.js`.
  - When adding or modifying LWC code, add or update the corresponding `*.test.js` and `__mocks__` as needed; `lint-staged` runs related tests for staged LWC changes.

- **Formatting & file types:** Prettier is used for many Salesforce file extensions (see `package.json` `prettier` script). Format files matching `*.cls, *.cmp, *.component, *.css, *.html, *.js, *.json, *.md, *.page, *.trigger, *.xml, *.yaml`.

- **Search patterns & examples:**
  - Find LWCs: `force-app/main/default/lwc/*/<component>.js` and `*.html`.
  - Apex classes: `force-app/main/default/classes/*.cls`.
  - Example SOQL scripts: `scripts/soql/*.soql` and example Apex scripts in `scripts/apex`.

- **When editing files:**
  - Run `npm run lint` and `npm test` locally before proposing large changes.
  - Keep diffs minimal and component-scoped. Prefer small, test-backed changes.

- **What *not* to assume:**
  - Do not assume there are multiple packages or unlocked packages; `sfdx-project.json` shows a single `force-app` package directory.
  - Do not assume a local scratch org is present — recommend `sfdx auth:web:login` and scratch org creation only after confirming developer intent.

If anything here is unclear or you want the agent to follow stricter conventions (e.g., commit message style, branch naming, or additional CI steps), ask for clarification and I'll update this file.
