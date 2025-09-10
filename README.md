# TDS-Macros
yo
This contains macros for stuff I find annoying to do in TDS. Made public because I don't feel it is cheating, and I don't see anything online for AHK macros for Tower Defense Simulator. so i made my own :)


# EXPLANATION OF FILES:
**MercFullAirDropMicro.ahk**
- my main motivation for making this script.
- Most AHK scripts for mercenary will only spam upgrade key.
- this script will press 5 for merc, click to place (middle of screen), press Z (my merc airdrop hotkey), then goes through coordinates. you should use GrabCoords.ahk to find what works for ur laptop.
- for coordinate grabbing, add a location where you want the airdrop to click (since Z is last button pressed to trigger airdrop ability), then click 2 times on riot (or whatever u wanna drop really, i just choose riot) and then it presses X (my sell button) and exits.
- very simple script, so it doesn't account for lag. looking into improving it for solo PW2, since it seems to only be possible in solo with merc airdrop micro (guess why i made this!!!!!!!!!!!!!!!!!!!)

# TODO:
- if this gets more traction make script more intuitive and easier to use
- figure out how to properly use tolerances with ImageSearch and PixelSearch
- Since I got icons off the tds wiki, it should be easy in theory for ImageSearch to find the icons instead, circumventing the need to adjust macros for lag?
- DJ auto collect
- script to do CTA chaining
- 




SOURCES TO KEEP AN EYE ON:
https://www.reddit.com/r/AutoHotkey/comments/hp3qxk/a_failproof_method_for_imagepixel_search/
