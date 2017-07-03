# HexToClr - Hex string txt convert to clr.
=========

# Usage

>HexToClr ./colors.txt

```:colors.txt

#FFF white
FFF white
#FFFF white
FFFF white
#FFFFFFFF white
FFFFFFFF white

```

# Install

`chmod a+x HexToClr`

# Compile

`$ swift build -c release`

# Generate Xcode Proj

`swift package generate-xcodeproj`

## Pre-configuration Build Products Path

`$(SRCROOT)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)`

## Always Embed Swift Standard Libraries

`Yes`

