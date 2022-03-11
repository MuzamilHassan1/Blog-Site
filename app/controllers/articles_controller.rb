class ArticlesController < ApplicationController
    def show
        #finding articles with id from https address i.e (articles/1)
        @article=Article.find(params[:id])
    end

    def index
        @articles=Article.all
    end

    def new
        #for first time we visit /new (required in new.index.html) ohervise nill error will appear
        @article=Article.new
    end

    def create
        #render plain: params[:article] #for rendering at webpage
        #creating article object by taking values from the FORM
        #permit is security feature
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save #if article passed validations (than save)
            #redirecting to the created article(show route) after button is pressed
            redirect_to @article
            #we use flash notice(hash) for success & flash alert(also a hash) for error
            flash[:notice]="Article was created successfully"
        else #else reload the page
            render 'new'
        end
        #render plain: @article.inspect
    end
end
