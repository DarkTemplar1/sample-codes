CREATE TABLE officer (
  id SERIAL PRIMARY KEY,
  rank VARCHAR(20),
  is_manager BOOLEAN DEFAULT FALSE
);

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
