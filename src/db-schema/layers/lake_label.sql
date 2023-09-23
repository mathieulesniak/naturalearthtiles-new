DROP TABLE IF EXISTS lake_label_z5 CASCADE;
CREATE TABLE lake_label_z5 AS (
    SELECT topoint(geom) AS geom, scalerank, name, name_fr FROM ne_10m_lakes
);

CREATE INDEX lake_label_z5_geom_idx ON lake_label_z5 USING gist(geom);
