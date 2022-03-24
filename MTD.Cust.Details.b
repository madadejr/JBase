    SUBROUTINE MTD.Cust.Details(cust_id, cust_name, cust_country, cust_nati, cust_add, cust_curr)
* @in       : cust_id
* @out      : cust_id, cust_name, cust_cat, cust_curr...
* Author    : Moises Madade (moises.jr@cpc.co.mz)
* Date      : 05/11/2021

    $INSERT T24.BP I_COMMON   ;* Holds all the common variables
    $INSERT T24.BP I_EQUATE   ;* Its a must to put this
    $INSERT T24.BP I_F.CUSTOMER         ;* It could be any other we want to work with

    fn_cust = 'F.CUSTOMER'
    f_cust = ''
    cust_rec = ''

    cust_nati = ''
    cust_name = ''
    cust_country = ''
    cust_curr = ''
    cust_add = ''

    CALL LOAD.COMPANY('BNK')
    CALL OPF(fn_cust, f_cust)
    CALL F.READ(fn_cust, cust_id, cust_rec, f_cust, err)

    cust_nati = cust_rec<Customer_Nationality>
    cust_name = cust_rec<Customer_Name1>
    cust_add = cust_rec<Customer_Street>
    cust_curr = cust_rec<Customer_Sector>
    cust_country = cust_rec<Customer_TownCountry>
    
    RETURN
END
