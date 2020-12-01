# frozen_string_literal: true

require_relative '../video/video_ads'
require 'csv'
require 'growth_channel/util/manage_csv'

module GoogleAds

  class View < Video::Video_ads

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

    def get_videos_ideias
      total_per_video = []
      group_videos_by_tag('[Ideias]').each do |videos_principais_agrupado|
        id_video_principal = videos_principais_agrupado.first[:id_video_principal]
        sum_views = videos_principais_agrupado.inject(0) { |sum, hash| sum + hash[:views] }

        total_per_video.push({id_video_principal: id_video_principal, views: sum_views})
      end
      total_per_video
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
