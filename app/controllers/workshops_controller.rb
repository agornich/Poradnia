class WorkshopsController < ApplicationController
  
    layout "with_sidebar"

  def index
    @workshops = Workshop.all
    puts @workshops.count
    puts @workshops.inspect
      
    if params[:search]
      @workshops = @workshops.where "name || shortcut || description || price LIKE ?", "%#{params[:search]}%"
    end
  end
  
  def show
  end
  
  def new
    @workshop = Workshop.new
  end
  
  def create
    puts "jestem w create"
    # "workshop"=>{"name"=>""}
    @workshop = Workshop.new( params[:workshop].permit! )
    puts '-----'
    puts @workshop.inspect
    if @workshop.save
      redirect_to workshops_path
    else
      render :new
    end  
  end
  
  def edit
    @workshop = Workshop.find( params[:id] )
  end
  
  def update
    @workshop = Workshop.find( params[:id] )
    if @workshop.update( params[:workshop].permit! )
      
      flash[:notice] = 'Wszystko jest ok'
      
      redirect_to workshops_path
    else
      flash.now[:error] = 'Popraw!!'
      render :edit
    end
  end
  
  def destroy
    @workshop = Workshop.find( params[:id] )
    @workshop.destroy
    flash[:notice] = "Usunieto workshop o ID: #{@workshop.id}"
    redirect_to workshops_path
  end
  
end
