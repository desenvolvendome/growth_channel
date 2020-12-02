require 'growth_channel/google_ads/investment'

RSpec.describe 'GoogleAds::Investment' do

  context 'List' do
    it 'maiores_invenstimentos' do
      groups = GoogleAds::Investment.new.bigger_list('')
      result = [
          {id_video_principal: 'v7', cost: 77.52},
          {id_video_principal: 'v17', cost: 3.22}
      ]

      expect(groups.first).to eq(result.first)
      expect(groups.last).to eq(result.last)
    end
  end
end