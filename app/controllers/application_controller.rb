class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Welcome :)"
  end

  #READ all
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #CREATE Part 1
  get '/recipes/new' do
    erb :new
  end

  #CREATE Part 2
  post '/recipes' do
    # binding.pry 
   @recipe = Recipe.create(name: params[:name],ingredients: params[:ingredients], cook_time: params[:cook_time])
   redirect "/recipes/#{@recipe.id}"
  end

  #READ
  get '/recipes/:id' do
  @recipe = Recipe.find(params[:id])
  erb :show
  end

  #UPDATE
   get '/recipes/:id/edit' do
     @recipe = Recipe.find(params[:id])
     erb :edit
   end

   patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "recipes/#{@recipe.id}"
  end


  #DELETE
   delete '/recipes/:id' do
     @recipe = Recipe.find(params[:id])
     @recipe.delete
     redirect '/recipes'
   end


end
