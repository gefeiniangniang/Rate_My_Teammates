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

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #auth" do
    it "returns http 302" do
      @token = Token.create(:login_token => SecureRandom.hex(10),
                            :uni => 'lc3534')
      get :auth, {:token => @token.login_token}
      expect(response).to have_http_status(302)

      get :auth, {:token => "123"}
      expect(response).to have_http_status(302)

      get :auth, {:token => @token.login_token}, {user_id: 1}
      expect(response).to have_http_status(302)
    end
  end

  describe "POST #verify" do
    it "returns http success" do
      post :verify, {:uni => 'lc3534'}
      expect(response).to have_http_status(302)

      post :verify, {:uni => 'lc3534'}
      expect(response).to have_http_status(302)

      post :verify, {:uni => ''}
      expect(response).to have_http_status(302)

      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})

      post :verify, {:uni => 'lc3534'}, {user_id: 1}
      expect(response).to have_http_status(302)
    end
  end

end
