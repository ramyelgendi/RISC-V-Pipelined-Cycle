#set_property package_pin J15 [get_ports {ledSel[1]}]
#set_property iostandard LVCMOS33 [get_ports {ledSel[1]}]
#set_property package_pin L16 [get_ports {ledSel[0]}]
#set_property iostandard LVCMOS33 [get_ports {ledSel[0]}]
#set_property package_pin M13 [get_ports {ssdSel[3]}]
#set_property iostandard LVCMOS33 [get_ports {ssdSel[3]}]
#set_property package_pin R15 [get_ports {ssdSel[2]}]
#set_property iostandard LVCMOS33 [get_ports {ssdSel[2]}]
#set_property package_pin R17 [get_ports {ssdSel[1]}]
#set_property iostandard LVCMOS33 [get_ports {ssdSel[1]}]
#set_property package_pin T18 [get_ports {ssdSel[0]}]
#set_property iostandard LVCMOS33 [get_ports {ssdSel[0]}]
#set_property package_pin U18 [get_ports {rst}]
#set_property iostandard LVCMOS33 [get_ports {rst}]
#set_property package_pin R13 [get_ports {clk}]
#set_property iostandard LVCMOS33 [get_ports {clk}]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]
#set_property package_pin U13 [get_ports {Anode[3]}]
#set_property iostandard LVCMOS33 [get_ports {Anode[3]}]
#set_property package_pin K2 [get_ports {Anode[2]}]
#set_property iostandard LVCMOS33 [get_ports {Anode[2]}]
#set_property package_pin T14 [get_ports {Anode[1]}]
#set_property iostandard LVCMOS33 [get_ports {Anode[1]}]
#set_property package_pin P14 [get_ports {Anode[0]}]
#set_property iostandard LVCMOS33 [get_ports {Anode[0]}]
#set_property package_pin L18 [get_ports {LED_out[0]}]
#set_property iostandard LVCMOS33 [get_ports {LED_out[0]}]
#set_property package_pin T11 [get_ports {LED_out[1]}]
#set_property iostandard LVCMOS33 [get_ports {LED_out[1]}]
#set_property package_pin P15 [get_ports {LED_out[2]}]
#set_property iostandard LVCMOS33 [get_ports {LED_out[2]}]
#set_property package_pin K13 [get_ports {LED_out[3]}]
#set_property iostandard LVCMOS33 [get_ports {LED_out[3]}]
#set_property package_pin K16 [get_ports {LED_out[4]}]
#set_property iostandard LVCMOS33 [get_ports {LED_out[4]}]
#set_property package_pin R10 [get_ports {LED_out[5]}]
#set_property iostandard LVCMOS33 [get_ports {LED_out[5]}]
#set_property package_pin T10 [get_ports {LED_out[6]}]
#set_property iostandard LVCMOS33 [get_ports {LED_out[6]}]
#set_property package_pin H17 [get_ports {outputPort[0]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[0]}]
#set_property package_pin K15 [get_ports {outputPort[1]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[1]}]
#set_property package_pin J13 [get_ports {outputPort[2]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[2]}]
#set_property package_pin N14 [get_ports {outputPort[3]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[3]}]
#set_property package_pin R18 [get_ports {outputPort[4]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[4]}]
#set_property package_pin V17 [get_ports {outputPort[5]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[5]}]
#set_property package_pin U17 [get_ports {outputPort[6]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[6]}]
#set_property package_pin U16 [get_ports {outputPort[7]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[7]}]
#set_property package_pin V16 [get_ports {outputPort[8]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[8]}]
#set_property package_pin T15 [get_ports {outputPort[9]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[9]}]
#set_property package_pin U14 [get_ports {outputPort[10]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[10]}]
#set_property package_pin T16 [get_ports {outputPort[11]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[11]}]
#set_property package_pin V15 [get_ports {outputPort[12]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[12]}]
#set_property package_pin V14 [get_ports {outputPort[13]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[13]}]
#set_property package_pin V12 [get_ports {outputPort[14]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[14]}]
#set_property package_pin V11 [get_ports {outputPort[15]}]
#set_property iostandard LVCMOS33 [get_ports {outputPort[15]}]
#set_property package_pin E3 [get_ports {clk1}]
#set_property iostandard LVCMOS33 [get_ports {clk1}]

