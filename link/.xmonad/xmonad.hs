import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Paste
import XMonad.Hooks.SetWMName

main = xmonad $ defaultConfig {
    terminal    = myTerm,
    modMask     = mod4Mask,
    startupHook = setWMName "LG3D"
} `additionalKeysP` myKeys

myTerm = "roxterm"

myKeys = [ ("M-c", kill)
         , ("M-<Return>", spawn myTerm)
         , ("M-v", pasteSelection)
         ]
