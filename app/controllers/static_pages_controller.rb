class StaticPagesController < ApplicationController
  def home
    @hello = 'hello'
  end
end
