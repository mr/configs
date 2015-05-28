-- default desktop configuration for Fedora

import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Util.EZConfig

main = xmonad $ defaultConfig {
    terminal = myTerm
} `additionalKeysP` myKeys

myTerm = "roxterm"

myKeys = [ ("M-c", kill), ("M-<Return>", spawn myTerm) ]
