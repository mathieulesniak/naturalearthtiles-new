FROM node:20-alpine


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm install -g \
          tl@0.10.2 \
          mapnik@4.5.x \
          mbtiles@0.9.x \
          @mapbox/tilelive@v6.1.0 \
          tilelive-tmsource@0.8.x \
          tilelive-vector@3.9.x \
          tilelive-bridge@2.3.x \
          tilelive-mapnik@0.6.x

VOLUME /data/tm2source /data/export
ENV SOURCE_PROJECT_DIR=/data/tm2source EXPORT_DIR=/data/export TILELIVE_BIN=tl
COPY . /usr/src/app/

CMD ["/usr/src/app/export-local.sh"]