class HomeScreen
  include Gametel

  text(:app_title, :name => 'iOS Demo')
  text(:view_text, :name => 'demoTextField')

  def active?
     app_title_view.shown?
  end
end