#[DRC 23-20] Rule violation (CFGBVS-1) Missing CFGBVS and CONFIG_VOLTAGE Design Properties - Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

# set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

# set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0


set_property package_pin E3 [get_ports clk1 ] 
set_property iostandard LVCMOS33 [get_ports clk1]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk] 

set_property package_pin L16 [get_ports rst]
set_property iostandard LVCMOS33 [get_ports rst]

set_property package_pin J15 [get_ports clk]
set_property iostandard LVCMOS33 [get_ports clk]

set_property package_pin U11 [get_ports {ledSel[0]}]
set_property iostandard LVCMOS33 [get_ports {ledSel[0]}]

set_property package_pin V10 [get_ports {ledSel[1]}]
set_property iostandard LVCMOS33 [get_ports {ledSel[1]}]

set_property package_pin R16 [get_ports {ssdSel[0]}]
set_property iostandard LVCMOS33 [get_ports {ssdSel[0]}]

set_property package_pin T13 [get_ports {ssdSel[1]}]
set_property iostandard LVCMOS33 [get_ports {ssdSel[1]}]

set_property package_pin H6 [get_ports {ssdSel[2]}]
set_property iostandard LVCMOS33 [get_ports {ssdSel[2]}]

set_property package_pin U12 [get_ports {ssdSel[3]}]
set_property iostandard LVCMOS33 [get_ports {ssdSel[3]}]

set_property package_pin H17 [get_ports {outputPort[0]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[0]}]

set_property package_pin K15 [get_ports {outputPort[1]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[1]}]

set_property package_pin J13 [get_ports {outputPort[2]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[2]}]

set_property package_pin N14 [get_ports {outputPort[3]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[3]}]

set_property package_pin R18 [get_ports {outputPort[4]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[4]}]

set_property package_pin V17 [get_ports {outputPort[5]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[5]}]

set_property package_pin U17 [get_ports {outputPort[6]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[6]}]

set_property package_pin U16 [get_ports {outputPort[7]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[7]}]

set_property package_pin V16 [get_ports {outputPort[8]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[8]}]

set_property package_pin T15 [get_ports {outputPort[9]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[9]}]

set_property package_pin U14 [get_ports {outputPort[10]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[10]}]

set_property package_pin T16 [get_ports {outputPort[11]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[11]}]

set_property package_pin V15 [get_ports {outputPort[12]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[12]}]

set_property package_pin V14 [get_ports {outputPort[13]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[13]}]

set_property package_pin V12 [get_ports {outputPort[14]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[14]}]

set_property package_pin V11 [get_ports {outputPort[15]}]
set_property iostandard LVCMOS33 [get_ports {outputPort[15]}]

set_property package_pin P14 [get_ports {Anode[0]}]
set_property iostandard LVCMOS33 [get_ports {Anode[0]}]

set_property package_pin T14 [get_ports {Anode[1]}]
set_property iostandard LVCMOS33 [get_ports {Anode[1]}]

set_property package_pin K2 [get_ports {Anode[2]}]
set_property iostandard LVCMOS33 [get_ports {Anode[2]}]

set_property package_pin U13 [get_ports {Anode[3]}]
set_property iostandard LVCMOS33 [get_ports {Anode[3]}]

set_property package_pin L18 [get_ports {LED_out[0]}]
set_property iostandard LVCMOS33 [get_ports {LED_out[0]}]

set_property package_pin T11 [get_ports {LED_out[1]}]
set_property iostandard LVCMOS33 [get_ports {LED_out[1]}]

set_property package_pin P15 [get_ports {LED_out[2]}]
set_property iostandard LVCMOS33 [get_ports {LED_out[2]}]

set_property package_pin K13 [get_ports {LED_out[3]}]
set_property iostandard LVCMOS33 [get_ports {LED_out[3]}]

set_property package_pin K16 [get_ports {LED_out[4]}]
set_property iostandard LVCMOS33 [get_ports {LED_out[4]}]

set_property package_pin R10 [get_ports {LED_out[5]}]
set_property iostandard LVCMOS33 [get_ports {LED_out[5]}]

set_property package_pin T10 [get_ports {LED_out[6]}]
set_property iostandard LVCMOS33 [get_ports {LED_out[6]}]
