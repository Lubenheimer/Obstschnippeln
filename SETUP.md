# Obstschnippeln – Setup-Anleitung

Technisch identisch zum Erntedankfest: eine einzige `index.html` auf GitHub Pages, Daten in Supabase (kostenlos).

## 1. Supabase-Projekt anlegen
1. https://supabase.com → „New Project" → Name `obstschnippeln`, Region **Frankfurt**.
   (Eigenes, neues Projekt – die Zugangsdaten vom Erntedankfest nicht wiederverwenden.)
2. **SQL Editor** → Inhalt von `setup.sql` einfügen → **Run**. Das legt die Tabellen an und trägt alle Mittwochs-Termine 04.11.2026 – 28.07.2027 ein (Ferien sind automatisch gesperrt).

## 2. Zugangsdaten eintragen
Supabase → Project Settings → API → *Project URL* und *publishable key* kopieren und oben im `<script>` von `index.html` eintragen.

## 2b. Admin-Konto (Passwort liegt in Supabase, nicht im Repo)
1. Supabase → **Authentication → Users → Add user** → E-Mail + Passwort, „Auto Confirm User" anhaken.
2. **Authentication → Sign In / Providers** → „Allow new users to sign up" **ausschalten**.
3. Lief `setup.sql` schon vor dieser Änderung: einmalig `migrate-admin-auth.sql` im SQL-Editor ausführen.

## 3. GitHub Pages
1. Neues **Public** Repository (z. B. `obstschnippeln`), `index.html` + `.nojekyll` hochladen.
2. Settings → Pages → *Deploy from a branch* → `main` / `(root)`.
3. URL: `https://DEIN-NAME.github.io/obstschnippeln/`

## Bedienung
- **Eltern:** Termin wählen → „Ich übernehme" → Name eingeben. Standard: 2 Helfer pro Mittwoch.
- **Admin** (unten „🔒 Admin", Login mit E-Mail + Passwort): Einträge entfernen, Termine bearbeiten (Hinweis, Helferzahl, sperren), Termine hinzufügen/löschen, auch bei vollen Terminen eintragen. Alles landet im Änderungsprotokoll.

## Sicherheit
Admin-Anmeldung läuft über Supabase Auth. Termine anlegen/ändern/löschen und Eintragungen entfernen erlaubt die Datenbank nur angemeldeten Nutzern (Row Level Security) – im Repo steht kein Passwort. Eltern dürfen nur lesen und sich eintragen. Voraussetzung: Registrierung neuer Nutzer ist deaktiviert (2b.2).
