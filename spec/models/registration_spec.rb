require 'rails_helper'

RSpec.describe Registration do
  describe 'relationships' do
    it { should belong_to(:team) }
    it { should belong_to(:competition) }
  end
end
