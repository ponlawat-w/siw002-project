CREATE EXTENSION IF NOT EXISTS postgis;

DROP TYPE IF EXISTS disaster_type CASCADE;
CREATE TYPE disaster_type AS ENUM
  ('earthquake', 'landslide', 'volcanic_eruption', 'tsunami', 'inundation', 'fire', 'storm');

DROP TYPE IF EXISTS user_type CASCADE;
CREATE TYPE user_type AS ENUM ('citizen', 'call_center', 'organisation');

DROP TYPE IF EXISTS target_site_status CASCADE;
CREATE TYPE target_site_status AS ENUM
  ('pending', 'waiting', 'in_progress', 'success', 'rejected');

DROP TABLE IF EXISTS social_medias CASCADE;
CREATE TABLE social_medias (
  id    INTEGER       NOT NULL,
  name  VARCHAR(200)  NOT NULL,
  CONSTRAINT social_medias_pk PRIMARY KEY (id)
);

DROP TABLE IF EXISTS social_media_messages CASCADE;
CREATE TABLE social_media_messages (
<<<<<<< HEAD
  id            INTEGER         NOT NULL,
  message       TEXT            NOT NULL,
  published_by  VARCHAR(200)    NOT NULL,
  social_media  INTEGER         NOT NULL,
  geo           GEOMETRY(POINT) NULL,
=======
  id                  INTEGER         NOT NULL,
  message             TEXT            NOT NULL,
  published_by        VARCHAR(200)    NOT NULL,
  published_datetime  TIMESTAMP       NOT NULL,
  social_media        INTEGER         NOT NULL,
  geo                 GEOMETRY(POINT) NULL,
>>>>>>> 573f18dce7caba5f9094aa73862334fe77bd982b
  CONSTRAINT social_media_messages_pk               PRIMARY KEY (id),
  CONSTRAINT social_media_messages_social_media_fk  FOREIGN KEY (social_media)
    REFERENCES social_medias(id)
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS disasters CASCADE;
CREATE TABLE disasters (
  id                INTEGER           NOT NULL,
  severity          SMALLINT          NOT NULL,
  active            BOOLEAN           NOT NULL DEFAULT true,
  incident_datetime TIMESTAMP         NOT NULL DEFAULT NOW(),
  type              disaster_type     NOT NULL,
  geo               GEOMETRY(POLYGON) NOT NULL,
  CONSTRAINT disasters_pk             PRIMARY KEY (id),
  CONSTRAINT disasters_severity_value CHECK (severity BETWEEN 1 AND 5)
);

DROP TABLE IF EXISTS earthquakes CASCADE;
CREATE TABLE earthquakes (
  id        INTEGER         NOT NULL,
  magnitude REAL            NOT NULL,
  depth     REAL            NOT NULL,
  epicenter GEOMETRY(POINT) NOT NULL,
  CONSTRAINT earthquakes_pk     PRIMARY KEY (id),
  CONSTRAINT earthquakes_id_fk  FOREIGN KEY (id) REFERENCES disasters(id)
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS volcanic_eruptions CASCADE;
CREATE TABLE volcanic_eruptions (
  id      INTEGER         NOT NULL,
  crater  GEOMETRY(POINT) NOT NULL,
  CONSTRAINT volcanic_eruptions_pk    PRIMARY KEY (id),
  CONSTRAINT volcanic_eruptions_id_fk FOREIGN KEY (id) REFERENCES disasters(id)
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS tsunamis CASCADE;
CREATE TABLE tsunamis (
  id              INTEGER               NOT NULL,
  max_wave_height INTEGER               NOT NULL,
  coast_line      GEOMETRY(LINESTRING)  NOT NULL,
  CONSTRAINT tsunamis_pk    PRIMARY KEY (id),
  CONSTRAINT tsunamis_id_fk FOREIGN KEY (id) REFERENCES disasters(id)
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS inundations CASCADE;
CREATE TABLE inundations (
  id        INTEGER           NOT NULL,
  max_depth DOUBLE PRECISION  NOT NULL,
  CONSTRAINT inundations_pk     PRIMARY KEY (id),
  CONSTRAINT inundations_id_fk  FOREIGN KEY (id) REFERENCES disasters(id)
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS storms CASCADE;
CREATE TABLE storms (
  id              INTEGER               NOT NULL,
  max_wind_speed  DOUBLE PRECISION      NOT NULL,
  path            GEOMETRY(LINESTRING)  NOT NULL,
  CONSTRAINT storms_pk    PRIMARY KEY (id),
  CONSTRAINT storms_id_fk FOREIGN KEY (id) REFERENCES disasters(id)
);

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id        INTEGER       NOT NULL,
  full_name VARCHAR(200)  NOT NULL,
  phone     VARCHAR(50)   NOT NULL,
  type      user_type     NOT NULL,
  CONSTRAINT users_pk PRIMARY KEY (id)
);

DROP TABLE IF EXISTS citizens CASCADE;
CREATE TABLE citizens (
  id          INTEGER     NOT NULL,
  citizen_id  VARCHAR(50) NOT NULL,
  CONSTRAINT citizens_pk    PRIMARY KEY (id),
  CONSTRAINT citizens_id_fk FOREIGN KEY (id) REFERENCES users(id)
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS target_sites CASCADE;
CREATE TABLE target_sites (
  id            INTEGER                       NOT NULL,
  status        target_site_status            NOT NULL,
  priority      INTEGER                       NOT NULL,
  last_updated  TIMESTAMP                     NOT NULL  DEFAULT NOW(),
  created_by    INTEGER                       NOT NULL,
  assigned_to   INTEGER                       NULL,
  geo           GEOMETRY(GEOMETRYCOLLECTION)  NOT NULL,
  CONSTRAINT target_sites_pk              PRIMARY KEY (id),
  CONSTRAINT target_sites_created_by_fk   FOREIGN KEY (created_by)
    REFERENCES users(id)
    ON DELETE CASCADE,
  CONSTRAINT target_sites_assigned_to_fk  FOREIGN KEY (assigned_to)
    REFERENCES users(id)
    ON DELETE CASCADE,
  CONSTRAINT target_sites_priority_value  CHECK (priority BETWEEN 1 AND 3)
);

DROP TABLE IF EXISTS messages_sites CASCADE;
CREATE TABLE messages_sites (
  message     INTEGER NOT NULL,
  target_site INTEGER NOT NULL,
  CONSTRAINT messages_sites_pk              PRIMARY KEY (message, target_site),
  CONSTRAINT messages_sites_message_fk      FOREIGN KEY (message)
    REFERENCES social_media_messages(id)
    ON DELETE CASCADE,
  CONSTRAINT messages_sites_target_site_fk  FOREIGN KEY (target_site)
    REFERENCES target_sites(id)
    ON DELETE CASCADE
);

DROP TABLE IF EXISTS site_disasters CASCADE;
CREATE TABLE site_disasters (
  target_site INTEGER NOT NULL,
  disaster    INTEGER NOT NULL,
  CONSTRAINT site_disasters_pk              PRIMARY KEY (target_site, disaster),
  CONSTRAINT site_disasters_target_site_fk  FOREIGN KEY (target_site)
    REFERENCES target_sites(id)
    ON DELETE CASCADE,
  CONSTRAINT site_disasters_disaster_fk     FOREIGN KEY (disaster)
    REFERENCES disasters(id)
    ON DELETE CASCADE
);
