    PROGRAM MTD.MultiValue
    CRT @(-1)
    PRINT "Enter the customer ID: "
    INPUT cust_id

    CALL MTD.Cust.Details(cust_id, cust_name, cust_country, cust_nati, cust_add, cust_curr)
    CRT "Customer id: ": cust_id 
    CRT "Customer name: ": FMT(cust_name, 'MCP')
    CRT "Customer country: ": FMT(cust_country, 'MCP')
    CRT "Customer nationality: ": FMT(cust_nati, 'MCP')
    CRT "Customer address: ": FMT(cust_add, 'MCP')
    CRT "Customer sector: ": FMT(cust_curr, 'MCP')
    
END
