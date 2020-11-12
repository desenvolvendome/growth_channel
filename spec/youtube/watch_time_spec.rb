require 'growth_channel/youtube/watch_time'

RSpec.describe "Youtube::WatchTime" do

  context "count" do

    it "ordered_most_watched" do
      ordered_most_watched = Youtube::WatchTime.new.ordered_most_watched

      result = [
          {id: "https://www.youtube.com/watch?v=DRhGVZTVTco", title: 'v6.0: Minha História, do "mato" ao sucesso na TI', watch_time: "166.5hs"},
          {id: "https://www.youtube.com/watch?v=1OaRT7heJ58", title: 'v10.4: Como configurar o Php para estudar?', watch_time: "0.0hs"}
      ]

      expect(ordered_most_watched.first).to eq(result.first)
      expect(ordered_most_watched.last).to eq(result.last)
    end

  end


end
