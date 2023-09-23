CREATE OR REPLACE FUNCTION fix_win1252_shp_encoding(str TEXT) RETURNS TEXT
AS $$
BEGIN
    RETURN convert_from(convert_to(str, 'WIN1252'), 'UTF-8');
    EXCEPTION WHEN others THEN RETURN str;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- UPDATE ne_10m_admin_1_states_provinces
-- SET name=fix_win1252_shp_encoding(name);

-- UPDATE ne_50m_admin_1_states_provinces
-- SET name=fix_win1252_shp_encoding(name);
DROP VIEW state_label_z3;

CREATE OR REPLACE VIEW state_label_z3 AS (
    SELECT geom, name, name_fr scalerank, labelrank, postal
    FROM ne_50m_admin_1_states_provinces
);

DROP VIEW state_label_z5;

CREATE OR REPLACE VIEW state_label_z5 AS (
    SELECT geom, name, name_fr scalerank, labelrank, postal
    FROM ne_10m_admin_1_states_provinces
    WHERE scalerank <= 6
);

DROP VIEW state_label_z7;

CREATE OR REPLACE VIEW state_label_z7 AS (
    SELECT geom, name, name_fr, scalerank, labelrank, postal
    FROM ne_10m_admin_1_states_provinces
);
