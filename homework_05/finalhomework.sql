-- PART 1
-- Create new table actors_logging_table, that will have the following columns: log_id SERIAL, actor_name VARCHARR, insertion_time TIMESTAMP
-- Create new trigger actor_insert_trigger, and bind it to the actors table. Whenever a new actor is inserted, add new record/insertion in the 
-- actors_logging_table with the correct data.


CREATE TABLE actors_logging_table (
	log_id SERIAL PRIMARY KEY,
	actor_name VARCHAR(100),
	insertion_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE OR REPLACE FUNCTION actor_insert_trigger_function ()
RETURNS TRIGGER
AS $$

BEGIN
     
	INSERT INTO actors_logging_table (actor_name)
    VALUES (NEW.name);
    RETURN NEW;
	 
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER actor_insert_trigger
AFTER INSERT ON actors
FOR EACH ROW
EXECUTE FUNCTION actor_insert_trigger_function();

INSERT INTO actors (name, nationality, birth_year)
VALUES ('Robert Downey Jr.', 'American', 1965),
VALUES ('Karen Sheila Gillan', 'Scottish', 1987);

SELECT * FROM actors;
SELECT * FROM actors_logging_table;





-- PART 2
-- Create new trigger actors_delete_trigger and bind it to the table actors.
-- Execute the trigger on DELETE, and whenever a row/record is deleted, RAISE NOTICE with the following message 
-- format 'Row with id: some_id, and actor with name: some_actor_name was deleted' -> Example message: "Actor with id: 1, and with name John Doe was deleted."


CREATE OR REPLACE FUNCTION actors_delete_trigger_function ()
RETURNS TRIGGER
AS $$

BEGIN

    RAISE NOTICE 'Row with id: %, and actor with name: % was deleted', OLD.actor_id, OLD.name;
    RETURN OLD;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER actors_delete_trigger
AFTER DELETE ON actors
FOR EACH ROW
EXECUTE FUNCTION actors_delete_trigger_function();


DELETE FROM movieactors WHERE actor_id = 6;
DELETE FROM actors WHERE actor_id = 6;
-- NOTICE:  Row with id: 6, and actor with name: John Travolta was deleted
-- DELETE 1

-- Query returned successfully in 75 msec. (Duri i ovaa poraka ja kopirav)





-- PART 3 BONUS
-- Create a procedure for adding new Actor ( get inspiration from the procedure from the class )


CREATE OR REPLACE PROCEDURE AddActor(
	IN actor_name VARCHAR (100),
	IN nationality VARCHAR (50),
	IN birth_year INT
)
AS $$

BEGIN

    INSERT INTO actors(name, nationality, birth_year)
    VALUES(actor_name, nationality, birth_year);
	 
    COMMIT;

END;
$$ LANGUAGE plpgsql;

CALL AddActor('Sean Connery', 'Scottish', 1930);

SELECT * FROM actors;