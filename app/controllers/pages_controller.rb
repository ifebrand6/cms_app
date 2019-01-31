class PagesController < ApplicationController
  before_action :confirmed_logged_in
  before_action :find_subject
  layout "admin"
  def index
    # @pages = Page.where(:subject_id => @subject.id).sorted
    @pages = @subject.pages.sorted
  end

  def show
    @page = Page.find(params['id'])
  end

  def new
    @page = Page.new({:subject_id => @subject.id, :name => "Default"})
  end


  def create
    @page = Page.new(page_params)
   if @page.save

      redirect_to(:action => 'index', :subject_id => @subject.id)
   else
    render('new')
     
   end
  end

  def edit
     @page = Page.find(params['id'])
  end
  def update
     @page = Page.find(params['id'])
     if @page.update_attributes(page_params)
       flash[:notice] = "Subject with ID number '#{@page.id}' had been updated successfully."
       redirect_to(:action => 'show', :id => @page.id, :subject_id => @subject.id)
     else
      render('edit')
       
     end
  end

  def delete
    @page = Page.find(params['id'])
  end
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to(:action => 'index', :subject_id => @subject.id)
  end

  private
  def page_params
  params.require(:page).permit(:name,:position,:visible,:permalink, :subject_id)

 end
 def find_subject
  if params[:subject_id]
    @subject = Subject.find(params[:subject_id])
  end
   
 end
end
