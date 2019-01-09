CREATE OR REPLACE PROCEDURE greet2(names IN VARCHAR2 ) 
IS 
BEGIN
    dbms_output.put_line('how are you, ' || names || '?'); 
END;
/

CREATE OR REPLACE PROCEDURE bye
IS
BEGIN
    dbms_output.put_line('ok bye!');
END;
/
 
CREATE OR REPLACE PROCEDURE greet(names IN VARCHAR2)
IS
BEGIN
     dbms_output.put_line('hello, ' || names || '!');
     greet2(names);
     dbms_output.put_line('getting ready to say bye...');
     bye();
END;
/

SET SERVEROUTPUT ON  
BEGIN  
   greet('adit');
END;  