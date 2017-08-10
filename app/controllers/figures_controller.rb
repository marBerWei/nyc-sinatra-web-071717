class FiguresController < ApplicationController

	get '/figures' do
		@figures = Figure.all
		erb :'/figures/index'
	end

	get '/figures/new' do 
		@landmarks = Landmark.all
		@titles = Title.all
		# binding.pry
		erb :'/figures/new'
	end

	post '/figures' do 
		# binding.pry
		@figure = Figure.new(params[:figure])
		@figure.save
		 # binding.pry
		if !params[:landmark][:name].empty?
			land = Landmark.new(params[:landmark])
			land.figure_id = @figure.id
			land.save
			 # binding.pry
		end
		if !params[:title][:name].empty?
			title = Title.new(params[:title])
			title.save
			# binding.pry
		end
		@figure.titles << title
		 # binding.pry
		redirect "/figures"

	end

	get '/figures/:id' do 
		@figure = Figure.find(params[:id])
		erb :'/figures/show'
	end

	get '/figures/:id/edit' do
		@figure = Figure.find(params[:id])
		erb :'figures/edit'
	end

	patch '/figures/:id' do
		@figure = Figure.find(params[:id])
		@figure.name = params[:figure][:name]
		@figure.save
		if !params[:landmark][:name].empty?
			land = Landmark.new(params[:landmark])
			land.figure_id = @figure.id
			land.save
		end

		redirect "/figures/#{@figure.id}"
	end

	delete '/figures/:id' do 
		@figure = figure.find(params[:id])
		@figure.destroy
		erb :'figures/'
	end



end
