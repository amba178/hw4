require 'rails_helper'


RSpec.describe MoviesController, type: :controller do 

	let!(:m1) {FactoryGirl.create(:movie, :director => "Salem Ali", title: "Judgement Day")}
	let!(:m2) {FactoryGirl.create(:movie, :director => " ", title: "Aladdin")}
	let!(:m3) {FactoryGirl.create(:movie, :director => "Salem Ali", title: "Judgement Day")}

	describe "GET #movies_same_dictor" do
	    it "search_directors route should map to movies_same_director action" do
	    	expect(:get => '/search_directors/:id').to route_to(controller: "movies", action: 'movies_same_director', id: ":id")
	    end

    end

    describe "GET 'movies_same_director with valid director" do 
    	before {get :movies_same_director, :id => m1.id}
    	it "render the movies_same_director template" do 
    		expect(response).to render_template("movies_same_director")
    	end
    end


    describe "GET 'movies_same_director with no director" do 
    	before {get :movies_same_director, :id => m2.id}
    	it "render the movies_same_director template" do 
    		expect(response).to redirect_to root_url 
    	end
    	it "will set flash[:notice]" do 
    		expect(flash[:notice]).to eql "'#{m2.title}' has no director info" 
    	end
    end

end