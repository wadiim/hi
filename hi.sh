#!/bin/bash

declare -A TYPE=( [hiragana]=false
                  [katakana]=false)
declare -A TABLE=([gojuon]=false
                  [dakuon]=false
                  [handakuon]=false
                  [yoon]=false
                  [sokuon]=false)

# The flags below indicate whether specified command-line options had been
# used successfully.
tflag=false
oflag=false

show_usage()
{
  cat <<- EOF
Usage: $0 [-t types-list] [-o table-names-list]

types-list is a comma-separated list of types of character sets.
Possible values are: 'hiragana' and 'katakana'.

table-names-list is a comma-separated list of table names.
Possible values are: 'gojuon', 'dakuon', 'handakuon', 'yoon', and 'sokuon'
EOF
}

parse_args()
{
  while getopts ":t:o:h" opt; do
    IFS=',' read -ra ARG <<< "$OPTARG"
    case ${opt} in
      t )
        for i in "${ARG[@]}"; do
          case $i in
            hiragana | katakana )
              TYPE[$i]=true
              tflag=true
              ;;
            * )
              show_usage
              exit 1
              ;;
          esac
        done
        ;;
      o )
        for i in "${ARG[@]}"; do
          case $i in
            gojuon | dakuon | handakuon | yoon | sokuon )
              TABLE[$i]=true
              oflag=true
              ;;
            * )
              show_usage
              exit 1
              ;;
          esac
        done
        ;;
      h | : | \? )
        show_usage
        ;;&
      h )
        exit 0
        ;;
      : | \? )
        exit 1
        ;;
    esac
  done
  shift $((OPTIND-1))
}

init()
{
  parse_args $@

  # Set defaults if needed
  if [[ "$tflag" == false ]]; then
    TYPE[hiragana]=true
  fi
  if [[ "$oflag" == false ]]; then
    TABLE[gojuon]=true
  fi
}

print_tables()
{
  for charset in hiragana katakana; do
    if [[ "${TYPE[$charset]}" == true ]]; then
      for table in gojuon dakuon handakuon yoon sokuon; do
        if [[ "${TABLE[$table]}" == true ]]; then
          print_${charset}_$table
        fi
      done
    fi
  done
}

main()
{
  init $@
  print_tables
}

print_hiragana_gojuon()
{
  cat <<- EOF
┌────┬────┬────┬────┬────┬────┐
│    │ a  │ i  │ u  │ e  │ o  │
├────┼────┼────┼────┼────┼────┤
│ a  │ あ │ い │ う │ え │ お │
├────┼────┼────┼────┼────┼────┤
│ ka │ か │ き │ く │ け │ こ │
├────┼────┼────┼────┼────┼────┤
│ sa │ さ │ し │ す │ せ │ そ │
├────┼────┼────┼────┼────┼────┤
│ ta │ た │ ち │ つ │ て │ と │
├────┼────┼────┼────┼────┼────┤
│ na │ な │ に │ ぬ │ ね │ の │
├────┼────┼────┼────┼────┼────┤
│ ha │ は │ ひ │ ふ │ へ │ ほ │
├────┼────┼────┼────┼────┼────┤
│ ma │ ま │ み │ む │ め │ も │
├────┼────┼────┼────┼────┼────┤
│ ya │ や │ い │ ゆ │ え │ よ │
├────┼────┼────┼────┼────┼────┤
│ ra │ ら │ り │ る │ れ │ ろ │
├────┼────┼────┼────┼────┼────┤
│ wa │ わ │ い │ う │ え │ を │
├────┴────┴────┴────┴────┴────┤
│              ん             │
│              n              │
└─────────────────────────────┘
EOF
}

