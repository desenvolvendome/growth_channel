require_relative '../video/video_ads'

module GoogleAds
  # this class calculate the score of benefit cost
  class Investment < Video::Video_ads

    def maiores_invenstimentos(tag, sorted:true)
      ordem_maiores_invenstimentos(sortIncreasing: sorted, filterTag: tag)
      end

    private

    def ordem_maiores_invenstimentos(sortIncreasing: false, filterTag:'')
      group_sorted_investimento = []
      group_main_video_info(filter_tag:filterTag).each do |video|
        id_video_principal = video[:id_video_principal]
        cost = video[:cost]
        cost = cost.floor(2)
        group_sorted_investimento.push(id_video_principal: id_video_principal, cost: cost)

      end
      sortIncreasing ? group_sorted_investimento.sort_by {|s| s[:cost]}.reverse : group_sorted_investimento
    end
  end
end
