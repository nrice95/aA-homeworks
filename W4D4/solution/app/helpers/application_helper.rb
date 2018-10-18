module ApplicationHelper
  def auth_token
    # h(<input
    #   type="hidden",
    #   name="authenticity_token",
    #   value="#{form_authenticity_token}"/>)
  '<input
  type="hidden"
  name="authenticity_token"
  value="#{form_authenticity_token}"
  />'.html_safe
  end
end
