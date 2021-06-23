require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject (:user1) { User.create(username: "hello", password: "password") }

  describe 'GET #index' do
    it 'renders the index page' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'renders the show page' do
      get :show, params: { id: user1.id }
      expect(response).to render_template('show')
    end
  end

  describe 'GET #new' do
    it 'renders the new page' do
      get :new
      expect(response).to render_template('new')
    end
  end
end