-- 3. How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? 
-- Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.

SELECT facid, name, membercost, monthlymaintenance
FROM facilities
WHERE membercost < monthlymaintenance / 50;


-- 4. How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

SELECT * FROM facilities
WHERE facid in (1, 5);


-- 5. You'd like to get the signup date of your last member. How can you retrieve this information?

SELECT joindate
FROM members
ORDER BY joindate DESC
LIMIT 1;



-- 6. You'd like to get the first and last name of the last member(s) who signed up - not just the date. How can you do that?

SELECT firstname, surname
FROM members
ORDER BY joindate DESC
LIMIT 3;



-- 7. Produce a list of the total number of slots booked per facility. For now, just produce an output table consisting of facility id and slots, sorted by facility id.

SELECT facid,
SUM(slots)
FROM bookings
GROUP BY facid
ORDER BY facid;



-- 8. Find the total number of members (including guests) who have made at least one booking.

SELECT COUNT(DISTINCT memid) as members_guests_total
FROM bookings;



-- 9. Produce a monotonically increasing numbered list of members (including guests), ordered by their date of joining. Remember that member IDs are not guaranteed to be sequential.

SELECT
memid, joindate, row_number () OVER (order by joindate) as row_num
FROM members
ORDER BY joindate;



-- 10. How can you produce a list of the start times for bookings by members named 'David Farrell’?

SELECT starttime
FROM bookings AS book
INNER JOIN members AS mem
ON book.memid = mem.memid
WHERE mem.firstname = 'David' AND mem.surname = 'Farrell';



-- 11. How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time

SELECT starttime, fac.name
FROM bookings AS book
INNER JOIN facilities AS fac
ON book.facid = fac.facid
WHERE fac.name LIKE '%Tennis Court%'
AND book.starttime::date = '2012-09-21'
ORDER BY book.starttime;



-- 12. How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

SELECT DISTINCT memOne.
* FROM members AS memOne
INNER JOIN members AS memTwo
ON memOne.memid = memTwo.recommendedby
ORDER BY surname, firstname;