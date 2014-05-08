property win_list : {}
property win_contniner : {"", "", ""}

tell application "Finder"
	
	if (count of every window) is 0 then
		if win_list is not {} then
			my load_windows()
		else
			exit repeat
		end if
	else
		my save_windows()
	end if
	
end tell


on save_windows()
	set win_list to {}
	tell application "Finder"
		set cnt to count of every window
		
		repeat with i from 1 to cnt
			tell window i
				set item 1 of win_contniner to target
				set item 2 of win_contniner to position
				set item 3 of win_contniner to bounds
			end tell
			
			
			set end of win_list to contents of win_contniner
			--log win_list
		end repeat
		
		--return win_list
	end tell
end save_windows

on load_windows()
	tell application "Finder"
		set cnt to count of win_list
		
		repeat with i from 1 to cnt
			
			--	return item 1 of item i of win_list
			make new Finder window to (item 1 of item i of win_list)
			set position of Finder window 1 to (item 2 of item i of win_list)
			set bounds of Finder window 1 to (item 3 of item i of win_list)
			
		end repeat
		
	end tell
	--set win_list to {}
end load_windows

(*
	
	
	
		repeat with win1 in every_win
		tell win1
			set item 1 of item i of win_list to target
			set item 2 of item i of win_list to position
			set item 3 of item i of win_list to bounds
			--properties
		end tell
		set i to i + 1
		--	set end of win_list to {"", "", ""}
	end repeat
	
	
	
		set position_win to position
		set bounds_win to bounds


	tell window 1
		
		set path_win to target
		set position_win to position
		set bounds_win to bounds
		
	end tell
	
	
	set win_path to "Macintosh HD2:Users:admin 1:Desktop:Script_test:" as alias
	--	set win_path to path to desktop folder
	make new Finder window to win_path
	set position of Finder window 1 to {5, 44}
	set bounds of Finder window 1 to {5, 44, 843, 636}
	--	make new Finder window to path_win
*)

--	set position of Finder window 1 to {5, 44}
--	set bounds of Finder window 1 to {5, 44, 843, 636}

