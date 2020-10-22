require 'csv'

module GoogleAdSense
  class View

    def initialize(file_path)
      @file_path = file_path
    end

    def total_views_per_idea_videos
      "Idea videos: #{total_views}"
    end

    def total_views
      read_views_per_video_type_idea.reduce(:+)
    end

    def read_views_per_video_type_idea
      reports = CSV.read(@file_path, headers: true)
      views_list = []
      reports.each do |row|
        id_video = row["Campanha"].split(" ").first
        if id_video.split(".").last != '0'
          views = row["Visualizações"].to_i
          views_list.push(views)
        end
      end
      views_list
    end

  end
end
