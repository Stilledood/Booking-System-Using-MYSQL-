-- # # # # # # # # TESTS # # # # # # # #

USE sport_bookings;

-- # # # # # # # # CHECK IF ALL TABLES ARE CREATED CORRECTLLY # # # # # # # #

SELECT * FROM members;
SELECT * FROM rooms;
SELECT * FROM bookings;
SELECT * FROM pending_terminations;


-- # # # # # # # # CHECK IF THE PROCEDURES WORK CORRECTLLY # # # # # # # #

CALL insert_new_member('angelolott','1234abcd','angeloloto@gmail.com');
SELECT * FROM members ORDER BY member_since DESC;

-- NOW WE WILL CHECK THE TRIGGER-WE WILL TRY TO DELETE 2 ENTRIES FROm member TABLE-ONE WITH NO PAYMENT DUE THE OTHER WITH A PYMENT DUE

SELECT * FROM members WHERE id IN('little31','amely_18');
CALL delete_member('amely_18');
CALL delete_member('little31');
SELECT * FROM pending_terminations;
SELECT * FROM members;

-- CHECK IF UPDATE PROCEDURES WORK

CALL update_member_password('afeil','1234567890');
SELECT * FROM members WHERE id='afeil';

CALL update_member_email('afeil','Abdul.Feil@gmail.com');
SELECT * FROM members WHERE id='afeil';

-- CHECK IF THE UPDATE PAYMENT PROCEDURE WORKS

SELECT * FROM members WHERE id='marvin1';
SELECT * FROM bookings WHERE member_id='marvin1';

CALL update_payment(9);

SELECT * FROM members WHERE id='marvin1';
SELECT * FROM bookings WHERE member_id='marvin1';

-- CHECK search_rooms PROCEDURE

CALL search_rooms('Archery Range', '2017-12-26', '13:00:00');
CALL search_rooms('Badminton Court', '2018-04-15', '14:00:00');

-- CHECK make_booking PROCEDURE

CALL make_booking('AR', '2017-12-26', '13:00:00', 'noah51');
CALL make_booking('T1' ,CURDATE() + INTERVAL 2 WEEK,'11:00:00','noah51');
SELECT * FROM bookings LIMIT 30;

-- CHECK cancel_booking PROCEDURE

CALL cancel_booking(1,@message);
SELECT @message;

CALL cancel_booking(12,@message);
SELECT @message;

