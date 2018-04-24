# This is my application's routing file. It holds entries in a special DSL (domain-specific language) that tells Rails how to connect incoming requests to controllers and actions. I can edit this file by adding the line of code `root 'welcome#index'`, or in this case, `root 'reviews#index'.

# The routes for my application or engine live in the file config/routes.rb and typically looks like this:

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :reviews
  # :reviews is because we generated a controller called 'reviews'
  # Resource routing allows me to quickly declare all of the common routes for a given resourceful controller. In Rails, a resourceful route provides a mapping between HTTP verbs and URLs to controller actions. By convention, each action also maps to a specific CRUD operation in a database. A single entry in the routing file, such as:
  # resources :reviews
  # creates seven different routes in my application, all mapping to the Photos controller:
  # GET, GET (new), POST, GET (id), GET (id/edit), PATCH/PUT and DELETE

  # A resource is the term used for a collection of similar objects, such as articles, people or animals. I can create, read, update and destroy items for a resource and these operations are referred to as CRUD (create read update delete) operations.

  # Rails provides a resources method which can be used to declare a standard REST resource. I need to add the article resource to the config/routes.rb.

  root 'reviews#index'
  # to link to main page — (not 'route' – root)

end

# `root 'reviews#index'` tells Rails to map requests (firstly) to the root of the application (and secondly) to the reviews controller's index action.