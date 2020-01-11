-- Data for table social_medias
TRUNCATE social_medias CASCADE;
INSERT INTO social_medias (id, name) VALUES
  (1, 'Facebook'),
  (2, 'Twitter'),
  (3, 'Instagram'),
  (4, 'Tumblr');

-- Data for table disasters
TRUNCATE disasters CASCADE;
INSERT INTO disasters (id, severity, active, incident_datetime, type, geo) VALUES
  (1, 3, TRUE, TIMESTAMP '2019-12-12 16:02:38', 'earthquake',
    ST_GeomFromText('POLYGON((98.37081737590597 19.690822057229134,98.43673534465597 20.680713708483015,99.62325878215597 21.204000768511825,101.09542675090597 21.06053575274361,101.42501659465597 20.186553855763414,101.19430370403097 19.068995908434868,100.02975292278097 18.517766285341825,98.37081737590597 18.94434760982433,98.37081737590597 19.690822057229134))', 4326)),
  (2, 5, TRUE, TIMESTAMP '2019-12-14 04:23:10', 'tsunami',
    ST_GeomFromText('POLYGON((98.23267235348521 7.903323077499917,98.1521631676942 8.892346592723344,98.31335320065318 9.011724104566584,98.48827614376842 9.022574657846834,98.47643150875865 8.696917835832956,98.43797936032115 7.755710072774676,98.23267235348521 7.755710072774676,98.23267235348521 7.903323077499917))', 4326)),
  (3, 3, TRUE, TIMESTAMP '2019-12-16 01:32:38', 'inundation',
    ST_GeomFromText('POLYGON((103.15507598019735 16.92980683158297,103.2731790075411 17.019122341816423,103.44072051144735 16.9192963331173,103.54509062863485 16.916668616842063,103.4929055700411 16.819417389595106,103.63298125363485 16.827304487504758,103.64396758175985 16.751048807286047,103.5917825231661 16.695810092946562,103.5478372106661 16.71422477534455,103.51762480832235 16.643186938250167,103.4544534216036 16.564225121504304,103.3500833044161 16.585284777676716,103.19352812863485 16.564225121504304,103.21000762082235 16.66160668836929,103.36381621457235 16.651081333752582,103.40776152707235 16.70896361877166,103.38578887082235 16.793124693595402,103.3500833044161 16.86936346100235,103.2566995153536 16.887761319787593,103.15507598019735 16.92980683158297))', 4326));

-- Data for table earthquakes
TRUNCATE earthquakes CASCADE;
INSERT INTO earthquakes (id, magnitude, depth, epicenter) VALUES
  (1, 4.6, 4000, ST_GeomFromText('POINT(99.349365234375 19.973348786110602)', 4326));

-- Data for table volcanic_eruptions
TRUNCATE volcanic_eruptions CASCADE;

-- Data for table tsunamis
TRUNCATE tsunamis CASCADE;
INSERT INTO tsunamis (id, max_wave_height, coast_line) VALUES
  (2, 5.2,
    ST_GeomFromText('LINESTRING(98.29311486658025 7.901894707557416,98.28693505700994 7.8855713670057686,98.27800866540838 7.8855713670057686,98.26496240075994 7.8916926952670945,98.2629024642365 7.8855713670057686,98.26496240075994 7.879449948162856,98.27251550134588 7.879449948162856,98.27320214685369 7.872648265516414,98.28006860193182 7.862445532231456,98.28556176599432 7.862445532231456,98.29105493005682 7.849521709935449,98.29448815759588 7.832516068382787,98.290368284549 7.825033366043346,98.29860803064275 7.822992605728061,98.29860803064275 7.814149195658619,98.29792138513494 7.8046253137914166,98.29448815759588 7.795101214932831,98.28693505700994 7.7889784654877054,98.290368284549 7.784216265150532,98.28830834802557 7.777413027956324,98.29517480310369 7.774011367978302,98.30478784021307 7.7767326981670095,98.30616113122869 7.767888310545359,98.30410119470525 7.759724095125904,98.312340940799 7.7570026547496775)', 4326));

-- Data for table inundations
TRUNCATE inundations CASCADE;
INSERT INTO inundations (id, max_depth) VALUES
  (3, 5);

-- Data for table storms
TRUNCATE storms CASCADE;

-- Data for table users
TRUNCATE users CASCADE;
INSERT INTO users (id, full_name, phone, type) VALUES
  (1, 'Somchai', '73852014', 'citizen'),
  (2, 'Chiang Rai Rescue Team', '3522', 'organisation'),
  (3, 'Emergency Call', '1669', 'call_center'),
  (4, 'Local Electric Distrubution Center', '12234123', 'organisation'),
  (5, 'Aroi', '2143543', 'citizen'),
  (6, 'Pa Tong Rescue Team', '123512', 'organisation'),
  (7, 'National Rescue Organisation', '23456464', 'organisation'),
  (8, 'Local Rescue Organisation of Lamphun', '6235342342', 'organisation');

