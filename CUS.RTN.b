    SUBROUTINE CUS.RTN
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
    cust_id = '101258'
    cust_rec = ''
    RETURN
OPENFILES:
    CALL OPF(fn_cust,f_cust)
    RETURN
PROCESS: 
    CALL F.READU(fn_cust,cust_id,cust_rec,f_cust,err,'')
    CRT "MNEMONIC: ": cust_rec<Customer_Mnemonic>
    CRT "SECTOR: ": cust_rec<Customer_Sector>
    CRT "NAME 2: ": cust_rec<Customer_Name2>

    cust_rec<Customer_Name2> = ""

    CALL F.WRITE(fn_cust,cust_id,cust_rec)
  * CALL JOURNAL.UPDATE(cust_id)
    CRT "MNEMONIC: ": cust_rec<Customer_Mnemonic>
    CRT "SECTOR: ": cust_rec<Customer_Sector>
    CRT "NAME 2: ": cust_rec<Customer_Name2>

    RETURN 
END
