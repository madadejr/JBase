    PROGRAM SUB.WRITE
    $INSERT T24.BP I_COMMON
    $INSERT T24.BP I_EQUATE
    $INSERT T24.BP I_F.CUSTOMER

    GOSUB INIT
    GOSUB PROCESS

    RETURN

INIT:
    fn_cust = 'FBNK.CUSTOMER'
    f_cust = ''
    cust_rec = ''
    cust_id = ''
    CALL OPF(fn_cust, f_cust)
    SEL.CMD = 'SSELECT ':fn_cust
    CUS.LIST = ''
    NO.OF.REC = ''
    RET.CODE = ''
    RETURN

PROCESS:
    CALL EB.READLIST(SEL.CMD, CUS.LIST,'',NO.OF.REC,RET.CODE)
    FOR COUNTER = 1 TO NO.OF.REC

        cust_id = CUS.LIST<COUNTER>
        CALL F.READ(fn_cust,cust_id,cust_rec,f_cust,err)
        account_officer_old = cust_rec<EB.CUS.ACCOUNT.OFFICER>

        IF account_officer_old = 3 THEN
            account_officer_new = 4
            cust_rec<EB.CUS.ACCOUNT.OFFICER> = account_officer_new
            CALL F.WRITE(fn_cust,cust_id,cust_rec)

            CRT cust_id :' - ': cust_rec<EB.CUS.SHORT.NAME> :' - ': cust_rec<EB.CUS.ACCOUNT.OFFICER>
*CALL JOURNAL.UPDATE(cust_id)
        END
    NEXT COUNTER
    RETURN
END
