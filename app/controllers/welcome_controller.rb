class WelcomeController < ApplicationController
  def index
    puts '++++++++++++++++++'
    puts current_user
  end
end
