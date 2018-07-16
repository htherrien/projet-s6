set mdldir [file dirname [info script]]

puts "Adding DSP Builder System Squelette_DSPBuilder to project\n"

set_global_assignment -name "QIP_FILE" [file join $mdldir "Squelette_DSPBuilder.qip" ]

if { [file exist [file join $mdldir "Squelette_DSPBuilder_add_user.tcl" ]] } {
	source [file join $mdldir "Squelette_DSPBuilder_add_user.tcl" ]
}


# Add an index file for the Librarian
set ipDir "[get_project_directory]/ip/Squelette_DSPBuilder/";
if { ![file exists $ipDir] } {
	file mkdir $ipDir;
}
# Reference the file by relative path if possible
if { [file pathtype $mdldir] == "relative" } {
	set mdlIPX "../../$mdldir/Squelette_DSPBuilder.ipx"
} else {
	set mdlIPX "${mdldir}/Squelette_DSPBuilder.ipx"
}
set ipxFP [open "$ipDir/Squelette_DSPBuilder.ipx" w]
puts $ipxFP "<library><index file='$mdlIPX'/></library>"
close $ipxFP

