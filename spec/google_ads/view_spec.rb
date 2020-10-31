require 'growth_channel/google_ads/views'

RSpec.describe "GoogleAds::View" do

  context "count" do

    it "total_views_per_video" do
<<<<<<< HEAD
      total_views_per_video = GoogleAds::View.new("spec/suports/report_adsense_sample.csv").total_views_per_video
=======
      total_views_per_video = GoogleAds::View.new('spec/suports/report_adsense_sample.csv').total_views_per_video
>>>>>>> 56edde726321e8ce26bc86703b404b57c822a881
      result = [        
        {id_video_principal: 'v1', views: 411 + 301},
        {id_video_principal: 'v10', views: 451 + 107 + 0 + 37},
      ]
      expect(total_views_per_video).to eq(result)
    end
    
    it "total_views_video_externo" do
<<<<<<< HEAD
      groups = GoogleAds::View.new("spec/suports/report_adsense_sample.csv").total_views_video_externo
=======
      groups = GoogleAds::View.new('spec/suports/report_adsense_sample.csv').total_views_video_externo
>>>>>>> 56edde726321e8ce26bc86703b404b57c822a881
      result = [
          {id_video_principal: 'v1', views: 411 + 301},
          {id_video_principal: 'v10', views: 107 + 0 + 37}
      ]
      expect(groups).to match_array(result)
    end

    it 'total_views_per_video_ideias' do
      groups = GoogleAds::View.new('spec/suports/report_adsense_sample.csv').get_videos_ideias
      result = [
          { id_video_principal: 'v1', views: 411 + 301 },
          { id_video_principal: 'v10', views: 107 + 0 + 37 }
      ]
      expect(groups).to match_array(result)
    end
  end
end