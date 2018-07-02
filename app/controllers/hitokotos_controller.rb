class HitokotosController < ApplicationController
  before_action :set_hitokoto, only: [:show, :edit, :update, :destroy]
  def index
    @hitokotos = Hitokoto.all
  end
  def new
    if params[:back]
      @hitokoto = Hitokoto.new(hitokoto_params)
    else
      @hitokoto = Hitokoto.new
    end
  end
  def destroy
    @hitokoto.destroy
     redirect_to hitokotos_path, notice:"一言を削除しました！"
  end
  def confirm
    @hitokoto = Hitokoto.new(hitokoto_params)
    render :new if @hitokoto.invalid?
  end
  def create
    @hitokoto = Hitokoto.new(hitokoto_params)
      if @hitokoto.save
        redirect_to new_hitokoto_path
      else
        render 'new'
      end
  end
  # def show
  #   @hitokoto = Hitokoto.find(params[:id])
  # end
  # def edit
  #   @hitokoto = Hitokoto.find(params[:id])
  # end
  def update
    @hitokoto = Hitokoto.find(params[:id])
    if @hitokoto.update(hitokoto_params)
      redirect_to hitokotos_path, notice: "一言を編集しました！"
    else
      render 'edit'
    end
  end
  
  private
  def hitokoto_params
    params.require(:hitokoto).permit(:content)
  end
  def set_hitokoto
    @hitokoto = Hitokoto.find(params[:id])
  end
 
end
