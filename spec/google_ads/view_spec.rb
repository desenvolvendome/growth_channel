require 'growth_channel/google_ads/views'

RSpec.describe "GoogleAds::View" do

  context "count" do

    it "total_views_per_video" do
      total_views_per_video = GoogleAds::View.new("spec/suports/Relatorio_de_Campanhas.csv").total_views_per_video
      result = [        
        {id_video_principal: 'v1', views: 411 + 301},
        {id_video_principal: 'v10', views: 451 + 107 + 0 + 37},   
      ]
      expect(total_views_per_video).to eq(result)
    end
    
    it "total_views_video_externo" do
      groups = GoogleAds::View.new("spec/suports/Relatorio_de_Campanhas.csv").total_views_video_externo
      result = [
          {id_video_principal: 'v1', views: 411 + 301},
          {id_video_principal: 'v10', views: 107 + 0 + 37}
      ]
      expect(groups).to match_array(result)
    end
  end
end