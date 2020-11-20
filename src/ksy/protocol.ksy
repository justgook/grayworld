meta:
  id: protocol
  endian: be
  application: Grayworld server protocol
  license: CC0-1.0
seq:
  - id: delme_source
    type: u1
    enum: source
  - id: cmd
    type: u1
  - id: body
    type:
      switch-on: delme_source
      cases:
        'source::to_server': pkg_to_server
        'source::to_client': pkg_to_client
types:
  pkg_to_server:
    doc: |
      Split to different files, to be able generate different files for server and client
    seq:
      - id: pkf
        type:
          switch-on: _root.cmd
          cases:
            0x00: create_character
            0x01: disconnect_notification
            0x02: move_request
            0x03: talk_request
            0x04: god_mode_toggle
            0x05: attack_request
            0x06: double_click
            0x07: pick_up_item
            0x08: drop_item
            0x09: single_click
            0x0A: packet_edit
            0x0B: packet_editarea
            0x0C: packet_tiledata
            0x0D: packet_npcdata
            0x0E: packet_templatedata
            0x0F: packet_paperdoll
            0x10: packet_huedata
            0x11: stat_window_info
            0x12: request_skill__action__magic_usage
            0x13: equip_item_request
            0x14: change_elevation
            0x15: follow
            0x16: request_script_names
            0x17: script_tree_command
            0x18: script_attach
            0x19: npc_conversation_data
#            0x1A: object_information
#            0x1B: login_confirmation
#            0x1C: send_text
            0x1D: delete_object
            0x1E: packet_animate
#            0x1F: packet_explode
#            0x20: teleport_player
#            0x21: character_move_reject
            0x22: character_move_ack__resync_request
#            0x23: drag_item
#            0x24: draw_container
#            0x25: add_item_to_container
#            0x26: kick_player
#            0x27: get_item_failed
#            0x28: clear_square
#            0x29: paperdoll_clothing_added
            0x2A: packet_blood
#            0x2B: toggle_god_mode_reply
            0x2C: death__resurrection
            0x2D: packet_health
#            0x2E: equip_item
#            0x2F: fight_occurring
#            0x30: attack_ok
            0x31: attack_end
#            0x32: hack_mover
            0x33: pause__resume_client
            0x34: client_query
            0x35: resource_type
            0x36: resource_tile_data
            0x37: move_object
            0x38: follow_move
            0x39: groups
            0x3A: send_skills__lock_state
            0x3B: buy_item
#            0x3C: items_in_container
            0x3D: ship
            0x3E: versions
#            0x3F: update_statics
#            0x40: update_terrain
#            0x41: update_tiledata
#            0x42: update_art
#            0x43: update_anim
#            0x44: update_hues
#            0x45: ver_ok
            0x46: new_art
            0x47: new_terrain
            0x48: new_anim
            0x49: new_hues
            0x4A: destroy_art
            0x4B: check_ver
            0x4C: script_names
            0x4D: script_file
#            0x4E: personal_light_level
#            0x4F: overall_light_level
#            0x50: board_header
#            0x51: board_message
            0x52: post_message
#            0x53: login_reject
#            0x54: play_sound_effect
#            0x55: login_complete
            0x56: plot_course
#            0x57: update_regions
            0x58: new_region
            0x59: new_context_fx
#            0x5A: update_context_fx
#            0x5B: time
#            0x5C: restart_ver
#            0x5D: pre_login
            0x5E: server_list
            0x5F: add_server
            0x60: server_remove
            0x61: destroy_static
            0x62: move_static
            0x63: area_load
            0x64: area_load_request
#            0x65: set_weather
            0x66: book_contents
#            0x67: simple_edit
            0x68: script_ls_attach
            0x69: friends
            0x6A: friend_notify
            0x6B: key_use
            0x6C: targeting_cursor_commands
#            0x6D: play_midi_music
#            0x6E: character_animation
            0x6F: secure_trading
#            0x70: graphical_effect
            0x71: bulletin_board_message
            0x72: request_war_mode_change__send_war_mode_status
            0x73: ping_message
#            0x74: open_buy_window
            0x75: rename_character
            0x76: new_subserver
#            0x77: update_player
#            0x78: draw_object
            0x79: resource_query
            0x7A: resource_data
            0x7B: sequence
#            0x7C: object_picker
            0x7D: client_response_to_dialog
            0x7E: god_view_query
#            0x7F: god_view_data
            0x80: login_request
#            0x81: account_login_ok
#            0x82: login_denied
            0x83: delete_character
            0x84: change_character_password
#            0x85: delete_character_failed
#            0x86: resend_characters_after_delete
#            0x87: send_resources
#            0x88: open_paperdoll
#            0x89: corpse_clothing
            0x8A: trigger_edit
#            0x8B: display_sign
#            0x8C: server_redirect
#            0x8D: unused_3
            0x8E: move_character
