/* Copyright 2020 foostan
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#include QMK_KEYBOARD_H

enum layers {
    _DEFAULT = 0,
    _LOWER = 1,
    _RAISE = 2,
    _ADJUST = 3,
    _NOMODS = 4,
};

#define LOWER MO(_LOWER)
#define RAISE MO(_RAISE)
#define ADJST MO(_ADJUST)

// Mod Tap defintion
#define MT_A LGUI_T(KC_A)
#define MT_S LSFT_T(KC_S)
#define MT_D LALT_T(KC_D)

#define MT_K RALT_T(KC_K)
#define MT_L RSFT_T(KC_L)
#define MT_SCLN RGUI_T(KC_SCLN)

#define CTLESC LCTL_T(KC_ESC)

#define AGLEFT LALT(LGUI(KC_LEFT))
#define AGRIGHT LALT(LGUI(KC_RIGHT))
#define AGUP LALT(LGUI(KC_UP))
#define AGDOWN LALT(LGUI(KC_DOWN))
#define AGF LALT(LGUI(KC_F))
#define AGC LALT(LGUI(KC_C))
#define ALLIN1 LSFT(LGUI(KC_5))
#define SCRNSHT LSFT(LGUI(KC_6))

#define FLOW_TAP_TERM 200

// macOS never sleeping fixes
#define USB_POLLING_INTERVAL_MS 10
#define USB_SUSPEND_WAKEUP_DELAY_MS 0
#define USB_MAX_POWER_CONSUMPTION 100
#define NO_USB_STARTUP_CHECK

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
   /* Qwerty (with homerow mods)
    * ,------------------------------------------------------------------------------------------.
    * | Tab  |   Q  |   W  |   E  |   R  |   T  |      |   Y  |   U  |   I  |   O  |   P  | Bksp |
    * |------+------+------+------+------+------+------+------+------+------+------+------+------|
    * |CTLESC|LGUI_A|LSFT_S|LATL_D|   F  |   G  |      |   H  |   J  |RALT_K|RSFT_L|RGUI_;|  "   |
    * |------+------+------+------+------+------+------+------+------+------+------+------+------|
    * | Shift|   Z  |   X  |   C  |   V  |   B  |      |   N  |   M  |   ,  |   .  |   /  |Enter |
    * |------+------+------+------+------+------+------+------+------+------+------+------+------|
    * | HYPER| LCTL | LALT |      | LOWER| SPACE|      |ENTER |RAISE |      | RALT | RCTL |HYPER |
    * `------------------------------------------------------------------------------------------'
    */
  [_DEFAULT] = LAYOUT(
      KC_TAB,    KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,         KC_Y,    KC_U,     KC_I,    KC_O,    KC_P, KC_BSPC,
      CTLESC,    MT_A,    MT_S,    MT_D,    KC_F,    KC_G,         KC_H,    KC_J,     MT_K,    MT_L, MT_SCLN, KC_QUOT,
      KC_LSFT,   KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,         KC_N,    KC_M,  KC_COMM,  KC_DOT, KC_SLSH, KC_RSFT,
      KC_HYPR,KC_LCTL, KC_LALT, XXXXXXX,   LOWER,  KC_SPC,       KC_ENT,   RAISE,  XXXXXXX, KC_RALT, KC_RCTL, KC_HYPR
  ),

   /* Lower
    * ,------------------------------------------------------------------------------------------.
    * |   ~  |   1  |   2  |   3  |   4  |   5  |      |   6  |   7  |   8  |   9  |   0  | Bksp |
    * |------+------+------+------+------+------+      +------+------+------+------+------+------|
    * |      | XXXX | XXXX | XXXX | XXXX | XXXX |      | Left | Down |  Up  |Right | XXXX | XXXX |
    * |------+------+------+------+------+------+      +------+------+------+------+------+------|
    * |      | XXXX | XXXX | XXXX | XXXX | XXXX |      | XXXX | XXXX | XXXX | XXXX | XXXX | XXXX |
    * |------+------+------+------+------+------+      +------+------+------+------+------+------|
    * |      |      |      |      | LOWER|      |      |      |ADJUST|      |      |      |      |
    * `------------------------------------------------------------------------------------------'
    */
  [_LOWER] = LAYOUT(
     KC_TILD,    KC_1,    KC_2,    KC_3,    KC_4,    KC_5,         KC_6,    KC_7,    KC_8,    KC_9,    KC_0, KC_BSPC,
     _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,      KC_LEFT, KC_DOWN,   KC_UP,KC_RIGHT, XXXXXXX, XXXXXXX,
     _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
     _______, _______, _______, _______,   LOWER, _______,      _______,   ADJST, _______, _______, _______, _______
  ),

   /* Raise
    * ,------------------------------------------------------------------------------------------.
    * |   `  |   !  |   @  |   #  |   $  |   %  |      |   ^  |   &  |   *  |   (  |   )  | Bksp |
    * |------+------+------+------+------+------+      +------+------+------+------+------+------|
    * |      | XXXX | XXXX | XXXX | XXXX | XXXX |      |   -  |   =  |   {  |   }  |   |  |   `  |
    * |------+------+------+------+------+------+      +------+------+------+------+------+------|
    * |      | XXXX | XXXX | XXXX | XXXX | XXXX |      |   _  |   +  |   [  |   ]  |   \  |   ~  |
    * |------+------+------+------+------+------+      +------+------+------+------+------+------|
    * |      |      |      |      |ADJUST|      |      |      | RAISE|      |      |      |      |
    * `------------------------------------------------------------------------------------------'
    */
  [_RAISE] = LAYOUT(
      KC_GRV, KC_EXLM,   KC_AT, KC_HASH,  KC_DLR, KC_PERC,      KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, KC_BSPC,
     _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,      KC_MINS,  KC_EQL, KC_LCBR, KC_RCBR, KC_PIPE,  KC_GRV,
     _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,      KC_UNDS, KC_PLUS, KC_LBRC, KC_RBRC, KC_BSLS, KC_TILD,
     _______, _______, _______, _______,   ADJST, _______,      _______,   RAISE, _______, _______, _______, _______
  ),

   /* Adjust
    * ,------------------------------------------------------------------------------------------.
    * |      | XXXX | XXXX | XXXX |ALLIN1| XXXX |      | XXXX | XXXX | XXXX | XXXX | XXXX | XXXX |
    * |------+------+------+------+------+------+      +------+------+------+------+------+------|
    * |QK_BOOT|XXXX |SCRNSHT|XXXX |  AGF | XXXX |      |AGLEFT|AGDOWN| AGUP |AGRIGHT|XXXX | XXXX |
    * |------+------+------+------+------+------+      +------+------+------+------+------+------|
    * |      | XXXX | XXXX |  AGC | XXXX | XXXX |      | XXXX | XXXX | XXXX | XXXX | XXXX | XXXX |
    * |------+------+------+------+------+------+      +------+------+------+------+------+------|
    * |      |      |      |      |ADJUST|      |      |      |ADJUST|      |      |      |      |
    * `------------------------------------------------------------------------------------------'
    */
  [_ADJUST] = LAYOUT(
     _______, XXXXXXX, XXXXXXX, XXXXXXX,  ALLIN1, XXXXXXX,      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_MPLY, KC_SLEP,
     QK_BOOT, XXXXXXX, SCRNSHT, XXXXXXX,     AGF, XXXXXXX,       AGLEFT,  AGDOWN,    AGUP, AGRIGHT, XXXXXXX, XXXXXXX,
     _______, XXXXXXX, XXXXXXX,     AGC, XXXXXXX, XXXXXXX,      KC_MNXT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,TG(_NOMODS),
     _______, _______, _______, _______,   ADJST, _______,      _______,   ADJST, _______, _______, _______, _______
  ),

   /* NoMods (Default without homerow mods)
    * ,------------------------------------------------------------------------------------------.
    * | Tab  |   Q  |   W  |   E  |   R  |   T  |      |   Y  |   U  |   I  |   O  |   P  | Bksp |
    * |------+------+------+------+------+------+      +------+------+------+------+------+------|
    * |CTLESC|   A  |   S  |   D  |   F  |   G  |      |   H  |   J  |   K  |   L  |   ;  |  "   |
    * |------+------+------+------+------+------+      +------+------+------+------+------+------|
    * | Shift|   Z  |   X  |   C  |   V  |   B  |      |   N  |   M  |   ,  |   .  |   /  |Enter |
    * |------+------+------+------+------+------+      +------+------+------+------+------+------|
    * | HYPER| LCTL | LALT |      | LOWER| SPACE|      |ENTER |RAISE |      | RALT | RCTL |HYPER |
    * `------------------------------------------------------------------------------------------'
    */
  [_NOMODS] = LAYOUT(
      _______, _______, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______,
      _______,   KC_A,    KC_S,    KC_D, _______, _______,      _______, _______,   KC_K,    KC_L, KC_SCLN, _______,
      _______, _______, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______,
      _______, _______, _______, _______, _______, _______,      _______, _______, _______, _______, _______, _______
  ),
};
