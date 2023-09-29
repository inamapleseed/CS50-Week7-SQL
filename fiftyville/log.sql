-- get the thief
-- people in carpark // widrawers // callers
SELECT DISTINCT(people.name), phone_number, license_plate FROM people
    JOIN bank_accounts ON people.id = bank_accounts.person_id
    JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
    WHERE atm_transactions.month = 7 AND atm_transactions.day = 28 AND atm_location = 'Leggett Street' AND license_plate
    IN (SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute > 14 AND minute < 26)
    AND phone_number IN (SELECT caller FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 61);
-- receivers
SELECT * FROM people JOIN phone_calls ON people.phone_number = phone_calls.receiver WHERE phone_number IN (SELECT receiver FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 61) AND caller IN (SELECT phone_number FROM people
    JOIN bank_accounts ON people.id = bank_accounts.person_id
    JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
    WHERE atm_transactions.month = 7 AND atm_transactions.day = 28 AND atm_location = 'Leggett Street' AND license_plate
    IN (SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute > 14 AND minute < 26)
    AND phone_number IN (SELECT caller FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 61));
-- city EARLIEST: NYC
-- in flight: thief
SELECT DISTINCT(people.name) FROM people
    JOIN bank_accounts ON people.id = bank_accounts.person_id
    JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
    WHERE atm_transactions.month = 7 AND atm_transactions.day = 28 AND atm_location = 'Leggett Street' AND license_plate
    IN (SELECT license_plate FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute > 14 AND minute < 26)
    AND phone_number IN (SELECT caller FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 61) AND passport_number IN (SELECT passport_number FROM passengers JOIN flights ON passengers.flight_id = flights.id WHERE destination_airport_id = (SELECT destination_airport_id FROM flights JOIN airports ON flights.destination_airport_id = airports.id WHERE month = 7 AND day = 29 AND origin_airport_id = 8 ORDER BY hour ASC LIMIT 1) AND month = 7 AND day = 29);