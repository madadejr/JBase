    SUBROUTINE SOME.THING.NEW(cust_id_ref, cust_rec)
    $INSERT T24.BP I_COMMON
    $INSERT T24.BP I_EQUATE
    $INSERT T24.BP I_F.CUSTOMER
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN

INIT:
    fn_cust = 'FBNK.CUSTOMER'
    f_cust = ''
    cust_rec = ''

    RETURN

OPENFILES:
    CALL OPF(fn_cust,f_cust)

    RETURN

PROCESS:
    SEL.CMD = "SSELECT ": fn_cust
    CALL EB.READLIST(SEL.CMD, SEL.LIST,'', NO.OF.REC, RET.CODE)
    FOR counter = 1 TO NO.OF.REC
        cust_id = SEL.LIST<counter>
        CALL F.READ(fn_cust,cust_id,cust_rec,f_cust,err)
        IF cust_id = cust_id_ref THEN
            CRT 'NOME> ' :cust_rec<EB.CUS.SHORT.NAME>
        END
    NEXT counter
    RETURN
END

