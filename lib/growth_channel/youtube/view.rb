require 'csv'
require 'growth_channel/util/manage_csv'

module Youtube
  class View

    def initialize
      @report = ManageCSV.read_csv_youtube
    end

    def total_views
      total_views = 0
      @report.each do |row|
        views = row["Views"].to_i
        total_views += views
      end
      total_views
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

    private

    def read_per_video
      videos_principais = []
      @report.each do |row|
        id_video = row["Video title"].split(".").first
        id_video_principal = id_video.split(".").first
        views = row["Views"].to_i

        videos_principais.push({id_video_principal: id_video_principal, views: views})
      end
      videos_principais
    end

    def videos_principais_agrupados
      read_per_video.group_by { |h| h[:id_video_principal] }.values
    end

  end
end