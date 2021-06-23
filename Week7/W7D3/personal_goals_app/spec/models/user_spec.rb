# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
    let(:incomplete_user) {User.new(username: "", password: "password")}
    let(:user1) {User.create(username: "Anything", password: "password")}

    describe "validates pressence" do 
        it {should validate_presence_of(:username)}
        it {should validate_presence_of(:password_digest)}
        it {should validate_presence_of(:session_token)}
        it {should validate_length_of(:password).is_at_least(6)}
    end

    describe "validates uniqueness" do
        subject { User.new(username: "Anythings", password: "password")}
        it {should validate_uniqueness_of(:username)}
        # it {should validate_uniqueness_of(:session_token)}
    end

    describe "class user methods" do 
        it "::find_by_credentials(username, password)" do
            user2 = User.create(username: "Anythingss", password: "password")
            expect(User.find_by_credentials("Anythingss", "password")).to eq user2
        end

        it "#is_password?(password)" do
            expect(user1.is_password?("password")).to be true
            expect(user1.is_password?("password1")).to be false
        end
    end

    #attr_reader password and password=
    #is_password?
    #reset_session_token!
    #ensure_session_token
end
