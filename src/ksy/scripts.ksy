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
doc: |
  Single binary file for whole game server
seq:
  - id: setup
    type: setup
  - id: itemdef
    type: itemdef
  - id: chardef
    type: chardef
