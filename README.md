# FL4GS
An open-source project aimed at solving the problem of **centralized state management**, and the issue of having to **poll** for changes in variables.
# Basic knowledge
**Freezing:** freezing a flag will make it so it can not be changed.

**Removing:** if you remove a flag, it's just gone.
# Starting out
Download the file of your choice (rbxm/rbxmx), and simply place it wherever you want. Probably in Replicated Storage.
# Flag structure
Before starting all you need is the basic knowledge of what a flag is internally
```lua
[Flag] = value
```
Yeah its that simple, but if you didnt know that it would be confusing.
## API
```lua
function FLGS:SetFlag(flagname : string, newvalue)
```
Sets an existing flag, or creates a new one.
```lua
function FLGS:GetFlag(flagname : string): flag
```
Returns a flag.
```lua
function FLGS:FlagChanged(flagname : string): signal
```
Returns a signal from the [GoodSignal](https://github.com/stravant/goodsignal) module
```lua
function FLGS:RemoveFlag(flagname : string)
```
Removes the given flag.
```lua
function FLGS:FreezeFlag(flagname : string)
```
Freeze's the given flag.
```lua
function FLGS:UnfreezeFlag(flagname : string)
```
Unfreeze's the given flag.
```lua
function FLGS:GetAllFlags(): table
```
Returns a table of ALL the flags.

# Credits
Written by [STR8](https://github.com/S-T-R-8)
Additonal help from [dumpstring](https://github.com/dumpstring)
