import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W
import System.IO



myTerminal = "urxvt"

myModMask = mod4Mask

myNormalBorderColor = "#002b36"
myFocusedBorderColor = "#657b83"

myWorkspaces = ["one", "two", "three", "four", "five"]

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaults
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , logHook = dynamicLogWithPP $ xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "#657b83" "" . shorten 100
            , ppCurrent = xmobarColor "#c0c0c0" "" . wrap "" ""
            , ppSep = xmobarColor "c0c0c0" "" " | "
            , ppUrgent = xmobarColor "#ff69b4" ""
            }
        }

defaults = defaultConfig
    { terminal = myTerminal
    , modMask = myModMask
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , workspaces = myWorkspaces
    }