#            0x8F: unused_4
            0x90: map_message_open_course_gump
            0x91: post_login
#            0x92: update_multi
#            0x93: book_header
#            0x94: update_skill
            0x95: dye_window
            0x96: game_central_monitor
            0x97: move_player
            0x98: mob_name
#            0x99: house__boat_placement
            0x9A: console_entry_prompt
            0x9B: request_help
            0x9C: assist_request
            0x9D: gm_single
#            0x9E: sell_list
            0x9F: sell_reply
            0xA0: select_server
#            0xA1: update_current_health
#            0xA2: update_current_mana
#            0xA3: update_current_stamina
            0xA4: client_machine_info
#            0xA5: open_web_browser
#            0xA6: tip__notice_window
            0xA7: request_tips
#            0xA8: game_server_list
#            0xA9: characters__starting_locations
#            0xAA: attack_request_reply
#            0xAB: gump_text_entry_dialog
            0xAC: gump_text_entry_dialog_reply
            0xAD: unicode_speech_request
#            0xAE: unicode_speech_message
#            0xAF: display_death_animation
#            0xB0: send_gump_menu_dialog
            0xB1: gump_menu_selection
            0xB2: chat_message
            0xB5: open_chat_window
            0xB6: send_help__tip_request
#            0xB7: help__tip_data
            0xB8: request_char_profile
#            0xB9: client_features
#            0xBA: quest_arrow
            0xBB: ultima_messenger
#            0xBC: seasonal_information
            0xBD: client_version_message
            0xBE: assist_version
            0xBF: misc_commands_packet
#            0xC0: hued_fx
#            0xC1: predefined_message
            0xC2: unicode_text_entry
#            0xC3: global_queue
#            0xC4: semivisible
#            0xC5: invalid_map
#            0xC6: invalid_map_enable
#            0xC7: particle_effect

            0xC8: change_update_range
            0xC9: trip_time
            0xCA: utrip_time
#            0xCB: global_queue_count
#            0xCC: localized_text_plus_string
            0xCD: unknown_god_packet
            0xCE: igr_client
            0xCF: igr_login
            0xD0: igr_configuration
            0xD1: igr_logout
#            0xD2: update_mobile
#            0xD3: show_mobile
            0xD4: book_info
            0xD5: unknown_client_packet
#            0xD6: mega_cliloc
            0xD7: aos_command
#            0xD8: custom_house
            0xD9: metrics
            0xDA: mahjong
            0xDB: character_transfer_log
            0xDC: unused5
#            0xDD: compressed_gump

  pkg_to_client:
    doc: |
      Split to different files, to be able generate different files for server and client
    seq:
      - id: pkf
        type:
          switch-on: _root.cmd
          cases:
#            0x00: create_character
#            0x01: disconnect_notification
#            0x02: move_request
#            0x03: talk_request
#            0x04: god_mode_toggle
#            0x05: attack_request
#            0x06: double_click
#            0x07: pick_up_item
#            0x08: drop_item
#            0x09: single_click
            0x0A: packet_edit
#            0x0B: packet_editarea
            0x0C: packet_tiledata
            0x0D: packet_npcdata
            0x0E: packet_templatedata
            0x0F: packet_paperdoll
            0x10: packet_huedata
            0x11: stat_window_info
#            0x12: request_skill__action__magic_usage
#            0x13: equip_item_request
#            0x14: change_elevation
#            0x15: follow
#            0x16: request_script_names
#            0x17: script_tree_command
#            0x18: script_attach
#            0x19: npc_conversation_data
            0x1A: object_information
            0x1B: login_confirmation
            0x1C: send_text
            0x1D: delete_object
            0x1E: packet_animate
            0x1F: packet_explode
            0x20: teleport_player
            0x21: character_move_reject
            0x22: character_move_ack__resync_request
            0x23: drag_item
            0x24: draw_container
            0x25: add_item_to_container
            0x26: kick_player
            0x27: get_item_failed
            0x28: clear_square
            0x29: paperdoll_clothing_added
            0x2A: packet_blood
            0x2B: toggle_god_mode_reply
            0x2C: death__resurrection
            0x2D: packet_health
            0x2E: equip_item
            0x2F: fight_occurring
            0x30: attack_ok
            0x31: attack_end
            0x32: hack_mover
            0x33: pause__resume_client
            #0x34: client_query
            0x35: resource_type
#            0x36: resource_tile_data
#            0x37: move_object
            0x38: follow_move
            0x39: groups

            0x3A: send_skills__lock_state
            0x3B: buy_item
            0x3C: items_in_container

#            0x3D: ship
            0x3E: versions
            0x3F: update_statics
            0x40: update_terrain
            0x41: update_tiledata
            0x42: update_art
            0x43: update_anim
            0x44: update_hues
            0x45: ver_ok
