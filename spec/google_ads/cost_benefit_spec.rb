require 'rspec'
require 'growth_channel/google_ads/cost_benefit'

RSpec.describe 'GoogleAds::CostBenefit' do

  it 'per_video' do
    groups = GoogleAds::CostBenefit.new.per_video
    result = [
        {id_video_principal: 'v1', cost_benefit: (((712 + (46.43 * 2) + (30.92 * 4) + (25.17 * 5) + (17.97 * 3)) / 15) / 10.05).floor(2)},
        {id_video_principal: 'v10', cost_benefit: (((595 + (29.519 * 2) + (17.27 * 4) + (10.07 * 5) + (5.5 * 3)) / 15) / 6.96).floor(2)},
    ]
    expect(true).to be groups.include? result[0]
    expect(true).to be groups.include? result[1]
  end

end