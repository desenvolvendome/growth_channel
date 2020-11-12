require 'csv'
require 'growth_channel/util/manage_csv'

module Youtube
  class WatchTime

    def initialize
      @report = ManageCSV.read_csv_youtube
    end

    def ordered_most_watched
      most_watched = []
      @report.each do |row|
        id = row["Video"]
        title = row["Video title"]
        watch_time = row["Watch time (hours)"].sub(",", ".").to_f

        most_watched.push({id: "https://www.youtube.com/watch?v=#{id}", title: title, watch_time: watch_time})
      end
      most_watch_sorted = most_watched.sort_by { |s| s[:watch_time] }.reverse

      #TODO: Não encontrei uma solução para concatenar com bang para ficar mais simples
      most_watch_sorted.each { |mws| mws[:watch_time] = mws[:watch_time].to_s + "hs" }
    end

  end
end