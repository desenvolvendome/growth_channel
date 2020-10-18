require 'growth_channel/youtube/view'

RSpec.describe "Youtube::View" do

  context "count" do

    it "total_views" do
      total_views = Youtube::View.new("spec/suports/report_youtube_sample.csv").total_views

      expect(total_views).to eq(283 + 930 + 537 + 154 + 67 + 13 + 85)
    end

    it "total_views_per_video" do
      total_views_per_video = Youtube::View.new("spec/suports/report_youtube_sample.csv").total_views_per_video
      result = [
          {id_video_principal: 'v1', views: 283 + 930},
          {id_video_principal: 'v10', views: 537 + 154 + 67 + 13 + 85}
      ]
      expect(total_views_per_video).to eq(result)
    end

  end


end
