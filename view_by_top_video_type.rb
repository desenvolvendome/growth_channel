require 'csv'
require 'growth_channel/util/manage_csv'

@@report = ManageCSV.read_csv_adsense
@@report.each { |row| puts "\nCampanha: #{row.fetch(:campanha)} - total de visulalização:  #{row.fetch(:visualizaes)}" }
