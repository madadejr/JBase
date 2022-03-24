    SUBROUTINE CUS.SELECT
    $INSERT T24.BP I_COMMON
    $INSERT T24.BP I_EQUATE
    $INSERT T24.BP I_F.ACCOUNT
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
INIT:
    fn_cust = 'F.ACCOUNT'
    f_cust = ''
    cust_id = ''
    cust_rec = ''
    cont = 1
    RETURN
OPENFILES:
    CALL OPF(fn_cust,f_cust)
    RETURN
PROCESS:
    SEL.CMD = "SSELECT ": fn_cust
    CALL EB.READLIST(SEL.CMD, SEL.LIST,'', NO.OF.REC, RET.CODE)
    LOOP
        REMOVE cust_id FROM SEL.LIST SETTING POS
    WHILE cust_id: POS
        CALL F.READ(fn_cust,cust_id,cust_rec,f_cust,err)
        CRT "CUSTOMER ":cont
        CRT "ID: ":cust_id
        CRT "CATEGORY: ":cust_rec<AC.CATEGORY>
        CRT "CURRENCY: ":cust_rec<AC.CURRENCY>
        cont = cont+1
    REPEAT  
    RETURN
END
