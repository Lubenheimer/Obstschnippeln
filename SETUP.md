# Obstschnippeln – Setup-Anleitung

Technisch identisch zum Erntedankfest: eine einzige `index.html` auf GitHub Pages, Daten in Supabase (kostenlos).

## 1. Supabase-Projekt anlegen
1. https://supabase.com → „New Project" → Name `obstschnippeln`, Region **Frankfurt**.
   (Eigenes, neues Projekt – die Zugangsdaten vom Erntedankfest nicht wiederverwenden.)
2. **SQL Editor** → Inhalt von `setup.sql` einfügen → **Run**. Das legt die Tabellen an und trägt alle Mittwochs-Termine 04.11.2026 – 28.07.2027 ein (Ferien sind automatisch gesperrt).

## 2. Zugangsdaten eintragen
Supabase → Project Settings → API → *Project URL* und *anon/publishable key* kopieren und oben im `<script>` von `index.html` eintragen. Dort auch `ADMIN_PASSWORD` ändern.

## 3. GitHub Pages
1. Neues **Public** Repository (z. B. `obstschnippeln`), `index.html` + `.nojekyll` hochladen.
2. Settings → Pages → *Deploy from a branch* → `main` / `(root)`.
3. URL: `https://DEIN-NAME.github.io/obstschnippeln/`

## Bedienung
- **Eltern:** Termin wählen → „Ich übernehme" → Name eingeben. Standard: 2 Helfer pro Mittwoch.
- **Admin** (unten „🔒 Admin"): Einträge entfernen, Termine bearbeiten (Hinweis, Helferzahl, sperren), Termine hinzufügen/löschen, auch bei vollen Terminen eintragen. Alles landet im Änderungsprotokoll.

## Hinweis zur Sicherheit
Wie beim Erntedankfest wird das Admin-Passwort im Frontend geprüft – das schützt vor versehentlichen Änderungen, nicht vor gezielten Angriffen (Passwort steht im Quelltext). Für eine Schul-Liste ausreichend.
