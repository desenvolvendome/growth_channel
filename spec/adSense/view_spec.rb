require 'growth_channel/adSense/view'

RSpec.describe "AdSense::View" do

  context "count" do
  
    it "total_views_per_video" do
      total_views_per_video = AdSense::View.new("spec/suports/report_adsense_sample.csv").total_views_per_video
      result = [
          {id_video_principal: 'v1', views: 411 + 301},
          {id_video_principal: 'v10', views: 451 + 107 + 0 + 37}
      ]
      expect(total_views_per_video).to eq(result)
    end

  end

end
