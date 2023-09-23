DROP VIEW marine_label_z2;
CREATE OR REPLACE VIEW marine_label_z2 AS (
    SELECT geom, name, name_fr, scalerank, featurecla AS type
    FROM ne_110m_geography_marine_polys
);

DROP VIEW marine_label_z5;
CREATE OR REPLACE VIEW marine_label_z5 AS (
    SELECT geom, name, name_fr, scalerank, featurecla AS type
    FROM ne_50m_geography_marine_polys
);

DROP VIEW marine_label_z7;
CREATE OR REPLACE VIEW marine_label_z7 AS (
    SELECT geom, name, name_fr, scalerank, featurecla AS type
    FROM ne_10m_geography_marine_polys
);
