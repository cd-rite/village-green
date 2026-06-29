--
-- Views for a fresh install.
--
-- The active_member / active_volunteer views are created by migration
-- 0006-ce-member-volunteer-fields.js for databases that upgrade through the
-- migrations. A fresh install, however, loads this current/ schema dump (which
-- also baselines _migrations as already-applied in 20-vg-static.sql), so the
-- migration never runs and the views would otherwise be missing — breaking
-- PersonService / VillageService (anything selecting from active_member /
-- active_volunteer). Defining them here keeps fresh installs working. Keep these
-- definitions in sync with migration 0006.
--

CREATE OR REPLACE VIEW active_member AS
  SELECT * FROM member WHERE status = 'Active';

CREATE OR REPLACE VIEW active_volunteer AS
  SELECT * FROM volunteer WHERE active = 1;
