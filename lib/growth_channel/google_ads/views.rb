require 'csv'

module GoogleAds
  
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
      
      def total_views_video_externo
        total_per_video = []
        videos_principais_agrupados_externo.each do |videos_principais_agrupado|
          id_video_principal = videos_principais_agrupado.first[:id_video_principal]
          sum_views = videos_principais_agrupado.inject(0) { |sum, hash| sum + hash[:views] }
  
          total_per_video.push({id_video_principal: id_video_principal, views: sum_views})
        end
        total_per_video
      end

<<<<<<< HEAD
=======
      def get_videos_ideias
        total_per_video = []
        group_videos_by_tag('[Ideias]').each do |videos_principais_agrupado|
          id_video_principal = videos_principais_agrupado.first[:id_video_principal]
          sum_views = videos_principais_agrupado.inject(0) { |sum, hash| sum + hash[:views] }

          total_per_video.push({ id_video_principal: id_video_principal, views: sum_views })
        end
        total_per_video
      end
  
>>>>>>> 56edde726321e8ce26bc86703b404b57c822a881
      private

      # @return [Array_0f_all_videos]
      def read_per_video
        reports = CSV.read(@file_path, headers: true)
        videos_principais = []
        reports.each do |row|
          tags_campanha = row['Campanha'].split(' ')
          id_video = tags_campanha.first
          tags_campanha.shift
          id_video_principal = id_video.split('.').first
          views = row['Visualizações'].to_i

          videos_principais.push({
                                     id_video: id_video,
                                     id_video_principal: id_video_principal,
                                     tags_campanha: tags_campanha,
                                     views: views
                                 })
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

<<<<<<< HEAD

=======
      def group_videos_by_tag(tag)
        group = []
        read_per_video.each do |video|
          group.push(video) if video[:tags_campanha].include? tag
        end
        group.group_by { |h| h[:id_video_principal] }.values
      end
>>>>>>> 56edde726321e8ce26bc86703b404b57c822a881
    end
  end