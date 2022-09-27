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


RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
  let!(:param) { {:uni=> 'lc3533', :name => 'Charles Chen', :description => 'MSCS_2021'}}
	let!(:user) {User.create!(param)}

	before(:each) do
		get :show, :id => user.id
	end

    it 'should show the user' do
      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
      @re = @user.reviews.create!(:content => "ok",
          :reviewer_uni => 'lc3535',
          :course_taken_together => 'coms4111',
          :time_management => 5,
          :critical_thinking => 5,
          :collaboration => 5,
          :communication => 5,
          :reliability => 5)
      get :show, :id => @user.id
      # expect(@controller.instance_variable_get('@user').uni).to eq(param[:uni])
    end
  end

  describe "GET #index" do
    let!(:param1) {{:uni=> 'lc3533', :name => 'Charles Chen', :description => 'MSCS_2021'}}
	let!(:param2) {{:uni=> 'yj2627', :name => 'Ari Jiang', :description => 'MSCS_2021'}}
	let!(:user1) {User.create!(param1)}
	let!(:user2) {User.create!(param2)}

	it 'should render the index html template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "GET #search" do
    let!(:param1) {{:uni=> 'lc3533', :name => 'Charles Chen', :description => 'MSCS_2021'}}
  	let!(:param2) {{:uni=> 'yj2627', :name => 'Ari Jiang', :description => 'MSCS_2021'}}
  	let!(:user1) {User.create!(param1)}
  	let!(:user2) {User.create!(param2)}

	it 'should stay at index with correct UNI' do
      get :search, :uni=> 'lc3533'
      expect(response).to render_template('index')
    end

    it 'should stay at index with incorrect UNI' do
      get :search, :uni=> 'lc'
      expect(response).to render_template('index')
    end

    it 'should stay at index with no UNI' do
      get :search, :uni=> ''
      expect(response).to render_template('index')
    end

  end

  describe "GET #update" do
    let!(:param1) {{:uni=> 'lc3533', :name => 'Charles Chen', :description => 'MSCS_2021'}}
  	let!(:user1) {User.create!(param1)}

  	it 'update' do
      post :update, {id: 1, user: {name: 'Charles CChen'}}
      expect(response).to have_http_status(302)

      post :update, {id: 1, user: {aname: ''}}
      expect(response).to have_http_status(302)
    end



  end

end
