function cv(Subs::String; T = 300)

    #T (Temperature) is a keyword argument, usually T = 300 K. 

    return CoefMolarCpPropTable[Subs]["a"] + CoefMolarCpPropTable[Subs]["b"]*T + CoefMolarCpPropTable[Subs]["c"]*T^2 + CoefMolarCpPropTable[Subs]["d"]*T^3

end


