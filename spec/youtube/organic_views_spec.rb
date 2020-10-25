require 'growth_channel/youtube/organic_views'

RSpec.describe "OrganicViews::View" do

  context "count" do

    it "total_views_per_video" do
      total_views_per_video = OrganicViews::View.new("spec/suports/report_youtube.csv").total_views_per_video
      result = [
          {id_main_video: "v1", views: 1213},
          {id_main_video: "v10", views: 856},
          {id_main_video: "v11", views: 1626},
          {id_main_video: "v12", views: 1010},
          {id_main_video: "v13", views: 529},
          {id_main_video: "v14", views: 552},
          {id_main_video: "v15", views: 504},
          {id_main_video: "v16", views: 503},
          {id_main_video: "v17", views: 213},
          {id_main_video: "v18", views: 1},
          {id_main_video: "v2", views: 1660},
          {id_main_video: "v3", views: 996},
          {id_main_video: "v4", views: 933},
          {id_main_video: "v5", views: 2801},
          {id_main_video: "V5", views: 419},
          {id_main_video: "v6", views: 4270},
          {id_main_video: "v7", views: 6983},
          {id_main_video: "v8", views: 3148},
          {id_main_video: "v9", views: 3007}]
      expect(total_views_per_video).to eq(result)
    end
  end
end
