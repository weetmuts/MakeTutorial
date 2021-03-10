
# Common makefile flags, macros and settings.

# Always expect a BUILD directory.
BUILD?=build
$(shell mkdir -p $(BUILD))

# Use: make LOG=verbose
# to change the log level. You can use silent,normal,verbose,debug and trace.

LOG?=normal
AT?=@
MAKEFLAGS+=--no-builtin-rules

define LOG_INFO_FRAMED
./make/echo-framed airy $1 $2 $3
endef

define LOG_INFO_LINE
./make/echo-framed dense $1 $2 $3
endef

define LOG_INFO
echo "$1"
endef

define LOG_VERBOSE
echo "(verbose) $1"
endef

define LOG_DEBUG
echo "(debug) $1"
endef

ifeq ($(LOG),silent)
    AT:=@
    LOG_INFO:=
    LOG_INFO_FRAME:=
    LOG_VERBOSE:=
    LOG_DEBUG:=
endif

ifeq ($(LOG),normal)
    LOG_VERBOSE:=
    LOG_DEBUG:=
endif

ifeq ($(LOG),verbose)
    LOG_DEBUG:=
endif

ifeq ($(LOG),debug)
# Show all commands.
    AT:=
endif

ifeq ($(LOG),trace)
# Show all commands debug make behaviour.
    AT:=
    MAKEFLAGS+=-d
endif
