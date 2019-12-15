-- Data for table social_medias
TRUNCATE social_medias CASCADE;
INSERT INTO social_medias (id, name) VALUES
  (1, 'Facebook'),
  (2, 'Twitter'),
  (3, 'Instagram'),
  (4, 'Tumblr');

-- Data for table social_media_messages
TRUNCATE social_media_messages CASCADE;
INSERT INTO social_media_messages (id, message, published_by, published_datetime, social_media, geo) VALUES
  (1, 'The wall of my house is cracked!!', 'somchai123', TIMESTAMP '2019-12-12 18:23:15', 1, ST_GeomFromText('POINT(99.35334664941854 20.00599665692158)')),
  (2, 'Roof is collapsed!!! My dog is in the house! HELP!!!', 'tawatchai', TIMESTAMP '2019-12-12 18:33:21', 2, ST_GeomFromText('POINT(99.34756749424889 20.004682759949375)'));

-- Data for table disasters
TRUNCATE disasters CASCADE;
INSERT INTO disasters (id, severity, active, incident_datetime, type, geo) VALUES
  (1, 3, FALSE, TIMESTAMP '2019-12-12 16:02:38', 'earthquake',
    ST_GeomFromText('POLYGON((99.34179938596503 19.991386987794268,99.34935248655097 20.00816314032623,99.3617121056916 20.0057436132844,99.37338507932441 19.990741715459485,99.37166846555488 19.98122364147655,99.34694922727363 19.9771903858429,99.3371645287873 19.98315956751491,99.34179938596503 19.991386987794268))'));

-- Data for table earthquakes
TRUNCATE earthquakes CASCADE;
INSERT INTO earthquakes (id, magnitude, depth, epicenter) VALUES
  (1, 4.6, 4000, ST_GeomFromText('POINT(99.349365234375 19.973348786110602)'));

-- Data for table volcanic_eruptions
TRUNCATE volcanic_eruptions CASCADE;

-- Data for table tsunamis
TRUNCATE tsunamis CASCADE;

-- Data for table inundations
TRUNCATE inundations CASCADE;

-- Data for table storms
TRUNCATE storms CASCADE;

-- Data for table users
TRUNCATE users CASCADE;
INSERT INTO users (id, full_name, phone, type) VALUES
  (1, 'Somchai', '73852014', 'citizen');

-- Data for table citizens
TRUNCATE citizens CASCADE;
INSERT INTO citizen (id, citizen_id) VALUES
  (1, '6849285013859');

-- Data for table target_sites
TRUNCATE target_sites CASCADE;

-- Data for table messages_sites
TRUNCATE messages_sites CASCADE;

-- Data for table site_disasters
TRUNCATE site_disasters CASCADE;
