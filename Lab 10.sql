--Mike Sanzo
--Lab 10 (last lab :( )
--Database Mangagement
--November 21,2016

--func1on PreReqsFor(courseNum)-Returns the immediate prerequisites for the passed-in course number.
CREATE or REPLACE FUNCTION PreReqsFor(IN courseNumber integer) RETURNS SETOF integer AS 
$$	
BEGIN

	return query (SELECT courses.num
		      FROM courses
		      WHERE courses.num IN (SELECT prereqnum
					    FROM prerequisites
					    WHERE prerequisites.coursenum = courseNumber));
END;
$$
language PLPGSQL;

--func1on IsPreReqFor(courseNum) - Returns the courses for which the passed-in course number is an immediate pre-requisite.
CREATE or REPLACE FUNCTION IsPreReqFor (IN courseNumber integer) reutrns SETOF integer AS
$$
BEGIN

	return query (SELECT prerequisites.courseNum
		      FROM prerequisites
		      WHERE prerequisites.preReqNum = courseNumber);
END;
$$
language PLPGSQL;

			