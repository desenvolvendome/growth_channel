require 'growth_channel/google_ads/views'

RSpec.describe "GoogleAds::View" do

  context "count" do

    it "total_views_per_video" do

      total_views_per_video = GoogleAds::View.new("spec/suports/report_adsense_sample.csv").total_views_per_video

      total_views_per_video = GoogleAds::View.new('spec/suports/report_adsense_sample.csv').total_views_per_video

      result = [        
        {id_video_principal: 'v1', views: 411 + 301},
        {id_video_principal: 'v10', views: 451 + 107 + 0 + 37},
      ]
      expect(total_views_per_video).to eq(result)
    end
    
    it "total_views_video_externo" do

      groups = GoogleAds::View.new("spec/suports/report_adsense_sample.csv").total_views_video_externo

      groups = GoogleAds::View.new('spec/suports/report_adsense_sample.csv').total_views_video_externo

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

    it 'cost_benefit_per_video' do
      groups = GoogleAds::View.new('spec/suports/report_adsense_sample.csv').cost_benefit_per_video
      result = [
        { id_video_principal: 'v1', cost_benefit: (((712 + (46.43 * 2) + (30.92 * 4) + (25.17 * 5) + (17.97 * 3))/15)/ 10.05).floor(2)},
        { id_video_principal: 'v10', cost_benefit: (((595 + (29.519 * 2) + (17.27 * 4) + (10.07 * 5) + (5.5 * 3))/15)/ 6.96).floor(2)}
      ]
      expect(groups).to match_array(result)
    end

  end
end