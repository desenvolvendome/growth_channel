RSpec.describe "Youtube::View" do

  context "count" do

    it "total_views" do
      total_views = Youtube::View.new.total_views

      expect(total_views).to eq(31224)
    end

    it "total_views_per_video" do
      total_views_per_video = Youtube::View.new.total_views_per_video
      result = [
        {id_video_principal: 'v1', views: 1213},
        {id_video_principal: 'v10', views: 856},
        {id_video_principal: 'v11', views: 1626},
        {id_video_principal: 'v12', views: 1010},
        {id_video_principal: 'v13', views: 529},
        {id_video_principal: 'v14', views: 552},
        {id_video_principal: 'v15', views: 504},
        {id_video_principal: 'v16', views: 503},
        {id_video_principal: 'v17', views: 213},
        {id_video_principal: 'v18', views: 1},
        {id_video_principal: 'v2', views: 1660},
        {id_video_principal: 'v3', views: 996},
        {id_video_principal: 'v4', views: 933},
        {id_video_principal: 'v5', views: 2801},
        {id_video_principal: 'V5', views: 419},
        {id_video_principal: 'v6', views: 4270},
        {id_video_principal: 'v7', views: 6983},
        {id_video_principal: 'v8', views: 3148},
        {id_video_principal: 'v9', views: 3007}
    ]
      expect(total_views_per_video).to eq(result)
    end

  end


end
