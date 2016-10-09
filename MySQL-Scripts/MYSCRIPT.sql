USE BPUB;

/*Q.3 Which students have picked up their books?*/
SELECT SID, FNAME, LNAME, SUFFIX, STREET, CITY, STATE, ZIP
  FROM STUDENT
	WHERE SID IN
	 (SELECT DISTINCT SRBID 
		FROM RETRIEVED_BOOK);
        
/* Q.6 Which students have books in need of retrieval? */
SELECT SID, FNAME, LNAME, SUFFIX, STREET, CITY, STATE, ZIP
  FROM STUDENT
	WHERE SID IN
	 (SELECT DISTINCT SUID 
		FROM UNRETRIEVED_BOOK);
        
/*Q.9 Which students have not sold any books? */
SELECT SID, FNAME, LNAME, SUFFIX, STREET, CITY, STATE, ZIP
  FROM STUDENT
	WHERE SID NOT IN
	 (SELECT DISTINCT SSBID 
		FROM SOLD_BOOK);
        
/*Q.12 How many different students have tried to sell a copy of “Inside Outsourcing”? */
 SELECT SID, FNAME, LNAME, SUFFIX, STREET, CITY, STATE, ZIP
  FROM STUDENT
	WHERE SID IN
	 (SELECT DISTINCT SSID 
		FROM BOOK_COPY BC, BOOK BK
			WHERE BC.ISBN=BK.ISBN
				AND BK.TITLE LIKE '%Inside Outsourcing%');
                
/* Q.15 List the first and last name of students who have both purchased
a book from us and received payment from us for a sold book. */
SELECT FNAME, LNAME
  FROM STUDENT
  WHERE SID IN (SELECT DISTINCT BSID
	FROM PAYMENT P, SALE SL
		WHERE P.SSID=SL.BSID);
