meta:
  id: scripts
  endian: be
  file-extension: gwscp
  application: Grayworld server scripts
  license: CC0-1.0
  import:
    - scripts/setup
    - scripts/itemdef
    - scripts/chardef
doc: |
  Single binary file for whole game server
seq:
  - id: setup
    type: setup
  - id: items
    type: itemdef
  - id: chars
    type: chardef

