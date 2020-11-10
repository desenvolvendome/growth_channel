require 'csv'
class ManageCSV

    def self.read_csv_youtube
        @file_path = "spec/suports/report_youtube.csv"
        report = CSV.read(@file_path, headers: true)

        if validate_youtube_headers(report)
            report.each do |row|
                if !row["Views"].match("[0-9]+")
                    raise ArgumentError.new('Tipo de dado incorreto, esperado: númerico.')  
                end
            end      
            
            return report
        
        else 
            raise ArgumentError.new('É necessário que o CSV contenha os formatos: [Video title] e [Views]')
        end
            
    end

    def self.read_csv_adsense
        @file_path = "spec/suports/report_adsense.csv"
        return CSV.read(@file_path, headers: true)
    end

    def self.validate_youtube_headers(report)
        if report.headers.include? "Video title" 
            if report.headers.include? "Views"
                validate = true
            end
        end

        return validate
    end

end