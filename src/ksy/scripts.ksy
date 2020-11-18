meta:
  id: scripts
  endian: be
  file-extension: gwscp
  application: Grayworld server
  license: CC0-1.0
  import:
    scripts/setup
    scripts/itemdef
    scripts/chardef
    scripts/script_tables # all scripts definition is here
doc: |
  Single binary file for whole game server
seq:
  - id: setup
    type: setup
  - id: scripts
    type: scripts
