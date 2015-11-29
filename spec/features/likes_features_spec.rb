require 'rails_helper'

describe 'features for liking a post' do
  before do
    user = create(:user)
    create(:post, user_id: user.id )
    sign_up
    visit '/posts'
  end
  
  context 'liking posts' do
    scenario 'there is a link to like a post' do
      within('div.likes') do
        expect(page).to have_link 'Like'
      end
    end

    scenario 'a user can like a post' do
      click_link 'Like'
      within('div.likes') do
        expect(page).to have_content '1 like'
      end
    end

    scenario 'a user can not like a post twice, but can unlike' do
      click_link 'Like'
      within('div.likes') do
        expect(page).not_to have_link 'Like'
        expect(page).to have_link 'Unlike'
      end
    end
  end
end
