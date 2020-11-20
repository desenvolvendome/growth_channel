require 'growth_channel/google_ads/views'

RSpec.describe "GoogleAds::View" do

  context "count" do

    it "total_views_per_video" do
      total_views_per_video = GoogleAds::View.new.total_views_per_video
      result = [        
        {id_video_principal: 'v1', views: 411 + 301},
        {id_video_principal: 'v10', views: 451 + 107 + 0 + 37},
        {id_video_principal: 'v11', views: 463 + 0 + 991 + 33},
        {id_video_principal: 'v12', views: 455 + 353 + 0},
        {id_video_principal: 'v13', views: 444},
        {id_video_principal: 'v14', views: 455},
        {id_video_principal: 'v15', views: 468},
        {id_video_principal: 'v16', views: 445},
        {id_video_principal: 'v17', views: 299},
        {id_video_principal: 'v2', views: 210 + 379 + 299 + 364},
        {id_video_principal: 'v3', views: 295 + 275 + 259},
        {id_video_principal: 'v4', views: 67 + 197 + 282},
        {id_video_principal: 'v5', views: 386 + 365 + 381 + 334 + 1807},
        {id_video_principal: 'v6', views: 1603 + 2480},
        {id_video_principal: 'v7', views: 1183 + 404 + 2393 + 398 + 0 + 394 + 388 + 356 + 64 + 247},
        {id_video_principal: 'v8', views: 398 + 264 + 387 + 368 + 392 + 345 + 283 + 64},
        {id_video_principal: 'v9', views: 442 + 367 + 397 + 384 + 125 + 363 + 43 + 89 + 109 + 63}
      ]
      expect(total_views_per_video).to eq(result)
    end
    
    it "total_views_video_externo" do

      groups = GoogleAds::View.new.total_views_video_externo
      result = [
        {id_video_principal: 'v1', views: 712},
        {id_video_principal: 'v10', views: 144},
        {id_video_principal: 'v11', views: 1024},
        {id_video_principal: 'v12', views: 353},
        {id_video_principal: 'v2', views: 1252},
        {id_video_principal: 'v3', views: 829},
        {id_video_principal: 'v4', views: 546},
        {id_video_principal: 'v5', views: 3273},
        {id_video_principal: 'v7', views: 4240},
        {id_video_principal: 'v8', views: 2103},
        {id_video_principal: 'v9', views: 1940}
      ]

      expect(groups).to match_array(result)
    end

    it 'total_views_per_video_ideias' do
      groups = GoogleAds::View.new.get_videos_ideias
      result = [
        { id_video_principal: 'v1', views: 411 + 301 },
          { id_video_principal: 'v10', views: 107 + 0 + 37 }
      ]
      expect(true).to be groups.include? result[0]
      expect(true).to be groups.include? result[1]
    end

  end
end