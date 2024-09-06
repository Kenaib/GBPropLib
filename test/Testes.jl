using GBPropLib

#cp Air at T = 300 K, molar based:

println("cp_MO = ", GBPropLib.cp("Air", T = 300, Base = "MO"))

#cp Air at T = 300 K, mass based:

println("cp_MA = ", GBPropLib.cp("Air", Base = "MA"))

#Air Specific Enthalpy variation from T = 273.15 K to T = 450 K, mass based:

println("Δh_MA = ", GBPropLib.Δh("Air", Tref = 273.15, Base = "MA"))

#Air Specific Internal Energy variation from T = 290.15 K to T = 330.15 K, mass based:

println("Δu_MA = ", GBPropLib.Δu("Air", Tref = 273.15, Base = "MA"))

#Air Specific Entropy variation from (P = 100 kPa, T = 290.15 K) to (P = 600 kPa, T = 330.15 K), mass based:

println("Δs_MA = ", GBPropLib.Δs("Air", T = 330.15, Tref = 290.15, P2 = 600, P1 = 100, Base = "MA"))
