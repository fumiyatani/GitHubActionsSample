#!/bin/zsh

APP_MODULE_DIR="./app/src/main/java/com/ftani/multimodulegradlesample/domain"
DOMAIN_MODULE_DIR="./domain/src/main/java/com/ftani/domain"

# 指定したディレクトリからサブディレクトリも含めた全ファイル数を取得する1
app_file_count=(`ls -UFR $APP_MODULE_DIR | grep -v "/\|.:\|^\s*$" | wc -l`)
echo "$app_file_count"

# 指定したディレクトリからサブディレクトリも含めた全ファイル数を取得する1
domain_file_count=(`ls -UFR $DOMAIN_MODULE_DIR | grep -v "/\|.:\|^\s*$" | wc -l`)
echo "$domain_file_count"

# 割合を出すために取得した全ファイル数を足しておく
all_count=$((app_file_count+domain_file_count))
echo "$all_count"

# 割合計算を行い小数点5桁分表示する。
percent=(`echo "scale=5; ${domain_file_count}/${all_count}*100" | bc | xargs printf "%.2f\n"`)

# ファイル書き込みメソッド
function write_count_result() {
  echo -e "日付:$(date "+%Y/%m/%d"), appモジュール: $1, domainモジュール: $2, 移行率: $3%" >> ~/result_count.txt
  echo "finish writing file"
}

# 移行初期などで0を割ってしまう場合があるため、その場合は強制的に移行率を0にして書き込む
write_count_result $app_file_count $domain_file_count $percent || write_count_result $app_file_count $domain_file_count 0

