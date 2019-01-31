class SectionsController < ApplicationController
  before_action :confirmed_logged_in
  before_action :find_pages_id
  layout "admin"
  
  def index
    @sections = Section.where(:page_id => @page.id).sorted
    # @section = @page.section.sorted
    @pages = @page.subject.pages.sorted
  end

  def show
     @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:page_id => @page.id, :name => "Default"})
    
  end
  # def make
  #   @section = Section.new(section_params)
  #   if @section.save!

  #     redirect_to(:action => 'index',:page_id => @page.id)
  #   else
  #     render 'new'
      
  #   end
    
  # end

   def create
    @section = Section.new(section_params)
    if @section.save
      flash[:hash]  = "Section Added Successfully."
       redirect_to(:action => 'index',:page_id => @page.id)
     else
   
        render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end
  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
       redirect_to(:action => 'show', :id => @section.id,:page_id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end
  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:hash] = "The section with '#{@section.name}"
    redirect_to(:action => 'index',:page_id => @page.id)    
  end
  private
  def section_params
    params.require(:section).permit(:name,:position,:visible,:content_type,:content, :page_id)
    
  end
  def find_pages_id
    if  params[:page_id]
      @page = Page.find(params[:page_id])

      
    end
    
  end
end
