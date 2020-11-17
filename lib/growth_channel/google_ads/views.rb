# frozen_string_literal: true

require 'csv'
require 'growth_channel/util/manage_csv'
require 'growth_channel/google_ads/cost_benefit'
require 'growth_channel/google_ads/video'

module GoogleAds

  class View < Video

    def initialize
      @@report = ManageCSV.read_csv_adsense
    end

    def per_video
      generate_videos(videos_principais_agrupados)
    end

    def per_video_externo
      generate_videos(videos_principais_agrupados_externo)
    end

    def get_videos_ideias
      generate_videos(group_videos_by_tag('[Ideias]'))
    end

    private

    def generate_videos(group_videos)
      video = []
      group_videos.each do |videos_principais_agrupado|
        create_list_videos(video, videos_principais_agrupado)
      end
      video
    end

    def create_list_videos(videos, videos_principais_agrupado)
      id_video_principal = videos_principais_agrupado.first[:id_video_principal]
      sum_views = videos_principais_agrupado.inject(0) { |sum, hash| sum + hash[:views] }

      videos.push({id_video_principal: id_video_principal, views: sum_views})
    end

    def videos_principais_agrupados_externo
      videos_externo = []
      read_per_video.each do |video|
        videos_externo.push(video) if video[:id_video].split('.').last.to_i.positive?
      end
      videos_externo.group_by { |h| h[:id_video_principal] }.values
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
