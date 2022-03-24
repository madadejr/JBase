    PROGRAM MDD.FML.CALC
    CRT @(-1)
    CRT "Welcome to FML calculator!"

    PROMPT "Enter the loan amount (MZN): "
    INPUT loan_amount
    PROMPT "Enter the client's salary (MZN): "
    INPUT salary
    PROMPT "Enter the descount amount (MZN): "
    INPUT descount
    PROMPT "Enter the amount of the last FML (MZN): "
    INPUT fml

    capacity = 0
    ability = false

    PRECISION 7
    capacity = ((salary - descount)/3) - fml

    IF loan_amount LT capacity THEN
        ability = true
        CRT "The client is able to borrow that amount and his capacity is (MZN): ": DROUND(capacity,4)
    END ELSE
        CRT "The client is not able to borrow that amount and his capacity is (MZN): ": DROUND(capacity,4)
    END
END
