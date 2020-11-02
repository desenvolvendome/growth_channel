require 'csv'
require 'growth_channel/util/manage_csv'

@@report = ManageCSV.read_csv_adsense

CSV.foreach(@@report, col_sep: ',') do |line|
    if line[0][3] != "0" and line[0][4] != "0" and line[0][5] != "0"
        puts "#{line[0]} #{line[1]}"
    end
end
