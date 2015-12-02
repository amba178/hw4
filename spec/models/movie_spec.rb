require 'rails_helper'

RSpec.describe Movie, type: :model do

	let(:m1) {FactoryGirl.create(:movie, :director => "Salem Ali", title: "Judgement Day")}
	let(:m2) {FactoryGirl.create(:movie, :director => "Abdi Omar", title: "Aladdin")}
	let(:m3) {FactoryGirl.create(:movie, :director => "Salem Ali", title: "Judgement Day")}
	let(:m4) {FactoryGirl.create(:movie, :director => "Abdi Omar", :title => "Catch me if can")}
	let(:m5) {FactoryGirl.create(:movie, :director => "Salem Ali")}
	let(:m6) {FactoryGirl.create(:movie, :director => " ")}
	let(:m7) {FactoryGirl.create(:movie, :director => "Salem Ali")}
	let(:m8) {FactoryGirl.create(:movie, :director => "Abdi Omar", :title => "Catch me if can")}

	describe 'Fixtures' do
		it 'should have a valid factory' do
		  expect(FactoryGirl.create(:movie)).to be_valid
		end
	end

	describe "searching movies with same director" do 
		it "#movies_same_dictor with director" do
			expect(Movie.movies_same_dictor(m1.director)).to include(m7, m3, m5)
		end

		it "#movies_same_dictor withno director" do
			expect(Movie.movies_same_dictor(m6.director).first.director).to be_blank
			expect(Movie.movies_same_dictor(m6.director).size).to eql(1)
		end
	end

end