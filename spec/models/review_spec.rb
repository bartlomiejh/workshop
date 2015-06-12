require 'spec_helper'

describe Review do
  describe 'validations' do
    it { should validate_presence_of :content }
    it { should validate_presence_of :rating }
    # @q: why not: validate_presence_of :user
    it { should validate_presence_of :user_id }
    it { should belong_to :user }
  end
end
