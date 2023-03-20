# Prototype2Fix
**A fix for Prototype 2 crashing at startup on modern Windows machines**


The game "Prototype 2" on Steam has a very common problem of crashing on startup on most modern machines. 
The most common working solution I have seen is as follows: Disable HiD compliant consumer control devices, 
and reduce the number of processor cores that the .exe uses to 4.

Both of these can be done manually - disabling the devices via device manager, and modifying processor affinity via the task manager.
This script serves to automate both of those processes and then launch the .exe, so that the game can be opened simply by running this script
instead of requiring a tedious process every time the game needs to be launched. 

First, Steam is set to only use the first 4 cores of the processor - since Prototype 2 launches via Steam, it launches with the same processor affinity 
that Steam does. Modifying the processor affinity after launch still results in a crash, so this script simply edits the affinity for Steam itself.
Afterwards, all currently active HiD compliant consumer control devices are disabled. If this causes any issues to your input devices for the game,
you can manually re-enable any of them from the device manager after the script is run

This script is accompanied by a 'closeGame' script, that should be run after exiting the game. This will reinstate affinity to all processor cores for Steam,
and re-enable all HiD compliant consumer control devices that were disabled in the 'openGame' script. Not running this script after exiting the game may lead
to performance issues for Steam or problems with your input devices.

These scripts are tested and working on a build with a Ryzen 3700x processor and running Windows 10. Other configurations may require small edits to the script,
but comments in the code have been added to address some of those. 
