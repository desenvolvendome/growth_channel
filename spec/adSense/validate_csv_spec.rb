require 'growth_channel/google_ads/validate_format_csv'

RSpec.describe 'Validate_Format::Validate' do
  context "Validação" do

    it 'validação csv valido' do
      validate = Validate_Format::Validate.new('spec/suports/report_adsense.csv').validate_csv
      result = ['Campanha','Visualizações']

      expect(validate).to eq(result)
    end

    it 'validação scv invalido' do

      validate = Validate_Format::Validate.new('spec/suports/report_adsense.csv').validate_csv
      result = !['Campanha','Visualizações']

      expect(validate).not_to eq(result)
    end
  end
end
