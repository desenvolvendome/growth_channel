require 'csv'
require 'growth_channel/util/manage_csv'

module GoogleAds
  
    class View
  
      def initialize
        @@report = ManageCSV.read_csv_adsense
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
      
      def total_views_video_externo
        total_per_video = []
        videos_principais_agrupados_externo.each do |videos_principais_agrupado|
          id_video_principal = videos_principais_agrupado.first[:id_video_principal]
          sum_views = videos_principais_agrupado.inject(0) { |sum, hash| sum + hash[:views] }
  
          total_per_video.push({id_video_principal: id_video_principal, views: sum_views})
        end
        total_per_video
      end
  
      private
  
      def read_per_video
        videos_principais = []
        @@report.each do |row|
          id_video = row["Campanha"].split(" ").first
          id_video_principal = id_video.split(".").first
          views = row["Visualizações"].to_i
  
          videos_principais.push({id_video: id_video, id_video_principal: id_video_principal, views: views})
        end
        videos_principais
      end
   
      def videos_principais_agrupados
        read_per_video.group_by { |h| h[:id_video_principal] }.values
      end
  
      def videos_principais_agrupados_externo
        videos_externo = []
        read_per_video.each do |video|
          if video[:id_video].split(".").last.to_i > 0
            videos_externo.push(video)
          end
        end

        return videos_externo.group_by { |h| h[:id_video_principal] }.values
      end
    end
  end