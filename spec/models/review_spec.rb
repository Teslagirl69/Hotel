require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :author_name }
    it { is_expected.to validate_presence_of :author_email }
    it { is_expected.to validate_presence_of :body }
  end
end
