require 'csv'

CSV.foreach('Relatório de Campanhas.csv', col_sep: ',') do |line|
    if line[0][line[0].length - 2] == "G"
        puts "#{line[0]} = #{line[1]}"
    end
end
