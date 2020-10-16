require 'csv'

CSV.foreach('Relatório de Campanhas.csv', col_sep: ',') do |line|
    if line[0][3] != "0" and line[0][4] != "0" and line[0][5] != "0"
        puts "#{line[0]} #{line[1]}"
    end
end
