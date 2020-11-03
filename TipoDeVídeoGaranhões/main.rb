require 'csv'
require 'growth_channel/util/manage_csv'

@@report = ManageCSV.read_csv_adsense

CSV.foreach(@@report, col_sep: ',') do |line|
    if line[0][line[0].length - 2] == "G"
        puts "#{line[0]} = #{line[1]}"
    end
end