#            0x46: new_art
#            0x47: new_terrain
#            0x48: new_anim
#            0x49: new_hues
#            0x4A: destroy_art
#            0x4B: check_ver
            0x4C: script_names
            0x4D: script_file
            0x4E: personal_light_level
            0x4F: overall_light_level
            0x50: board_header
            0x51: board_message
#            0x52: post_message
            0x53: login_reject
            0x54: play_sound_effect
            0x55: login_complete
            0x56: plot_course
            0x57: update_regions
#            0x58: new_region
#            0x59: new_context_fx
            0x5A: update_context_fx
            0x5B: time
            0x5C: restart_ver
            0x5D: pre_login
            0x5E: server_list
            0x5F: add_server
            0x60: server_remove
#            0x61: destroy_static
#            0x62: move_static
#            0x63: area_load
#            0x64: area_load_request
            0x65: set_weather
            0x66: book_contents
#            0x67: simple_edit
            0x68: script_ls_attach
            0x69: friends
            0x6A: friend_notify
            0x6B: key_use
            0x6C: targeting_cursor_commands
            0x6D: play_midi_music
            0x6E: character_animation
            0x6F: secure_trading
            0x70: graphical_effect
            0x71: bulletin_board_message
            0x72: request_war_mode_change__send_war_mode_status
            0x73: ping_message
            0x74: open_buy_window
#            0x75: rename_character
            0x76: new_subserver
            0x77: update_player
            0x78: draw_object
            0x79: resource_query
            0x7A: resource_data
            0x7B: sequence
            0x7C: object_picker
#            0x7D: client_response_to_dialog
            0x7E: god_view_query
            0x7F: god_view_data
#            0x80: login_request
            0x81: account_login_ok
            0x82: login_denied
#            0x83: delete_character
#            0x84: change_character_password
            0x85: delete_character_failed
            0x86: resend_characters_after_delete
            0x87: send_resources
            0x88: open_paperdoll
            0x89: corpse_clothing
            0x8A: trigger_edit
            0x8B: display_sign
            0x8C: server_redirect
            0x8D: unused_3
            0x8E: move_character
            0x8F: unused_4
            0x90: map_message_open_course_gump
#            0x91: post_login
            0x92: update_multi
            0x93: book_header
            0x94: update_skill
            0x95: dye_window
            0x96: game_central_monitor
            0x97: move_player
            0x98: mob_name
            0x99: house__boat_placement
            0x9A: console_entry_prompt
#            0x9B: request_help
            0x9C: assist_request
            0x9D: gm_single
            0x9E: sell_list
#            0x9F: sell_reply
#            0xA0: select_server
            0xA1: update_current_health
            0xA2: update_current_mana
            0xA3: update_current_stamina
#            0xA4: client_machine_info
            0xA5: open_web_browser
            0xA6: tip__notice_window
#            0xA7: request_tips
            0xA8: game_server_list
            0xA9: characters__starting_locations
            0xAA: attack_request_reply
            0xAB: gump_text_entry_dialog
#            0xAC: gump_text_entry_dialog_reply
#            0xAD: unicode_speech_request
            0xAE: unicode_speech_message
            0xAF: display_death_animation
            0xB0: send_gump_menu_dialog
#            0xB1: gump_menu_selection
#            0xB2: chat_message
            0xB5: open_chat_window
#            0xB6: send_help__tip_request
            0xB7: help__tip_data
            0xB8: request_char_profile
            0xB9: client_features
            0xBA: quest_arrow
            0xBB: ultima_messenger
            0xBC: seasonal_information
            0xBD: client_version_message
            0xBE: assist_version
            0xBF: misc_commands_packet
            0xC0: hued_fx
            0xC1: predefined_message
            0xC2: unicode_text_entry
            0xC3: global_queue
            0xC4: semivisible
            0xC5: invalid_map
            0xC6: invalid_map_enable
            0xC7: particle_effect
            0xC8: change_update_range
            0xC9: trip_time
            0xCA: utrip_time
            0xCB: global_queue_count
            0xCC: localized_text_plus_string
            0xCD: unknown_god_packet
            0xCE: igr_client
#            0xCF: igr_login
            0xD0: igr_configuration
            0xD1: igr_logout
            0xD2: update_mobile
            0xD3: show_mobile
            0xD4: book_info
#            0xD5: unknown_client_packet
            0xD6: mega_cliloc
            0xD7: aos_command
            0xD8: custom_house