print_hiragana_dakuon()
{
  cat <<- EOF
┌────┬────┬────┬────┬────┬────┐
│    │ a  │ i  │ u  │ e  │ o  │
├────┼────┼────┼────┼────┼────┤
│ ga │ が │ ぎ │ ぐ │ げ │ ご │
├────┼────┼────┼────┼────┼────┤
│ za │ ざ │ じ │ ず │ ぜ │ ぞ │
├────┼────┼────┼────┼────┼────┤
│ da │ だ │ ぢ │ づ │ で │ ど │
├────┼────┼────┼────┼────┼────┤
│ ba │ ば │ び │ ぶ │ べ │ ぼ │
└────┴────┴────┴────┴────┴────┘
EOF
}

print_hiragana_handakuon()
{
  cat <<- EOF
┌────┬────┬────┬────┬────┬────┐
│    │ a  │ i  │ u  │ e  │ o  │
├────┼────┼────┼────┼────┼────┤
│ pa │ ぱ │ ぴ │ ぷ │ ぺ │ ぽ │
└────┴────┴────┴────┴────┴────┘
EOF
}

print_hiragana_yoon()
{
  cat <<- EOF
┌──────┬──────┬──────┐
│ きゃ │ きゅ │ きょ │
├──────┼──────┼──────┤
│ kya  │ kyu  │ kyo  │
├──────┼──────┼──────┤
│ しゃ │ しゅ │ しょ │
├──────┼──────┼──────┤
│ sha  │ shu  │ sho  │
├──────┼──────┼──────┤
│ ちゃ │ ちゅ │ ちょ │
├──────┼──────┼──────┤
│ cha  │ chu  │ cho  │
├──────┼──────┼──────┤
│ にゃ │ にゅ │ にょ │
├──────┼──────┼──────┤
│ nya  │ nyu  │ nyo  │
├──────┼──────┼──────┤
│ ひゃ │ ひゅ │ ひょ │
├──────┼──────┼──────┤
│ hya  │ hyu  │ hyo  │
├──────┼──────┼──────┤
│ みゃ │ みゅ │ みょ │
├──────┼──────┼──────┤
│ mya  │ myu  │ myo  │
├──────┼──────┼──────┤
│ りゃ │ りゅ │ りょ │
├──────┼──────┼──────┤
│ rya  │ ryu  │ ryo  │
├──────┼──────┼──────┤
│ きゃ │ きゅ │ きょ │
├──────┼──────┼──────┤
│ gya  │ gyu  │ gyo  │
├──────┼──────┼──────┤
│ しゃ │ しゅ │ しょ │
├──────┼──────┼──────┤
│ ja   │ ju   │ jo   │
├──────┼──────┼──────┤
│ ぢゃ │ ぢゅ │ ぢょ │
├──────┼──────┼──────┤
│ ja   │ ju   │ jo   │
├──────┼──────┼──────┤
│ びゃ │ びゅ │ びょ │
├──────┼──────┼──────┤
│ bya  │ byu  │ byo  │
├──────┼──────┼──────┤
│ ぴゃ │ ぴゅ │ ぴょ │
├──────┼──────┼──────┤
│ pya  │ pyu  │ pyo  │
└──────┴──────┴──────┘
EOF
}

print_hiragana_sokuon()
{
  cat <<- EOF
┌───────┐
│  っ   │
├───────┤
│ pause │
└───────┘
EOF
}

print_katakana_gojuon()
{
  cat <<- EOF
┌────┬────┬────┬────┬────┬────┐
│    │ a  │ i  │ u  │ e  │ o  │
├────┼────┼────┼────┼────┼────┤
│ a  │ ア │ イ │ ウ │ エ │ オ │
├────┼────┼────┼────┼────┼────┤
│ ka │ カ │ キ │ ク │ ケ │ コ │
├────┼────┼────┼────┼────┼────┤
│ sa │ サ │ シ │ ス │ セ │ ソ │
├────┼────┼────┼────┼────┼────┤
│ ta │ タ │ チ │ ツ │ テ │ ト │
├────┼────┼────┼────┼────┼────┤
│ na │ ナ │ ニ │ ヌ │ ネ │ ノ │
├────┼────┼────┼────┼────┼────┤
│ ha │ ハ │ ヒ │ フ │ へ │ ホ │
├────┼────┼────┼────┼────┼────┤
│ ma │ マ │ ミ │ 厶 │ メ │ モ │
├────┼────┼────┼────┼────┼────┤
│ ya │ ヤ │ イ │ ユ │ エ │ ヨ │
├────┼────┼────┼────┼────┼────┤
│ ra │ ラ │ リ │ ル │ レ │ ロ │
├────┼────┼────┼────┼────┼────┤
│ wa │ ワ │ イ │ ウ │ エ │ ヲ │
├────┴────┴────┴────┴────┴────┤
│              ン             │
│              n              │
└─────────────────────────────┘
EOF
}

