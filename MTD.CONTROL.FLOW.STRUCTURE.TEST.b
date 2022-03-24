    PROGRAM MTD.CONTROL.FLOW.STRUCTURE.TEST

    customers = '180032,101258,100289,102497,101875,100960,100693,101658'
    CHANGE ',' TO @FM IN customers
    CRT @(-1)
    LOOP
        REMOVE cust_id FROM customers SETTING pos
    WHILE cust_id: pos
        CALL MTD.CONTROL.FLOW.STRUCTURE(cust_id, cust_name, cust_residence)
        
        BEGIN CASE
        CASE cust_residence EQ 'MATOLA'
            CRT cust_id :' - ': cust_name :' - ': cust_residence
        CASE cust_residence EQ 'MAPUTO'
            CRT cust_name :' is a resident from Maputo.'
        END CASE
    REPEAT  
END
