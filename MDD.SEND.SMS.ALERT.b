    SUBROUTINE MDD.SEND.SMS.ALERT(mobile, acc_id, txn, text)

    $INSERT T24.BP I_COMMON
    $INSERT T24.BP I_EQUATE
    $INSERT T24.BP I_F.ACCOUNT

    text = ''
    dr_cr = 'debited from'

    CALL MDD.GET.RECORD('F.ACCOUNT', acc_id, acc_rec)
    acc_name = acc_rec<Account_ShortTitle>

    CALL GET.LOC.REF('ACCOUNT', 'SMS.ALERT', posn)
    sms_alert = acc_rec<Account_LocalRef, posn>

    IF sms_alert NE 'Y' THEN RETURN

    currency = txn<1>
    amount = txn<2>
    details = txn<4>

    IF txn<3> EQ 'CR' THEN dr_cr = 'credited to'

    text = 'Hi ': acc_name :', ' : currency : ' ' : amount : ' has been '
    text := dr_cr : ' your account ': acc_id : '. Details: ': details

*Sending SMS
    CRT 'Sendig SMS to ': mobile

    RETURN
END
