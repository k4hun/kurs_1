module ApplicationHelper

  def visible_status(bool, options={})
    options[:true] ||= ''
    options[:false] ||= ''

    bool ? content_tag(:span, options[:true], :class => 'glyphicon glyphicon-ok-circle') : 
            content_tag(:span, options[:false], :class => 'glyphicon glyphicon-ban-circle')  
  end

  def error(object)
    render(:partial => 'addons/errors', :locals => {:object => object})    
  end

end
