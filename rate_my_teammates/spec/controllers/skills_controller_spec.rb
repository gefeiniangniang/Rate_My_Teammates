require 'rails_helper'

if RUBY_VERSION>='2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

RSpec.describe SkillsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Skill. As you add validations to Skill, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:user_uni=> 'lc3534', :name=>'Java'}
  }

  let(:invalid_attributes) {
    {:user_uni=> 'lc3534', :name=>''}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SkillsController. Be sure to keep this updated too.
  let(:valid_session) { {user_id: 1} }

  describe "GET #new" do
    it "returns a success response" do
      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
      get :new, {user_id: @user.id, user_uni: @user.uni}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Skill" do
        @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
        expect {
          post :create, {user_id: @user.id, :skill => valid_attributes}, valid_session
        }.to change(Skill, :count).by(1)
      end

      it "redirects to the created skill" do
        @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
        post :create, {user_id: @user.id, :skill => valid_attributes}, valid_session
        expect(response).to redirect_to(user_path(@user))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
        post :create, {user_id: @user.id, :skill => invalid_attributes}, valid_session
        expect(response).to redirect_to(new_user_skill_path(:user_uni => @user.uni))
      end
    end
  end

end
