module ApplicationHelper
    
  def signup?
    variable = instance_variable_get(:@form_state)
    variable == 'sign_up'
  end
end