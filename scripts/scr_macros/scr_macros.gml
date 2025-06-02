#region //Object references
#macro BLOCK obj_block
#macro ONEWAY obj_oneWay
#macro GROUND abs_ground
#macro BLOCK_CARRY abs_carryBlock
#macro ONEWAY_CARRY abs_carryOneway
#macro CARRY [BLOCK_CARRY, ONEWAY_CARRY]
#macro CORPSE obj_dead
#macro PLAYER obj_player
#endregion

#region //Room references
#macro TITLE room_beach
#endregion

#region //Constant numbers
#macro TERMINAL_VELOCITY 10
#macro MAX_ACCEL 3
#macro JUMP_HEIGHT 4
#macro PLAYER_WEIGHT 0.02
#macro FLICKER_MAX game_get_speed(gamespeed_fps)
#macro TEXT_BALLOON_SPEED 5
#macro TEXT_BALLOON_MAXW 150
#endregion

#region //masks
#macro MASK_BLANK spr_maskNone
#endregion

#region	//Controls.
#macro ANY_BUTTON (keyboard_check(vk_anykey))
#macro RIGHT_BUTTON (keyboard_check(vk_right)	 || keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr))
#macro DOWN_BUTTON (keyboard_check(vk_down)		 || keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd))
#macro LEFT_BUTTON (keyboard_check(vk_left)		 || keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl))
#macro UP_BUTTON (keyboard_check(vk_up)			 || keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu))
#macro A_BUTTON (keyboard_check(vk_space) || gamepad_button_check(0, gp_face1))
#macro B_BUTTON (keyboard_check(ord("Z")) || gamepad_button_check(0, gp_face2))
#macro X_BUTTON (keyboard_check(ord("X")) || gamepad_button_check(0, gp_face3))
#macro Y_BUTTON (keyboard_check(ord("C")) || gamepad_button_check(0, gp_face4))
#macro FACE_BUTTON (A_BUTTON || B_BUTTON || X_BUTTON || Y_BUTTON) 
#macro START_BUTTON ((gamepad_button_check(0, gp_start)) || (keyboard_check(vk_enter)))
#macro RESTART_BUTTON (keyboard_check(vk_f8))
#macro MOUSE_LEFT_BUTTON mouse_check_button(mb_left)
#macro MOUSE_RIGHT_BUTTON mouse_check_button(mb_right)
#macro MOUSE_LEFT_BUTTON_NOT_GUI (!position_meeting(mouse_x, mouse_y, abs_gui) && MOUSE_LEFT_BUTTON)
#macro MOUSE_RIGHT_BUTTON_NOT_GUI (!position_meeting(mouse_x, mouse_y, abs_gui) && MOUSE_RIGHT_BUTTON)
#macro MOUSE_WHEEL_UP mouse_wheel_up()
#macro MOUSE_WHEEL_DOWN mouse_wheel_down()

#macro ANY_BUTTON_PRESSED (keyboard_check_pressed(vk_anykey))
#macro RIGHT_BUTTON_PRESSED (keyboard_check_pressed(vk_right)	|| keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr))
#macro DOWN_BUTTON_PRESSED (keyboard_check_pressed(vk_down)		|| keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd))
#macro LEFT_BUTTON_PRESSED (keyboard_check_pressed(vk_left)		|| keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl))
#macro UP_BUTTON_PRESSED (keyboard_check_pressed(vk_up)			|| keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu))
#macro A_BUTTON_PRESSED (keyboard_check_pressed(vk_space)	|| gamepad_button_check_pressed(0, gp_face1))
#macro B_BUTTON_PRESSED (keyboard_check_pressed(ord("Z"))	|| gamepad_button_check_pressed(0, gp_face2))
#macro X_BUTTON_PRESSED (keyboard_check_pressed(ord("X"))	|| gamepad_button_check_pressed(0, gp_face3))
#macro Y_BUTTON_PRESSED (keyboard_check_pressed(ord("C"))	|| gamepad_button_check_pressed(0, gp_face4))
#macro RESTART_BUTTON_PRESSED (keyboard_check_pressed(vk_f8))
#macro MOUSE_LEFT_BUTTON_PRESSED mouse_check_button_pressed(mb_left)
#macro MOUSE_RIGHT_BUTTON_PRESSED mouse_check_button_pressed(mb_right)
#macro MOUSE_LEFT_BUTTON_PRESSED_NOT_GUI (!position_meeting(mouse_x, mouse_y, abs_gui) && MOUSE_LEFT_BUTTON_PRESSED)
#macro MOUSE_RIGHT_BUTTON_PRESSED_NOT_GUI (!position_meeting(mouse_x, mouse_y, abs_gui) && MOUSE_RIGHT_BUTTON_PRESSED)

#macro ANY_BUTTON_RELEASED (keyboard_check_released(vk_anykey))
#macro START_BUTTON_RELEASED ((gamepad_button_check_released(0, gp_start)) || (keyboard_check_released(vk_enter)))
#macro RIGHT_BUTTON_RELEASED (keyboard_check_released(vk_right) || keyboard_check_released(ord("D")) || gamepad_button_check_released(0, gp_padr))
#macro DOWN_BUTTON_RELEASED (keyboard_check_released(vk_down)	|| keyboard_check_released(ord("S")) || gamepad_button_check_released(0, gp_padd) || mouse_wheel_down())
#macro LEFT_BUTTON_RELEASED (keyboard_check_released(vk_left)	|| keyboard_check_released(ord("A")) || gamepad_button_check_released(0, gp_padl))
#macro UP_BUTTON_RELEASED (keyboard_check_released(vk_up)		|| keyboard_check_released(ord("W")) || gamepad_button_check_released(0, gp_padu) || mouse_wheel_up())
#macro A_BUTTON_RELEASED (keyboard_check_released(vk_space) || gamepad_button_check_released(0, gp_face1))
#macro B_BUTTON_RELEASED (keyboard_check_released(ord("Z")) || gamepad_button_check_released(0, gp_face2))
#macro X_BUTTON_RELEASED (keyboard_check_released(ord("X")) || gamepad_button_check_released(0, gp_face3))
#macro Y_BUTTON_RELEASED (keyboard_check_released(ord("C")) || gamepad_button_check_released(0, gp_face4))
#macro FACE_BUTTON_RELEASED (A_BUTTON_RELEASED || B_BUTTON_RELEASED || X_BUTTON_RELEASED || Y_BUTTON_RELEASED) 
#macro MOUSE_LEFT_BUTTON_RELEASED mouse_check_button_pressed(mb_left)
#macro MOUSE_RIGHT_BUTTON_RELEASED mouse_check_button_pressed(mb_right)
#macro MOUSE_LEFT_BUTTON_RELEASED_NOT_GUI (!position_meeting(mouse_x, mouse_y, abs_gui) && MOUSE_LEFT_BUTTON_RELEASED)
#macro MOUSE_RIGHT_BUTTON_RELEASED_NOT_GUI (!position_meeting(mouse_x, mouse_y, abs_gui) && MOUSE_RIGHT_BUTTON_RELEASED)
#endregion

#region enums
enum USER_EVENTS {U_EVENT_PICKED_UP = 14, U_EVENT_THROWN = 15}
#endregion