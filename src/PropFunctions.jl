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
    
    if Subs ∉ keys(CoefMolarCpPropTable)

        error("This substance is not supported yet!")

    else

        if Base == "MO"

            return CoefMolarCpPropTable[Subs]["a"] - NatureConst["Ru"] + CoefMolarCpPropTable[Subs]["b"]*T + CoefMolarCpPropTable[Subs]["c"]*T^2 + CoefMolarCpPropTable[Subs]["d"]*T^3

        elseif Base == "MA"

            return 1/MolarMassPropTable[Subs] * (CoefMolarCpPropTable[Subs]["a"] - NatureConst["Ru"] + CoefMolarCpPropTable[Subs]["b"]*T + CoefMolarCpPropTable[Subs]["c"]*T^2 + CoefMolarCpPropTable[Subs]["d"]*T^3)

        end

    end

end

function Δu(Subs::String; T = 300, Tref = 0, Base = "MO")

    if Subs ∉ keys(CoefMolarCpPropTable)

        error("This substance is not supported yet!")

    else

        if Base == "MO"

            return (CoefMolarCpPropTable[Subs]["a"] - NatureConst["Ru"])*(T-Tref) + CoefMolarCpPropTable[Subs]["b"]*(T^2/2-Tref^2/2) + CoefMolarCpPropTable[Subs]["c"]*(T^3/3-Tref^3/3) + CoefMolarCpPropTable[Subs]["d"]*(T^4/4-Tref^4/4)

        elseif Base == "MA"

            return 1/MolarMassPropTable[Subs] * ((CoefMolarCpPropTable[Subs]["a"] - NatureConst["Ru"])*(T-Tref) + CoefMolarCpPropTable[Subs]["b"]*(T^2/2-Tref^2/2) + CoefMolarCpPropTable[Subs]["c"]*(T^3/3-Tref^3/3) + CoefMolarCpPropTable[Subs]["d"]*(T^4/4-Tref^4/4))

        end

    end

end

function Δh(Subs::String; T = 300, Tref = 0, Base = "MO")

    if Subs ∉ keys(CoefMolarCpPropTable)

        error("This substance is not supported yet!")

    else

        if Base == "MO"

            return CoefMolarCpPropTable[Subs]["a"]*(T-Tref) + CoefMolarCpPropTable[Subs]["b"]*(T^2/2-Tref^2/2) + CoefMolarCpPropTable[Subs]["c"]*(T^3/3-Tref^3/3) + CoefMolarCpPropTable[Subs]["d"]*(T^4/4-Tref^4/4)

        elseif Base == "MA"

            return 1/MolarMassPropTable[Subs] * (CoefMolarCpPropTable[Subs]["a"]*(T-Tref) + CoefMolarCpPropTable[Subs]["b"]*(T^2/2-Tref^2/2) + CoefMolarCpPropTable[Subs]["c"]*(T^3/3-Tref^3/3) + CoefMolarCpPropTable[Subs]["d"]*(T^4/4-Tref^4/4))

        end

    end

end

function Δs(Subs::String; T = 300, v2 = nothing, v1 = nothing, P2 = nothing, P1 = nothing, Tref = 300, Base = "MO")

    #v2 and v1 are specific volumes at given states 1 and 2.

    if Subs ∉ keys(CoefMolarCpPropTable)

        error("This substance is not supported yet!")

    else

        PropMatrix = [v1 v2; P1 P2]

        #NewPropMatrix = hcat(filter(row -> !any(x -> x === nothing, row), eachrow(PropMatrix))...) V01

        PropMatrixIndex = findall(row -> !any(i -> i === nothing, row), eachrow(PropMatrix))

        #Returns index where row -> !any(i -> i === nothing, row) is true, row is a row from PropMatrix, i is an element of a row. 

        if Tref != 0

            if !isempty(PropMatrixIndex)

                if PropMatrixIndex[1] == 1 #This one indicates that [v1, v2] is not nothing.

                    if Base == "MO"

                        return (CoefMolarCpPropTable[Subs]["a"] - NatureConst["Ru"])*log(T/Tref) + CoefMolarCpPropTable[Subs]["b"]*(T - Tref) + CoefMolarCpPropTable[Subs]["c"]/2*(T^2 - Tref^2) + CoefMolarCpPropTable[Subs]["d"]/3*(T^3 - Tref^3) + NatureConst["Ru"]*log(v2/v1)
            
                    elseif Base == "MA"
            
                        return 1/MolarMassPropTable[Subs]*((CoefMolarCpPropTable[Subs]["a"] - NatureConst["Ru"])*log(T/Tref) + CoefMolarCpPropTable[Subs]["b"]*(T - Tref) + CoefMolarCpPropTable[Subs]["c"]/2*(T^2 - Tref^2) + CoefMolarCpPropTable[Subs]["d"]/3*(T^3 - Tref^3) + NatureConst["Ru"]*log(v2/v1))
            
                    end

                else 

                    if Base == "MO"

                        return CoefMolarCpPropTable[Subs]["a"]*log(T/Tref) + CoefMolarCpPropTable[Subs]["b"]*(T - Tref) + CoefMolarCpPropTable[Subs]["c"]/2*(T^2 - Tref^2) + CoefMolarCpPropTable[Subs]["d"]/3*(T^3 - Tref^3) - NatureConst["Ru"]*log(P2/P1)
            
                    elseif Base == "MA"
            
                        return 1/MolarMassPropTable[Subs]*(CoefMolarCpPropTable[Subs]["a"]*log(T/Tref) + CoefMolarCpPropTable[Subs]["b"]*(T - Tref) + CoefMolarCpPropTable[Subs]["c"]/2*(T^2 - Tref^2) + CoefMolarCpPropTable[Subs]["d"]/3*(T^3 - Tref^3) - NatureConst["Ru"]*log(P2/P1))
            
                    end
            
                end
                
            else

                error("Input pressure or specific volume of state i and i+1!")
            
            end

        else

            error("Tref must be different from zero!")

        end

    end

end