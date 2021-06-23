require 'rails_helper'

RSpec.describe User, type: :model do
    let(:incomplete_user) {User.new(username: "", password: "password")}
    describe "validates pressence" do 
        it {should validate_presence_of(:username)}
        it {should validate_presence_of(:password_digest)}
        it {should validate_presence_of(:session_token)}
        it {should validate_length_of(:password).is_at_least(6)}
    end

    describe "validates uniqueness" do
        it {should validate_uniqueness_of(:username)}
        it {should validate_uniqueness_of(:session_token)}
    end

    describe "class user methods" do 
        let(:user1) {User.create(username: "Anything", password: "password")}
    
        it "::find_by_credentials(username, password)" do
            expect(User.find_by_credentials("Anything", "password")).to eq :user1
        end

        it "#is_password?(password)" do
            expect(:user1.is_password?("password")).to be true
            expect(:user1.is_password?("password1")).to be false
        end
    end

    #attr_reader password and password=
    #is_password?
    #reset_session_token!
    #ensure_session_token
end