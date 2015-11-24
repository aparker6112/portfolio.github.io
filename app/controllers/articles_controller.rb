class ArticlesController < ApplicationController

def new
	@article = Article.new
end

def create
	@article = Article.new
end

end