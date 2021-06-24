require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject (:user1) { User.create(username: "hello", password: "password") }

  describe 'GET #index' do
    before do 
      allow(controller).to receive(:current_user) {user1}
    end

    it 'renders the index page' do
      get :index
      expect(response).to render_template('index')
    end

    # it 'shows all users' do
    #     fetched_users = controller.instance_variable_get(:@users)
    #     expect(fetched_users).to eq(User.all)
    # end
  end

  describe 'GET #show' do
    before do 
        allow(controller).to receive(:current_user) {user1}
    end
    it 'renders the show page' do
      get :show, params: { id: user1.id }
      expect(response).to render_template('show')
    end

    # it 'shows a user' do
    #     fetched_user = controller.instance_variable_get(:@user)
    #     expect(fetched_user).to eq(User.find(user1.id))
    # end
  end

  describe 'GET #new' do
    it 'renders the new page' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context "With valid params" do 
      it 'redirects the user to index page' do
        post :create, params: {user: {username: "user", password: "password"}}
        expect(response).to redirect_to(users_url)
      end

      it 'should log in the user' do
        post :create, params: {user: {username: "user3", password: "password"}}
        user = User.find_by(username: "user3")
        expect(session[:session_token]).to eq(user.session_token)
      end
    end

    context "With invalid params" do 
      it 'renders the new page and shows errors' do
        post :create, params: {user: {username: "user", password: ""}}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end

  end
end