print_katakana_dakuon()
{
  cat <<- EOF
┌────┬────┬────┬────┬────┬────┐
│    │ a  │ i  │ u  │ e  │ o  │
├────┼────┼────┼────┼────┼────┤
│ ga │ ガ │ ギ │ グ │ ゲ │ ゴ │
├────┼────┼────┼────┼────┼────┤
│ za │ ザ │ ジ │ ズ │ ゼ │ ゾ │
├────┼────┼────┼────┼────┼────┤
│ da │ ダ │ ヂ │ ヅ │ デ │ ド │
├────┼────┼────┼────┼────┼────┤
│ ba │ バ │ ビ │ ブ │ ベ │ ボ │
└────┴────┴────┴────┴────┴────┘
EOF
}

print_katakana_handakuon()
{
  cat <<- EOF
┌────┬────┬────┬────┬────┬────┐
│    │ a  │ i  │ u  │ e  │ o  │
├────┼────┼────┼────┼────┼────┤
│ pa │ パ │ ピ │ プ │ ペ │ ポ │
└────┴────┴────┴────┴────┴────┘
EOF
}

print_katakana_yoon()
{
  cat <<- EOF
┌──────┬──────┬──────┐
│ キャ │ キュ │ キョ │
├──────┼──────┼──────┤
│ kya  │ kyu  │ kyo  │
├──────┼──────┼──────┤
│ シャ │ シュ │ ショ │
├──────┼──────┼──────┤
│ sha  │ shu  │ sho  │
├──────┼──────┼──────┤
│ チャ │ チュ │ チョ │
├──────┼──────┼──────┤
│ cha  │ chu  │ cho  │
├──────┼──────┼──────┤
│ ニャ │ ニュ │ ニョ │
├──────┼──────┼──────┤
│ nya  │ nyu  │ nyo  │
├──────┼──────┼──────┤
│ ヒャ │ ヒュ │ ヒョ │
├──────┼──────┼──────┤
│ hya  │ hyu  │ hyo  │
├──────┼──────┼──────┤
│ ミャ │ ミュ │ ミョ │
├──────┼──────┼──────┤
│ mya  │ myu  │ myo  │
├──────┼──────┼──────┤
│ リャ │ リュ │ リョ │
├──────┼──────┼──────┤
│ rya  │ ryu  │ ryo  │
├──────┼──────┼──────┤
│ ギャ │ ギュ │ ギョ │
├──────┼──────┼──────┤
│ gya  │ gyu  │ gyo  │
├──────┼──────┼──────┤
│ ジャ │ ジュ │ ジョ │
├──────┼──────┼──────┤
│ ja   │ ju   │ jo   │
├──────┼──────┼──────┤
│ ヂャ │ ヂュ │ ヂョ │
├──────┼──────┼──────┤
│ ja   │ ju   │ jo   │
├──────┼──────┼──────┤
│ ビャ │ ビュ │ ビョ │
├──────┼──────┼──────┤
│ bya  │ byu  │ byo  │
├──────┼──────┼──────┤
│ ピャ │ ピュ │ ピョ │
├──────┼──────┼──────┤
│ pya  │ pyu  │ pyo  │
└──────┴──────┴──────┘
EOF
}

print_katakana_sokuon()
{
  cat <<- EOF
┌───────┐
│  ッ   │
├───────┤
│ pause │
└───────┘
EOF
}

main $@
