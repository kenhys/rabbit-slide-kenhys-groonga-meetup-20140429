require 'jp_prefecture'
require 'mojinizer'
require 'pp'
require 'csv'

def generate_prefs_grn
  File.open("ekidata-prefs.grn", "w+") do |file|
    file.puts("load --table Prefs")
    file.puts("[")

    JpPrefecture::Prefecture.all.each do |pref|
      prefs_entry = [
        "\"_key\": #{pref.code}",
        "\"name\": \"#{pref.name}\"",
        "\"romaji\": \"#{pref.name_e.downcase}\"",
        "\"hiragana\": \"#{pref.name_e.downcase.hiragana}\"",
        "\"katakana\": \"#{pref.name_e.downcase.katakana}\"",
      ].join(",")

      file.puts("{#{prefs_entry}}")
    end
    file.puts("]")
  end
end

def generate_company_grn
  File.open("ekidata-company.grn", "w+") do |file|
    file.puts("load --table Company")
    file.puts("[")

    CSV.open("ekidata.jp/company20130120.csv", "r") do |csv|
      csv.each_with_index do |row, i|
        next if i == 0
        company_code, railway_code, name, katakana,
        full_name, short_name, url, type,
        status, sort = row
        entry = [
          "\"_key\": #{company_code}",
          "\"name\": \"#{name}\"",
          "\"romaji\": \"#{katakana.romaji}\"",
          "\"hiragana\": \"#{katakana.hiragana}\"",
          "\"katakana\": \"#{katakana}\"",
          "\"full_name\": \"#{full_name}\"",
          "\"short_name\": \"#{short_name}\"",
          "\"url\": \"#{url}\"",
          "\"type\": #{type}",
          "\"status\": #{status}",
          "\"sort\": #{sort}"
        ].join(",")

        file.puts("{#{entry}},")
      end
    end
    file.puts("]")
  end
end

def generate_station_grn
  File.open("ekidata-station.grn", "w+") do |file|
    file.puts("load --table Station")
    file.puts("[")

    CSV.open("ekidata.jp/station20140303free.csv", "r") do |csv|
      csv.each_with_index do |row, i|
        next if i == 0
        station_cd, group_cd, name, _, _,
        line_cd, pref_cd, post, add, longitude, latitude, * = row
        entry = [
          "\"_key\": \"#{station_cd}\"",
          "\"group_cd\": \"#{group_cd}\"",
          "\"line_cd\": \"#{line_cd}\"",
          "\"name\": \"#{name}\"",
          "\"location\": \"#{latitude}x#{longitude}\"",
        ].join(",")
        file.puts("{#{entry}},")
      end
    end
    file.puts("]")
  end
end

#generate_company_grn
generate_station_grn
