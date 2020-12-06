require 'csv'
require 'growth_channel/util/manage_csv'

module Youtube
  class Engagement

    def initialize
      @report = ManageCSV.read_csv_youtube
    end

    def ordered_most_engagement(sorted: true)
      sort_by(sort_decreasing: sorted)
    end

    private

    def sort_by(sort_decreasing: false)
      group_sorted_engagement = []
      videos_agrupados.each do |video|
        id_video_principal = video.first[:id_video_principal]
        share = video.inject(0) { |sum, hash| sum + hash[:share] }
        like = video.inject(0) { |sum, hash| sum + hash[:like] }
        comment = video.inject(0) { |sum, hash| sum + hash[:comment] }

        sub_total = share + like + comment
        group_sorted_engagement.push(id_video_principal: id_video_principal, total: sub_total)
      end
      sort_decreasing ? group_sorted_engagement.sort_by { |s| s[:total] }.reverse : group_sorted_investment
    end

    def read_per_video
      videos_principais = []
      @report.each do |row|
        id_video = row["Video title"].split(":").first
        id_video_principal = id_video.split(".").first
        share = row["Shares"].to_i
        like = row["Likes"].to_i
        comment = row["Comments added"].to_i

        videos_principais.push({id_video_principal: id_video_principal, share: share, like: like, comment: comment})
      end
      videos_principais
    end

    def videos_agrupados
      read_per_video.group_by { |h| h[:id_video_principal] }.values
    end
  end
end