    PROGRAM MTD.EQUATE.TEST
    $INSERT MADADE.BP I_Transaction

*txn = 'USD': @FM : 30500.90 : @FM : 'CR' : @FM : 'Pyt for T24 Training'
    txn<1> = 'USD'
    txn<Amount> = 30500.90
    txn<3> = 'CR'
    txn<Details> = 'Pyt for T24 Training'

    CRT txn<Details>:" in amount of ": txn<Amount> :" with Currency ": txn<Currency> :", meaning a ": txn<CrDr>
END
