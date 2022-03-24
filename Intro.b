    PROGRAM Intro
* Working with Strings
    name = 'Moises Madade'
    company = 'CPC'
    address = 'Ndlavela, Q.17, C. 111'
    CRT "My name is ": name :" I am a trainee at ": company :" and I live in ": address

    firstname = name[1,6]
    CRT firstname
    CRT @(-1)       ;* clear screen

    CRT "My name has ": LEN(name) : " characters"
    CRT "My first name is ": LEFT(name,6)
    CRT "My last name is ": RIGHT(name,6)
    CRT "Company is ": UPCASE(company)
    CRT "Company is ": DOWNCASE(company)
    CRT STR(firstname,3)

* Now with numbers
    CRT @(-1)
    age = 23
    salary = 6000.50
    company2 = 'AR'
    salary2 = 0.0

    CRT "My name is ": name :" and I earn ": salary :" at age ": age

* Now with Dynamic Arrays
    employee = name:@FM:address:@FM:age:@FM:company:@VM:salary:@FM:company2:@VM:salary2
    CRT @(-1)
    PRINT FMT(employee, 'MCP')
    CRT "Name: ": employee<1>
    CRT "Address: " : employee<2>
    CRT "Age: ": employee<3>
    CRT "Company: ": employee<4,1>
    CRT "Salary: ": employee<4,2>
    CRT "Another Company: ": employee<5,1>
    CRT "Another Company's Salary: ": employee<5,2>

* Conversion of characters in a String
    loan_request = '001*Anne*EUR*348990*240*0.031'
    CONVERT '*' TO @FM IN loan_request
    CRT ""
    CRT @(-1)
    CRT FMT(loan_request, 'MCP')
    CRT "" 
    PRINT loan_request<2>:" requested ": loan_request<3>:"":loan_request<4>:" on ": loan_request<6>*100 :"% to pay in ": loan_request<5>/12 :" years."

* Working with Dimensional arrays
    rows = 2
    cols = 3
    DIM arr(rows,cols)
    arr(1,1)=1
    arr(1,2)=2
    arr(1,3)=3
    arr(2,1)=4
    arr(2,2)=5
    arr(2,3)=6

    FOR r=1 TO rows
        FOR c=1 TO cols
            CRT arr(r,c)
        NEXT c
    NEXT r
    CRT @(-1)
*Converting to Dynamic array
    MATBUILD arr2 FROM arr USING CHAR(32)
    PRINT arr2
    CRT ""

*Converting to Dimensional array
    DIM arr3(3,2)
    MATPARSE arr3 FROM arr2 USING CHAR(32)
    CRT arr3(3,1)
END
