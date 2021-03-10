
# Prepare a macro for creating arule for listing the symbols of the object files.

define ListSymbols
$1 : $2
	@$(call LOG_INFO_LINE,"Symbols for $2") >> $1
	$(AT)nm $2 >> $1
	@$(call LOG_INFO_LINE,"Done printing symbols") >> $1
	@$(call LOG_INFO,"Listed symbols into $1")
endef
