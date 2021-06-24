require 'rails_helper'
require 'spec_helper'

feature 'signup' do 
    before :each do 
        visit new_user_url
    end

    it 'has a signup page' do 
        expect(page).to have_content 'Sign Up!'
    end

    it 'takes a username and password' do 
        expect(page).to have_content 'username:'
        expect(page).to have_content 'password:'
    end

    context 'given valid params' do
        before :each do 
            register('Username')
        end

        it 'logs in user and redirects to index' do 
            expect(current_path).to eq(users_path)
            expect(page).to have_content 'All Users'
        end
    end

    context 'outside valid params' do
        before :each do 
            register('')
        end

        it 'should show flash errors' do 
            expect(page).to have_content 'Username can\'t be blank' 
        end

        it 'should render the new page' do 
            expect(page).to have_content 'Sign Up!'
        end
    end
end