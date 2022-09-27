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

RSpec.describe ReviewsController, type: :controller do
  let(:valid_session) { {user_id: 1} }
  describe 'new' do
    it 'should render a page for entering a new review' do
      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
      get :new, {user_id: @user.id, user_uni: @user.uni}, valid_session
      expect(response).to have_http_status(302)
    end
  end
  
  describe 'create' do
    it 'should create a new review' do
      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
      post :create, {user_id: @user.id, review: {user_uni: @user.uni, content: 'good teammate', course_taken_together:'cs12', time_management:'1', critical_thinking:'1', collaboration:'1', communication:'1', reliability:'1'}}, valid_session
      expect(response).to redirect_to(user_path(@user))
    end

    it 'should not create a new review' do
      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
      post :create, {user_id: @user.id, review: {user_uni: @user.uni, content: '', course_taken_together:'cs12', time_management:'1', critical_thinking:'1', collaboration:'1', communication:'1', reliability:'1'}}, valid_session
      expect(response).to redirect_to(new_user_review_path(:user_uni => @user.uni))
    end

    it 'should not create a new review' do
      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
      post :create, {user_id: @user.id, review: {user_uni: @user.uni, content: 'good teammate', course_taken_together:'', time_management:'1', critical_thinking:'1', collaboration:'1', communication:'1', reliability:'1'}}, valid_session
      expect(response).to redirect_to(new_user_review_path(:user_uni => @user.uni))
    end

    it 'should not create a new review' do
      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
      post :create, {user_id: @user.id, review: {user_uni: @user.uni, content: 'good teammate', course_taken_together:'cs12', critical_thinking:'1', collaboration:'1', communication:'1', reliability:'1'}}, valid_session
      expect(response).to redirect_to(new_user_review_path(:user_uni => @user.uni))
    end

    it 'should not create a new review' do
      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
      post :create, {user_id: @user.id, review: {user_uni: @user.uni, content: 'good teammate', course_taken_together:'cs12', time_management:'1', collaboration:'1', communication:'1', reliability:'1'}}, valid_session
      expect(response).to redirect_to(new_user_review_path(:user_uni => @user.uni))
    end

    it 'should not create a new review' do
      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
      post :create, {user_id: @user.id, review: {user_uni: @user.uni, content: 'good teammate', course_taken_together:'cs12', time_management:'1', critical_thinking:'1', communication:'1', reliability:'1'}}, valid_session
      expect(response).to redirect_to(new_user_review_path(:user_uni => @user.uni))
    end

    it 'should not create a new review' do
      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
      post :create, {user_id: @user.id, review: {user_uni: @user.uni, content: 'good teammate', course_taken_together:'cs12', time_management:'1', critical_thinking:'1', collaboration:'1', reliability:'1'}}, valid_session
      expect(response).to redirect_to(new_user_review_path(:user_uni => @user.uni))
    end

    it 'should not create a new review' do
      @user = User.create({:uni=> 'lc3534', :name => 'Charles Chen', :description => 'MSCS_2021'})
      post :create, {user_id: @user.id, review: {user_uni: @user.uni, content: 'good teammate', course_taken_together:'cs12', time_management:'1', critical_thinking:'1', collaboration:'1', communication:'1'}}, valid_session
      expect(response).to redirect_to(new_user_review_path(:user_uni => @user.uni))
    end
  end
end

