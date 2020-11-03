# frozen_string_literal: true

require 'growth_channel/adSense/view'

RSpec.describe 'AdSense::View' do
  context 'count' do
    it 'total_views_per_video' do
      total_views_per_video = AdSense::View.new('spec/suports/report_adsense_sample.csv').total_views_per_video
      result = [
        { id_video_principal: 'v1', views: 411 + 301 },
        { id_video_principal: 'v10', views: 451 + 107 + 0 + 37 }

require 'growth_channel/adSense/view'

RSpec.describe "AdSense::View" do

  context "count" do
  
    it "total_views_per_video" do
      total_views_per_video = AdSense::View.new.total_views_per_video
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

  end

end
    it "total_views_per_video_ideias" do
      groups = AdSense::View.new.total_views_per_video_ideias
      result = [
        {id_video_principal: 'v1', views: 411 + 301},
        {id_video_principal: 'v10', views: 107 + 0 + 37},
        {id_video_principal: 'v11', views: 0 + 991 + 33},
        {id_video_principal: 'v12', views: 353 + 0},
        {id_video_principal: 'v2', views: 210 + 379 + 299 + 364},
        {id_video_principal: 'v3', views: 295 + 275 + 259},
        {id_video_principal: 'v4', views: 67 + 197 + 282},
        {id_video_principal: 'v5', views: 386 + 365 + 381 + 334 + 1807},
        {id_video_principal: 'v7', views: 2393 + 398 + 0 + 394 + 388 + 356 + 64 + 247},
        {id_video_principal: 'v8', views: 264 + 387 + 368 + 392 + 345 + 283 + 64},
        {id_video_principal: 'v9', views: 367 + 397 + 384 + 125 + 363 + 43 + 89 + 109 + 63}
      ]
      expect(groups).to match_array(result)
    end

    it "total_internal_videos_views" do
      views = AdSense::View.new.total_internal_video_views
      result = 451 + 463 + 455 + 444 + 455 + 468 + 445 + 299 + 2480 + 404 + 398 + 442
        
      expect(views).to eq(result)
    end
    
  end

end