-- Data for table citizens
TRUNCATE citizens CASCADE;
INSERT INTO citizens (id, citizen_id) VALUES
  (1, '6849285013859'),
  (5, '3245643564324');

-- Data for table target_sites
TRUNCATE target_sites CASCADE;
INSERT INTO target_sites (id, status, priority, last_updated, created_by, disaster, geo) VALUES
  (1, 'waiting', 2, TIMESTAMP '2019-12-12 18:24:00', 1, 1,
    ST_GeomFromText('POLYGON((99.35329468161888 20.006039502967614,99.35343549759216 20.006039502967614,99.35343549759216 20.005949400239643,99.35329468161888 20.005949400239643,99.35329468161888 20.006039502967614))', 4326)),
  (2, 'in_progress', 3, TIMESTAMP '2019-12-12 18:30:00', 3, 1,
    ST_GeomFromText('POLYGON((99.34742625958052 20.004517649022016,99.34742491847601 20.004460940469045,99.34734042889204 20.00445968027874,99.34734847551908 20.004547893575253,99.34741553074446 20.00457309736517,99.34742625958052 20.004517649022016))', 4326)),
  (3, 'waiting', 3, TIMESTAMP '2019-12-12 19:00:00', 4, 1,
    ST_GeomFromText('POLYGON((99.30229596539266 20.03690514438413,99.40941266461141 20.03690514438413,99.40941266461141 19.967543290287697,99.30229596539266 19.967543290287697,99.30229596539266 20.03690514438413))', 4326)),
  (4, 'pending', 1, TIMESTAMP '2019-12-12 17:35:21', 5, 1,
    ST_GeomFromText('POLYGON((99.35585431500203 20.01142224831279,99.36237744732625 20.01142224831279,99.36237744732625 20.005938047203717,99.35585431500203 20.005938047203717,99.35585431500203 20.01142224831279))', 4326)),
  (5, 'waiting', 2, TIMESTAMP '2019-12-14 06:00:00', 3, 2,
    ST_GeomFromText('POLYGON((98.28864814612973 7.908263114335121,98.31233741614926 7.908263114335121,98.31233741614926 7.879357204386421,98.28864814612973 7.879357204386421,98.28864814612973 7.908263114335121))', 4326)),
  (6, 'pending', 3, TIMESTAMP '2019-12-16 08:24:21', 7, 3,
    ST_GeomFromText('
      POLYGON((103.41874785519735 16.71290949979957,103.43934722043173 16.69975624582873,103.4214944372286 16.682655661350694,103.39540190793173 16.70107161200442,103.41874785519735 16.71290949979957))
    ', 4326)),
  (7, 'in_progress', 3, TIMESTAMP '2019-12-14 06:53:21', 3, 2,
    ST_GeomFromText('LINESTRING(98.34025075079819 8.92714962394911,98.24137379767319 8.796887546088891,98.24137379767319 8.612271279010505,98.28531911017319 8.481899532875408)', 4326));

-- Data for table social_media_messages
TRUNCATE social_media_messages CASCADE;
INSERT INTO social_media_messages (id, message, published_by, published_datetime, social_media, target_site, geo) VALUES
  (1, 'The wall of my house is cracked!!', 'somchai123', TIMESTAMP '2019-12-12 18:23:15', 1, 1, ST_GeomFromText('POINT(99.35334664941854 20.00599665692158)', 4326)),
  (2, 'Roof is collapsed!!! My dog is in the house! HELP!!!', 'tawatchai', TIMESTAMP '2019-12-12 18:33:21', 2, 5, ST_GeomFromText('POINT(99.34756749424889 20.004682759949375)', 4326)),
  (3, 'Black out!!! No electric!!!!!', 'ghargsd', TIMESTAMP '2019-12-12 17:30:00', 2, 2, ST_GeomFromText('POINT(99.3321650449825 20.02690601936971)', 4326)),
  (4, 'Please fix the electricity before it gets dark', 'pleaseplease', TIMESTAMP '2019-12-12 17:32:23', 2, 3, ST_GeomFromText('POINT(99.35207776470907 20.021744931753915)', 4326));
INSERT INTO social_media_messages (id, message, published_by, published_datetime, social_media, target_site, geo) VALUES
  (101, 'Earthquake !! I see people trapped in the house!!', '@cnnJournalist', TIMESTAMP '2019-10-05 12:20:05', 2, 4, ST_GeomFromText('POINT(102.4263821 17.2144061)', 4326)),
  (102, 'Earthquake !! We are many people taking shelter in school here we need drinking water!!', 'Apinya WeeraanduBisista', TIMESTAMP '2019-10-05 12:22:05', 1, 1, ST_GeomFromText('POINT(99.8585839 19.9511766)', 4326)),
  (103, 'This bridge is collapsed by the flood, vehicles cannot pass it', 'Paithoon', TIMESTAMP '2019-11-10 16:35:05', 1, 6, ST_GeomFromText('POINT(102.543 13.543)', 4326)),
  (104, 'Tsunami just took away this house', 'John', TIMESTAMP '2019-09-02 12:20:05', 3, 7, ST_GeomFromText('POINT(100 8)', 4326));
INSERT INTO social_media_messages (id, message, published_by, published_datetime, social_media, target_site, geo) VALUES
  (201, 'Flood !! The village is inundated!!', 'sagar111', TIMESTAMP '2019-11-15 13:20:05', 2, 6, ST_GeomFromText('POINT(102.4386558884521 17.208728495144474)', 4326)),
  (202, 'The earth is crumbling !! crisis situation here!!', 'Deepak Sahil', TIMESTAMP '2012-12-15 07:22:05', 4, 2, ST_GeomFromText('POINT(99.8585739 19.9611766)', 4326)),
  (203, 'I am trapped in my house. The earth is crumbling', 'Samurai', TIMESTAMP '2019-11-10 16:35:05', 1, 3, ST_GeomFromText('POINT(102.643 13.773)', 4326)),
  (204, 'Earthquake is killing me', 'Ponpisit', TIMESTAMP '2019-10-12 12:30:15', 2, 4, ST_GeomFromText('POINT(100.212 9.217)', 4326));
INSERT INTO social_media_messages (id, message, published_by, published_datetime, social_media, geo) VALUES
  (205, 'Help!! My neighborhood is under water', 'deepak123', TIMESTAMP '2019-11-20 23:20:05', 3, ST_GeomFromText('POINT(102.4397558884521 17.118728495144474)', 4326)),
  (206, 'O My God!!Tsunami is approaching towards us. Save us!!!', 'Haris', TIMESTAMP '2012-12-17 17:22:05', 1, ST_GeomFromText('POINT(100.3355 7.9046)', 4326)),
  (207, 'Another one. This is not ending. Eq after eq. God Save us pls', 'Ponlawat Niraula', TIMESTAMP '2019-11-11 13:35:05', 4, ST_GeomFromText('POINT(98.884466 18.442255)', 4326)),
  (208, 'I am trapped inside. Anybody pls save me #earthquake', 'Poshan Weerapanpisit', TIMESTAMP '2019-10-13 08:30:15', 3, ST_GeomFromText('POINT(95.25124 15.332214)', 4326)),
  (209, 'The fence is cracking!!', 'ramprasad', TIMESTAMP '2019-12-14 11:23:15', 2, ST_GeomFromText('POINT(95.35334664941854 21.00599665692158)', 4326)),
  (210, 'The roof is collapsing!!! My grandma is inside! HELP!!!', 'sonchyang', TIMESTAMP '2019-12-14 16:33:21', 1, ST_GeomFromText('POINT(98.34756749424889 19.004682759949375)', 4326)),
  (211, 'A complete Black out!!! No electric!! Pls get it foxed!!!', 'ramhari', TIMESTAMP '2019-12-14 17:30:00', 4, ST_GeomFromText('POINT(93.3321650449825 18.02690601936971)', 4326)),
  (212, 'Pls get me outta here before it gets dark. M trapped', 'ponwat', TIMESTAMP '2019-12-14 17:55:23', 1, ST_GeomFromText('POINT(93.35207776470907 18.021744931753915)', 4326)),
  (213, 'The shocks are still there. O god, never ends!!Pls help', 'prasit', TIMESTAMP '2019-12-15 14:20:05', 3, ST_GeomFromText('POINT(100.4263821 16.2144061)', 4326)),
  (214, 'Earthquake !! We need food urgently!!', 'panpisit', TIMESTAMP '2019-12-14 18:22:05', 4, ST_GeomFromText('POINT(90.8585839 19.9511766)', 4326)),
  (215, 'Everything is wrecking. The village is flown away', 'sadoon', TIMESTAMP '2019-11-11 17:35:05', 2, ST_GeomFromText('POINT(102.6653 13.4533)', 4326)),
  (216, 'A huge Tsunami approaching. God save us', 'Dan', TIMESTAMP '2019-09-03 13:20:05', 1, ST_GeomFromText('POINT(101.0022114 8.7644912)', 4326)),
  (217, 'The city is drowning!!Emergency situation here', 'daniel', TIMESTAMP '2019-11-16 15:20:05', 1, ST_GeomFromText('POINT(103.4386558884521 17.208728495144474)', 4326)),
  (218, 'The house is devastated!!I can see people inside', 'simran', TIMESTAMP '2012-12-14 17:22:05', 1, ST_GeomFromText('POINT(90.8585739 15.9611766)', 4326)),
  (219, 'I am suffocating inside the house.pls rescue me outta this', 'ramaram', TIMESTAMP '2019-11-12 14:35:05', 2, ST_GeomFromText('POINT(102.41223 14.773)', 4326)),
  (220, 'Another one. Huge tremor. Pls help me', 'weelawat', TIMESTAMP '2019-10-11 11:30:15', 3, ST_GeomFromText('POINT(102.212 10.217)', 4326)),
  (221, 'The village is under water.Crisis here', 'rasmita123', TIMESTAMP '2019-11-21 13:20:05', 2, ST_GeomFromText('POINT(103.4397558884521 16.118728495144474)', 4326)),
  (222, 'Plss rescue us immediately!!! #Tsunami', 'sudeep', TIMESTAMP '2012-12-16 16:22:05', 4, ST_GeomFromText('POINT(102.3355 9.9046)', 4326)),
  (223, 'O no not again. This is never ending. #Earthquake #Tremors', 'Weeraposhan', TIMESTAMP '2019-11-12 23:35:05', 2, ST_GeomFromText('POINT(97.884466 19.442255)', 4326)),
  (224, 'Help me please. I am inside the house. #Earthquake', 'ponlashan', TIMESTAMP '2019-10-12 18:30:15', 1, ST_GeomFromText('POINT(96.25124 16.332214)', 4326)),
  (225, 'Its wrecking.Somebody is trapped there!!Help', 'weerashan', TIMESTAMP '2019-12-13 12:23:15', 3, ST_GeomFromText('POINT(97.35334664941854 21.00599665692158)', 4326)),
  (226, 'Everything is collapsing!!! People in trouble there! HELP!!!', 'samyang', TIMESTAMP '2019-12-13 10:33:21', 2, ST_GeomFromText('POINT(95.34756749424889 19.004682759949375)', 4326)),
  (227, 'The village is completely black and its chaos situation there!!!', 'samriddhi', TIMESTAMP '2019-12-13 11:30:00', 2, ST_GeomFromText('POINT(95.3321650449825 18.02690601936971)', 4326)),
  (228, 'Pls get him outta here before it gets dark. he is trapped', 'weepisit', TIMESTAMP '2019-12-13 11:55:23', 3, ST_GeomFromText('POINT(91.35207776470907 18.021744931753915)', 4326)),
  (229, 'Still trembling. help us pls', 'panwat niraula', TIMESTAMP '2019-12-14 15:20:05', 2, ST_GeomFromText('POINT(102.4263821 17.2144061)', 4326)),
  (230, 'Rescue and relief materials required here #earthquake!!', 'weeshan poraula', TIMESTAMP '2019-12-13 17:22:05', 4, ST_GeomFromText('POINT(92.8585839 20.9511766)', 4326)),
  (231, 'Water water everywhere. Save the village', 'jamim', TIMESTAMP '2019-11-12 11:35:05', 1, ST_GeomFromText('POINT(99.6653 11.4533)', 4326)),
  (232, 'Save the county from tsunami. crisis there', 'nameet', TIMESTAMP '2019-09-04 15:20:05', 2, ST_GeomFromText('POINT(102.0022114 7.7644912)', 4326)),
  (233, 'Water is everywhere. It;s flooding!!', 'rosy', TIMESTAMP '2019-11-16 13:20:05', 3, ST_GeomFromText('POINT(100.4386558884521 17.208728495144474)', 4326)),
  (234, 'A huge earthquake here!!help us', 'Sahil', TIMESTAMP '2012-12-20 17:22:05', 4, ST_GeomFromText('POINT(95.8585739 19.9611766)', 4326)),
  (235, 'Somebody is trapped inside the house. The earth is crumbling', 'samba', TIMESTAMP '2019-11-15 17:35:05', 1, ST_GeomFromText('POINT(101.643 13.773)', 4326)),
  (236, 'People are dying. Emergency here', 'rakesh', TIMESTAMP '2019-10-13 22:30:15', 3, ST_GeomFromText('POINT(99.212 9.217)', 4326)),
  (237, 'Flood is approaching. Somebody pls help', 'samyam', TIMESTAMP '2019-11-20 23:20:05', 2, ST_GeomFromText('POINT(100.4397558884521 17.118728495144474)', 4326)),
  (238, 'Everything will be blown away by tsunami in no time!!Save pls!', 'huawei@123', TIMESTAMP '2012-12-15 14:22:05', 4, ST_GeomFromText('POINT(102.3355 7.9046)', 4326)),
  (239, 'Never ending tremors. save us please', 'Niraula@234', TIMESTAMP '2019-11-14 23:35:05', 4, ST_GeomFromText('POINT(98.884466 20.442255)', 4326)),
  (240, 'Please save the people inside the houses #earthquake', 'Eerapanpisit', TIMESTAMP '2019-10-12 18:30:15', 3, ST_GeomFromText('POINT(95.25124 17.332214)', 4326)),
  (241, 'When will the wlectricity resume. Pls make it fast!!!', 'huawei', TIMESTAMP '2019-12-15 16:30:00', 1, ST_GeomFromText('POINT(92.3321650449825 17.02690601936971)', 4326)),
  (242, 'Pls get us outta here before it gets dark. M trapped', 'apple@123', TIMESTAMP '2019-12-15 17:55:23', 4, ST_GeomFromText('POINT(92.35207776470907 16.021744931753915)', 4326)),
  (243, 'Still trembling. O god, it never ends!!Pls help', 'samsung', TIMESTAMP '2019-12-17 18:20:05', 2, ST_GeomFromText('POINT(99.4263821 17.2144061)', 4326)),
  (244, 'We need open space!!This place is so congested to escape earthquake', 'sony', TIMESTAMP '2019-12-18 20:22:05', 1, ST_GeomFromText('POINT(91.8585839 20.9511766)', 4326)),
  (245, 'Everything is flowing with water. Save pls', 'philips', TIMESTAMP '2019-11-18 14:35:05', 3, ST_GeomFromText('POINT(101.6653 13.4533)', 4326)),
  (246, 'A huge Tsunami has just impacted the village. God save us', 'michael', TIMESTAMP '2019-09-03 11:20:05', 1, ST_GeomFromText('POINT(101.0022114 7.7644912)', 4326)),
  (247, 'Everything is drowning!!Emergency situation here', 'chris', TIMESTAMP '2019-11-14 15:20:05', 4, ST_GeomFromText('POINT(102.4386558884521 17.208728495144474)', 4326)),
  (248, 'Everything is devastated!!I can see people inside', 'sweet@123', TIMESTAMP '2012-12-14 15:22:05', 2, ST_GeomFromText('POINT(91.8585739 15.9611766)', 4326)),
  (249, 'We are suffocating inside the house.pls rescue us outta this', 'seeta', TIMESTAMP '2019-11-12 12:35:05', 3, ST_GeomFromText('POINT(100.41223 14.773)', 4326)),
  (250, 'Another one. Huge tremor. Pls help us', 'deepa', TIMESTAMP '2019-10-11 21:30:15', 3, ST_GeomFromText('POINT(102.212 12.217)', 4326)),
  (251, 'The whole county is under water. Crisis here', 'ramila', TIMESTAMP '2019-11-21 23:20:05', 2, ST_GeomFromText('POINT(103.4397558884521 18.118728495144474)', 4326)),
  (252, 'Plss rescue and relief materials here urgently!!! #Tsunami', 'aabha', TIMESTAMP '2012-12-16 20:22:05', 1, ST_GeomFromText('POINT(102.3355 10.9046)', 4326)),
  (253, 'This is never ending. #Earthquake #Tremors', 'jibika', TIMESTAMP '2019-11-12 13:35:05', 2, ST_GeomFromText('POINT(99.884466 19.442255)', 4326)),
  (254, 'Help us please. We are inside the house. #Earthquake', 'jeewan', TIMESTAMP '2019-10-13 18:30:15', 4, ST_GeomFromText('POINT(96.25124 14.332214)', 4326)),
  (255, 'Everything is wrecking.Somebody is trapped there!!Help', 'martin', TIMESTAMP '2019-12-14 11:23:15', 3, ST_GeomFromText('POINT(95.35334664941854 21.00599665692158)', 4326)),
  (256, 'The houses are collapsing!!! People in trouble there! HELP!!!', 'sonam', TIMESTAMP '2019-12-15 12:33:21', 2, ST_GeomFromText('POINT(96.34756749424889 19.004682759949375)', 4326)),
  (257, 'The county is completely black and its chaos situation there!!!', 'ritikrai', TIMESTAMP '2019-12-16 12:30:00', 3, ST_GeomFromText('POINT(94.3321650449825 18.02690601936971)', 4326)),
  (258, 'Pls get them outta here before it gets dark. they are trapped', 'cnn121', TIMESTAMP '2019-12-22 15:55:23', 3, ST_GeomFromText('POINT(92.35207776470907 18.021744931753915)', 4326)),
  (259, 'Still trembling. help us pls before we die', 'prakash niraula', TIMESTAMP '2019-12-21 14:20:05', 3, ST_GeomFromText('POINT(102.4263821 15.2144061)', 4326)),
  (260, 'Urgent Rescue and relief materials required here #earthquake!!', 'deepak poraula', TIMESTAMP '2019-12-25 15:22:05', 4, ST_GeomFromText('POINT(93.8585839 20.9511766)', 4326)),
  (261, 'The village is drowning. Save the village', 'ramesh', TIMESTAMP '2019-10-12 10:35:05', 2, ST_GeomFromText('POINT(99.6653 14.4533)', 4326)),
  (262, 'Save the village from tsunami. crisis there', 'harry', TIMESTAMP '2019-09-05 16:20:05', 1, ST_GeomFromText('POINT(100.0022114 7.7644912)', 4326)),
  (263, 'Everything is cracking and breaking.Safety pls!!', 'nokia', TIMESTAMP '2019-12-11 12:23:15', 3, ST_GeomFromText('POINT(96.35334664941854 22.00599665692158)', 4326)),
  (264, 'Everything is collapsing!!! My frineds are inside! HELP!!!', 'oppo', TIMESTAMP '2019-12-15 15:33:21', 1, ST_GeomFromText('POINT(97.34756749424889 20.004682759949375)', 4326)),
  (265, 'Help help!! My neighborhood is under water', 'radhe', TIMESTAMP '2019-11-25 23:20:05', 2, ST_GeomFromText('POINT(102.4397558884521 19.118728495144474)', 4326)),
  (266, 'Tsunami is approaching towards us. Save us!!!', 'rate', TIMESTAMP '2019-12-25 17:22:05', 4, ST_GeomFromText('POINT(99.3355 7.9046)', 4326)),
  (267, 'Eq in tandem. This is not ending. Eq after eq. God Save us pls', 'kaila Niraula', TIMESTAMP '2019-11-15 13:35:05', 3, ST_GeomFromText('POINT(97.884466 17.442255)', 4326)),
  (268, 'I am trapped. Somebody pls save me #earthquake', 'shaila Weerapanpisit', TIMESTAMP '2019-10-20 08:30:15', 2, ST_GeomFromText('POINT(95.25124 17.332214)', 4326)),
  (269, 'Everything is cracking!!', 'chame', TIMESTAMP '2019-12-29 12:23:15', 1, ST_GeomFromText('POINT(95.35334664941854 20.00599665692158)', 4326)),
  (270, 'Everything is collapsing!!! People are inside! Help them rescue them!!!', 'manange', TIMESTAMP '2019-12-30 17:33:21', 4, ST_GeomFromText('POINT(96.34756749424889 19.004682759949375)', 4326)),
  (271, 'Black out and hell here!!! No electric!! Pls get it foxed!!!', 'chakre', TIMESTAMP '2019-12-24 15:30:00', 3, ST_GeomFromText('POINT(95.3321650449825 18.02690601936971)', 4326)),
  (272, 'Pls get us outta here before it gets dark. trapped', 'milan', TIMESTAMP '2019-12-26 17:55:23', 4, ST_GeomFromText('POINT(95.35207776470907 18.021744931753915)', 4326)),
  (273, 'Still shaking. O god, never ends!!Pls help', 'bichhod', TIMESTAMP '2019-12-25 14:20:05', 2, ST_GeomFromText('POINT(99.4263821 16.2144061)', 4326)),
  (274, 'Earthquake !! We need rescue urgently!!', 'dhoju', TIMESTAMP '2019-12-27 18:22:05', 3, ST_GeomFromText('POINT(90.8585839 20.9511766)', 4326)),
  (275, 'O god, this is wrecking. The village is flown away', 'santosh', TIMESTAMP '2019-11-14 17:35:05', 1, ST_GeomFromText('POINT(100.6653 13.4533)', 4326)),
  (276, 'A huge Tsunami is approaching in no time. God save us', 'bharat', TIMESTAMP '2019-09-05 13:20:05', 1, ST_GeomFromText('POINT(99.0022114 8.7644912)', 4326)),
  (277, 'Everything is drowning!!Emergency situation here', 'preety', TIMESTAMP '2019-09-16 15:20:05', 4, ST_GeomFromText('POINT(100.4386558884521 17.208728495144474)', 4326)),
  (278, 'Everything is devastated!!I can see people inside', 'subina', TIMESTAMP '2012-11-14 17:22:05', 4, ST_GeomFromText('POINT(95.8585739 15.9611766)', 4326)),
  (279, 'I cant breathe inside the house.pls rescue me outta this', 'nilisha', TIMESTAMP '2019-09-12 14:35:05', 2, ST_GeomFromText('POINT(99.41223 14.773)', 4326)),
  (280, 'Another and another. On and on . Huge tremor. Pls help me', 'nitisha', TIMESTAMP '2019-09-11 11:30:15', 2, ST_GeomFromText('POINT(99.212 10.217)', 4326)),
  (281, 'Everything is under water.Crisis here', 'asmita', TIMESTAMP '2019-11-25 13:20:05', 1, ST_GeomFromText('POINT(101.4397558884521 16.118728495144474)', 4326)),
  (282, 'Plss come to rescue us immediately!!! #Tsunami', 'sushmita', TIMESTAMP '2012-12-29 16:22:05', 3, ST_GeomFromText('POINT(101.3355 8.9046)', 4326)),
  (283, 'Not again. This is never ending. #Earthquake #Tremors', 'ritika', TIMESTAMP '2019-12-22 23:35:05', 1, ST_GeomFromText('POINT(98.884466 20.442255)', 4326)),
  (284, 'Please Help me please. I am inside the house. #Earthquake', 'bipin', TIMESTAMP '2019-10-15 18:30:15', 4, ST_GeomFromText('POINT(97.25124 17.332214)', 4326)),
  (285, 'Everything wrecking.Somebody is trapped there!!Help', 'suwani', TIMESTAMP '2019-12-28 12:23:15', 2, ST_GeomFromText('POINT(98.35334664941854 20.00599665692158)', 4326)),
  (286, 'It is collapsing!!! People in trouble there! HELP!!!', 'samikshya', TIMESTAMP '2019-12-23 10:33:21', 1, ST_GeomFromText('POINT(96.34756749424889 18.004682759949375)', 4326)),
  (287, 'The village is completely black and its chaos situation there!!!', 'keny', TIMESTAMP '2019-12-27 11:30:00', 1, ST_GeomFromText('POINT(96.3321650449825 17.02690601936971)', 4326)),
  (288, 'Pls get them outta here before it gets dark. they are trapped', 'warsha', TIMESTAMP '2019-12-28 11:55:23', 2, ST_GeomFromText('POINT(92.35207776470907 16.021744931753915)', 4326)),
  (289, 'O no, Still trembling and trembling. help us pls', 'chandika niraula', TIMESTAMP '2019-12-28 15:20:05', 1, ST_GeomFromText('POINT(100.4263821 16.2144061)', 4326)),
  (290, 'Pls, Rescue and relief materials required here #earthquake!!', 'chandani poraula', TIMESTAMP '2019-12-25 17:22:05', 3, ST_GeomFromText('POINT(94.8585839 21.9511766)', 4326)),
  (291, 'O god, Water water everywhere. Save the village', 'jasmine', TIMESTAMP '2019-11-24 11:35:05', 4, ST_GeomFromText('POINT(98.6653 12.4533)', 4326)),
  (292, 'O My God, Save the county from tsunami. crisis there', 'pinky', TIMESTAMP '2019-09-01 15:20:05', 1, ST_GeomFromText('POINT(100.0022114 7.7644912)', 4326)),
  (293, 'Its a complete chaos. Water is everywhere. Its flooding!!', 'daisy', TIMESTAMP '2019-11-10 13:20:05', 2, ST_GeomFromText('POINT(102.4386558884521 17.208728495144474)', 4326)),
  (294, 'This is shaking. A huge earthquake here!!help us', 'jahil', TIMESTAMP '2012-12-27 17:22:05', 3, ST_GeomFromText('POINT(96.8585739 19.9611766)', 4326)),
  (295, 'Many people are trapped inside the house. The earth is crumbling', 'samina', TIMESTAMP '2019-11-05 17:35:05', 4, ST_GeomFromText('POINT(100.2243 12.773)', 4326)),
  (296, 'They are dying. Emergency here', 'pradeep', TIMESTAMP '2019-10-11 22:30:15', 3, ST_GeomFromText('POINT(99.212 7.217)', 4326)),
  (297, 'It is approaching and will reach in no time. Somebody pls help #Flood', 'dipson', TIMESTAMP '2019-11-24 23:20:05', 1, ST_GeomFromText('POINT(99.4397558884521 17.118728495144474)', 4326)),
  (298, 'O god, Everything will be blown away by tsunami in no time!!Save pls!', 'rate@123', TIMESTAMP '2012-12-25 14:22:05', 4, ST_GeomFromText('POINT(100.3355 7.9046)', 4326)),
  (299, 'When will this end. Never ending tremors. save us please', 'late@234', TIMESTAMP '2019-11-24 23:35:05', 3, ST_GeomFromText('POINT(98.884466 22.442255)', 4326)),
  (300, 'For god sake, Save the people inside the houses #earthquake', 'bibeek', TIMESTAMP '2019-10-22 18:30:15', 2, ST_GeomFromText('POINT(93.25124 17.332214)', 4326)),
  (301, 'O man, When will the wlectricity resume. Pls make it fast!!!', 'bipika', TIMESTAMP '2019-12-25 16:30:00', 4, ST_GeomFromText('POINT(91.3321650449825 18.02690601936971)', 4326)),
  (302, 'God, Pls get us outta here before it gets dark. M trapped', 'bipin@123', TIMESTAMP '2019-12-26 17:55:23', 3, ST_GeomFromText('POINT(94.35207776470907 17.021744931753915)', 4326)),
  (303, 'Quake and quake, Still trembling. O god, it never ends!!Pls help', 'bipindra', TIMESTAMP '2019-12-27 18:20:05', 1, ST_GeomFromText('POINT(98.4263821 18.2144061)', 4326)),
  (304, 'Help us. We need open space!!This place is so congested to escape earthquake', 'nabin', TIMESTAMP '2019-12-28 20:22:05', 1, ST_GeomFromText('POINT(92.8585839 22.9511766)', 4326)),
  (305, 'O my god, Everything is flowing with water. Save pls', 'anil', TIMESTAMP '2019-11-28 14:35:05', 2, ST_GeomFromText('POINT(102.6653 15.4533)', 4326)),
  (306, 'This is worst. A huge Tsunami has just impacted the village. God save us', 'sujan', TIMESTAMP '2019-09-05 11:20:05', 4, ST_GeomFromText('POINT(103.0022114 7.7644912)', 4326)),
  (307, 'Worst here. Everything is drowning!!Emergency situation here', 'junge', TIMESTAMP '2019-11-24 15:20:05', 3, ST_GeomFromText('POINT(100.4386558884521 17.208728495144474)', 4326)),
  (308, 'O god, Everything is devastated!!I can see people inside', 'aryam@123', TIMESTAMP '2012-12-24 15:22:05', 2, ST_GeomFromText('POINT(92.8585739 15.9611766)', 4326)),
  (309, 'Chaos here, We are suffocating inside the house.pls rescue us outta this', 'bear', TIMESTAMP '2019-11-02 12:35:05', 2, ST_GeomFromText('POINT(102.41223 14.773)', 4326)),
  (310, 'Again and again, Another one. Huge tremor. Pls help us', 'grylls', TIMESTAMP '2019-10-01 21:30:15', 2, ST_GeomFromText('POINT(100.212 12.217)', 4326)),
  (311, 'Sucks, The whole county is under water. Crisis here', 'steven', TIMESTAMP '2019-11-01 23:20:05', 1, ST_GeomFromText('POINT(100.4397558884521 18.118728495144474)', 4326)),
  (312, 'God, Plss rescue and relief materials here urgently!!! #Tsunami', 'smith', TIMESTAMP '2012-12-26 20:22:05', 4, ST_GeomFromText('POINT(100.3355 10.9046)', 4326)),
  (313, 'Pls end this. This is never ending. #Earthquake #Tremors', 'david', TIMESTAMP '2019-11-02 13:35:05', 1, ST_GeomFromText('POINT(100.884466 19.442255)', 4326)),
  (314, 'God Help us please. We are inside the house. #Earthquake', 'warner', TIMESTAMP '2019-10-10 18:30:15', 3, ST_GeomFromText('POINT(98.25124 14.332214)', 4326)),
  (315, 'O man, Everything is wrecking.Somebody is trapped there!!Help', 'gupta', TIMESTAMP '2019-12-28 11:23:15', 2, ST_GeomFromText('POINT(96.35334664941854 21.00599665692158)', 4326)),
  (316, 'God, The houses are collapsing!!! People in trouble there! HELP!!!', 'hancy', TIMESTAMP '2019-12-26 12:33:21', 1, ST_GeomFromText('POINT(95.34756749424889 19.004682759949375)', 4326)),
  (317, 'O my god, The county is completely black and its chaos situation there!!!', 'hansel', TIMESTAMP '2019-12-26 12:30:00', 2, ST_GeomFromText('POINT(95.3321650449825 18.02690601936971)', 4326)),
  (318, 'Somebody, Pls get them outta here before it gets dark. they are trapped', 'grytal', TIMESTAMP '2019-12-12 15:55:23', 2, ST_GeomFromText('POINT(94.35207776470907 18.021744931753915)', 4326)),
  (319, 'Not again, Still trembling. help us pls before we die', 'rickesh niraula', TIMESTAMP '2019-12-25 14:20:05', 2, ST_GeomFromText('POINT(100.4263821 15.2144061)', 4326)),
  (320, 'Pls, Urgent Rescue and relief materials required here #earthquake!!', 'maharaj poraula', TIMESTAMP '2019-12-22 15:22:05', 3, ST_GeomFromText('POINT(91.8585839 20.9511766)', 4326)),
  (321, 'O my god, The village is drowning. Save the village', 'sarkar', TIMESTAMP '2019-10-02 10:35:05', 1, ST_GeomFromText('POINT(97.6653 14.4533)', 4326)),
  (322, 'Somebody, Save the village from tsunami. crisis there', 'shreepanch', TIMESTAMP '2019-09-09 16:20:05', 4, ST_GeomFromText('POINT(98.0022114 7.7644912)', 4326)),
  (323, 'Chaos here, Everything is cracking and breaking.Safety pls!!', 'rajasaheb', TIMESTAMP '2019-12-21 12:23:15', 2, ST_GeomFromText('POINT(98.35334664941854 22.00599665692158)', 4326)),
  (324, 'This is too bad. It is collapsing!!! They are inside! HELP!!!', 'sahibjyada', TIMESTAMP '2019-12-20 15:33:21', 4, ST_GeomFromText('POINT(96.34756749424889 20.004682759949375)', 4326)),
  (325, 'Water and water !! The village is inundated!!', 'shiva', TIMESTAMP '2019-11-25 11:20:05', 1, ST_GeomFromText('POINT(99.4386558884521 17.208728495144474)', 4326)),
  (326, 'The base is crumbling !! crisis situation here!!', 'Deepak', TIMESTAMP '2012-12-21 07:22:05', 3, ST_GeomFromText('POINT(101.8585739 19.9611766)', 4326)),
  (327, 'I am trapped inside. The earth is crumbling', 'hariman', TIMESTAMP '2019-11-15 16:35:05', 4, ST_GeomFromText('POINT(101.143 13.773)', 4326)),
  (328, 'It is killing me. I am suffocating', 'jibisit', TIMESTAMP '2019-10-15 12:30:15', 1, ST_GeomFromText('POINT(100.212 7.217)', 4326));


-- Data for table assignments
INSERT INTO assignments (target_site, user_id, solved) VALUES
  (1, 2, FALSE),
  (2, 2, TRUE),
  (3, 4, FALSE),
  (4, 2, TRUE),
  (5, 6, FALSE),
  (6, 7, FALSE),
  (7, 6, FALSE);

-- End
