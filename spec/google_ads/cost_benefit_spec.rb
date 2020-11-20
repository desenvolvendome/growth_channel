require 'growth_channel/google_ads/cost_benefit'

RSpec.describe 'GoogleAds::CostBenefit' do

  context 'List' do
    it 'cost_benefit_per_video' do
      groups = GoogleAds::CostBenefit.new.per_video
      result = [
          { id_video_principal: 'v1', cost_benefit: 7.35 },#((712 + (46.43 * 2) + (30.92 * 4) + (25.17 * 5) + (17.97 * 3))/15)/ 10.05).floor(2)
          { id_video_principal: 'v10', cost_benefit: 7.56 },#(((595 + (29.519 * 2) + (17.27 * 4) + (10.07 * 5) + (5.5 * 3))/15)/ 6.96).floor(2)
      ]
      expect(true).to be groups.include? result[0]
      expect(true).to be groups.include? result[1]
    end

    it "sort_cost_benefit_INTERNOS" do
      groups = GoogleAds::CostBenefit.new.by_tag('[INTERNOS]')
      result = [
          {id_video_principal:'v11',cost_benefit:6.4},
          {id_video_principal:'v8',cost_benefit:5.64}
      ]

      expect(groups.first).to eq(result.first)
      expect(groups.last).to eq(result.last)
    end
  end
end