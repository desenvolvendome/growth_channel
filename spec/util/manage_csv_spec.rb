require 'growth_channel/util/manage_csv'

RSpec.describe "ManageCSV" do

    it "is valid when the video format is correct" do
        expect {ManageCSV.read_csv_youtube}.not_to raise_error
    end

    context "testing invalid titles" do
        s = "não está em um formato correto!"

        it "title with spaces" do
            title = ManageCSV.validate_youtube_title("v 4.5: Qual é a melhor maneira para evoluir como Dev?")
            expect(title).to eq("v 4.5: Qual é a melhor maneira para evoluir como Dev? " + s)
        end

        it "invalid format id" do
            title = ManageCSV.validate_youtube_title("va4.5: Qual é a melhor maneira para evoluir como Dev?")
            expect(title).to eq("va4.5: Qual é a melhor maneira para evoluir como Dev? " + s)
        end

        it "without id" do
            title = ManageCSV.validate_youtube_title("Qual é a melhor maneira para evoluir como Dev?")
            expect(title).to eq("Qual é a melhor maneira para evoluir como Dev? " + s)
        end

        it "without title" do
            title = ManageCSV.validate_youtube_title("v4.5:")
            expect(title).to eq("v4.5: " + s)
        end
    end

    context "testing valids titles" do

      it "title in the correct pattern" do
          title = ManageCSV.validate_youtube_title("v4.5: Qual é a melhor maneira para evoluir como Dev?")
          expect(title).to eq(true)
      end

    end

end


