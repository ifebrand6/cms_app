class DemoController < ApplicationController
 layout 'application'
  def index
  	# render('hello')

 
  end
  def hello
  	# render('index')
  	@array = [1,2,3,4,5]
  	@id = params['id'].to_i
  	@page = params[:page].to_i
  end
  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end
  def google
  	redirect_to("http://google.com")
  end
  def escape_output
                             
  end
  def make_error
    render(:text => "test")
    # render(:text => @something.upcase)
    # render(text => "1" + 1)
  end
  def logging
    logger.debug("This is debug")
    logger.info("this is info")
    logger.warn("this is warn")
    logger.error("this is error")
    logger.fatal("this is fatal")
    render(:text => 'k')    
  end
end
