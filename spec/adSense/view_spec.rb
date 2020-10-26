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

    it "total_internal_videos_views" do
      groups = AdSense::View.new("spec/suports/report_adsense.csv").total_internal_video_views
      result = [
          {id_video: 'v10.0', views: 451},
          {id_video: 'v13.0', views: 444},
          {id_video: 'v11.0', views: 463},
          {id_video: 'v12.0', views: 455},
          {id_video: 'v7.0', views: 404},
          {id_video: 'v8.0', views: 398},
          {id_video: 'v9.0', views: 442},
          {id_video: 'v14.0', views: 455},
          {id_video: 'v15.0', views: 468},
          {id_video: 'v16.0', views: 445},
          {id_video: 'v17.0', views: 299},
          {id_video: 'v6.0', views: 2480}
        ]
      expect(groups).to match_array(result)
    end

  end

end