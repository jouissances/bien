# To get Rails saying "Hello", you need to create at minimum a controller and a view.

# A controller's purpose is to receive specific requests for the application. Routing decides which controller receives which requests. Often, there is more than one route to each controller, and different routes can be served by different actions. 
# Each action's purpose is to collect information to provide it to a view.

# A view's purpose is to display this information in a human readable format. An important distinction to make is that it is the controller, not the view, where information is collected. The view should just display that information. By default, view templates are written in a language called eRuby (Embedded Ruby) which is processed by the request cycle in Rails before being sent to the user.

# To create a new controller, you will need to run the "controller" generator on terminal and tell it you want a controller called "Reviews" with an action called "index", just like this:
# $ rails generate controller reviews index

# Most important of these are of course the controller, located at app/controllers/reviews_controller.rb. 
# The view is located at app/views/reviews/index.html.erb.

class ReviewsController < ApplicationController
# ruby works in 'classes', '<' 

    def index
        # this 'define' (function) handles index page (list of reviews), and always end with 'end'

        @reviews = Review.all

    end

    def new
        @review = Review.new
    end

    def create 
        @review = Review.new(form_params)

        @review.save

        redirect_to root_path
    end

    def show
        @review = Review.find(params[:id])
    end

    def destroy
        # find the individual review
        @review = Review.find(params[:id]) 
        
        # destroy particular review
        @review.destroy

        #redirect to home page
        redirect_to root_path
    end

    def edit 
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        @review.update(form_params)
        redirect_to review_path
    end

    # form_params is just a random variable, essentially a shortcut
    def form_params
        params.require(:review).permit(:title, :body, :score, :restaurant, :location, :price, :cuisine)
    end

end

# A controller is simply a class that is defined to inherit from ApplicationController. It's inside this class that I'll define methods that will become the actions for this controller. These actions will perform CRUD (create read update delete) operations on the reviews within our system.

# To manually define an action inside a controller, all I need to do is to define a method inside the controller. Open app/controllers/reviews_controller.rb and inside the ReviewsController class, define the (e.g. index) method.

# The simplest template that would work would be one located at app/views/articles/index.html.erb. The extension of this file name is important: the first extension is the format of the template, and the second extension is the handler that will be used to render the template. Rails is attempting to find a template called app/views/reviews/index for the application. The format for this template can only be html and the default handler for HTML is erb. Rails uses other handlers for other formats. `builder handler` is used to build XML templates and `coffee handler` uses CoffeeScript to build JavaScript templates. Since I want to create a new HTML form, I will be using the ERB language which is designed to embed Ruby in HTML.