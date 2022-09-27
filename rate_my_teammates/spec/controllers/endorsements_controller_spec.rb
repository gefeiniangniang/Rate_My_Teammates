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

RSpec.describe EndorsementsController, type: :controller do

  let(:valid_session) { {user_id: 1} }

  describe "GET #new" do
    it "returns a success response" do
      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
      @skill = @user.skills.create!(:name => "skill one")
      post :create, {skill_id: @skill.id, endorser_id: @user.id, user_id: @user.id}, valid_session
      expect(response).to redirect_to(user_path(@user))
      post :create, {skill_id: @skill.id, endorser_id: @user.id, user_id: @user.id}, valid_session
      expect(response).to redirect_to(user_path(@user))
    end
  end
end
