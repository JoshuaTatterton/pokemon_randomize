feature "Roulette" do
  before(:each) do
    visit "/"
  end

  context "it displays spaces for" do

    scenario "1 person 1 pokemon" do
      choose "people_1"
      choose "pokemon_1"
      click_button "Randomize"

      
      expect(page).to have_css "#player_1"
      within "#player_1" do
        expect(page).to have_content "Player 1:"
        expect(page).to have_css "#pokemon_1"
        expect(page).to have_button "Roll"
      end
    end

    scenario "4 people 6 pokemon each" do
      choose "people_4"
      choose "pokemon_6"
      click_button "Randomize"

      4.times do |num|
        expect(page).to have_css "#player_#{num + 1}"

        within "#player_#{num + 1}" do
          expect(page).to have_content "Player #{num + 1}:"

          6.times do |num2|

            within "#pokemon_#{num2 + 1}" do
              expect(page).to have_css ".image"
              expect(page).to have_button "Roll"
            end
          end
        end
      end
    end

  end
end