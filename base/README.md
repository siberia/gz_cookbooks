base Cookbook
=============

The is the base cookbook for SmartOS-based Global Zones.  This cookbook install
various tools we use like patched MegaCli for use with MegaRAID SAS 9260-4i,
mbuffer for buffering large streams of data for zfs send/recv, etc.

Requirements
------------

#### packages
- `toaster` - base needs toaster to brown your bagel.

Attributes
----------

Usage
-----
#### base::default

Just include `base` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[base]"
  ]
}
```

License and Authors
-------------------
Authors:

 * Jacques Marneweck (jacques@powertrip.co.za)
