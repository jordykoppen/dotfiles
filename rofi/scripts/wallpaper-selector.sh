#!/bin/sh
WALLPAPER_SCRIPTS_DIR=$DOTFILES/wallpapers/scripts

ROFI_FB_GENERIC_FO="sh"
ROFI_FB_START_DIR=$WALLPAPER_SCRIPTS_DIR

BASE_URL="https://source.unsplash.com"
UNSPLASH_PATH=$DOTFILES/wallpapers/images/unsplash

WEEK_NUM=$(date +%V)
DAILY_NUM=$(date +"%d-%m-%y")

random_unsplash () {
  URL="${BASE_URL}/random/3840*1600"
  OUTPUT_PATH="${UNSPLASH_PATH}/random"

  wget $URL -O $OUTPUT_PATH -nv
  set_wallpaper $OUTPUT_PATH
}

daily_unsplash () {
  URL="${BASE_URL}/3840x2160/daily"
  OUTPUT_PATH="${UNSPLASH_PATH}/daily/${DAILY_NUM}"

  get_unsplash $URL $OUTPUT_PATH
}

weekly_unsplash () {
  URL="${BASE_URL}/3840x2160/weekly"
  OUTPUT_PATH="${UNSPLASH_PATH}/weekly/${WEEK_NUM}"

  get_unsplash $URL $OUTPUT_PATH
}

get_unsplash () {
  if test ! -f $2; then
    wget $1 -O $2 -nv
  fi

  set_wallpaper $2
}

set_wallpaper () {
  feh --bg-fill $1 >> /dev/null
}


if [[ -z "$@" ]]; then
  echo "local"
  echo "Unsplash Daily"
  echo "Unsplash Weekly"
  echo "Unsplash Random"
else
  case $@ in
    "local")
      ;;
    "Unsplash Daily")
      daily_unsplash
      ;;
    "Unsplash Weekly")
      weekly_unsplash
      ;;
    "Unsplash Random")
      random_unsplash
      ;;
  esac
fi
