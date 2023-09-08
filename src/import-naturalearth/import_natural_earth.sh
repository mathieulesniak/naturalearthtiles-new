#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

readonly NE_DB=${NE_DB:-naturalearth}
readonly NE_USER=${NE_USER:-naturalearth}
readonly NE_PASSWORD=${NE_PASSWORD:-naturalearth}

function import_natural_earth() {
    echo "Importing Natural Earth to PostGIS"
    PGCLIENTENCODING=LATIN1 ogr2ogr \
    -progress \
    -f Postgresql \
    -s_srs EPSG:4326 \
    -t_srs EPSG:3857 \
    -clipsrc -180.1 -85.0511 180.1 85.0511 \
    PG:"host=postgis dbname=$NE_DB user=$NE_USER password=$NE_PASSWORD"\
    -lco GEOMETRY_NAME=geom \
    -lco DIM=2 \
    -nlt GEOMETRY \
    -overwrite \
    "$NATURAL_EARTH_DB"
}

import_natural_earth
