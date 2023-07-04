--trigger - funkcja wyzwalająca, która aktualizuje kolumnę w tabeli za każdym razem, gdy wstawiany jest nowy wiersz
CREATE OR REPLACE FUNCTION set_manager_status()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.rank = 'Manager' THEN
    NEW.is_manager = TRUE;
  ELSE
    NEW.is_manager = FALSE;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_manager_status_trigger
BEFORE INSERT OR UPDATE ON officer
FOR EACH ROW
EXECUTE FUNCTION set_manager_status();

--granty, role
CREATE ROLE officer1
LOGIN
PASSWORD 'officer1';

GRANT ALL PRIVILEGES ON DATABASE criminal_database TO officer1;

CREATE ROLE officer2
LOGIN
PASSWORD 'officer2';

GRANT SELECT, INSERT ON crime TO officer2;

CREATE ROLE officer3
LOGIN
PASSWORD 'officer3';

GRANT SELECT (status) ON case TO officer3;

--funkcja z tranzakcją

BEGIN TRANSACTION;

INSERT INTO
  contact_information (id, phone_number, email)
VALUES
  (91,'797502620', 'rodrigo@gmail.com');

COMMIT;

-- join
CREATE OR REPLACE VIEW PersonDetails AS
SELECT p.id, p.first_name, p.last_name, p.date_of_birth, p.gender, p.nationality,
       c.phone_number, c.email
FROM person p
LEFT JOIN contact_information c ON p.id = c.id;

-- full,right,left and inner joins
CREATE OR REPLACE VIEW CrimeSceneDetails AS
SELECT cs.id AS crime_scene_id, cs.date, cs.time, cs.location, cs.description,
       e.id AS evidence_id, e.name AS evidence_name, e.type AS evidence_type, e.description AS evidence_description,
       s.id AS statement_id, s.statement,
       o.officer_id,
       w.id AS witness_id, p.first_name AS witness_first_name, p.last_name AS witness_last_name
FROM crime_scene cs
LEFT JOIN evidence e ON cs.id = e.crime_scene_id
INNER JOIN statement s ON cs.id = s.crime_scene_id
FULL JOIN officers_on_crime_scene o ON cs.id = o.crime_scene_id
RIGHT JOIN witnesses_on_crime_scene woc ON cs.id = woc.crime_scene_id
LEFT JOIN witness w ON woc.witness_id = w.id
INNER JOIN person p ON w.person_id = p.id;

-- group by and having
CREATE OR REPLACE VIEW CaseDetails AS
SELECT c.id AS case_id, c.status, c.crime_scene_id,
       STRING_AGG(ch.description, ', ') AS charge_descriptions
FROM "case" c
LEFT JOIN charge ch ON c.id = ch.case_id
GROUP BY c.id, c.status, c.crime_scene_id
HAVING c.id > 0;

-- limit + offset, order by
CREATE OR REPLACE VIEW SevereCrimeWitnesses AS
SELECT c.id AS crime_id, c.name AS crime_name, c.description AS crime_description, c.severity AS crime_severity,
       w.id AS witness_id, p.first_name AS witness_first_name, p.last_name AS witness_last_name
FROM crime c
JOIN crime_scene cs ON c.id = cs.crime_id
JOIN witnesses_on_crime_scene woc ON cs.id = woc.crime_scene_id
JOIN witness w ON woc.witness_id = w.id
JOIN person p ON w.person_id = p.id
WHERE CAST(c.severity as INTEGER)  > 10
ORDER BY p.first_name
LIMIT 10
OFFSET 0;

-- subquery
CREATE OR REPLACE VIEW CaughtPersonOfInterestDetails AS
SELECT poi.id AS person_of_interest_id, p.first_name, p.last_name, p.date_of_birth, p.gender, p.nationality,
       ci.phone_number, ci.email, poi.status
FROM person_of_interest poi
JOIN (
    SELECT id, first_name, last_name, date_of_birth, gender, nationality
    FROM person) p ON poi.person_id = p.id -- p is a subquery
JOIN contact_information ci ON p.id = ci.id
WHERE poi.status != 'on a run';

-- intersect
CREATE OR REPLACE VIEW OldestRegisteredPersons AS
SELECT p.first_name, p.last_name, p.gender, p.date_of_birth, p.id
FROM person p
INTERSECT
SELECT p.first_name, p.last_name, p.gender, p.date_of_birth, p.id
FROM person p
WHERE p.id < 50
ORDER BY id;

-- except
CREATE OR REPLACE VIEW LatestRegisteredPersons AS
(SELECT p.first_name, p.last_name, p.gender, p.date_of_birth, p.id
FROM person p
EXCEPT
SELECT p.first_name, p.last_name, p.gender, p.date_of_birth, p.id
FROM person p
WHERE p.id < ((SELECT count(*) FROM person) - 30))
ORDER BY id;

-- union
CREATE OR REPLACE VIEW InvestigationPersons AS
(SELECT p.first_name, p.last_name, p.gender, p.date_of_birth, p.id, 'witness' as role
FROM person p
JOIN witness w on p.id = w.person_id
WHERE w.person_id = p.id
UNION
SELECT p.first_name, p.last_name, p.gender, p.date_of_birth, p.id, 'person of interest' as role
FROM person p
JOIN person_of_interest poi on p.id = poi.person_id
WHERE poi.person_id = p.id)
ORDER BY id;