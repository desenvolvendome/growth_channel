require 'csv'
video_channel= CSV.read('Relatorio_de_Campanhas.csv')

video_channel = CSV.table('Relatorio_de_Campanhas.csv')
video_channel.each { |row| puts "\nCampanha: #{row.fetch(:campanha)} - total de visulalização:  #{row.fetch(:visualizaes)}" }
