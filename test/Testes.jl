using GBPropLib

println(GBPropLib.cp("O2", T = 300, Base = "MO"))

GBPropLib.cv("O2", T = 300, Base = "MO")

v1 = 0.287*(17+273.15)/100
v2 = 0.287*(57+273.15)/600
GBPropLib.s("Air", T = 600, Tref = 100, v2 = v2, v1 = v1, Base = "MA")