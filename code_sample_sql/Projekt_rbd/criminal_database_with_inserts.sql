create database criminal_database;

create table person(
    id serial PRIMARY KEY,
    first_name varchar(35) not null,
    last_name varchar(35) not null,
    date_of_birth date not null,
    gender varchar(35) not null,
    nationality varchar(35)
);

create table contact_information(
    id serial PRIMARY KEY,
    phone_number varchar(24),
    email varchar
);

create table person_of_interest(
    id serial PRIMARY KEY,
    eye_color varchar,
    hair_color varchar,
    weight decimal(6,2),
    height decimal(6,2),
    additional_details text,
    status text not null,
    person_id int not null
);
alter table person_of_interest
    add constraint fk_poi_person_id
    foreign key (person_id) references person(id);

create table crime(
    id serial PRIMARY KEY,
    name varchar not null,
    description text not null,
    severity varchar not null
);

create table officer(
    id serial PRIMARY KEY,
    badge_number varchar not null,
    rank varchar not null,
    department varchar not null,
    person_id int not null,
    contact_information_id int not null
);

alter table officer
    add constraint fk_o_person_id
    foreign key (person_id) references person(id),
    add constraint fk_o_contact_information_id
    foreign key (contact_information_id) references contact_information(id);

create table crime_scene(
    id serial PRIMARY KEY,
    date date not null,
    time time,
    location varchar not null,
    description text not null,
    crime_id int not null
);

alter table crime_scene
    add constraint fk_cs_crime_id
    foreign key (crime_id) references crime(id);

create table "case"(
    id serial primary key,
    status text not null,
    crime_scene_id int not null
);

alter table "case"
    add constraint fk_ca_crime_scene_id
    foreign key (crime_scene_id) references crime_scene(id);

create table charge(
    id serial primary key,
    severity varchar not null,
    description text not null,
    case_id int not null,
    crime_id int not null,
    person_of_interest_id int not null
);

alter table charge
    add constraint fk_ch_case_id
    foreign key (case_id) references "case"(id),
    add constraint fk_ch_crime_id
    foreign key (crime_id) references crime(id),
    add constraint fk_ch_person_of_interest_id
    foreign key (person_of_interest_id) references person_of_interest(id);

create table evidence(
    id serial primary key,
    name varchar not null,
    type varchar not null,
    description text not null,
    crime_scene_id int not null
);

alter table evidence
    add constraint fk_e_crime_scene_id
    foreign key (crime_scene_id) references crime_scene(id);

create table witness(
    id serial primary key,
    person_id int not null,
    contact_information_id int not null
);

alter table witness
    add constraint fk_w_person_id
    foreign key (person_id) references person(id),
    add constraint fk_w_contact_information_id
    foreign key (contact_information_id) references contact_information(id);

create table statement(
    id serial primary key,
    statement text not null,
    witness_id int not null,
    crime_scene_id int not null
);

alter table statement
    add constraint fk_s_witness_id
    foreign key (witness_id) references witness(id),
    add constraint fk_s_crime_scene_id
    foreign key (crime_scene_id) references crime_scene(id);

create table arrest(
    id serial not null,
    date date not null,
    time time not null,
    location varchar not null,
    officer_id int not null,
    person_of_interest_id int not null
);

alter table arrest
    add constraint fk_a_officer_id
    foreign key (officer_id) references officer(id),
    add constraint fk_a_person_of_interest_id
    foreign key (person_of_interest_id) references person_of_interest(id);

create table charges_on_person(
    charge_id int not null,
    person_of_interest_id int not null
);

alter table charges_on_person
    add constraint fk_cop_charge_id
    foreign key (charge_id) references charge(id),
    add constraint fk_cop_person_of_interest_id
    foreign key (person_of_interest_id) references person_of_interest(id);

create table witnesses_on_crime_scene(
    witness_id int not null,
    crime_scene_id int not null
);

alter table witnesses_on_crime_scene
    add constraint fk_wocs_witness_id
    foreign key (witness_id) references witness(id),
    add constraint fk_wocs_crime_scene_id
    foreign key (crime_scene_id) references crime_scene(id);

create table officers_on_crime_scene(
    officer_id int not null,
    crime_scene_id int not null
);

alter table officers_on_crime_scene
    add constraint fk_oocs_officer_id
    foreign key (officer_id) references officer(id),
    add constraint fk_oocs_crime_scene_id
    foreign key (crime_scene_id) references crime_scene(id);

insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (1, 'Sallyanne', 'Illesley', '9/2/1998', 'Female', 'Azerbaijan');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (2, 'Mehetabel', 'Branche', '12/26/1999', 'Female', 'Indonesia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (3, 'Anica', 'Goch', '9/20/1996', 'Female', 'Switzerland');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (4, 'Nicoli', 'Backshell', '4/27/1999', 'Female', 'Indonesia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (5, 'Bail', 'Aronovich', '7/7/2000', 'Male', 'Peru');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (6, 'Sigvard', 'Hayland', '6/23/1999', 'Male', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (7, 'Desirae', 'Sangra', '1/15/1997', 'Female', 'Argentina');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (8, 'Maynard', 'Hemphall', '9/21/2001', 'Male', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (9, 'Pedro', 'Amort', '8/6/2003', 'Male', 'Yemen');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (10, 'Brier', 'Hargraves', '9/9/1995', 'Female', 'Portugal');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (11, 'Guthrey', 'Blasli', '8/11/2001', 'Male', 'Philippines');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (12, 'Dyann', 'Kleszinski', '5/13/1998', 'Female', 'Indonesia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (13, 'Marty', 'Martyn', '5/9/2000', 'Female', 'Indonesia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (14, 'Kipper', 'Weyland', '7/9/1995', 'Male', 'Indonesia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (15, 'Culver', 'Gobbett', '3/14/1999', 'Male', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (16, 'Merle', 'McSkeagan', '6/2/1995', 'Female', 'Macedonia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (17, 'Johan', 'Skim', '6/18/1996', 'Male', 'Philippines');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (18, 'Nance', 'Rutledge', '4/17/1999', 'Female', 'Greece');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (19, 'Liv', 'Maxweell', '11/9/2003', 'Female', 'Japan');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (20, 'Birch', 'Hatherell', '4/12/1995', 'Male', 'Australia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (21, 'Thia', 'Slowly', '2/21/2001', 'Female', 'Indonesia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (22, 'Quintana', 'Petrello', '5/19/2000', 'Female', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (23, 'Donall', 'Sheerin', '7/3/2001', 'Male', 'Vietnam');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (24, 'Sharai', 'Duesberry', '2/9/2003', 'Female', 'Afghanistan');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (25, 'Chev', 'Swidenbank', '6/28/2001', 'Male', 'Indonesia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (26, 'Jock', 'Lanchester', '11/17/2000', 'Male', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (27, 'Gonzalo', 'Etienne', '11/27/2003', 'Male', 'Indonesia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (28, 'Coretta', 'Cowope', '10/30/1998', 'Female', 'Malaysia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (29, 'Celia', 'Checklin', '5/8/1999', 'Female', 'Kenya');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (30, 'Cosimo', 'Saynor', '11/3/1998', 'Male', 'Mali');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (31, 'Gustie', 'Wigsell', '2/20/2003', 'Female', 'Sweden');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (32, 'Cherin', 'Baggelley', '6/7/1996', 'Female', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (33, 'Kristoffer', 'Cassius', '6/24/1999', 'Male', 'Indonesia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (34, 'Marni', 'Lansberry', '12/10/1998', 'Female', 'Greece');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (35, 'Babbie', 'Bragger', '7/22/1995', 'Female', 'Philippines');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (36, 'Thibaut', 'Lorrimer', '4/20/1999', 'Male', 'Canada');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (37, 'Jule', 'Highwood', '7/6/1997', 'Male','Poland');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (38, 'Hastie', 'Filyaev', '6/20/1999', 'Male','Germany');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (39, 'Benetta', 'Killbey', '3/22/1999', 'Female','China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (40, 'Kingsley', 'Bairnsfather', '1/30/2003', 'Male','France');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (41, 'Jayme', 'Libbie', '3/9/1999', 'Male', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (42, 'Thomasina', 'Gavozzi', '5/6/1995', 'Female','England');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (43, 'Robyn', 'Rustedge', '2/13/1995', 'Female', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (44, 'Elizabeth', 'Pendrick', '11/1/2003', 'Female', 'Greece');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (45, 'Tallulah', 'Bromehed', '1/16/2003', 'Female', 'Morocco');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (46, 'Reube', 'Butterley', '12/12/2003', 'Male', 'Portugal');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (47, 'Karl', 'Gullan', '4/8/1995', 'Male', 'Russia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (48, 'Nefen', 'Jeffrey', '3/15/2000', 'Male', 'Czech Republic');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (49, 'Tressa', 'Allcoat', '12/13/2002', 'Female', 'Indonesia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (50, 'Rock', 'Doberer', '9/18/2002', 'Male', 'Sweden');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (51, 'Filippo', 'Float', '6/11/1996', 'Male', 'United States');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (52, 'Archambault', 'Bernardon', '5/23/1997', 'Male', 'Nepal');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (53, 'Emmalee', 'Steward', '5/8/1996', 'Female', 'Iran');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (54, 'Errick', 'Bloy', '6/27/1997', 'Male', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (55, 'Rodney', 'Philip', '1/12/1999', 'Male', 'United Kingdom');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (56, 'Frankie', 'Gehrts', '12/11/2001', 'Male', 'Philippines');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (57, 'Bastien', 'Bunning', '1/16/1999', 'Male', 'Dominican Republic');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (58, 'Aprilette', 'Rebanks', '5/9/1997', 'Female', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (59, 'Ansell', 'Sholl', '10/1/2003', 'Male', 'Czech Republic');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (60, 'Moise', 'Alldread', '2/19/1996', 'Male', 'Brazil');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (61, 'Wini', 'Beacham', '4/24/1995', 'Female', 'Canada');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (62, 'Bobine', 'Thwaites', '1/2/2003', 'Female', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (63, 'Violette', 'Trollope', '10/9/1998', 'Female', 'Namibia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (64, 'Micky', 'Rudledge', '4/19/2003', 'Female', 'Yemen');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (65, 'Ricky', 'Cardus', '3/21/2003', 'Male', 'Luxembourg');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (66, 'Theodora', 'Herreros', '2/19/1999', 'Female', 'Sweden');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (67, 'Grissel', 'Hinze', '8/7/1997', 'Female', 'Jordan');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (68, 'Benni', 'Minifie', '6/30/1999', 'Female', 'Philippines');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (69, 'Rheta', 'Burkhill', '6/22/1999', 'Female', 'Netherlands');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (70, 'Rutger', 'Sukbhans', '1/5/2001', 'Male', 'Japan');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (71, 'Nettle', 'Sherrott', '5/22/1995', 'Female', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (72, 'Cecilius', 'McPhilemy', '12/21/2000', 'Male', 'Brazil');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (73, 'Vincenz', 'Baly', '11/26/1998', 'Male', 'Latvia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (74, 'Ware', 'Inglish', '12/13/1998', 'Male', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (75, 'Enrika', 'Cicerone', '8/26/2001', 'Female', 'Indonesia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (76, 'Sydney', 'Gater', '10/26/1995', 'Male', 'France');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (77, 'Allissa', 'Royall', '6/2/1997', 'Female', 'Ukraine');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (78, 'Rand', 'Bloyes', '2/12/1998', 'Male', 'Palestinian Territory');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (79, 'Leesa', 'Abernethy', '8/21/2003', 'Female', 'Serbia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (80, 'Kort', 'Kitchiner', '5/3/1998', 'Male', 'Cambodia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (81, 'Randi', 'Ashall', '7/10/2001', 'Male', 'Nigeria');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (82, 'Chariot', 'MacGilfoyle', '5/3/1998', 'Male', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (83, 'Frederico', 'Blatherwick', '6/28/1999', 'Male','Russia');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (84, 'Geno', 'Torrisi', '11/24/2002', 'Male', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (85, 'Brendan', 'Fitzsimon', '7/19/2002', 'Male', 'Dominican Republic');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (86, 'Coraline', 'Lucus', '7/17/2000', 'Female', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (87, 'Kylie', 'Markos', '8/30/1995', 'Male', 'Philippines');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (88, 'Bartram', 'Foxcroft', '6/1/1995', 'Male', 'China');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (89, 'Kristen', 'Swine', '6/27/2002', 'Female', 'Poland');
insert into person (id, first_name, last_name, date_of_birth, gender, nationality) values (90, 'Frazier', 'Simeone', '5/1/2000', 'Male', 'Brazil');
insert into contact_information (id,  phone_number, email) values (1,  '+994 690 593 4562', 'sillesley0@yelp.com');
insert into contact_information (id,  phone_number, email) values (2,  '+62 674 564 7921', 'mbranche1@arizona.edu');
insert into contact_information (id,  phone_number, email) values (3,  '+41 477 815 1475', 'agoch2@icq.com');
insert into contact_information (id,  phone_number, email) values (4,  '+62 270 221 7103', 'nbackshell3@tmall.com');
insert into contact_information (id,  phone_number, email) values (5, '+51 910 983 2394', 'baronovich4@oracle.com');
insert intO contact_information (id,  phone_number, email) values (6,  '+86 815 345 5160', 'shayland5@springer.com');
insert into contact_information (id,  phone_number, email) values (7,  '+54 643 300 0852', 'dsangra6@mozilla.org');
insert into contact_information (id,  phone_number, email) values (8,  '+86 821 905 2860', 'mhemphall7@ameblo.jp');
insert into contact_information (id,  phone_number, email) values (9,  '+967 543 680 6869', 'pamort8@blog.com');
insert into contact_information (id,  phone_number, email) values (10,  '+351 259 114 0230', 'bhargraves9@prnewswire.com');
insert into contact_information (id,  phone_number, email) values (11, '+63 717 429 0864', 'gblaslia@jigsy.com');
insert into contact_information (id,  phone_number, email) values (12, '+62 403 281 2180', 'dkleszinskib@123-reg.co.uk');
insert into contact_information (id,  phone_number, email) values (13, '+62 696 692 7759', 'mmartync@mtv.com');
insert into contact_information (id,  phone_number, email) values (14,  '+62 443 985 2238', 'kweylandd@indiatimes.com');
insert into contact_information (id,  phone_number, email) values (15,  '+86 108 951 5060', 'cgobbette@elpais.com');
insert into contact_information (id,  phone_number, email) values (16,  '+389 614 419 0529', 'mmcskeaganf@phpbb.com');
insert into contact_information (id,  phone_number, email) values (17,  '+63 757 458 6813', 'jskimg@addtoany.com');
insert into contact_information (id,  phone_number, email) values (18,  '+30 459 136 3601', 'nrutledgeh@epa.gov');
insert into contact_information (id,  phone_number, email) values (19,  '+81 695 241 3034', 'lmaxweelli@bloglines.com');
insert into contact_information (id,  phone_number, email) values (20,  '+61 827 360 8803', 'bhatherellj@newsvine.com');
insert into contact_information (id,  phone_number, email) values (21, '+62 654 680 6387', 'tslowlyk@washingtonpost.com');
insert into contact_information (id,  phone_number, email) values (22,  '+86 148 719 8212', 'qpetrellol@goo.ne.jp');
insert into contact_information (id,  phone_number, email) values (23,  '+84 396 596 8866', 'dsheerinm@naver.com');
insert into contact_information (id,  phone_number, email) values (24,  '+93 535 182 0248', 'sduesberryn@prlog.org');
insert into contact_information (id,  phone_number, email) values (25,  '+62 542 863 2893', 'cswidenbanko@google.fr');
insert into contact_information (id,  phone_number, email) values (26,  '+86 342 991 3767', 'jlanchesterp@ed.gov');
insert into contact_information (id,  phone_number, email) values (27,  '+62 755 580 2795', 'getienneq@tuttocitta.it');
insert into contact_information (id,  phone_number, email) values (28,  '+60 802 547 0252', 'ccowoper@disqus.com');
insert into contact_information (id,  phone_number, email) values (29,  '+254 990 413 8959', 'cchecklins@netvibes.com');
insert into contact_information (id,  phone_number, email) values (30,  '+223 688 762 5668', 'csaynort@nsw.gov.au');
insert into contact_information (id,  phone_number, email) values (31,  '+46 649 109 3603', 'gwigsellu@xing.com');
insert into contact_information (id,  phone_number, email) values (32,  '+86 538 660 6562', 'cbaggelleyv@cyberchimps.com');
insert into contact_information (id,  phone_number, email) values (33,  '+62 129 211 6627', 'kcassiusw@nature.com');
insert into contact_information (id,  phone_number, email) values (34,  '+30 565 795 3967', 'mlansberryx@qq.com');
insert into contact_information (id,  phone_number, email) values (35,  '+63 246 281 5349', 'bbraggery@dmoz.org');
insert into contact_information (id,  phone_number, email) values (36,  '+1 138 588 0947', 'tlorrimerz@w3.org');
insert into contact_information (id,  phone_number, email) values (37,  '+57 499 460 7189', 'jhighwood10@1688.com');
insert into contact_information (id,  phone_number, email) values (38,  '+681 429 150 6063', 'hfilyaev11@altervista.org');
insert into contact_information (id,  phone_number, email) values (39,  '+63 296 241 6505', 'bkillbey12@gov.uk');
insert into contact_information (id,  phone_number, email) values (40,  '+81 490 937 7302', 'kbairnsfather13@constantcontact.com');
insert into contact_information (id,  phone_number, email) values (41,  '+86 763 899 3524', 'jlibbie14@printfriendly.com');
insert into contact_information (id,  phone_number, email) values (42,  '+62 215 761 9064', 'tgavozzi15@oracle.com');
insert into contact_information (id,  phone_number, email) values (43, '+86 258 190 5844', 'rrustedge16@skyrock.com');
insert into contact_information (id,  phone_number, email) values (44,  '+30 948 336 1001', 'ependrick17@nifty.com');
insert into contact_information (id,  phone_number, email) values (45,  '+212 517 216 6018', 'tbromehed18@marketwatch.com');
insert into contact_information (id,  phone_number, email) values (46,  '+351 329 517 5211', 'rbutterley19@etsy.com');
insert into contact_information (id,  phone_number, email) values (47,  '+7 465 533 8706', 'kgullan1a@irs.gov');
insert into contact_information (id,  phone_number, email) values (48,  '+420 474 307 5484', 'njeffrey1b@cnn.com');
insert into contact_information (id,  phone_number, email) values (49,  '+62 148 913 1623', 'tallcoat1c@lycos.com');
insert into contact_information (id,  phone_number, email) values (50,  '+46 435 731 3809', 'rdoberer1d@smugmug.com');
insert into contact_information (id,  phone_number, email) values (51,  '+1 202 736 3732', 'ffloat1e@noaa.gov');
insert into contact_information (id,  phone_number, email) values (52,  '+977 833 108 6177', 'abernardon1f@merriam-webster.com');
insert into contact_information (id,  phone_number, email) values (53,  '+98 160 858 2116', 'esteward1g@weebly.com');
insert into contact_information (id,  phone_number, email) values (54,  '+86 560 646 1841', 'ebloy1h@washington.edu');
insert into contact_information (id,  phone_number, email) values (55,  '+44 991 234 1381', 'rphilip1i@cbsnews.com');
insert into contact_information (id,  phone_number, email) values (56,  '+63 394 587 5758', 'fgehrts1j@hexun.com');
insert into contact_information (id,  phone_number, email) values (57,  '+1 994 444 7853', 'bbunning1k@desdev.cn');
insert into contact_information (id,  phone_number, email) values (58,  '+86 551 894 1926', 'arebanks1l@google.cn');
insert into contact_information (id,  phone_number, email) values (59,  '+420 212 873 5708', 'asholl1m@wufoo.com');
insert into contact_information (id,  phone_number, email) values (60,  '+55 892 885 2616', 'malldread1n@answers.com');
insert into contact_information (id,  phone_number, email) values (61, '+1 803 317 8049', 'wbeacham1o@ca.gov');
insert into contact_information (id,  phone_number, email) values (62,  '+86 991 310 7572', 'bthwaites1p@mit.edu');
insert into contact_information (id,  phone_number, email) values (63,  '+264 507 919 1464', 'vtrollope1q@tumblr.com');
insert into contact_information (id,  phone_number, email) values (64,  '+967 238 966 1891', 'mrudledge1r@ihg.com');
insert into contact_information (id,  phone_number, email) values (65,  '+352 299 109 9167', 'rcardus1s@cloudflare.com');
insert into contact_information (id,  phone_number, email) values (66,  '+46 552 186 7025', 'therreros1t@nyu.edu');
insert into contact_information (id,  phone_number, email) values (67,  '+962 474 525 1466', 'ghinze1u@plala.or.jp');
insert into contact_information (id,  phone_number, email) values (68,  '+63 248 772 6670', 'bminifie1v@wisc.edu');
insert into contact_information (id,  phone_number, email) values (69,  '+31 622 495 2732', 'rburkhill1w@posterous.com');
insert into contact_information (id,  phone_number, email) values (70,  '+81 755 854 2173', 'rsukbhans1x@reference.com');
insert into contact_information (id,  phone_number, email) values (71,  '+86 350 870 1461', 'nsherrott1y@skyrock.com');
insert into contact_information (id,  phone_number, email) values (72,  '+55 893 934 9652', 'cmcphilemy1z@photobucket.com');
insert into contact_information (id,  phone_number, email) values (73,  '+371 264 371 8216', 'vbaly20@wired.com');
insert into contact_information (id,  phone_number, email) values (74, '+86 560 890 6333', 'winglish21@washington.edu');
insert into contact_information (id,  phone_number, email) values (75, '+62 810 806 5472', 'ecicerone22@w3.org');
insert into contact_information (id,  phone_number, email) values (76,  '+33 596 358 5566', 'sgater23@yelp.com');
insert into contact_information (id,  phone_number, email) values (77,  '+380 221 237 6360', 'aroyall24@npr.org');
insert into contact_information (id,  phone_number, email) values (78,  '+970 897 763 5510', 'rbloyes25@instagram.com');
insert into contact_information (id,  phone_number, email) values (79,  '+381 567 928 2720', 'labernethy26@google.co.uk');
insert into contact_information (id,  phone_number, email) values (80,  '+855 119 229 8389', 'kkitchiner27@slashdot.org');
insert into contact_information (id,  phone_number, email) values (81,  '+234 179 854 6501', 'rashall28@msu.edu');
insert into contact_information (id,  phone_number, email) values (82,  '+86 141 425 1557', 'cmacgilfoyle29@yolasite.com');
insert into contact_information (id,  phone_number, email) values (83,  '+62 411 204 9177', 'fblatherwick2a@bluehost.com');
insert into contact_information (id,  phone_number, email) values (84,  '+86 904 963 2494', 'gtorrisi2b@google.com.br');
insert into contact_information (id,  phone_number, email) values (85,  '+1 227 543 8959', 'bfitzsimon2c@mayoclinic.com');
insert into contact_information (id,  phone_number, email) values (86,  '+86 391 986 6410', 'clucus2d@t-online.de');
insert into contact_information (id,  phone_number, email) values (87,  '+63 267 147 6779', 'kmarkos2e@symantec.com');
insert into contact_information (id,  phone_number, email) values (88,  '+86 223 432 2023', 'bfoxcroft2f@zimbio.com');
insert into contact_information (id,  phone_number, email) values (89,  '+48 981 543 1068', 'kswine2g@cornell.edu');
insert into contact_information (id,  phone_number, email) values (90,  '+55 858 556 0131', 'fsimeone2h@naver.com');
insert into crime (id, name, description, severity) values (1, 'Murder', 'Gang voilence', 1);
insert into crime (id, name, description, severity) values (2, 'vehicle theft', 'car stolen', 2);
insert into crime (id, name, description, severity) values (3, 'Murder', 'house raid', 3);
insert into crime (id, name, description, severity) values (4, 'drug dealer', 'selling meth', 4);
insert into crime (id, name, description, severity) values (5, 'vehicle theft', 'stealing and wrecking car', 5);
insert into crime (id, name, description, severity) values (6, 'robbery', 'shop robbery', 6);
insert into crime (id, name, description, severity) values (7, 'robbery', 'bank robbery', 7);
insert into crime (id, name, description, severity) values (8, 'robbery', 'house robbery', 8);
insert into crime (id, name, description, severity) values (9, 'vehicle theft', 'car stolen from garage', 9);
insert into crime (id, name, description, severity) values (10, 'Meth dealer', 'meth dealer park', 10);
insert into crime (id, name, description, severity) values (11, 'vehicle theft', 'car stolen from garage', 11);
insert into crime (id, name, description, severity) values (12, 'robbery', 'hause robbery', 12);
insert into crime (id, name, description, severity) values (13, 'Meth dealer', 'alleys dealer', 13);
insert into crime (id, name, description, severity) values (14, 'robbery', 'chinatown robbery', 14);
insert into crime (id, name, description, severity) values (15, 'Meth dealer', 'shop as cover for illiega activites', 15);
insert into crime (id, name, description, severity) values (16, 'robbery', 'shop robbery', 16);
insert into crime (id, name, description, severity) values (17, 'robbery', 'bank robbery', 17);
insert into crime (id, name, description, severity) values (18, 'robbery', 'house robbery', 18);
insert into crime (id, name, description, severity) values (19, 'vehicle theft', 'car stolen form parking lot', 19);
insert into crime (id, name, description, severity) values (20, 'robbery', 'bank robbery', 20);
insert into crime (id, name, description, severity) values (21, 'vehicle theft', 'car stolen', 21);
insert into crime (id, name, description, severity) values (22, 'robbery','bank robbery', 22);
insert into crime (id, name, description, severity) values (23, 'Murder', 'murder in house', 23);
insert into crime (id, name, description, severity) values (24, 'robbery', 'robbery in park', 24);
insert into crime (id, name, description, severity) values (25, 'Murder', 'hotel murder', 25);
insert into crime (id, name, description, severity) values (26, 'robbery', 'school robbery', 26);
insert into crime (id, name, description, severity) values (27, 'Murder', 'school murder', 27);
insert into crime (id, name, description, severity) values (28, 'robbery', 'robbery in mall', 28);
insert into crime (id, name, description, severity) values (29, 'Murder', 'murder in office', 29);
insert into crime (id, name, description, severity) values (30, 'robbery', 'robbery on train', 30);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (1, 'Maroon', 'Teal', 80, 162, 'VP Marketing', 'interrogated', 31);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (2, 'Puce', 'Teal', 60, 187, 'Staff Accountant II', 'captured', 32);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (3, 'Goldenrod', 'Maroon', 85, 168, 'Human Resources Assistant II', 'on a run', 33);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (4, 'Pink', 'Mauv', 68, 169, 'Research Assistant II', 'in jail', 34);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (5, 'Puce', 'Puce', 64, 165, 'Actuary', 'captured', 35);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (6, 'Maroon', 'Violet', 88, 162, 'Clinical Specialist', 'captured', 36);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (7, 'Teal', 'Yellow', 80, 169, 'Graphic Designer', 'interrogated', 37);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (8, 'Purple', 'Puce', 74, 165, 'VP Product Management', 'in jail', 48);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (9, 'Violet', 'Violet', 76, 188, 'Computer Systems Analyst I', 'on a run', 49);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (10, 'Red', 'Violet', 60, 162, 'Research Assistant II', 'captured', 41);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (11, 'Khaki', 'Pink', 73, 168, 'Product Engineer', 'on a run', 51);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (12, 'Maroon', 'Orange', 86, 169, 'Professor', 'on a run', 52);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (13, 'Teal', 'Blue', 60, 181, 'Electrical Engineer', 'interrogated', 53);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (14, 'Purple', 'Violet', 80, 168, 'Structural Engineer', 'on a run', 54);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (15, 'Orange', 'Purple', 78, 184, 'Professor', 'interrogated', 55);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (16, 'Mauv', 'Crimson', 84, 185, 'Office Assistant IV', 'interrogated', 66);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (17, 'Orange', 'Green', 79, 176, 'Design Engineer', 'captured', 67);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (18, 'Goldenrod', 'Orange', 87, 174, 'VP Quality Control', 'interrogated', 68);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (19, 'Violet', 'Fuscia', 80, 162, 'Structural Analysis Engineer', 'on a run', 69);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (20, 'Goldenrod', 'Khaki', 77, 184, 'Project Manager', 'on a run', 70);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (21, 'Khaki', 'Yellow', 69, 161, 'Research Associate', 'captured', 71);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (22, 'Goldenrod', 'Orange', 67, 188, 'Health Coach III', 'interrogated', 72);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (23, 'Aquamarine', 'Pink', 65, 175, 'Budget/Accounting Analyst II', false, 73);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (24, 'Purple', 'Blue', 87, 164, 'Occupational Therapist', 'captured', 74);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (25, 'Red', 'Violet', 65, 165, 'Environmental Tech', 'interrogated', 85);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (26, 'Yellow', 'Purple', 67, 177, 'Nuclear Power Engineer', 'captured', 86);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (27, 'Red', 'Green', 66, 171, 'Software Test Engineer III', 'on a run', 87);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (28, 'Turquoise', 'Red', 81, 167, 'Paralegal', 'captured', 88);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (29, 'Fuscia', 'Goldenrod', 82, 177, 'Product Engineer', 'interrogated', 89);
insert into person_of_interest (id, eye_color, hair_color, weight, height, additional_details, status, person_id) values (30, 'Pink', 'Indigo', 66, 179, 'Compensation Analyst', 'captured', 90);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (1, 'S1815', 'RPD', 'Police officer', 1, 1);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (2, 'S9063', 'DCPD', 'Sheriff', 2, 2);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (3, 'S1239', 'NYPD', 'Police officer', 3, 3);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (4, 'S3507', 'LSPD', 'Police officer', 4, 4);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (5, 'S8289', 'LPD', 'Park ranger', 5, 5);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (6, 'S4269', 'OPD', 'Park ranger', 6, 6);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (7, 'S7548', 'RPD', 'Park ranger', 7, 7);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (8, 'S8278', 'RPD', 'Highway patrol officer', 8, 8);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (9, 'S7733', 'OPD', 'Highway patrol officer', 9, 9);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (10, 'S0135', 'RPD', 'Highway patrol officer', 10, 10);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (11, 'S9311', 'OPD', 'Highway patrol officer', 11, 11);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (12, 'S5550', 'DCPD', 'Highway patrol officer', 12, 12);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (13, 'S9009', 'RPD', 'Park ranger', 13, 13);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (14, 'S7878', 'RPD', 'Park ranger', 14, 14);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (15, 'S8927', 'RPD', 'Park ranger', 15, 15);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (16, 'S1934', 'DCPD', 'Police officer', 16, 16);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (17, 'S1494', 'DCPD', 'Accounting', 17, 17);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (18, 'S1945', 'RPD', 'Police officer', 18, 18);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (19, 'S1114', 'DCPD', 'Park ranger', 19, 19);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (20, 'S0975', 'RPD', 'Park ranger', 20, 20);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (21, 'S9591', 'DCPD', 'Police officer', 21, 21);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (22, 'S2325', 'RPD', 'Sheriff', 22, 22);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (23, 'S4152', 'DCPD', 'Police officer', 23, 23);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (24, 'S8831', 'DCPD', 'Police officer', 24, 24);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (25, 'S9734', 'OPD', 'Park ranger', 25, 25);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (26, 'S6419', 'OPD', 'Police officer', 26, 26);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (27, 'S9024', 'DCPD', 'Park ranger', 27, 27);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (28, 'S5840', 'DCPD', 'Police officer', 28, 28);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (29, 'S3000', 'DCPD' , 'Detective', 29, 29);
insert into officer (id, badge_number , rank,  department, person_id, contact_information_id) values (30, 'S0441', 'DCPD', 'Detective', 30, 30);
insert into crime_scene (id, date, time, location, description, crime_id) values (1, '8/25/2020', '11:10 PM', 'Ponta da Garça', 'driveby by other gang', 1);
insert into crime_scene (id, date, time, location, description, crime_id) values (2, '12/31/2018', '6:44 AM', 'Tarczyn', 'car stolen from garage', 2);
insert into crime_scene (id, date, time, location, description, crime_id) values (3, '8/3/2022', '3:24 PM', 'Lianhe', 'House under attack', 3);
insert into crime_scene (id, date, time, location, description, crime_id) values (4, '11/7/2017', '2:53 AM', 'Nemuro', 'selling meth under the bridge', 4);
insert into crime_scene (id, date, time, location, description, crime_id) values (5, '8/22/2020', '2:20 PM', 'Merik', 'car stolen and wrecked in purste', 5);
insert into crime_scene (id, date, time, location, description, crime_id) values (6, '4/25/2019', '2:21 PM', 'Hanušovice', 'shop robbery', 6);
insert into crime_scene (id, date, time, location, description, crime_id) values (7, '9/15/2018', '10:22 AM', 'Pirapozinho', 'bank robbery', 7);
insert into crime_scene (id, date, time, location, description, crime_id) values (8, '11/3/2021', '1:57 PM', 'Tidaholm', 'house robbery', 8);
insert into crime_scene (id, date, time, location, description, crime_id) values (9, '6/12/2019', '12:25 AM', 'Biqiao', 'car stolen from garage', 9);
insert into crime_scene (id, date, time, location, description, crime_id) values (10, '7/12/2020', '1:28 AM', 'Östersund', 'meth dealer park', 10);
insert into crime_scene (id, date, time, location, description, crime_id) values (11, '10/11/2019', '11:41 AM', 'Fengmen','car stolen from garage' , 11);
insert into crime_scene (id, date, time, location, description, crime_id) values (12, '2/2/2019', '10:49 PM', 'Uhlove', 'hause robbery', 12);
insert into crime_scene (id, date, time, location, description, crime_id) values (13, '2/1/2021', '3:41 AM', 'Pojan', 'alleys dealer', 13);
insert into crime_scene (id, date, time, location, description, crime_id) values (14, '1/9/2022', '6:33 PM', 'Qitan', 'chinatown robbery', 14);
insert into crime_scene (id, date, time, location, description, crime_id) values (15, '5/12/2021', '3:44 PM', 'Aurelliana', 'shop', 15);
insert into crime_scene (id, date, time, location, description, crime_id) values (16, '10/29/2019', '12:32 PM', 'Qagan Obo', 'shop robbery', 16);
insert into crime_scene (id, date, time, location, description, crime_id) values (17, '1/7/2020', '3:42 AM', 'Karangmangu', 'bank robbery', 17);
insert into crime_scene (id, date, time, location, description, crime_id) values (18, '7/11/2020', '2:15 AM', 'Ibung','house robbery', 18);
insert into crime_scene (id, date, time, location, description, crime_id) values (19, '2/13/2020', '7:17 AM', 'Burgos', 'car stolen form parking lot', 19);
insert into crime_scene (id, date, time, location, description, crime_id) values (20, '7/8/2019', '4:48 AM', 'Xiadahe', 'bank robbery', 20);
insert into crime_scene (id, date, time, location, description, crime_id) values (21, '3/22/2021', '7:05 PM', 'Almelo', 'car stolen', 21);
insert into crime_scene (id, date, time, location, description, crime_id) values (22, '6/15/2017', '2:10 AM', 'Xuji', 'bank robbery', 22);
insert into crime_scene (id, date, time, location, description, crime_id) values (23, '6/2/2022', '12:37 PM', 'Hōjō', 'murder in house', 23);
insert into crime_scene (id, date, time, location, description, crime_id) values (24, '7/27/2021', '1:54 PM', 'Dahe', 'robbery in park', 24);
insert into crime_scene (id, date, time, location, description, crime_id) values (25, '9/2/2022', '8:17 PM', 'Lewin Kłodzki', 'hotel murder', 25);
insert into crime_scene (id, date, time, location, description, crime_id) values (26, '5/20/2019', '8:26 AM', 'Dongqu', 'school robbery', 26);
insert into crime_scene (id, date, time, location, description, crime_id) values (27, '2/20/2023', '5:58 PM', 'Al Wuday‘', 'school murder', 27);
insert into crime_scene (id, date, time, location, description, crime_id) values (28, '12/9/2019', '1:09 PM', 'Szeged', 'robbery in mall', 28);
insert into crime_scene (id, date, time, location, description, crime_id) values (29, '11/25/2017', '4:28 PM', 'Rumyantsevo', 'murder in office', 29);
insert into crime_scene (id, date, time, location, description, crime_id) values (30, '5/17/2019', '10:03 AM', 'Kuala Lumpur', 'robbery on train', 30);
insert into "case" (id, status, crime_scene_id) values (1, 'complited', 1);
insert into "case" (id, status, crime_scene_id) values (2, 'on going', 2);
insert into "case" (id, status, crime_scene_id) values (3, 'completed', 3);
insert into "case" (id, status, crime_scene_id) values (4, 'on going', 4);
insert into "case" (id, status, crime_scene_id) values (5, 'complited', 5);
insert into "case" (id, status, crime_scene_id) values (6, 'on going', 6);
insert into "case" (id, status, crime_scene_id) values (7, 'complited', 7);
insert into "case" (id, status, crime_scene_id) values (8, 'complited', 8);
insert into "case" (id, status, crime_scene_id) values (9, 'complited', 9);
insert into "case" (id, status, crime_scene_id) values (10, 'complited', 10);
insert into "case" (id, status, crime_scene_id) values (11, 'complited', 11);
insert into "case" (id, status, crime_scene_id) values (12, 'complited', 12);
insert into "case" (id, status, crime_scene_id) values (13, 'on going', 13);
insert into "case" (id, status, crime_scene_id) values (14, 'complited', 14);
insert into "case" (id, status, crime_scene_id) values (15, 'on going', 15);
insert into "case" (id, status, crime_scene_id) values (16, 'complited', 16);
insert into "case" (id, status, crime_scene_id) values (17, 'on going', 17);
insert into "case" (id, status, crime_scene_id) values (18, 'complited', 18);
insert into "case" (id, status, crime_scene_id) values (19, 'on going', 19);
insert into "case" (id, status, crime_scene_id) values (20, 'complited', 20);
insert into "case" (id, status, crime_scene_id) values (21, 'complited', 21);
insert into "case" (id, status, crime_scene_id) values (22, 'complited', 22);
insert into "case" (id, status, crime_scene_id) values (23, 'on going', 23);
insert into "case" (id, status, crime_scene_id) values (24, 'complited', 24);
insert into "case" (id, status, crime_scene_id) values (25, 'complited', 25);
insert into "case" (id, status, crime_scene_id) values (26, 'complited', 26);
insert into "case" (id, status, crime_scene_id) values (27, 'on going', 27);
insert into "case" (id, status, crime_scene_id) values (28, 'complited', 28);
insert into "case" (id, status, crime_scene_id) values (29, 'complited', 29);
insert into "case" (id, status, crime_scene_id) values (30, 'on going', 30);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (1, 'Minor', 'by the a law of severity', 1, 1, 1);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (2, 'Moderate', 'by the a law of severity', 2, 2, 2);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (3, 'oderate', 'by the a law of severity', 3, 3, 3);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (4, 'Moderate', 'by the a law of severity', 4, 4, 4);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (5, 'oderate', 'by the a law of severity', 5, 5, 5);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (6, 'Moderate', 'by the a law of severity', 6, 6, 6);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (7, 'Moderate', 'by the a law of severity', 7, 7, 7);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (8, 'Moderate', 'by the a law of severity', 8, 8, 8);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (9, 'Minor', 'by the a law of severity', 9, 9, 9);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (10, 'Moderate', 'by the a law of severity', 10, 10, 10);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (11, 'Minor', 'by the a law of severity', 11, 11, 11);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (12, 'Moderate', 'by the a law of severity', 12, 12, 12);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (13, 'Minor', 'by the a law of severity', 13, 13, 13);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (14, 'Moderate', 'by the a law of severity', 14, 14, 14);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (15, 'Moderate', 'by the a law of severity', 15, 15, 15);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (16, 'Minor', 'by the a law of severity', 16, 16, 16);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (17, 'Moderate', 'by the a law of severity', 17, 17, 17);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (18, 'Minor', 'by the a law of severity', 18, 18, 18);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (19, 'Moderate', 'by the a law of severity', 19, 19, 19);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (20, 'Minor', 'by the a law of severity', 20, 20, 20);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (21, 'Moderate', 'by the a law of severity', 21, 21, 21);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (22, 'Moderate', 'by the a law of severity', 22, 22, 22);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (23, 'Minor', 'by the a law of severity', 23, 23, 23);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (24, 'Minor', 'by the a law of severity', 24, 24, 24);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (25, 'Minor', 'by the a law of severity', 25, 25, 25);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (26, 'Moderate', 'by the a law of severity', 26, 26, 26);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (27, 'Minor', 'by the a law of severity', 27, 27, 27);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (28, 'Minor', 'by the a law of severity', 28, 28, 28);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (29, 'Moderate', 'by the a law of severity', 29, 29, 29);
insert into charge (id, severity, description , case_id, crime_id, person_of_interest_id) values (30, 'Moderate', 'by the a law of severity', 30, 30, 30);
insert into evidence (id, name, type, description, crime_scene_id) values (1, 'homemade-gun', 'weapon', 'used as weapon', 1);
insert into evidence (id, name, type, description, crime_scene_id) values (2, 'crowbar', 'tool', 'used as weapon', 2);
insert into evidence (id, name, type, description, crime_scene_id) values (3, 'knife','weapon', 'used as weapon',3);
insert into evidence (id, name, type, description, crime_scene_id) values (4, 'shotgun', 'weapon', 'used as weapon', 4);
insert into evidence (id, name, type, description, crime_scene_id) values (5, 'rifle', 'weapon', 'used as weapon', 5);
insert into evidence (id, name, type, description, crime_scene_id) values (6, 'crowbar', 'weapon', 'used as weapon', 6);
insert into evidence (id, name, type, description, crime_scene_id) values (7, 'crowbar', 'weapon', 'used as weapon', 7);
insert into evidence (id, name, type, description, crime_scene_id) values (8, 'crowbar', 'weapon', 'used as weapon', 8);
insert into evidence (id, name, type, description, crime_scene_id) values (9, 'homemade-gun', 'weapon', 'used as weapon', 9);
insert into evidence (id, name, type, description, crime_scene_id) values (10, 'knife', 'weapon', 'used as weapon', 10);
insert into evidence (id, name, type, description, crime_scene_id) values (11, 'crowbar', 'weapon', 'used as weapon', 11);
insert into evidence (id, name, type, description, crime_scene_id) values (12, 'homemade-gun', 'weapon', 'used as weapon', 12);
insert into evidence (id, name, type, description, crime_scene_id) values (13, 'homemade-gun', 'weapon', 'used as weapon', 13);
insert into evidence (id, name, type, description, crime_scene_id) values (14, 'knife', 'weapon', 'used as weapon', 14);
insert into evidence (id, name, type, description, crime_scene_id) values (15, 'crowbar', 'weapon', 'used as weapon', 15);
insert into evidence (id, name, type, description, crime_scene_id) values (16, 'knife', 'weapon', 'used as weapon', 16);
insert into evidence (id, name, type, description, crime_scene_id) values (17, 'crowbar', 'weapon', 'used as weapon', 17);
insert into evidence (id, name, type, description, crime_scene_id) values (18, 'knife', 'weapon', 'used as weapon', 18);
insert into evidence (id, name, type, description, crime_scene_id) values (19, 'knife', 'weapon', 'used as weapon', 19);
insert into evidence (id, name, type, description, crime_scene_id) values (20, 'crowbar', 'weapon', 'used as weapon', 20);
insert into evidence (id, name, type, description, crime_scene_id) values (21, 'shotgun', 'weapon', 'used as weapon', 21);
insert into evidence (id, name, type, description, crime_scene_id) values (22, 'crowbar', 'weapon', 'used as weapon', 22);
insert into evidence (id, name, type, description, crime_scene_id) values (23, 'shotgun', 'weapon', 'used as weapon', 23);
insert into evidence (id, name, type, description, crime_scene_id) values (24, 'shotgun', 'weapon', 'used as weapon', 24);
insert into evidence (id, name, type, description, crime_scene_id) values (25, 'crowbar', 'weapon', 'used as weapon', 25);
insert into evidence (id, name, type, description, crime_scene_id) values (26, 'shotgun', 'weapon', 'used as weapon', 26);
insert into evidence (id, name, type, description, crime_scene_id) values (27, 'crowbar', 'weapon', 'used as weapon', 27);
insert into evidence (id, name, type, description, crime_scene_id) values (28, 'shotgun', 'weapon', 'used as weapon', 28);
insert into evidence (id, name, type, description, crime_scene_id) values (29, 'crowbar', 'weapon', 'used as weapon', 29);
insert into evidence (id, name, type, description, crime_scene_id) values (30, 'shotgun', 'weapon', 'used as weapon', 30);
insert into witness (id, person_id, contact_information_id) values (1, 38, 38);
insert into witness (id, person_id, contact_information_id) values (2, 39, 39);
insert into witness (id, person_id, contact_information_id) values (3, 40, 40);
insert into witness (id, person_id, contact_information_id) values (4, 42, 42);
insert into witness (id, person_id, contact_information_id) values (5, 43, 43);
insert into witness (id, person_id, contact_information_id) values (6, 44, 44);
insert into witness (id, person_id, contact_information_id) values (7, 45, 45);
insert into witness (id, person_id, contact_information_id) values (8, 46, 46);
insert into witness (id, person_id, contact_information_id) values (9, 47, 47);
insert into witness (id, person_id, contact_information_id) values (10, 50, 50);
insert into witness (id, person_id, contact_information_id) values (11, 56, 56);
insert into witness (id, person_id, contact_information_id) values (12, 57, 57);
insert into witness (id, person_id, contact_information_id) values (13, 58, 58);
insert into witness (id, person_id, contact_information_id) values (14, 59, 59);
insert into witness (id, person_id, contact_information_id) values (15, 60, 60);
insert into witness (id, person_id, contact_information_id) values (16, 61, 61);
insert into witness (id, person_id, contact_information_id) values (17, 62, 62);
insert into witness (id, person_id, contact_information_id) values (18, 63, 63);
insert into witness (id, person_id, contact_information_id) values (19, 64, 64);
insert into witness (id, person_id, contact_information_id) values (20, 65, 65);
insert into witness (id, person_id, contact_information_id) values (21, 75, 75);
insert into witness (id, person_id, contact_information_id) values (22, 76, 76);
insert into witness (id, person_id, contact_information_id) values (23, 77, 77);
insert into witness (id, person_id, contact_information_id) values (24, 78, 78);
insert into witness (id, person_id, contact_information_id) values (25, 79, 79);
insert into witness (id, person_id, contact_information_id) values (26, 80, 80);
insert into witness (id, person_id, contact_information_id) values (27, 81, 81);
insert into witness (id, person_id, contact_information_id) values (28, 82, 82);
insert into witness (id, person_id, contact_information_id) values (29, 83, 83);
insert into witness (id, person_id, contact_information_id) values (30, 84, 84);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (1, 'witness saw it', 1, 1);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (2, 'witness isnt sure', 2, 2);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (3, 'witness confirmed him', 3, 3);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (4,  'witness saw it', 4, 4);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (5, 'witness confirmed him', 5, 5);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (6, 'witness saw it', 6, 6);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (7, 'witness confirmed him', 7, 7);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (8, 'witness isnt sure', 8, 8);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (9, 'witness saw it', 9, 9);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (10, 'witness saw it', 10, 10);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (11, 'witness isnt sure', 11, 11);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (12, 'witness saw it', 12, 12);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (13, 'witness isnt sure', 13, 13);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (14, 'witness saw it', 14, 14);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (15, 'witness saw it', 15, 15);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (16, 'witness confirmed him', 16, 16);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (17, 'witness isnt sure', 17, 17);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (18, 'witness saw it', 18, 18);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (19, 'witness saw it', 19, 19);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (20, 'witness confirmed him', 20, 20);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (21, 'witness saw it', 21, 21);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (22, 'witness saw it', 22, 22);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (23, 'witness confirmed him', 23, 23);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (24, 'witness saw it', 24, 24);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (25, 'witness isnt sure', 25, 25);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (26, 'witness saw it', 26, 26);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (27, 'witness confirmed him', 27, 27);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (28, 'witness isnt sure', 28, 28);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (29, 'witness confirmed him', 29, 29);
insert into  statement (id,  statement, witness_id, crime_scene_id) values (30, 'witness isnt sure', 30, 30);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (1, '11/12/2019', '9:45 PM', '93554 Mourelos', 1, 1);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (2, '11/12/2019', '12:44 PM', '38610 Dul’durga', 2, 2);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (3, '6/2/2017', '4:47 AM', '601 Viana', 3, 3);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (4, '6/26/2017', '12:30 AM', '32 Suchen', 4, 4);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (5, '9/29/2021', '3:01 PM', '8 Canoas', 5, 5);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (6, '9/13/2020', '6:23 PM', '56 Zhifudao', 6, 6);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (7, '3/7/2019', '1:23 PM', '617 Köln', 7, 7);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (8, '12/10/2018', '3:30 AM', '6 Pataruman', 8, 8);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (9,'4/3/2022', '7:18 PM', '0707 Pujocucho', 9, 9);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (10, '3/17/2022', '8:16 AM', '502 Aghajari', 10, 10);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (11, '1/29/2022', '5:50 PM', '18 Xarrë', 11, 11);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (12, '4/11/2018', '4:11 AM', '5436 Xiamao', 12, 12);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (13, '11/19/2020', '12:04 AM', '2 Wenxian Chengguanzhen', 13, 13);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (14, '6/28/2017', '10:09 AM', '315 Senggapi', 14, 14);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (15, '6/8/2022', '12:20 PM', '493 Chyhyryn', 15, 15);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (16, '7/6/2021', '3:52 AM', '1796 Kallinge', 16, 16);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (17, '1/28/2018', '6:27 AM', '1472 Magisterial', 17, 17);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (18, '1/25/2020', '1:05 AM', '869 Mtwara', 18, 18);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (19, '4/9/2018', '6:02 AM', '5912 Washington', 19, 19);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (20, '9/14/2017', '3:23 PM', '472 Zheng’an', 20, 20);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (21, '3/29/2021', '12:15 AM', '889 Hats’avan', 21, 21);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (22, '7/1/2022', '7:19 PM', '32 Makiv', 22, 22);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (23, '10/22/2017', '6:30 PM', '526 Buena Esperanza', 23, 23);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (24, '10/19/2020', '10:39 PM', '59738 Tierra y Libertad', 24, 24);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (25, '7/29/2021', '3:02 AM', '825 Xinsheng', 25, 25);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (26, '9/10/2018', '4:18 PM', '916 Magaozhuang', 26, 26);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (27, '3/29/2020', '7:27 AM', '9421 Zhenzhushan', 27, 27);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (28, '7/22/2018', '10:26 PM', '94049 Xiangjiazhai', 28, 28);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (29, '7/6/2017', '6:46 PM', '7336 Gon’ba', 29, 29);
insert into arrest (id, date, time, location, officer_id , person_of_interest_id) values (30, '1/28/2018', '7:50 PM', '4 Kokubunji', 30, 30);
insert into charges_on_person (charge_id, person_of_interest_id) values (1, 1);
insert into charges_on_person (charge_id, person_of_interest_id) values (2, 2);
insert into charges_on_person (charge_id, person_of_interest_id) values (3, 3);
insert into charges_on_person (charge_id, person_of_interest_id) values (4, 4);
insert into charges_on_person (charge_id, person_of_interest_id) values (5, 5);
insert into charges_on_person (charge_id, person_of_interest_id) values (6, 6);
insert into charges_on_person (charge_id, person_of_interest_id) values (7, 7);
insert into charges_on_person (charge_id, person_of_interest_id) values (8, 8);
insert into charges_on_person (charge_id, person_of_interest_id) values (9, 9);
insert into charges_on_person (charge_id, person_of_interest_id) values (10, 10);
insert into charges_on_person (charge_id, person_of_interest_id) values (11, 11);
insert into charges_on_person (charge_id, person_of_interest_id) values (12, 12);
insert into charges_on_person (charge_id, person_of_interest_id) values (13, 13);
insert into charges_on_person (charge_id, person_of_interest_id) values (14, 14);
insert into charges_on_person (charge_id, person_of_interest_id) values (15, 15);
insert into charges_on_person (charge_id, person_of_interest_id) values (16, 16);
insert into charges_on_person (charge_id, person_of_interest_id) values (17, 17);
insert into charges_on_person (charge_id, person_of_interest_id) values (18, 18);
insert into charges_on_person (charge_id, person_of_interest_id) values (19, 19);
insert into charges_on_person (charge_id, person_of_interest_id) values (20, 20);
insert into charges_on_person (charge_id, person_of_interest_id) values (21, 21);
insert into charges_on_person (charge_id, person_of_interest_id) values (22, 22);
insert into charges_on_person (charge_id, person_of_interest_id) values (23, 23);
insert into charges_on_person (charge_id, person_of_interest_id) values (24, 24);
insert into charges_on_person (charge_id, person_of_interest_id) values (25, 25);
insert into charges_on_person (charge_id, person_of_interest_id) values (26, 26);
insert into charges_on_person (charge_id, person_of_interest_id) values (27, 27);
insert into charges_on_person (charge_id, person_of_interest_id) values (28, 28);
insert into charges_on_person (charge_id, person_of_interest_id) values (29, 29);
insert into charges_on_person (charge_id, person_of_interest_id) values (30, 30);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (1, 1);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (2, 2);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (3, 3);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (4, 4);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (5, 5);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (6, 6);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (7, 7);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (8, 8);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (9, 9);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (10, 10);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (11, 11);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (12, 12);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (13, 13);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (14, 14);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (15, 15);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (16, 16);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (17, 17);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (18, 18);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (19, 19);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (20, 20);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (21, 21);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (22, 22);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (23, 23);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (24, 24);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (25, 25);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (26, 26);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (27, 27);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (28, 28);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (29, 29);
insert into witnesses_on_crime_scene ( witness_id, crime_scene_id) values (30, 30);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (1, 1);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (2, 2);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (3, 3);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (4, 4);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (5, 5);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (6, 6);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (7, 7);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (8, 8);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (9, 9);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (10, 10);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (9, 11);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (7, 12);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (8, 13);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (9, 14);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (10, 15);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (11, 16);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (12, 17);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (5, 18);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (8, 19);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (9, 20);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (5, 21);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (4, 22);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (3, 23);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (7, 24);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (6, 25);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (2, 26);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (5, 27);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (7, 28);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (6, 29);
insert into officers_on_crime_scene (officer_id, crime_scene_id) values (1, 30);

alter table officer add column is_manager boolean default false;