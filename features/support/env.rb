$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec/expectations'
require 'require_all'
require 'gametel'
require 'erb'
require 'yaml'

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


@config = YAML.load(ERB.new(File.read('.gametel.yml')).result)
DEVICE = @config["device"]
IOS = @config["ios_run"]

Gametel.start_ios if IOS

Before do

  if IOS
    Gametel.ios_new_run(DEVICE, 'iOSDemo')
  else
    Gametel.apk_path = 'features/support/ApiDemos.apk'
    @driver = Gametel.start('ApiDemos')
  end

end

After do
   Gametel.stop unless IOS
end

at_exit do
  Cumber.stop if IOS
end
