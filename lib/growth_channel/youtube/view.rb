require "csv"
require "growth_channel/util/manage_csv"
require "growth_channel/google_ads/views"

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

    def sort_by_more_views
      organic_view.sort_by { |hash| hash[:views] }.reverse
    end

    def validate_subtraction(youtube, adsense)
      youtube - adsense >= 0 ? true : nil
    end

    def organic_view
      # todo: não consegui refatorar o código tão bem por enquanto.
      subtracted_views = []
      total_views_per_video.each do |hash_youtube|
        GoogleAds::View.new.total_per_video.each do |hash_adsense|
          if hash_youtube[:id_video_principal] == hash_adsense[:id_video_principal]
            if validate_subtraction(hash_youtube[:views], hash_adsense[:views])
              subtracted_views.push({id_video: hash_youtube[:id_video_principal], views: hash_youtube[:views] - hash_adsense[:views]})
            else
              subtracted_views.push({id_video: "#{hash_youtube[:id_video_principal]}: apresenta inconsistência nos dados", views: hash_youtube[:views] - hash_adsense[:views]})
            end
          end
        end
      end
      subtracted_views
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
