class ApplicationController < Sinatra::Base
  use Rack::MethodOverride
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

post '/recipes' do
  @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
  redirect to "/recipes/#{@recipe.id}"
end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update_attributes(:name =>params[:name], :ingredients =>params[:ingredients],:cook_time =>params[:cook_time])
   redirect "/recipes/#{@recipe.id}"
  end


  delete '/recipes/:id' do

    Recipe.delete(params[:id])
    erb :index
    end
end
