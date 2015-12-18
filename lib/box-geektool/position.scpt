# use framework "CoreGraphics"
# use scripting additions
# set sizes to item 1 of (current application's NSScreen's mainScreen's frame as list)
# set theRez to ("width:" & width of |size| of sizes & " x height:" & height of |size| of sizes) as string
# display dialog theRez with title "Main Screen Rez" buttons "OK"
# display 1440 X 900

tell application "Finder"
  set DispW to 1150
  set pos to DispW - 210
  set QOTDpos to DispW - 375
  set DispH to 900
end tell

tell application "GeekTool Helper"
  set y position of first item of (geeklets whose name is "CompName") to 60
  set y position of first item of (geeklets whose name is "Clock") to 70
  set y position of first item of (geeklets whose name is "Date") to 170
  set y position of first item of (geeklets whose name is "WANIP") to 200
  set y position of first item of (geeklets whose name is "SysStats") to 225
  set y position of first item of (geeklets whose name is "QOTD") to DispH - 75

  set li to (name of every geeklet whose name is not "QOTD")
  repeat with glet in li
    set x position of first item of (geeklets whose name is glet) to pos
  end repeat
  set x position of first item of (geeklets whose name is "QOTD") to QOTDpos
end tell