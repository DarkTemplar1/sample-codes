//trigger - funkcja wyzwalająca, która aktualizuje kolumnę w tabeli za każdym razem, gdy wstawiany jest nowy wiersz
															
CREATE OR REPLACE FUNCTION update_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.badge_number := 'new_value';
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_column_trigger
AFTER INSERT ON officer
FOR EACH ROW
EXECUTE FUNCTION update_column();


//granty, role

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



//funkcja z tranzakcją

BEGIN TRANSACTION;

INSERT INTO 
  contact_information (phone_number, email)
VALUES
  ('797502620', 'rodrigo@gmail.com');

COMMIT;  
