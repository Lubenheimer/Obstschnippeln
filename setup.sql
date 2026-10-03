-- ════════════════════════════════════════════════════════════════
--  Obstschnippeln – Supabase Setup SQL
--  Dieses Skript im Supabase SQL-Editor ausführen (einmalig)
-- ════════════════════════════════════════════════════════════════

-- 1. Termine (jeden Mittwoch; Ferien sind gesperrt)
CREATE TABLE termine (
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    datum      DATE NOT NULL UNIQUE,
    kw         INT,
    gesperrt   BOOLEAN NOT NULL DEFAULT false,
    hinweis    TEXT,
    max_helfer INT NOT NULL DEFAULT 2,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Helfer (Eltern tragen sich zu einem Termin ein)
CREATE TABLE helfer (
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    termin_id  UUID NOT NULL REFERENCES termine(id) ON DELETE CASCADE,
    name       TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- 3. Änderungsprotokoll
CREATE TABLE change_log (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tabelle       TEXT NOT NULL,
    zeile_id      UUID,
    aktion        TEXT NOT NULL CHECK (aktion IN ('eintrag', 'loeschung', 'aenderung')),
    alter_wert    JSONB,
    neuer_wert    JSONB,
    geaendert_von TEXT,
    zeitstempel   TIMESTAMPTZ DEFAULT now()
);

-- ────────────────────────────────────────────────────────────────
--  Row Level Security – öffentlich les- und schreibbar
--  (Schutz der Admin-Funktionen erfolgt per Passwort im Frontend)
-- ────────────────────────────────────────────────────────────────
ALTER TABLE termine    ENABLE ROW LEVEL SECURITY;
ALTER TABLE helfer     ENABLE ROW LEVEL SECURITY;
ALTER TABLE change_log ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public read termine"    ON termine    FOR SELECT USING (true);
CREATE POLICY "public read helfer"     ON helfer     FOR SELECT USING (true);
CREATE POLICY "public read change_log" ON change_log FOR SELECT USING (true);

CREATE POLICY "public insert termine"    ON termine    FOR INSERT WITH CHECK (true);
CREATE POLICY "public insert helfer"     ON helfer     FOR INSERT WITH CHECK (true);
CREATE POLICY "public insert change_log" ON change_log FOR INSERT WITH CHECK (true);

CREATE POLICY "public update termine" ON termine FOR UPDATE USING (true) WITH CHECK (true);

CREATE POLICY "public delete termine" ON termine FOR DELETE USING (true);
CREATE POLICY "public delete helfer"  ON helfer  FOR DELETE USING (true);

-- ────────────────────────────────────────────────────────────────
--  Terminplan Schuljahr 2026/27
-- ────────────────────────────────────────────────────────────────
INSERT INTO termine (datum, kw, gesperrt, hinweis) VALUES
    ('2026-11-04', 45, true, 'Herbstferien'),
    ('2026-11-11', 46, false, NULL),
    ('2026-11-18', 47, false, NULL),
    ('2026-11-25', 48, false, NULL),
    ('2026-12-02', 49, false, NULL),
    ('2026-12-09', 50, false, NULL),
    ('2026-12-16', 51, false, NULL),
    ('2026-12-23', 52, false, NULL),
    ('2026-12-30', 53, true, 'Weihnachtsferien'),
    ('2027-01-06', 1, true, 'Weihnachtsferien'),
    ('2027-01-13', 2, false, NULL),
    ('2027-01-20', 3, false, NULL),
    ('2027-01-27', 4, false, NULL),
    ('2027-02-03', 5, false, NULL),
    ('2027-02-10', 6, true, 'Frühjahrsferien'),
    ('2027-02-17', 7, false, NULL),
    ('2027-02-24', 8, false, NULL),
    ('2027-03-03', 9, false, NULL),
    ('2027-03-10', 10, false, NULL),
    ('2027-03-17', 11, false, NULL),
    ('2027-03-24', 12, true, 'Osterferien'),
    ('2027-03-31', 13, true, 'Osterferien'),
    ('2027-04-07', 14, false, NULL),
    ('2027-04-14', 15, false, NULL),
    ('2027-04-21', 16, false, NULL),
    ('2027-04-28', 17, false, NULL),
    ('2027-05-05', 18, false, NULL),
    ('2027-05-12', 19, false, NULL),
    ('2027-05-19', 20, true, 'Pfingstferien'),
    ('2027-05-26', 21, true, 'Pfingstferien'),
    ('2027-06-02', 22, false, NULL),
    ('2027-06-09', 23, false, NULL),
    ('2027-06-16', 24, false, NULL),
    ('2027-06-23', 25, false, NULL),
    ('2027-06-30', 26, false, NULL),
    ('2027-07-07', 27, false, NULL),
    ('2027-07-14', 28, false, NULL),
    ('2027-07-21', 29, false, NULL),
    ('2027-07-28', 30, false, NULL);
