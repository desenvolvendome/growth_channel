# frozen_string_literal: true

require_relative '../video/video_ads'
require 'csv'
require 'growth_channel/util/manage_csv'

module GoogleAds
  # this class list about videos of google_ads having information about views and watchers
  class View < Video::Video_ads
    # @param [String] tag this for default is none, so list all videos in group, if you passed an tag list by tag.
    def total_per_video(tag: '')
      total_per_video = []
      get_group_by_tag(tag).each do |videos_principais_agrupado|
        id_video_principal = videos_principais_agrupado.first[:id_video_principal]
        sum_views = videos_principais_agrupado.inject(0) { |sum, hash| sum + hash[:views] }

        total_per_video.push({ id_video_principal: id_video_principal, views: sum_views })
      end
      total_per_video
    end

    def total_per_video_externo
      # TODO: refactor when solve externo csv problem, so remove this function and update test
      total_per_video_externo = []
      videos_principais_agrupados_externo.each do |videos_principais_agrupado|
        id_video_principal = videos_principais_agrupado.first[:id_video_principal]
        sum_views = videos_principais_agrupado.inject(0) { |sum, hash| sum + hash[:views] }

        total_per_video_externo.push({ id_video_principal: id_video_principal, views: sum_views })
      end
      total_per_video_externo
    end

    private

    def videos_principais_agrupados_externo
      videos_externo = []
      read_per_video.each do |video|
        videos_externo.push(video) if video[:id_video].split('.').last.to_i.positive?
      end
      videos_externo.group_by { |h| h[:id_video_principal] }.values
    end
  end
end
