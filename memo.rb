require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます
def create_file
    puts "新規ファイル名を入力してください:"
    filename = gets.chomp
    CSV.open(filename, "w") do |csv|
      puts "メモを入力してください(終了するには'quit'と入力):"
      loop do
        memo = gets.chomp
        break if memo == 'quit'
        csv << [memo]
      end
    end
    puts "#{filename}が作成されました。"
  end
  
  def edit_file
    puts "編集するファイル名を入力してください:"
    filename = gets.chomp
    if File.exist?(filename)
      CSV.open(filename, "a") do |csv|
        puts "メモを入力してください(終了するには'quit'と入力):"
        loop do
          memo = gets.chomp
          break if memo == 'quit'
          csv << [memo]
        end
      end
      puts "#{filename}が編集されました。"
    else
      puts "ファイルが存在しません。"
    end
  end
  
  loop do
    puts "1: 新規ファイル作成, 2: 既存ファイル編集"
    choice = gets.chomp.to_i
    case choice
    when 1
      create_file
      break
    when 2
      edit_file
      break
    else
      puts "1か2を入力してください。"
    end
  end