#นายธนกร เหลืองขจรวิทย์ 5510613309
#น.ส.บัณฑิตา อวยชัยเจริญ 5510613234

  module MoviesHelper
    # Checks if a number is odd:
    def oddness(count)
      count.odd? ?  "odd" :  "even"
    end
  end

  def title_selected_class
    params[:order] == 'title' ? 'hilite' : ''
  end
  
  def release_date_selected_class
    params[:order] == 'release_date' ? 'hilite' : ''
  end  

  def filter_option_checked?(rating)
    return true unless params.has_key?(:ratings)
    params[:ratings].has_key?(rating)
  end
  
