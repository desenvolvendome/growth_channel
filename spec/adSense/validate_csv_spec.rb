require 'growth_channel/adSense/validate_format_csv'

RSpec.describe 'Validate_Format::Validate' do
  context "Validação" do

    it 'validação csv valido' do
      validate = Validate_Format::Validate.new('spec/suports/report_adsense_sample.csv').validate_csv
      resutl = ['Campanha','Visualizações']

      expect(validate).to eq(resutl)
    end

    # it 'validação csv invalido' do
    #   validate2 = AdSense::View.new('spec/suports/report_adsense_sample.csv').validate_csv
    #
    #   expect(validate2).to eq("CSV invalido")
    # end

  end
end