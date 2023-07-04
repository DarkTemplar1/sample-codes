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
