require_relative 'video.rb'

module GoogleAds
  class CostBenefit < Video

    def by_tag(tag, sorted: true)
      per_video(sortIncreasing: sorted, filterTag: tag)
    end

    def per_video(sortIncreasing: false, filterTag: '')
      group_videos_cost_benefit = []
      group_main_video_info(filterTag: filterTag).each do |video|
        id_video_principal = video[:id_video_principal]
        cost_benefit = video[:views] + (video[:watched_25] * 2) + (video[:watched_50] * 4) + (video[:watched_75] * 5) + (video[:watched_100] * 3)
        cost_benefit /= 15 # soma dos pesos
        cost_benefit /= video[:cost]
        cost_benefit = cost_benefit.floor(2)
        group_videos_cost_benefit.push({id_video_principal: id_video_principal, cost_benefit: cost_benefit})
      end
      sortIncreasing ? group_videos_cost_benefit.sort_by { |s| s[:cost_benefit] }.reverse : group_videos_cost_benefit
    end
  end
end
