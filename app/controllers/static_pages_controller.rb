class StaticPagesController < ApplicationController
  def home
    @hello = 'hello'
  end
  
  def about
  end
end
