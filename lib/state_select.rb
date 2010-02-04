module ActionView::Helpers::FormOptionsHelper
  # Return select and option tags for the given object and method, using state_options_for_select to generate the list of option tags.
  def state_select(object, method, country='US', options = {}, html_options = {})
    ActionView::Helpers::InstanceTag.new(object, method, self, options.delete(:object)).to_state_select_tag(country, options, html_options)
  end
  
  # Returns a string of option tags for states in a country. Supply a state name as +selected+ to
  # have it marked as the selected option tag. 
  #
  # NOTE: Only the option tags are returned, you have to wrap this call in a regular HTML select tag.
  
  def state_options_for_select(selected = nil, country = 'US')
    state_options = ""
    if country
      state_options += options_for_select(eval(country.upcase+'_STATES'), selected)
    end
    return state_options
  end
  
  private
  
  US_STATES=[
    ["Alabama",'AL'],        ["Alaska",'AK'],       ["Arizona",'AZ'],        ["Arkansas",'AR'],        ["California",'CA'], 
    ["Colorado",'CO'],       ["Connecticut",'CT'],  ["Delaware",'DE'],       ["Florida",'FL'],         ["Georgia",'GA'], 
    ["Hawaii",'HI'],         ["Idaho",'ID'],        ["Illinois",'IL'],       ["Indiana",'IN'],         ["Iowa",'IA'], 
    ["Kansas",'KS'],         ["Kentucky",'KY'],     ["Louisiana",'LA'],      [ "Maine",'ME'],          ["Maryland",'MD'], 
    ["Massachusetts",'MA'],  ["Michigan",'MI'],     ["Minnesota",'MN'],      ["Mississippi",'MS'],     ["Missouri",'MO'], 
    ["Montana",'MN'],        ["Nebraska",'NE'],     ["Nevada",'NV'],         ["New Hampshire",'NH'],   ["New Jersey",'NJ'], 
    ["New Mexico",'NM'],     ["New York",'NY'],     ["North Carolina",'NC'], ["North Dakota",'ND'],    ["Ohio",'OH'], 
    ["Oklahoma",'OK'],       ["Oregon",'OR'],       ["Pennsylvania",'PA'],   ["Puerto Rico",'PR'],     ["Rhode Island",'RI'], 
    ["South Carolina",'SC'], ["South Dakota",'SD'], ["Tennessee",'TN'],      ["Texas",'TX'],           ["Utah",'UT'], 
    ["Vermont",'VE'],        ["Virginia",'VA'],     ["Washington",'WA'],     ["Washington D.C.",'DC'], ["West Virginia",'WV'], 
    ["Wisconsin",'WI'],      ["Wyoming",'WY']
  ] unless const_defined?("US_STATES")
  CANADA_STATES=[
    ["Alberta",'AB'],               ["British Columbia",'BC'], ["Manitoba",'MB'], ["New Brunswick",'NB'], ["Newfoundland",'NL'], 
    ["Northwest Territories",'NT'], ["Nova Scotia",'NS'],      ["Nunavut",'NU'],  ["Ontario",'ON'],       ["Prince Edward Island",'PE'], 
    ["Quebec",'QC'],                ["Saskatchewan",'SK'],     ["Yukon",'YT']
  ] unless const_defined?("CANADA_STATES")      
  US_CA_STATES= US_STATES + [['--] Select Province [--','']] + CANADA_STATES unless const_defined?("US_CA_STATES")
end

class ActionView::Helpers::InstanceTag
  def to_state_select_tag(country, options, html_options)
    html_options = html_options.stringify_keys
    add_default_name_and_id(html_options)
    value = value(object)
    selected_value = options.has_key?(:selected) ? options[:selected] : value
    content_tag("select", add_options(state_options_for_select(selected_value, country), options, value), html_options)
  end
end

class ActionView::Helpers::FormBuilder
  def state_select(method, country = 'US', options = {}, html_options = {})
    @template.state_select(@object_name, method, country, options.merge(:object => @object), html_options)
  end
end 

