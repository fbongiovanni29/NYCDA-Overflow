require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.build(:user)}
  let(:user_without_email) {FactoryGirl.build(:user_without_email)}
  subject { user}
  	it {should be_valid}
  subject {user_without_email}
  	it {should_not be_valid}
describe 'with missing email address' do 

end
end
