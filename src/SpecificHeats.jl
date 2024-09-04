#cp = a + bT + cT^2 + dT^3
#cv = a - Ru + bT + cT^2 + dT^3
#u = (a - Ru)*(T-Tref) + bT^2/2 + cT^3/3 + dT^4/4
#h = aT + bT^2/2 + cT^3/3 + dT^4/4

function cp(Subs::String; T = 300, Base = "MO")

    #This function works well in the 273 K - 1500 K range.

    #T (Temperature) is a keyword argument, usually T = 300 K. 

    #Base: MO (molar) or MA (mass)
    
    if Subs ∉ keys(CoefMolarCpPropTable)

        error("This substance is not supported yet!")

    else

        if Base == "MO"

            return CoefMolarCpPropTable[Subs]["a"] + CoefMolarCpPropTable[Subs]["b"]*T + CoefMolarCpPropTable[Subs]["c"]*T^2 + CoefMolarCpPropTable[Subs]["d"]*T^3

        elseif Base == "MA"

            return 1/MolarMassPropTable[Subs] * (CoefMolarCpPropTable[Subs]["a"] + CoefMolarCpPropTable[Subs]["b"]*T + CoefMolarCpPropTable[Subs]["c"]*T^2 + CoefMolarCpPropTable[Subs]["d"]*T^3)

        end

    end

end

function cv(Subs::String; T = 300, Base = "MO")

    #This function works well in the 273 K - 1500 K range.

    #T (Temperature) is a keyword argument, usually T = 300 K. 

    #Base: MO (molar) or MA (mass)
    
    if Subs ∉ keys(CoefMolarCvPropTable)

        error("This substance is not supported yet!")

    else

        if Base == "MO"

            return CoefMolarCpPropTable[Subs]["a"] - NatureConst["Ru"] + CoefMolarCpPropTable[Subs]["b"]*T + CoefMolarCpPropTable[Subs]["c"]*T^2 + CoefMolarCpPropTable[Subs]["d"]*T^3

        elseif Base == "MA"

            return 1/MolarMassPropTable[Subs] * (CoefMolarCpPropTable[Subs]["a"] - NatureConst["Ru"] + CoefMolarCpPropTable[Subs]["b"]*T + CoefMolarCpPropTable[Subs]["c"]*T^2 + CoefMolarCpPropTable[Subs]["d"]*T^3)

        end

    end

end

function u(Subs::String; T = 300, Tref = 0, Base = "MO")

    if Subs ∉ keys(CoefMolarCvPropTable)

        error("This substance is not supported yet!")

    else

        if Base == "MO"

            return (CoefMolarCpPropTable[Subs]["a"] - NatureConst["Ru"])*(T-Tref) + CoefMolarCpPropTable[Subs]["b"]*(T^2/2-Tref^2/2) + CoefMolarCpPropTable[Subs]["c"]*(T^3/3-Tref^3/3) + CoefMolarCpPropTable[Subs]["d"]*(T^4/4-Tref^4/4)

        elseif Base == "MA"

            return 1/MolarMassPropTable[Subs] * ((CoefMolarCpPropTable[Subs]["a"] - NatureConst["Ru"])*(T-Tref) + CoefMolarCpPropTable[Subs]["b"]*(T^2/2-Tref^2/2) + CoefMolarCpPropTable[Subs]["c"]*(T^3/3-Tref^3/3) + CoefMolarCpPropTable[Subs]["d"]*(T^4/4-Tref^4/4))

        end

    end

end

function h(Subs::String; T = 300, Tref = 0, Base = "MO")

    if Subs ∉ keys(CoefMolarCvPropTable)

        error("This substance is not supported yet!")

    else

        if Base == "MO"

            return CoefMolarCpPropTable[Subs]["a"]*(T-Tref) + CoefMolarCpPropTable[Subs]["b"]*(T^2/2-Tref^2/2) + CoefMolarCpPropTable[Subs]["c"]*(T^3/3-Tref^3/3) + CoefMolarCpPropTable[Subs]["d"]*(T^4/4-Tref^4/4)

        elseif Base == "MA"

            return 1/MolarMassPropTable[Subs] * (CoefMolarCpPropTable[Subs]["a"]*(T-Tref) + CoefMolarCpPropTable[Subs]["b"]*(T^2/2-Tref^2/2) + CoefMolarCpPropTable[Subs]["c"]*(T^3/3-Tref^3/3) + CoefMolarCpPropTable[Subs]["d"]*(T^4/4-Tref^4/4))

        end

    end

end




