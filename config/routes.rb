Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get 'search_directors/:id', to: 'movies#movies_same_director', as: 'search_directors'

end
