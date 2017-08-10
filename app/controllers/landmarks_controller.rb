class LandmarksController < ApplicationController
	get '/landmarks' do
		@landmarks = Landmark.all
		erb :'/landmarks/index'
	end

	get '/landmarks/new' do 
		@landmark = Landmark.new(params[:name])
		erb :'/landmarks/new'
	end

	post '/landmarks' do 
		# binding.pry
		@landmark = Landmark.new(params[:landmark])
		@landmark.save
	end

	get '/landmarks/:id' do 
		@landmark = Landmark.find(params[:id])
		erb :'/landmarks/show'
	end

	get '/landmarks/:id/edit' do
		@landmark = Landmark.find(params[:id])
		erb :'landmarks/edit'
	end

	patch '/landmarks/:id' do
		@landmark = Landmark.find(params[:id])
		@landmark.name = params[:landmark][:name]
		@landmark.year_completed = params[:landmark][:year_completed]
		@landmark.save
		if !params[:landmark][:name].empty?
			land = Landmark.new(params[:landmark])
			land.save
		end

		redirect "/landmarks/#{@landmark.id}"
	end

	delete '/landmarks/:id' do 
		@landmark = Landmark.find(params[:id])
		@landmark.destroy
		erb :'landmarks/'
	end


end
