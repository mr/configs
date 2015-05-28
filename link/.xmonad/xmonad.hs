import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Paste

main = xmonad $ defaultConfig {
    terminal = myTerm
} `additionalKeysP` myKeys

myTerm = "roxterm"

myKeys = [ ("M-c", kill)
         , ("M-<Return>", spawn myTerm)
         , ("M-v", pasteSelection)
         ]
