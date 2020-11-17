require 'csv'
require 'growth_channel/util/manage_csv'
require 'growth_channel/google_ads/video'

module GoogleAds
  class CostBenefit < Video

    def initialize
      @@report = ManageCSV.read_csv_adsense
    end

    def per_video
      group_videos_cost_benefit = []
      group_main_video_info.each do |video|
        id_video_principal = video[:id_video_principal]
        cost_benefit = video[:views] + (video[:watched_25] * 2) + (video[:watched_50] * 4) + (video[:watched_75] * 5) + (video[:watched_100] * 3)
        cost_benefit /= 15 # soma dos pesos
        cost_benefit /= video[:cost]
        cost_benefit = cost_benefit.floor(2)
        group_videos_cost_benefit.push({id_video_principal: id_video_principal, cost_benefit: cost_benefit})
      end
      group_videos_cost_benefit
    end


    private

    def group_main_video_info
      group_main_video = []
      videos_principais_agrupados.each do |video|
        id_video_principal = video.first[:id_video_principal]
        sum_views = video.inject(0) { |sum, hash| sum + hash[:views] }
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


  end
end
