class SubsController < ApplicationController
    def index
        @subs = Sub.all
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
    @sub = Sub.new(sub_params)
        if @sub
            @sub.save
            redirect_to sub_url(@sub)
        else
            render :new
            flash.now[:errors] = @sub.errors.full_messages
        end
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
        end
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
