-- Einmalig im Supabase SQL-Editor ausführen, wenn setup.sql schon gelaufen ist:
-- Admin-Aktionen nur noch für angemeldete Nutzer (Supabase Auth).
DROP POLICY IF EXISTS "public insert termine" ON termine;
DROP POLICY IF EXISTS "public update termine" ON termine;
DROP POLICY IF EXISTS "public delete termine" ON termine;
DROP POLICY IF EXISTS "public delete helfer"  ON helfer;

CREATE POLICY "admin insert termine" ON termine FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "admin update termine" ON termine FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "admin delete termine" ON termine FOR DELETE TO authenticated USING (true);
CREATE POLICY "admin delete helfer"  ON helfer  FOR DELETE TO authenticated USING (true);
