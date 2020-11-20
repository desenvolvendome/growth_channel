require_relative 'utility/video_ads_utility'
module Video
  class Video_ads
    private

    def read_per_video

      videos_principais = []
      ManageCSV.read_csv_adsense.each do |row|
        tags_campanha = VideoAdsUtility.get_campanhas(row)
        id_video = VideoAdsUtility.extract_id_video(tags_campanha)
        id_video_principal = VideoAdsUtility.get_id_video_principal(id_video)
        views = VideoAdsUtility.get_views(row)
        cost = VideoAdsUtility.get_custo(row)
        rdv25 = VideoAdsUtility.get_reproduction_to_25_percent(row)
        rdv50 = VideoAdsUtility.get_reproduction_to_50_percent(row)
        rdv75 = VideoAdsUtility.get_reproduction_to_75_percent(row)
        rdv100 = VideoAdsUtility.get_reproduction_to_100_percent(row)

        videos_principais.push({
                                   id_video: id_video,
                                   id_video_principal: id_video_principal,
                                   tags_campanha: tags_campanha,
                                   views: views,
                                   cost: cost,
                                   watched_25: rdv25,
                                   watched_50: rdv50,
                                   watched_75: rdv75,
                                   watched_100: rdv100
                               })
      end
      videos_principais
    end

    #@return group of videos with your information and that information and they are ready
    def group_main_video_info(filter_tag: '')
      group_main_video = []
      videos_principais = get_group_by_tag(filter_tag)
      videos_principais.each do |video|
        id_video_principal = video.first[:id_video_principal]
        sum_views = get_sum_of_the_parts_the_video(video)
        sum_cost = video.inject(0) { |sum, hash| sum + hash[:cost] }
        sum_watched_25 = video.inject(0) { |sum, hash| sum + hash[:watched_25] }
        sum_watched_50 = video.inject(0) { |sum, hash| sum + hash[:watched_50] }
        sum_watched_75 = video.inject(0) { |sum, hash| sum + hash[:watched_75] }
        sum_watched_100 = video.inject(0) { |sum, hash| sum + hash[:watched_100] }

        group_main_video.push({
                                  id_video_principal: id_video_principal,
                                  views: sum_views,
                                  cost: sum_cost,
                                  watched_25: sum_watched_25,
                                  watched_50: sum_watched_50,
                                  watched_75: sum_watched_75,
                                  watched_100: sum_watched_100
                              })
      end
      group_main_video
    end

    def get_sum_of_the_parts_the_video(video)
      sum_views = video.inject(0) { |sum, hash| sum + hash[:views] }
    end

    def get_group_by_tag(filter_tag)
      _videos_principais_agrupados = filter_tag == '' ? videos_principais_agrupados : group_videos_by_tag(filter_tag)
    end

    def videos_principais_agrupados
      read_per_video.group_by { |h| h[:id_video_principal] }.values
    end

    def group_videos_by_tag(tag)
      group = []
      read_per_video.each do |video|
        group.push(video) if video[:tags_campanha].include? tag
      end
      group.group_by { |h| h[:id_video_principal] }.values
    end
  end
end
