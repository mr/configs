import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Util.EZConfig
import XMonad.Util.NamedWindows
import XMonad.Util.Paste
import XMonad.Util.Run
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook

import qualified XMonad.StackSet as W

data LibNotifyUrgencyHook = LibNotifyUrgencyHook deriving (Read, Show)

instance UrgencyHook LibNotifyUrgencyHook where
    urgencyHook LibNotifyUrgencyHook w = do
        name <- getName w
        Just idx <- fmap (W.findTag w) $ gets windowset

        safeSpawn "notify-send" [show name, "workspace " ++ idx]

main = xmonad $ withUrgencyHook LibNotifyUrgencyHook $ defaultConfig {
    terminal    = myTerm,
    modMask     = mod4Mask,
    startupHook = setWMName "LG3D"
} `additionalKeysP` myKeys

myTerm = "roxterm"

myKeys = [ ("M-c", kill)
         , ("M-<Return>", spawn myTerm)
         , ("M-v", pasteSelection)
         , ("M-f", focusUrgent)
         , ("M-S-f", clearUrgents)
         ]
