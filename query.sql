--- 1. Which are severe and active disaster in the last week?
SELECT d.*
  FROM disasters d
  WHERE EXTRACT(day FROM (now() - d.incident_datetime)) < 7;

--- 2. List all the organisations and those disasters they are currently involved in?
SELECT
    u.id "Organisation ID",
    u.full_name "Organisation Name",
    COALESCE(d.type::VARCHAR, 'not involved') "Disaster Type"
  FROM users u
  LEFT JOIN assignments a
    ON u.id = a.user_id
  LEFT JOIN target_sites t
    ON a.target_site = t.id
  LEFT JOIN disasters d
    ON t.disaster = d.id
  WHERE u.type = 'organisation'
  GROUP BY u.id, d.type;

--- 3. How many high-prioritised target sites are waiting for being approved or responded?
SELECT COUNT(*)
  FROM target_sites t
  WHERE t.priority = 3
    AND t.status IN ('pending', 'waiting');

--- 4. Create view of high-prioritised target sites are waiting for being approved or responded.
CREATE OR REPLACE VIEW prioritised_waiting_target_sites AS (
  SELECT *
  FROM target_sites t
  WHERE t.priority = 3
    AND t.status IN ('pending', 'waiting')
);

--- 5. For each disaster type, how many times it was mentioned in social media?
SELECT disaster_types.val, (
    SELECT COUNT(*)
      FROM disasters d
      LEFT JOIN target_sites t
        ON d.id = t.disaster
      LEFT JOIN social_media_messages smm
        ON t.id = smm.target_site
      WHERE d.type = disaster_types.val
  )
  FROM (SELECT UNNEST(ENUM_RANGE(NULL::disaster_type))::disaster_type val) disaster_types;

--- 6. How many disaster by type occured in Phuket in last three months (90 days)?
--- Order the result by occurrance descending.
SELECT d.type "Disaster Type", COUNT(*) "Occurance"
  FROM disasters d,
    (SELECT ST_GeomFromText(
      'POLYGON((98.19970916174111 8.002429215766703,98.26013396642861 8.279757032963346,98.44140838049111 8.203646997340972,98.48535369299111 8.029626669965772,98.55676482580361 7.626921611182967,98.49634002111611 7.229286713053067,98.25464080236611 7.229286713053067,98.18322966955361 7.6160323374499255,98.19970916174111 8.002429215766703))'
      , 4326) geo) phuket
  WHERE ST_Overlaps(d.geo, phuket.geo)
    AND EXTRACT(days FROM NOW() - d.incident_datetime) < 90
  GROUP BY d.type
  ORDER BY "Occurance" DESC;

--- 7. Given earthquake data with epicenter, create disaster data whose affected area is 100km around epicenter.
--- Epicenter: POINT(98.05244488118797 18.640972349349987)
--- Severity: 4
--- Active: Yes
--- Incident Date Time: Now
--- Magnitude: 5
--- Depth: 12km
INSERT INTO disasters (id, severity, active, incident_datetime, type, geo)
  VALUES (
    (SELECT MAX(id) FROM disasters) + 1,
    4,
    TRUE,
    NOW(),
    'earthquake',
    ST_Transform(
      ST_Buffer(
        ST_Transform(
          ST_GeomFromText('POINT(98.05244488118797 18.640972349349987)', 4326),
        32647),
      100000),
    4326)
  );
INSERT INTO earthquakes (id, magnitude, depth, epicenter) 
  SELECT d.id, 5.0, 12000, ST_GeomFromText('POINT(98.05244488118797 18.640972349349987)', 4326) FROM disasters d
    ORDER BY d.id DESC LIMIT 1;

--- 8. In each disaster incident, which target site is the most isolated?
SELECT
  d_centroid.disaster_id,
  (
    SELECT t.id
      FROM target_sites t
      WHERE t.disaster = d_centroid.disaster_id
      ORDER BY ST_Distance(t.geo, d_centroid.centroid) DESC
      LIMIT 1
  ) target_site_id
FROM (
  SELECT
      d.id disaster_id,
      ST_Centroid(ST_Collect(t.geo)) centroid
    FROM disasters d
    JOIN target_sites t
      ON d.id = t.disaster
    GROUP BY d.id
) d_centroid;

--- 9. Update social media messages linkage to target sites.
--- For each social media messages which are located in any disaster but not linked to target site, create relation to nearest target site.
--- Run query #5 again to see changes.
UPDATE social_media_messages m
  SET target_site = (
    SELECT t.id
      FROM target_sites t
      JOIN disasters d ON t.disaster = d.id
      WHERE ST_Within(m.geo, d.geo)
      ORDER BY ST_Distance(m.geo, t.geo) ASC LIMIT 1
  )
  WHERE m.target_site IS NULL;
SELECT disaster_types.val, (
    SELECT COUNT(*)
      FROM disasters d
      LEFT JOIN target_sites t
        ON d.id = t.disaster
      LEFT JOIN social_media_messages smm
        ON t.id = smm.target_site
      WHERE d.type = disaster_types.val
  )
  FROM (SELECT UNNEST(ENUM_RANGE(NULL::disaster_type))::disaster_type val) disaster_types;
