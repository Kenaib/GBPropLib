function cp(Subs::String; T = 300, Base = "MO")

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


