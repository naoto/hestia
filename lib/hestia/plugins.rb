module Hestia
  class Plugins

    def initialize(plugin_dir)
      @plugin_dir = plugin_dir
      @plugins = []
      load_plugins
    end

    def [](urlstr)
      urls = URI.extract(urlstr)
      if !urls.empty?
        url = URI.parse(urls.first)

      else
        return nil
      end
    end

    private
     def load_plugins
       Dir::entries(@plugins_dir).each do |file|
         next if [".",".."].include?(file)
         class_name = Rinne.classify(file)
         require "#{@plugins_dir}/#{file}"
         @plugins << Module.module_eval("#{class_name}.new")
       end
     end
  end
end
