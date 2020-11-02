require 'csv'
class ManageCSV

    def self.read_csv_youtube
        @file_path = "spec/suports/report_youtube_sample.csv"
        return CSV.read(@file_path, headers: true)
    end

    def self.read_csv_adsense
        @file_path = "spec/suports/report_adsense_sample.csv"
        return CSV.read(@file_path, headers: true)
    end

end