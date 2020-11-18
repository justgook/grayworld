meta:
  id: setup
  import: ./util
  doc: |
    Main configuration for server
seq:
  - id: serv_name
    type: str
  - id: serv_ip
    type: ip
  - id: serv_port
    type: u4
