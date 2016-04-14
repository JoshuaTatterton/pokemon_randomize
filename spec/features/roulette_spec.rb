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
        expect(page).to have_content "Trainer 1:"
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
          expect(page).to have_content "Trainer #{num + 1}:"

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

  scenario "user can roll a players pokemon", js: true do
    choose "people_1"
    choose "pokemon_1"
    click_button "Randomize"

    within "#player_1" do
      within "#pokemon_1" do
        expect(page).not_to have_css "img"

        click_button "Roll"

        expect(page).to have_css "img"
        expect(page).not_to have_button "Roll"
      end
    end
  end

  scenario "if nothing is entered in form it defaults to 4 trainers 3 pokemon each" do
    click_button "Randomize"

    4.times do |num|
      expect(page).to have_css "#player_#{num + 1}"

      within "#player_#{num + 1}" do
        expect(page).to have_content "Trainer #{num + 1}:"

        6.times do |num2|
          if num2 <= 2
            within "#pokemon_#{num2 + 1}" do
              expect(page).to have_css ".image"
              expect(page).to have_button "Roll"
            end
          else
            expect(page).not_to have_css "#pokemon_#{num2 + 1}"
          end
        end
      end
    end
  end
end