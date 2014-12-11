require 'rails_helper'

describe Term do
  it { should belong_to(:student) }
end