feature "Options" do
  
  scenario "You can chose the number of people to randomize" do
    visit "/"

    choose "people_1"
    choose "people_2"
    choose "people_3"
    choose "people_4"

    click_button "Randomize"

    expect(current_path).to eq "/randomize"
  end

  scenario "You can chose the number of pokemon to randomize" do
    visit "/"

    expect(page).to have_content "1:"
    expect(page).to have_content "2:"
    expect(page).to have_content "3:"
    expect(page).to have_content "4:"
    expect(page).to have_content "5:"
    expect(page).to have_content "6:"

    choose "pokemon_1"
    choose "pokemon_2"
    choose "pokemon_4"
    choose "pokemon_5"
    choose "pokemon_6"
    choose "pokemon_3"

    click_button "Randomize"

    expect(current_path).to eq "/randomize"
  end

end