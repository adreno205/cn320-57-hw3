class MoviesController < ApplicationController

 caches_page :index
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    ##@movies = Movie.where('rating in ?',params[:ratings].keys).order(*params[:order])
    ##@all_ratings = ['G','PG','PG-13','R','NC-17']
    #@movies = Movie.order(*params[:order])
    @movies = Movie.where("rating in (?)", selected_ratings).order(params[:order])
    @all_ratings = ['G','PG','PG-13','R','NC-17']
    #@movies = Movie.find(:all, :order => (params[:sort_by]))
    #@sort_column = params[:sort_by]
    #@all_ratings = selected_ratings
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  
  private

  def selected_ratings
    if params.has_key?(:ratings)
      params[:ratings].keys
    else
      all_ratings
    end
  end  
 
  def all_ratings
    ['G','PG','PG-13','R','NC-17']
  end

  #def filter_checked?(rating)
    #params[:ratings].has_key?(rating)
  #end

end