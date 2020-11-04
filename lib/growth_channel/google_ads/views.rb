# frozen_string_literal: true

require 'csv'
require 'growth_channel/util/manage_csv'

module GoogleAds

  class View

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

    def get_videos_externo
      total_per_video = []
      group_videos_by_tag('[EXTERNOS]').each do |videos_principais_agrupado|
        id_video_principal = videos_principais_agrupado.first[:id_video_principal]
        sum_views = videos_principais_agrupado.inject(0) { |sum, hash| sum + hash[:views] }

        total_per_video.push({id_video_principal: id_video_principal, views: sum_views})
      end
      total_per_video
    end

    # def get_videos_custo
    #   total_per_video = []
    #   group_videos_by_tag('[EXTERNOS]').each do |videos_principais_agrupado|
    #     id_video_principal = videos_principais_agrupado.first[:id_video_principal]
    #     sum_views = videos_principais_agrupado.inject(0) { |sum, hash| sum + hash[:cost] }
    #
    #     total_per_video.push({id_video_principal: id_video_principal, cost: sum_views})
    #   end
    #   total_per_video
    # end

    def get_videos_ideias
      total_per_video = []
      group_videos_by_tag('[Ideias]').each do |videos_principais_agrupado|
        id_video_principal = videos_principais_agrupado.first[:id_video_principal]
        sum_views = videos_principais_agrupado.inject(0) { |sum, hash| sum + hash[:views] }

        total_per_video.push({id_video_principal: id_video_principal, views: sum_views})
      end
      total_per_video
    end

    def cost_benefit_per_video
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

    def read_per_video

      videos_principais = []
      @@report.each do |row|
        tags_campanha = row['Campanha'].split(' ')
        id_video = tags_campanha.first
        tags_campanha.shift
        id_video_principal = id_video.split('.').first
        views = row['Visualizações'].to_i
        cost = row['Custo'].sub(',', '.').to_f
        rdv25 = row['Reprod. do vídeo até 25%'].sub(',', '.').to_f
        rdv50 = row['Reprod. do vídeo até 50%'].sub(',', '.').to_f
        rdv75 = row['Reprod. do vídeo até 75%'].sub(',', '.').to_f
        rdv100 = row['Reprod. do vídeo até 100%'].sub(',', '.').to_f

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

    def videos_principais_agrupados
      read_per_video.group_by { |h| h[:id_video_principal] }.values
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
