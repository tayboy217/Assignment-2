class HomesController < ApplicationController

 def index
    @books = Book.all
 end
 
end
