# frozen_string_literal: true

require_relative '../video/video_ads'

module GoogleAds
  # this class list about Investment
  class Investment < Video::Video_ads
    def bigger_list(tag, sorted: true)
      sort_by(sort_decreasing: sorted, filter_tag: tag)
    end

    private

    # @param [String] filter_tag
    # (this is optional), if you don't passed this argument so for default is empty string, so this search all tags.
    # @param [Boolean] sort_decreasing (this is optional), if you don't passed this argument,
    # so for default False, so not sorted by investments, sorted by video id.
    def sort_by(sort_decreasing: false, filter_tag: '')
      group_sorted_investment = []
      group_main_video_info(filter_tag: filter_tag).each do |video|
        id_video_principal = video[:id_video_principal]
        cost = video[:cost]
        cost = cost.floor(2)
        group_sorted_investment.push(id_video_principal: id_video_principal, cost: cost)
      end
      sort_decreasing ? group_sorted_investment.sort_by { |s| s[:cost] }.reverse : group_sorted_investment
    end
  end
end
