    PROGRAM MDD.SEND.SMS.ALERT.RUN
    CRT @(-1)
    PRINT 'INSERT THE ACCOUNT NUMBER: '
    INPUT acc_id
    CRT ''
    PRINT 'INSERT THE PHONE NUMBER: '
    INPUT mobile
    CRT ''
    PRINT 'INSERT IF WHETHER IS A CREDIT (CR) OR DEBIT (DR): '
    INPUT cr_dr
    CRT ''
    PRINT 'INSERT THE AMOUNT: '
    INPUT amount
    CRT ''
    txn = 'MZN': @FM : amount : @FM : cr_dr : @FM : 'Payment for your bills at CPC.'

    CALL MDD.SEND.SMS.ALERT(mobile, acc_id, txn, text)
    CRT text

END
