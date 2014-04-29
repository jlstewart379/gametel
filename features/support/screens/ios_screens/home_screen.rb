class HomeScreen
  include Gametel

  text(:app_title, :name => 'iOS Demo')
  text(:view_text, :name => 'demoTextField')
  button(:button_demo, :name => 'Demo')


  def active?
     app_title_view.shown?
  end
end