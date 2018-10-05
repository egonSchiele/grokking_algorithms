SET SERVEROUTPUT ON
DECLARE  
   result NUMBER; 
   
FUNCTION countdown(x NUMBER)  
RETURN NUMBER  
IS  
   f NUMBER;
 
BEGIN  
    dbms_output.put_line(x);
   IF x <= 0  THEN  
      return x;
   ELSE  
      f := countdown(x - 1);  
   END IF;  
RETURN f;  
END;  
   
BEGIN  
  result := countdown(5);  
END; 