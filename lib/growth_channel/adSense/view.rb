require 'csv'

module AdSense
  class View

    def initialize(file_path)
      @file_path = file_path
    end

    def total_views_per_video
      total_per_video = []
      videos_principais_agrupados.each do |videos_principais_agrupado|
        id_video_principal = videos_principais_agrupado.first[:id_video_principal]
        sum_views = videos_principais_agrupado.inject(0) { |sum, hash| sum + hash[:views] }

        total_per_video.push({id_video_principal: id_video_principal, views: sum_views})
      end
      total_per_video
    end

    def total_internal_video_views
      total_per_video = []
      main_internal_videos.each do |main_videos|
        id_video = main_videos.first[:id_video]
        sum_views = main_videos.inject(0) { |sum, hash| sum + hash[:views] }

        total_per_video.push({id_video: id_video, views: sum_views})
      end
      total_per_video
    end

    private

    def read_per_video
      reports = CSV.read(@file_path, headers: true)
      videos_principais = []
      reports.each do |row|
        id_video = row["Campanha"].split(" ").first
        id_video_principal = id_video.split(".").first
        title = row["Campanha"]
        views = row["Visualizações"].to_i

        videos_principais.push({id_video: id_video, id_video_principal: id_video_principal, views: views, title: title})
      end
      videos_principais
    end

    def videos_principais_agrupados
      read_per_video.group_by { |h| h[:id_video_principal] }.values
    end

    def main_internal_videos
      internal_videos = []
      
      read_per_video.each do |video|
        title = video[:title]
        if video[:id_video].split(".").last.to_i == 0 && (title.include? "INTERNOS")
          internal_videos.push(video)
        end
      end

      return internal_videos.group_by { |h| h[:id_video] }.values
    end

  end
end