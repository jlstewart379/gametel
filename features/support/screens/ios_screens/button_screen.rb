class ButtonScreen
  include Gametel

  text(:intro, :name => 'This is the button screen')

  def active?
    intro_view.shown?
  end

end