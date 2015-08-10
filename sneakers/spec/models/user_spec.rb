require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do

let(:user){build(:user)}

  context "creation" do

      it 'is valid with a username greater than 6 characters' do
        create(:user, :username => "123456")
        expect(user).to be_valid
      end

      it 'is valid with a username less than 20 characters' do
        create(:user, :username => "123456")
        expect(user).to be_valid
      end

      specify 'username cannot be more than 20 characters' do
        create(:user, :username => "1"*21)
        expect(user).to_not be_valid
      end

      specify 'username cannot be less than 6 characters' do
        create(:user, :username => "1"*3)
        expect(user).to_not be_valid
      end

  end

end