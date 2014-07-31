import XMonad
import XMonad.Config.Xfce
import Data.Bits
import XMonad
import System.Exit

import XMonad.Actions.Submap
import XMonad.Layout.Tabbed
import XMonad.Layout.Circle
import XMonad.Layout.ThreeColumns
import XMonad.Actions.CycleWS
import XMonad.Actions.PhysicalScreens
import XMonad.Prompt
import XMonad.Prompt.Ssh
import XMonad.Prompt.Window
import XMonad.Prompt.Workspace
import XMonad.Prompt.Input
import XMonad.Actions.DynamicWorkspaces
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeInactive

import XMonad.Layout.Spiral
import XMonad.Util.Scratchpad

import Graphics.X11.Xlib
import Graphics.X11.Xinerama
-- import Graphics.X11.Xlib.Extras
-- import Graphics.X11.Xlib.Event
--
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
--
import Data.List
import Data.Function

import System.Process

main ::  IO ()
main = xmonad xfceConfig{
		terminal = "xfce4-terminal"
		,modMask = mod4Mask
		,focusedBorderColor = myFocusedBorderColor
		,keys = myKeys
		,layoutHook = myLayout
}


--Colors
myFocusedBorderColor ::  [Char]
myFocusedBorderColor = "#1E1E1E"
myUncfocusedBorderColor ::  a
myUncfocusedBorderColor = undefined


leader ::  (KeyMask, KeySym)
leader = (controlMask, xK_a)

--Music
spotifyLeader = (controlMask, xK_w)
spotifyPrefix = "dbus-send --print-reply --dest=com.spotify.qt /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player."

runSpotifyCommand ::  MonadIO m => String -> m ()
runSpotifyCommand a = spawn $ spotifyPrefix ++ a

spotifyNext = runSpotifyCommand "Next"
spotifyPlayPause = runSpotifyCommand "PlayPause"
spotifyPrev = runSpotifyCommand "Previous"

--Keys
myKeys ::  XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $ 
	--Regular keys
	[(leader, submap . M.fromList $ 
			[((0, 		xK_Return), 	spawn $ XMonad.terminal conf)
			,((0, 		xK_c) , 	kill)
			,((0, 		xK_space), 	sendMessage NextLayout)
			,((shiftMask, 	xK_space), 	setLayout $ XMonad.layoutHook conf)
			,((0, 		xK_n), 		refresh)
			,((0, 		xK_Tab),	windows W.focusDown)
			,((0, 		xK_j), 		windows W.focusDown)
			,((0, 		xK_k), 		windows W.focusUp)
			,((0, 		xK_m), 		windows W.focusMaster)
			,((shiftMask, 	xK_Return), 	windows W.swapMaster)
			,((shiftMask, 	xK_j), 		windows W.swapDown)
			,((shiftMask, 	xK_k), 		windows W.swapUp)
			,((0, 		xK_h), 		sendMessage Shrink)
			,((0, 		xK_l), 		sendMessage Expand)
			,((0, 		xK_comma), 	sendMessage (IncMasterN 1))
			,((0, 		xK_period), 	sendMessage (IncMasterN (-1)))
			,((0, 		xK_b), 		sendMessage ToggleStruts)
			,((shiftMask, 	xK_q), 		broadcastMessage ReleaseResources >> restart "xmonad" True)
			,((0, 		xK_p), 		spawn $ "xfce4-appfinder")] 
			++
			[((m .|. 0, k), windows $ f i)
        			| (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        			, (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]	
			++
			[((0 .|. mask, key), f sc)
        			| (key, sc) <- zip [xK_q, xK_w, xK_e] [0..]
        			, (f, mask) <- [(viewScreen, 0), (sendToScreen, shiftMask)]]
			
	 )]
	++
	--Music Keys
	[(spotifyLeader, submap . M.fromList $
			[((0, 		xK_w), 	spotifyPlayPause)
			,((0, 		xK_e), 	spotifyNext)
			,((0, 		xK_q), 	spotifyPrev)]
	)]

	--Layout
myLayout = avoidStruts $
	tiled
	||| Mirror tiled
	||| Full
	||| tabbed shrinkText defaultTheme
	||| threeCol
	||| spiral (4/3)
	where
	--- default tiling algorithm partitions the screen into two panes
	tiled   = Tall nmaster delta ratio
	--
	threeCol = ThreeCol nmaster delta ratio
	--                             
	-- The default number of windows in the master pane
	nmaster = 1

	-- Default proportion of screen occupied by master pane
	ratio   = 1/2

	-- Percent of screen to increment by when resizing panes
	delta   = 2/100
	--                                                              
	--
--Mouse
{--
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
	[(leader, submap . M.fromList $ 
		
 
        	[ ((0, button1), (\w -> focus w >> mouseMoveWindow w))
    --      
        	, ((0, button3), (\w -> focus w >> windows W.swapMaster))
    --               
        	, ((0, button2), (\w -> focus w >> mouseResizeWindow w))
		]
	)]
    --                        
        
--}
