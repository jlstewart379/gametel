$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec/expectations'
require 'require_all'
require 'gametel'

World(Gametel::Navigation)

require_rel '/screens'

Gametel::Navigation.routes = {
  :default => [[MainMenuScreen, :views],
               [ViewsMenuScreen, :controls],
               [ControlsMenuScreen, :light_theme],
               [ControlsScreen, :button_field_id]],
  :button_route => [[MainMenuScreen, :views],
                    [ViewsMenuScreen, :buttons],
                    [ButtonScreen, :normal_id]],
  :action_bar => [[MainMenuScreen, :app],
                  [AppScreen, :action_bar],
                  [ActionBar]]
}

Gametel.keystore = {
  :path => 'features/support/debug.keystore',
  :alias => 'androiddebugkey',
  :password => 'android',
  :keystore_password => 'android'
}

Gametel.start_ios

Before do
  # Gametel.apk_path = 'features/support/ApiDemos.apk'
  # @driver = Gamtel.start('ApiDemos')
  #
  Gametel.ios_new_run('38212597e981a7f426b1f144932a59749a1d0677', 'iOSDemo')
end

After do
  # Gametel.stop
end

at_exit do
  Cumber.stop
end
