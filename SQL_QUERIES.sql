-- List the names of technical analysts and the total number of the blood units processed by them in the ascending order of the number of blood units processed.
-- Requests (`request_id`, `blood_group`, `units_of_blood`)
-- Technical_Analyst (`ta_id`, `ta_name`, `ta_surname`, `bb_id`)
-- Technical_Analyst_Blood (`ta_id`, `bu_id`, `blood_group`)

SELECT technical_analyst_186.ta_name, SUM(requests_186.units_of_blood) AS TOTAL
FROM technical_analyst_186 NATURAL JOIN technical_analyst_blood_186 NATURAL JOIN requests_186
GROUP BY technical_analyst_186.ta_name
ORDER BY TOTAL;

-- Write a function to set the health status of a donor. If the donor has some associated disease, set health status to 'Fair', else to 'Good'
-- Donor (`d_id`, `d_name`, `d_surname`, `d_gender`, `blood_group`, `contact_no`, `d_street`, `d_house_number`, `d_locality`, `d_age`, `d_disease`, `id_blood`, `bloodGroup_Blood`, `id_rt`, `date_register)

DELIMITER $$
CREATE FUNCTION health_status_186(disease VARCHAR(10))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE return_value varchar(10);
	IF LOWER(disease) = 'nil'
    	THEN SET return_value = 'Good';
    ELSE
    	SET return_value = 'Fair';
    END IF;
    
    RETURN return_value;
END
$$
DELIMITER ;	

SELECT `d_id`, `d_name`, `d_surname`, health_status_186(donor_186.d_disease) FROM donor_186;

