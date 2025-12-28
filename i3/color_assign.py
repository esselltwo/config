#!/usr/bin/python3

accent_color = "e31977"
#accent_color = "a165bf"

i3_color_config = """
# colors
set $text_light #ffffff
set $text_dark #888888

set $focus #{}
set $inact #5f676a
set $unfoc #222222
set $alert #900000

# colour of border, background, text, indicator, and child_border
# class                 border  backgr. text        indicator child_border
client.focused          $focus  $focus  $text_light $focus    $focus
client.focused_inactive $inact  $inact  $text_light $inact    $inact
client.unfocused        $unfoc  $unfoc  $text_dark  $unfoc    $unfoc
client.urgent           $alert  $alert  $text_light $alert    $alert
client.placeholder      #000000 #0c0c0c $text_light #000000   #0c0c0c

client.background       #ffffff
""".format(accent_color)

with open("colors.conf", "w") as i3_file:
    i3_file.write(i3_color_config)

polybar_color_config = """
[colors]
background = #222
background-alt = #{}
foreground = #dfdfdf
foreground-alt = #555
primary = #ffb52a
secondary = #e60053
alert = #bd2c40
""".format(accent_color)

with open("../polybar/colors.ini", "w") as polybar_file:
    polybar_file.write(polybar_color_config)

