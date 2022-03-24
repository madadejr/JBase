*Conditional Statements: IF and CASE
*Loops: FOR...NEXT and LOOP...REPEAT
    SUBROUTINE MTD.CONTROL.FLOW.STRUCTURE(cust_id, cust_name, cust_residence)
    $INSERT T24.BP I_COMMON
    $INSERT T24.BP I_EQUATE
    $INSERT T24.BP I_F.CUSTOMER
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
INIT:
    fn_cust = 'F.CUSTOMER'
    f_cust = ''
    cust_rec = ''
    RETURN
OPENFILES:
    CALL OPF(fn_cust, f_cust)
    RETURN
PROCESS:
    CALL F.READ(fn_cust, cust_id, cust_rec, f_cust, err)
    cust_name   = cust_rec<EB.CUS.SHORT.NAME>
    cust_residence = cust_rec<EB.CUS.TOWN.COUNTRY>
    RETURN
END
