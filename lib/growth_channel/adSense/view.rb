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

    def total_views_per_video_ideias
      total_per_video = []
      videos_principais_agrupados_de_ideias.each do |videos_principais_agrupado|
        id_video_principal = videos_principais_agrupado.first[:id_video_principal]
        sum_views = videos_principais_agrupado.inject(0) { |sum, hash| sum + hash[:views] }

        total_per_video.push({id_video_principal: id_video_principal, views: sum_views})
      end
      total_per_video
    end

    def total_internal_video_views 
      views = 0
      read_per_video.each do |video|
        if video[:id_video].split(".").last.to_i == 0 && (video[:title].include? "INTERNOS")
          views += video[:views]
        end
      end
      return views
    end

    private

    def read_per_video
      reports = CSV.read(@file_path, headers: true)
      videos_principais = []
      reports.each do |row|
        id_video = row["Campanha"].split(" ").first
        id_video_principal = id_video.split(".").first
        views = row["Visualizações"].to_i
        
        title = row["Campanha"].split("[]").to_s

        videos_principais.push({id_video:id_video,id_video_principal: id_video_principal, views: views, title: title})
      end
      videos_principais
    end

    def videos_principais_agrupados
      read_per_video.group_by { |h| h[:id_video_principal] }.values
    end

    def videos_principais_agrupados_de_ideias 
      videos_ideias = []
      read_per_video.each do |video|
        if video[:id_video].split(".").last.to_i > 0 
          videos_ideias.push(video)
        end
      end
      return videos_ideias.group_by { |h| h[:id_video_principal] }.values 
    end

  end
end
