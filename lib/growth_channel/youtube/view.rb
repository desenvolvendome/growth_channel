require 'csv'

module Youtube
  class View

    def initialize(file_path)
      @file_path = file_path
    end

    def count
      reports = CSV.read(@file_path, headers: true)
      total_views = 0
      reports.each do |row|
        views = row["Views"].to_i
        total_views += views
      end
      total_views
    end
  end
end