    PROGRAM TEST.CALL.J

    class_name = "io.madade.test.Greeting"
    method_name = "hello"
    param = "Carmen!"

    CALLJ class_name, method_name, param SETTING ret ON ERROR
        err = SYSTEM(0)
        CRT "Error code ": err
        RETURN
    END

    CRT ""
    CRT "Received from java ": ret
END
