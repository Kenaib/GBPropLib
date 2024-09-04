CoefMolarCpPropTable = Dict{String, Dict}(
#cp => kJ/(kmol*K)
"N2" => Dict{String, Float64}("a" => 28.90, "b" => -0.1571e-2, "c" => 0.8081e-5, "d" => -2.873e-9), 
"O2" => Dict{String, Float64}("a" => 25.48, "b" => 1.520e-2, "c" => -0.7155e-5, "d" => 1.312e-9),
"Air" => Dict{String, Float64}("a" => 28.11, "b" => 0.1967e-2, "c" => 0.4802e-5, "d" => -1.966e-9),
"H2" => Dict{String, Float64}("a" => 29.11, "b" => 0.1916e-2, "c" => 0.4003e-5, "d" => -1.8704e-9),
"CO" => Dict{String, Float64}("a" => 28.16, "b" => 0.1675e-2, "c" => 0.5372e-5, "d" => -2.222e-9),
"CO2" => Dict{String, Float64}("a" => 22.26, "b" => 5.981e-2, "c" => -3.501e-5, "d" => 7.469e-9),
"H2O" => Dict{String, Float64}("a" => 32.24, "b" => 0.1923e-2, "c" => 1.055e-5, "d" => -3.595e-9),
"NO" => Dict{String, Float64}("a" => 29.34, "b" => -0.09395e-2, "c" => 0.9747e-5, "d" => -4.187e-9),
"N2O" => Dict{String, Float64}("a" => 24.11, "b" => 5.8632e-2, "c" => -3.562e-5, "d" => 10.58e-9),
"NO2" => Dict{String, Float64}("a" => 22.9, "b" => 5.715e-2, "c" => -3.52e-5, "d" => 7.87e-9),
"NH3" => Dict{String, Float64}("a" => 27.568, "b" => 2.5630e-2, "c" => 0.99072e-5, "d" => -6.6909e-9),
"S2" => Dict{String, Float64}("a" => 27.21, "b" => 2.218e-2, "c" => -1.628e-5, "d" => 3.986e-9),
"SO2" => Dict{String, Float64}("a" => 25.78, "b" => 5.795e-2, "c" => -3.812e-5, "d" => 8.612e-9),
"SO3" => Dict{String, Float64}("a" => 16.40, "b" => 14.58e-2, "c" => -11.20e-5, "d" => 32.42e-9),
"C2H2" => Dict{String, Float64}("a" => 21.8, "b" => 9.2143e-2, "c" => -6.527e-5, "d" => 18.21e-9),
"C6H6" => Dict{String, Float64}("a" => -36.22, "b" => 48.475e-2, "c" => -31.57e-5, "d" => 77.62e-9),
"CH4O" => Dict{String, Float64}("a" => 19.0, "b" => 9.152e-2, "c" => -1.22e-5, "d" => -8.039e-9),
"C2H6O" => Dict{String, Float64}("a" => 19.9, "b" => 20.96e-2, "c" => -10.38e-5, "d" => 20.05e-9),
"HCl" => Dict{String, Float64}("a" => 30.33, "b" => -0.7620e-2, "c" => 1.327e-5, "d" => -4.338e-9),
"CH4" => Dict{String, Float64}("a" => 19.89, "b" => 5.024e-2, "c" => 1.269e-5, "d" => -11.01e-9),
"C2H6" => Dict{String, Float64}("a" => 6.9, "b" => 17.27e-2, "c" => -6.406e-5, "d" => 7.285e-9),
"C3H8" => Dict{String, Float64}("a" => -4.04, "b" => 30.48e-2, "c" => -15.72e-5, "d" => 31.74e-9),
"C4H10" => Dict{String, Float64}("a" => 3.96, "b" => 37.15e-2, "c" => -18.34e-5, "d" => 35e-9),
"C5H12" => Dict{String, Float64}("a" => 6.774, "b" => 45.43e-2, "c" => -22.46e-5, "d" => 42.29e-9),
"C6H14" => Dict{String, Float64}("a" => 6.938, "b" => 55.22e-2, "c" => -28.65e-5, "d" => 57.69e-9),
"C2H4" => Dict{String, Float64}("a" => 3.95, "b" => 15.64e-2, "c" => -8.344e-5, "d" => 17.67e-9),
"C3H6" => Dict{String, Float64}("a" => 3.15, "b" => 23.83e-2, "c" => -12.18e-5, "d" => 24.62e-9),
)

#cp table available on Çengel and Boles (2013)
#Molar mass: 

MolarMassPropTable = Dict{String, Float64}(
#"Subs" => Value (kmol/kg)
"N2" => 28.0134,
"O2" => 31.9988,
"Air" => 28.966,
"H2" => 2.016,
"CO" => 28.011,
"CO2" => 44.01,
"H2O" => 18.02,
"NO" => 30.006,
"N2O" => 44.013,
"NO2" => 46.006,
"NH3" => 17.031,
"S2" => 32.02,
"SO2" => 64.065,
"SO3" => 80.057,
"C2H2" => 26.038,
"C6H6" => 78.114,
"CH4O" => 32.042,
"C2H6O" => 46.069,
"HCl" => 36.46,
"CH4" => 16.043,
"C2H6" => 30.07,
"C3H8" => 44.097,
"C4H10" => 58.12,
"C5H12" => 72.151,
"C6H14" => 86.178,
"C2H4" => 28.054,
"C3H6" => 42.081,
)

#Nature constants: 

NatureConst = Dict{String, Any}(
"Ru" => 8.31447 #kJ/(kmol*K)
)