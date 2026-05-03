# Week5_OSRM — OSRM 라우팅 데이터

## ⚠️ 데이터 파일 별도 다운로드 필요

`south-korea-latest.osrm.*` 파일들은 **대용량(개별 300MB+ / 합산 GB 단위)** 으로 git에 포함되지 않습니다 (`.gitignore` 처리).

빌드/실행 전에 직접 다운로드하세요.

## 다운로드 방법

### 1. 원본 OSM 데이터 받기
```bash
curl -O https://download.geofabrik.de/asia/south-korea-latest.osm.pbf
```

### 2. OSRM 사전처리 (Docker 권장)
```bash
# extract
docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-extract -p /opt/car.lua /data/south-korea-latest.osm.pbf

# partition
docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-partition /data/south-korea-latest.osrm

# customize
docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-customize /data/south-korea-latest.osrm
```

### 3. 산출물 배치
모든 `south-korea-latest.osrm.*` 파일을 이 폴더(`Week5/Week5_OSRM/`)에 배치.

## 참고
- OSRM 공식 문서: https://github.com/Project-OSRM/osrm-backend
- Geofabrik OSM 다운로드: https://download.geofabrik.de/asia/south-korea.html
