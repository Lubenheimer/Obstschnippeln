-- Einmalig im Supabase SQL-Editor ausführen: ein Platz pro Tag statt zwei.
ALTER TABLE termine ALTER COLUMN max_helfer SET DEFAULT 1;
UPDATE termine SET max_helfer = 1;
