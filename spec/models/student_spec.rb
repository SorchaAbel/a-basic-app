require 'rails_helper'

describe Student do
  # TODO implement shoulda-matchers https://github.com/thoughtbot/shoulda-matchers

  # TODO the shoulda matchers replace these tests, remove
  # TODO shoulda matchers for relationships
  context 'missing mandatory fields' do
    it "is invalid without a name" do
      expect(subject).to_not be_valid
    end
    it "is invalid without an email" do
      student = Student.new(:name => "Sorcha")
      expect(student).to_not be_valid
    end
    it "should raise an error if saved without mandatory fields" do
      expect{subject.save!}.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end

  # TODO this reads like an integration spec, but we dont have any
  # Look up how to create specs with capybara
  context 'mandatory data entered' do
    it "should have a name, address and email" do
      subject.name ="Andrew Abel"
      subject.name.should == "Andrew Abel"
      subject.email = "Andrew@gmail.com"
      subject.email.should == "Andrew@gmail.com"
      subject.addr1 = "88 Kilpatrick Street"
      subject.addr1.should == "88 Kilpatrick Street"
      expect {subject.save}.to change {Student.count}.by(1)
      # expect {
      # click_button 'Save'
      # }.to change(Student, :count).by(1)
    end
  end

  # TODO place these inside a validations context, put these at the top
  it { should validate_presence_of(:addr1) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end