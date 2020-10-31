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

    it "total_views_per_video_ideias" do
      groups = AdSense::View.new("spec/suports/report_adsense_sample.csv").total_views_per_video_ideias
      result = [
          {id_video_principal: 'v1', views: 411 + 301},
          {id_video_principal: 'v10', views: 107 + 0 + 37}
      ]
      expect(groups).to match_array(result)
    end

    it "total_internal_videos_views" do
      views = AdSense::View.new("spec/suports/report_adsense.csv").total_internal_video_views
      result = 451 + 463 + 455 + 444 + 455 + 468 + 445 + 299 + 2480 + 404 + 398 + 442
        
      expect(views).to eq(result)
    end
    
  end

end