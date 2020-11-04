require 'csv'
class ManageCSV

    def self.read_csv_youtube
        @file_path = "spec/suports/invalid_video_title_youtube.csv"
        reports = CSV.read(@file_path, headers: true)

        valid_format = /^v\d*\.\d*\.?\d\:.+/
        reports.each do |row|
            unless valid_format.match(row['Video title'])
                return "'#{row['Video title']}': It is not in the correct pattern"
            end
        end
        reports
    end

    def self.read_csv_adsense
        @file_path = "spec/suports/report_adsense.csv"
        return CSV.read(@file_path, headers: true)
    end

end