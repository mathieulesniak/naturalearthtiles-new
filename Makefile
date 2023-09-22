.PHONY: all

all: export-vectortiles db-schema import-naturalearth raster-datasource

export-vectortiles:
	docker build -t mathieulesniak/export-vectortiles src/export-vectortiles

db-schema:
	docker build -t mathieulesniak/db-schema src/db-schema

import-naturalearth:
	docker build -t mathieulesniak/import-naturalearth src/import-naturalearth

raster-datasource:
	docker build -t mathieulesniak/raster-datasource src/raster-datasource