#            0xD9: metrics
            0xDA: mahjong
            0xDB: character_transfer_log
            0xDC: unused5
            0xDD: compressed_gump

  create_character:
    doc: |
      This is sent to create a new character.
    enums:
        gender_type:
         0: male
         1: female
    seq:
      - id: pattern1
        contents: [0xED, 0xED, 0xED, 0xED]
      - id: pattern2
        contents: [0xFF, 0xFF, 0xFF, 0xFF]
      - id: pattern3
        contents: [0x00]
      - id: char_name
        type: str
        size: 30
        encoding: ASCII
      - id: char_password
        type: str
        size: 30
        encoding: ASCII
      - id: gender
        type: u1
        enum: gender_type
      - id: str
        type: u1
      - id: dex
        type: u1
      - id: int
        type: u1
      - id: skill1
        type: u1
      - id: skill1value
        type: u1
      - id: skill2
        type: u1
      - id: skill2value
        type: u1
      - id: skill3
        type: u1
      - id: skill3value
        type: u1
      - id: skin_color
        type: u2
      - id: hair_style
        type: u2
      - id: hair_color
        type: u2
      - id: facialhair_style
        type: u2
      - id: facialhair_color
        type: u2
      - id: location
        type: u2
      - id: unknown1
        type: u2
      - id: slot
        type: u2
      - id: client_ip
        type: u2
      - id: shirt_color
        type: u2
      - id: pants_color
        type: u2
  disconnect_notification:
    doc: |
      This is a message sent from client to server when the user chooses to return to the main menu from the character select menu.
    seq:
      - id: pattern
        contents: [0xFF, 0xFF, 0xFF, 0xFF]
  move_request:
    doc: |
      This packet is sent by the client when the player tries to walk, run, or change his direction.
      The sequence number starts at 0, is reseted when it reaches 255. However, when it's reseted, the next sequence number is 1, not 0.
      The fastwalk prevention key is a number sent by the server into the MOVE ACK, telling the client the next key to be used. This is used to prevent exploits where client sends “MOVE” message without waitting for the MOVE ACK from the server.
    seq:
      - id: direction
        type: u1
        enum: direction
      - id: sequence
        type: u4
      - id: key
        type: u4
  talk_request:
    doc: |
      This is sent by older clients instead of the Speech Unicode packet.
    seq:
      - id: block_size
        type: u2
      - id: speech_type
        type: u1
        enum: speech_type
      - id: hue
        type: u2
      - id: font
        type: u2
      - id: msg
        type: str
        terminator: 0x00
        encoding: ASCII
    enums:
      speech_type:
        0x00: regular
        0x01: broadcast
        0x02: emote
        0x06: system
        0x07: message
        0x08: whisper
        0x09: yell
  god_mode_toggle:
    doc: |
      god_mode_toggle
    seq:
      - id: change_me
        type: u1
  attack_request:
    doc: |
      attack_request
    seq:
      - id: change_me
        type: u1
  double_click:
    doc: |
      double_click
    seq:
      - id: change_me
        type: u1
  pick_up_item:
    doc: |
      pick_up_item
    seq:
      - id: change_me
        type: u1
  drop_item:
    doc: |
      drop_item
    seq:
      - id: change_me
        type: u1
  single_click:
    doc: |
      single_click
    seq:
      - id: change_me
        type: u1
  packet_edit:
    doc: |
      packet_edit
    seq:
      - id: change_me
        type: u1
  packet_editarea:
    doc: |
      packet_editarea
    seq:
      - id: change_me
        type: u1
  packet_tiledata:
    doc: |
      packet_tiledata
    seq:
      - id: change_me
        type: u1
  packet_npcdata:
    doc: |
      packet_npcdata
    seq:
      - id: change_me
        type: u1
  packet_templatedata:
    doc: |
      packet_templatedata
    seq:
      - id: change_me
        type: u1
  packet_paperdoll:
    doc: |
      packet_paperdoll
    seq:
      - id: change_me
        type: u1
  packet_huedata:
    doc: |
      packet_huedata
    seq:
      - id: change_me
        type: u1
  stat_window_info:
    doc: |
      stat_window_info
    seq:
      - id: change_me
        type: u1
  request_skill__action__magic_usage:
    doc: |
      request_skill__action__magic_usage
    seq:
      - id: change_me
        type: u1
  equip_item_request:
    doc: |
      equip_item_request
    seq:
      - id: change_me
        type: u1
  change_elevation:
    doc: |
      change_elevation
    seq:
      - id: change_me
        type: u1
  follow:
    doc: |
      follow
    seq:
      - id: change_me
        type: u1
  request_script_names:
    doc: |
      request_script_names
    seq:
      - id: change_me
        type: u1
  script_tree_command:
    doc: |
      script_tree_command
    seq:
      - id: change_me
        type: u1
  script_attach:
    doc: |
      script_attach
    seq:
      - id: change_me
        type: u1
  npc_conversation_data:
    doc: |
      npc_conversation_data
    seq:
      - id: change_me
        type: u1
  object_information:
    doc: |
      object_information
    seq:
      - id: change_me
        type: u1
  login_confirmation:
    doc: |
      login_confirmation
    seq:
      - id: change_me
        type: u1
  send_text:
    doc: |
      send_text
    seq:
      - id: change_me
        type: u1
  delete_object:
    doc: |
      delete_object
    seq:
      - id: change_me
        type: u1
  packet_animate:
    doc: |
      packet_animate
    seq:
      - id: change_me
        type: u1
  packet_explode:
    doc: |
      packet_explode
    seq:
      - id: change_me
        type: u1
  teleport_player:
    doc: |
      teleport_player
    seq:
      - id: change_me
        type: u1
  character_move_reject:
    doc: |
      character_move_reject
    seq:
      - id: change_me
        type: u1
  character_move_ack__resync_request:
    doc: |
      character_move_ack__resync_request
    seq:
      - id: change_me
        type: u1
  drag_item:
    doc: |
      drag_item
    seq:
      - id: change_me
        type: u1
  draw_container:
    doc: |
      draw_container
    seq:
      - id: change_me
        type: u1
  add_item_to_container:
    doc: |
      add_item_to_container
    seq:
      - id: change_me
        type: u1
  kick_player:
    doc: |
      kick_player
    seq:
      - id: change_me
        type: u1
  get_item_failed:
    doc: |
      get_item_failed
    seq:
      - id: change_me
        type: u1
  clear_square:
    doc: |
      clear_square
    seq:
      - id: change_me
        type: u1
  paperdoll_clothing_added:
    doc: |
      paperdoll_clothing_added
    seq:
      - id: change_me
        type: u1
  packet_blood:
    doc: |
      packet_blood
    seq:
      - id: change_me
        type: u1
  toggle_god_mode_reply:
    doc: |
      toggle_god_mode_reply
    seq:
      - id: change_me
        type: u1
  death__resurrection:
    doc: |
      death__resurrection
    seq:
      - id: change_me
        type: u1
  packet_health:
    doc: |
      packet_health
    seq:
      - id: change_me
        type: u1
  equip_item:
    doc: |
      equip_item
    seq:
      - id: change_me
        type: u1
  fight_occurring:
    doc: |
      fight_occurring
    seq:
      - id: change_me
        type: u1
  attack_ok:
    doc: |
      attack_ok
    seq:
      - id: change_me
        type: u1
  attack_end:
    doc: |
      attack_end
    seq:
      - id: change_me
        type: u1
  hack_mover:
    doc: |
      hack_mover
    seq:
      - id: change_me
        type: u1
  pause__resume_client:
    doc: |
      pause__resume_client
    seq:
      - id: change_me
        type: u1
  group:
    doc: |
      group
    seq:
      - id: change_me
        type: u1
  client_query:
    doc: |
      client_query
    seq:
      - id: change_me
        type: u1
  resource_type:
    doc: |
      resource_type
    seq:
      - id: change_me
        type: u1
  resource_tile_data:
    doc: |
      resource_tile_data
    seq:
      - id: change_me
        type: u1
  move_object:
    doc: |
      move_object
    seq:
      - id: change_me
        type: u1
  follow_move:
    doc: |
      follow_move
    seq:
      - id: change_me
        type: u1
  groups:
    doc: |
      groups
    seq:
      - id: change_me
        type: u1
  get_player_status:
    doc: |
      get_player_status
    seq:
      - id: change_me
        type: u1
  send_skills__lock_state:
    doc: |
      send_skills__lock_state
    seq:
      - id: change_me
        type: u1
  buy_item:
    doc: |
      buy_item
    seq:
      - id: change_me
        type: u1
  items_in_container:
    doc: |
      items_in_container
    seq:
      - id: change_me
        type: u1
  ship:
    doc: |
      ship
    seq:
      - id: change_me
        type: u1
  versions:
    doc: |
      versions
    seq:
      - id: change_me
        type: u1
  update_statics:
    doc: |
      update_statics
    seq:
      - id: change_me
        type: u1
  update_terrain:
    doc: |
      update_terrain
    seq:
      - id: change_me
        type: u1
  update_tiledata:
    doc: |
      update_tiledata
    seq:
      - id: change_me
        type: u1
  update_art:
    doc: |
      update_art
    seq:
      - id: change_me
        type: u1
  update_anim:
    doc: |
      update_anim
    seq:
      - id: change_me
        type: u1
  update_hues:
    doc: |
      update_hues
    seq:
      - id: change_me
        type: u1
  ver_ok:
    doc: |
      ver_ok
    seq:
      - id: change_me
        type: u1
  new_art:
    doc: |
      new_art
    seq:
      - id: change_me
        type: u1
  new_terrain:
    doc: |
      new_terrain
    seq:
      - id: change_me
        type: u1
  new_anim:
    doc: |
      new_anim
    seq:
      - id: change_me
        type: u1
  new_hues:
    doc: |
      new_hues
    seq:
      - id: change_me
        type: u1
  destroy_art:
    doc: |
      destroy_art
    seq:
      - id: change_me
        type: u1
  check_ver:
    doc: |
      check_ver
    seq:
      - id: change_me
        type: u1
  script_names:
    doc: |
      script_names
    seq:
      - id: change_me
        type: u1
  script_file:
    doc: |
      script_file
    seq:
      - id: change_me
        type: u1
  personal_light_level:
    doc: |
      personal_light_level
    seq:
      - id: change_me
        type: u1
  overall_light_level:
    doc: |
      overall_light_level
    seq:
      - id: change_me
        type: u1
  board_header:
    doc: |
      overall_light_level
    seq:
      - id: board_header
        type: u1
  board_message:
    doc: |
      overall_light_level
    seq:
      - id: board_message
        type: u1
  post_message:
    doc: |
      overall_light_level
    seq:
      - id: post_message
        type: u1
  login_reject:
    doc: |
      login_reject
    seq:
      - id: change_me
        type: u1
  play_sound_effect:
    doc: |
      play_sound_effect
    seq:
      - id: change_me
        type: u1
  login_complete:
    doc: |
      login_complete
    seq:
      - id: change_me
        type: u1
  plot_course:
    doc: |
      plot_course
    seq:
      - id: change_me
        type: u1
  update_regions:
    doc: |
      update_regions
    seq:
      - id: change_me
        type: u1
  new_region:
    doc: |
      new_region
    seq:
      - id: change_me
        type: u1
  new_context_fx:
    doc: |
      new_context_fx
    seq:
      - id: change_me
        type: u1
  update_context_fx:
    doc: |
      update_context_fx
    seq:
      - id: change_me
        type: u1
  time:
    doc: |
      time
    seq:
      - id: change_me
        type: u1
  restart_ver:
    doc: |
        restart_ver
    seq:
      - id: change_me
        type: u1
  pre_login:
    doc: |
      pre_login
    seq:
      - id: change_me
        type: u1
  server_list:
    doc: |
      server_list
    seq:
      - id: change_me
        type: u1
  add_server:
    doc: |
      add_server
    seq:
      - id: change_me
        type: u1
  server_remove:
    doc: |
      server_remove
    seq:
      - id: change_me
        type: u1
  destroy_static:
    doc: |
      destroy_static
    seq:
      - id: change_me
        type: u1
  move_static:
    doc: |
      move_static
    seq:
      - id: change_me
        type: u1
  area_load:
    doc: |
      area_load
    seq:
      - id: change_me
        type: u1
  area_load_request:
    doc: |
      area_load_request
    seq:
      - id: change_me
        type: u1
  set_weather:
    doc: |
      set_weather
    seq:
      - id: change_me
        type: u1
  book_contents:
    doc: |
      book_contents
    seq:
      - id: change_me
        type: u1
  simple_edit:
    doc: |
      simple_edit
    seq:
      - id: change_me
        type: u1
  script_ls_attach:
    doc: |
      script_ls_attach
    seq:
      - id: change_me
        type: u1
  friends:
    doc: |
      friends
    seq:
      - id: change_me
        type: u1
  friend_notify:
    doc: |
      friend_notify
    seq:
      - id: change_me
        type: u1
  key_use:
    doc: |
      key_use
    seq:
      - id: change_me
        type: u1
  targeting_cursor_commands:
    doc: |
      targeting_cursor_commands
    seq:
      - id: change_me
        type: u1
  play_midi_music:
    doc: |
      play_midi_music
    seq:
      - id: change_me
        type: u1
  character_animation:
    doc: |
      character_animation
    seq:
      - id: change_me
        type: u1
  secure_trading:
    doc: |
      secure_trading
    seq:
      - id: change_me
        type: u1
  graphical_effect:
    doc: |
      graphical_effect
    seq:
      - id: change_me
        type: u1
  bulletin_board_message:
    doc: |
      bulletin_board_message
    seq:
      - id: change_me
        type: u1
  request_war_mode_change__send_war_mode_status:
    doc: |
      request_war_mode_change__send_war_mode_status
    seq:
      - id: change_me
        type: u1
  ping_message:
    doc: |
      ping_message
    seq:
      - id: change_me
        type: u1
  open_buy_window:
    doc: |
      open_buy_window
    seq:
      - id: change_me
        type: u1
  rename_character:
    doc: |
      rename_character
    seq:
      - id: change_me
        type: u1
  new_subserver:
    doc: |
      new_subserver
    seq:
      - id: change_me
        type: u1
  update_player:
    doc: |
      update_player
    seq:
      - id: change_me
        type: u1
  draw_object:
    doc: |
      draw_object
    seq:
      - id: change_me
        type: u1
  resource_query:
    doc: |
      resource_query
    seq:
      - id: change_me
        type: u1
  resource_data:
    doc: |
      resource_data
    seq:
      - id: change_me
        type: u1
  sequence:
    doc: |
      sequence
    seq:
      - id: change_me
        type: u1
  object_picker:
    doc: |
      object_picker
    seq:
      - id: change_me
        type: u1
  client_response_to_dialog:
    doc: |
      client_response_to_dialog
    seq:
      - id: change_me
        type: u1
  god_view_query:
    doc: |
      god_view_query
    seq:
      - id: change_me
        type: u1
  god_view_data:
    doc: |
      god_view_data
    seq:
      - id: change_me
        type: u1
  login_request:
    doc: |
      login_request
    seq:
      - id: change_me
        type: u1
  account_login_ok:
    doc: |
      account_login_ok
    seq:
      - id: change_me
        type: u1
  login_denied:
    doc: |
      login_denied
    seq:
      - id: change_me
        type: u1
  delete_character:
    doc: |
      delete_character
    seq:
      - id: change_me
        type: u1
  change_character_password:
    doc: |
      change_character_password
    seq:
      - id: change_me
        type: u1
  delete_character_failed:
    doc: |
      delete_character_failed
    seq:
      - id: change_me
        type: u1
  resend_characters_after_delete:
    doc: |
      resend_characters_after_delete
    seq:
      - id: change_me
        type: u1
  send_resources:
    doc: |
      send_resources
    seq:
      - id: change_me
        type: u1
  open_paperdoll:
    doc: |
      open_paperdoll
    seq:
      - id: change_me
        type: u1
  corpse_clothing:
    doc: |
      corpse_clothing
    seq:
      - id: change_me
        type: u1
  trigger_edit:
    doc: |
      trigger_edit
    seq:
      - id: change_me
        type: u1
  display_sign:
    doc: |
      display_sign
    seq:
      - id: change_me
        type: u1
  server_redirect:
    doc: |
      server_redirect
    seq:
      - id: change_me
        type: u1
  unused_3:
    doc: |
      unused_3
    seq:
      - id: change_me
        type: u1
  move_character:
    doc: |
      move_character
    seq:
      - id: change_me
        type: u1
  unused_4:
    doc: |
      unused_4
    seq:
      - id: change_me
        type: u1
  map_message_open_course_gump:
    doc: |
      map_message_open_course_gump
    seq:
      - id: change_me
        type: u1
  post_login:
    doc: |
      post_login
    seq:
      - id: change_me
        type: u1
  update_multi:
    doc: |
      update_multi
    seq:
      - id: change_me
        type: u1
  book_header:
    doc: |
      book_header
    seq:
      - id: change_me
        type: u1
  update_skill:
    doc: |
      update_skill
    seq:
      - id: change_me
        type: u1
  dye_window:
    doc: |
      dye_window
    seq:
      - id: change_me
        type: u1
  game_central_monitor:
    doc: |
      game_central_monitor
    seq:
      - id: change_me
        type: u1
  move_player:
    doc: |
      move_player
    seq:
      - id: change_me
        type: u1
  mob_name:
    doc: |
      mob_name
    seq:
      - id: change_me
        type: u1
  house__boat_placement:
    doc: |
      house__boat_placement
    seq:
      - id: change_me
        type: u1
  console_entry_prompt:
    doc: |
      console_entry_prompt
    seq:
      - id: change_me
        type: u1
  request_help:
    doc: |
      request_help
    seq:
      - id: change_me
        type: u1
  assist_request:
    doc: |
      assist_request
    seq:
      - id: change_me
        type: u1
  gm_single:
    doc: |
      gm_single
    seq:
      - id: change_me
        type: u1
  sell_list:
    doc: |
      sell_list
    seq:
      - id: change_me
        type: u1
  sell_reply:
    doc: |
      sell_reply
    seq:
      - id: change_me
        type: u1
  select_server:
    doc: |
      select_server
    seq:
      - id: change_me
        type: u1
  update_current_health:
    doc: |
      update_current_health
    seq:
      - id: change_me
        type: u1
  update_current_mana:
    doc: |
      update_current_mana
    seq:
      - id: change_me
        type: u1
  update_current_stamina:
    doc: |
      update_current_stamina
    seq:
      - id: change_me
        type: u1
  client_machine_info:
    doc: |
      client_machine_info
    seq:
      - id: change_me
        type: u1
  open_web_browser:
    doc: |
      open_web_browser
    seq:
      - id: change_me
        type: u1
  tip__notice_window:
    doc: |
      tip__notice_window
    seq:
      - id: change_me
        type: u1
  request_tips:
    doc: |
      request_tips
    seq:
      - id: change_me
        type: u1
  game_server_list:
    doc: |
      game_server_list
    seq:
      - id: change_me
        type: u1
  characters__starting_locations:
    doc: |
      characters__starting_locations
    seq:
      - id: change_me
        type: u1
  attack_request_reply:
    doc: |
      attack_request_reply
    seq:
      - id: change_me
        type: u1
  gump_text_entry_dialog:
    doc: |
      gump_text_entry_dialog
    seq:
      - id: change_me
        type: u1
  gump_text_entry_dialog_reply:
    doc: |
      gump_text_entry_dialog_reply
    seq:
      - id: change_me
        type: u1
  unicode_speech_request:
    doc: |
      unicode_speech_request
    seq:
      - id: change_me
        type: u1
  unicode_speech_message:
    doc: |
      unicode_speech_message
    seq:
      - id: change_me
        type: u1
  display_death_animation:
    doc: |
      display_death_animation
    seq:
      - id: change_me
        type: u1
  send_gump_menu_dialog:
    doc: |
      send_gump_menu_dialog
    seq:
      - id: change_me
        type: u1
  gump_menu_selection:
    doc: |
      gump_menu_selection
    seq:
      - id: change_me
        type: u1
  chat_message:
    doc: |
      chat_message
    seq:
      - id: change_me
        type: u1
  open_chat_window:
    doc: |
      open_chat_window
    seq:
      - id: change_me
        type: u1
  send_help__tip_request:
    doc: |
      send_help__tip_request
    seq:
      - id: change_me
        type: u1
  help__tip_data:
    doc: |
      help__tip_data
    seq:
      - id: change_me
        type: u1
  request_char_profile:
    doc: |
      request_char_profile
    seq:
      - id: change_me
        type: u1
  client_features:
    doc: |
      client_features
    seq:
      - id: change_me
        type: u1
  quest_arrow:
    doc: |
      quest_arrow
    seq:
      - id: change_me
        type: u1
  ultima_messenger:
    doc: |
      ultima_messenger
    seq:
      - id: change_me
        type: u1
  seasonal_information:
    doc: |
      seasonal_information
    seq:
      - id: change_me
        type: u1
  client_version_message:
    doc: |
      client_version_message
    seq:
      - id: change_me
        type: u1
  assist_version:
    doc: |
      assist_version
    seq:
      - id: change_me
        type: u1
  misc_commands_packet:
    doc: |
      misc_commands_packet
    seq:
      - id: change_me
        type: u1
  hued_fx:
    doc: |
      hued_fx
    seq:
      - id: change_me
        type: u1
  predefined_message:
    doc: |
      predefined_message
    seq:
      - id: change_me
        type: u1
  unicode_text_entry:
    doc: |
      unicode_text_entry
    seq:
      - id: change_me
        type: u1
  global_queue:
    doc: |
      global_queue
    seq:
      - id: change_me
        type: u1
  semivisible:
    doc: |
      semivisible
    seq:
      - id: change_me
        type: u1
  invalid_map:
    doc: |
      invalid_map
    seq:
      - id: change_me
        type: u1
  invalid_map_enable:
    doc: |
      invalid_map_enable
    seq:
      - id: change_me
        type: u1
  particle_effect:
    doc: |
      particle_effect
    seq:
      - id: change_me
        type: u1
  change_update_range:
    doc: |
      change_update_range
    seq:
      - id: change_me
        type: u1
  trip_time:
    doc: |
      trip_time
    seq:
      - id: change_me
        type: u1
  utrip_time:
    doc: |
      utrip_time
    seq:
      - id: change_me
        type: u1
  global_queue_count:
    doc: |
      global_queue_count
    seq:
      - id: change_me
        type: u1
  localized_text_plus_string:
    doc: |
      localized_text_plus_string
    seq:
      - id: change_me
        type: u1
  unknown_god_packet:
    doc: |
      unknown_god_packet
    seq:
      - id: change_me
        type: u1
  igr_client:
    doc: |
      igr_client
    seq:
      - id: change_me
        type: u1
  igr_login:
    doc: |
      igr_login
    seq:
      - id: change_me
        type: u1
  igr_configuration:
    doc: |
      igr_configuration
    seq:
      - id: change_me
        type: u1
  igr_logout:
    doc: |
      igr_logout
    seq:
      - id: change_me
        type: u1
  update_mobile:
    doc: |
      update_mobile
    seq:
      - id: change_me
        type: u1
  show_mobile:
    doc: |
      show_mobile
    seq:
      - id: change_me
        type: u1
  book_info:
    doc: |
      book_info
    seq:
      - id: change_me
        type: u1
  unknown_client_packet:
    doc: |
      unknown_client_packet
    seq:
      - id: change_me
        type: u1
  mega_cliloc:
    doc: |
      mega_cliloc
    seq:
      - id: change_me
        type: u1
  aos_command:
    doc: |
      aos_command
    seq:
      - id: change_me
        type: u1
  custom_house:
    doc: |
      custom_house
    seq:
      - id: change_me
        type: u1
  metrics:
    doc: |
      metrics
    seq:
      - id: change_me
        type: u1
  mahjong:
    doc: |
      mahjong
    seq:
      - id: change_me
        type: u1
  character_transfer_log:
    doc: |
      character_transfer_log
    seq:
      - id: change_me
        type: u1
  unused5:
    doc: |
      unused5
    seq:
      - id: change_me
        type: u1
  compressed_gump:
    doc: |
      compressed_gump
    seq:
      - id: change_me
        type: u1
enums:
  direction:
    0: northeast
    1: east
    2: southeast
    3: south
    4: southwest
    5: west
    6: northwest
    7: north
  source:
    0: to_server
    1: to_client