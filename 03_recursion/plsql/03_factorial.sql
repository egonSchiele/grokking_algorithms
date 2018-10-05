SET SERVEROUTPUT ON
DECLARE  
   result NUMBER; 

FUNCTION factorial(x NUMBER)  
RETURN NUMBER  
IS  
   f NUMBER;
   
BEGIN  
   IF x = 0  THEN  
      f := 1;
   ELSE  
      f := x * factorial(x - 1);  
   END IF;  
RETURN f;  
END;  
   
BEGIN  
  result := factorial(5);  
  dbms_output.put_line(result);
END;  
