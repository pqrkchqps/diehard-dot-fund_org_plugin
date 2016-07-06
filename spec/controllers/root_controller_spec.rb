require 'rails_helper'

describe RootController, type: :controller do

  describe 'index' do

    context 'logged in' do
      it 'takes you to the explore page when not a member of any groups' do
        sign_in create(:user)
        get :index
        expect(response).to redirect_to explore_path
      end

      it 'takes you to your group page when a member of one group' do
        user =  create(:user)
        group = create(:group)
        group.add_member! user
        sign_in user
        get :index
        expect(response).to redirect_to group
      end

      it 'takes you to the dashboard when a member of multiple groups' do
        user = create(:user)
        group = create(:group)
        group.add_member! user
        second_group = create(:group)
        second_group.add_member! user
        sign_in user
        get :index
        expect(response).to redirect_to dashboard_path
      end
    end
  end
end
