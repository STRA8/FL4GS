# FL4GS

An open-source solution for **unified state management**.

---

## Overview

FL4GS provides centralized management for application state using "flags" (state markers) that you can set, retrieve, freeze, or remove.

### Key Concepts

- **Freezing**: Freezing a flag makes it read-only until unfrozen.
- **Removing**: Removing a flag deletes it permanently from the set.

---

## Installation

1. Download the `.rbxm` or `.rbxmx` file from the latest [release](https://github.com/STRA8/FL4GS/releases/latest).
2. Place the file wherever it is needed in your project.

---

## API Reference

| Method                                       | Description                                              |
| -------------------------------------------- | -------------------------------------------------------- |
| **`:SetFlag(flagname: string, newvalue)`**   | Sets the value of an existing flag or creates a new one. |
| **`:GetFlag(flagname: string): flag`**       | Retrieves the specified flag.                            |
| **`:FlagChanged(flagname: string): signal`** | Returns an event triggered when the flags value changes. |
| **`:RemoveFlag(flagname: string)`**          | Deletes the specified flag.                              |
| **`:FreezeFlag(flagname: string)`**          | Freezes the specified flag, making it read-only.         |
| **`:UnfreezeFlag(flagname: string)`**        | Unfreezes the specified flag, allowing changes.          |
| **`:GetAllFlags(): table`**                  | Returns a table of all flags.                            |

---

## Credits

Written by [STR8](https://github.com/S-T-R-8)<br/>
Additonal help from [dumpstring](https://github.com/dumpstring)
