cd osrm-backend && \
git pull -r && \
mkdir -p build && \
cd build && \
cmake .. -DCMAKE_BUILD_TYPE=Release && \
cmake --build . && \
sudo cmake --build . --target install && \
wget https://s3.amazonaws.com/metro-extracts.mapzen.com/new-york_new-york.osm.pbf && \
./osrm-extract new-york_new-york.osm.pbf -p ../profiles/bicycle.lua && \
./osrm-contract new-york_new-york.osrm && \
./osrm-routed new-york_new-york.osrm