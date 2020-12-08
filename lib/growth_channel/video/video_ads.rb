require_relative 'utility/video_ads_utility'
module Video
  # this class reads the csv of ads and loads information into hashing objects
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
        watched_ads_25 = VideoAdsUtility.get_reproduction_to_25_percent(row)
        watched_ads_50 = VideoAdsUtility.get_reproduction_to_50_percent(row)
        watched_ads_75 = VideoAdsUtility.get_reproduction_to_75_percent(row)
        watched_ads_100 = VideoAdsUtility.get_reproduction_to_100_percent(row)

        videos_principais.push({
                                   id_video: id_video,
                                   id_video_principal: id_video_principal,
                                   tags_campanha: tags_campanha,
                                   views: views,
                                   cost: cost,
                                   watched_25: watched_ads_25,
                                   watched_50: watched_ads_50,
                                   watched_75: watched_ads_75,
                                   watched_100: watched_ads_100
                               })
      end
      videos_principais
    end

    # @return group of videos with your information and that information and they are ready
    def group_main_video_info(filter_tag: '')
      group_main_video = []
      videos_principais = get_group_by_tag(filter_tag)
      videos_principais.each do |video|
        id_video_principal = video.first[:id_video_principal]
        sum_views = VideoAdsUtility.get_sum_of_the_parts_the_video(video)
        sum_cost = VideoAdsUtility.get_cost_of_the_parts_the_video(video)
        sum_watched_25 = VideoAdsUtility.get_watched_25_of_parts_the_video(video)
        sum_watched_50 = VideoAdsUtility.get_watched_50_of_parts_the_video(video)
        sum_watched_75 = VideoAdsUtility.get_watched_75_of_parts_the_video(video)
        sum_watched_100 = VideoAdsUtility.get_watched_100_of_parts_the_video(video)

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

    def get_group_by_tag(filter_tag) # utility method
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
