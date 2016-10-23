class OfficesController < ApplicationController
  
  layout "with_sidebar"
  
  def index
    @offices = Office.all
    puts 'to jest metoda index'
    puts @offices.count
    puts @offices.inspect
  end
  
  def show
  end
  
  def new
    @office = Office.new
  end
  
  def edit
    @office = Office.find( params[:id] )
  end
  
  def create
   puts "jestem w create"
    @office = Office.new( params[:office].permit! )
    puts '-----'
    puts @office.inspect
    if @office.save
      redirect_to offices_path
    else
      render :new
    end  
  end


def update
  @office = Office.find( params[:id] )
  if @office.update( params[:office].permit! )
      
      flash[:notice] = 'Wszystko jest ok'
      
    redirect_to offices_path
    else
      flash.now[:error] = 'Popraw!!'
      render :edit
    end
  end
  
  def destroy
    @office = Office.find( params[:id] )
    if @office.destroy
		flash[:notice] = "Usunieto #{@office.name}"
    else
      flash[:error] = "Mie można usunąć #{@office.name}"

    end
    redirect_to offices_path
  end

end
