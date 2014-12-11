require 'rails_helper'

describe Result do
  context 'scopes' do
    describe '.allresults' do
      let!(:result_one) { Result.create(student_id: 1, term_id: 2, grade: 95) }
      let!(:result_two) { Result.create(student_id: 2, term_id: 2, grade: 75) }
      let!(:result_three) { Result.create(student_id: 3, term_id: 2, grade: 45) }

#  use match_array rather than eq, unless your scope is explicitly looking for a defined order eg alphabetical
      it { expect(Result.allresults.map(&:grade)).to eq([result_one, result_two, result_three].map(&:grade))}
      # it do
#         # Do this 3 times with 3 different grades
#         # give each a different variable name
#         Result.create(# create result here)
#         expect(Result.ordered_results.map(&:grade)).to eq([best, medium, worst].map(&:grade))
#       end

    end
  end
end