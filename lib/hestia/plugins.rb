require 'rinne'

module Hestia
  class Plugins

    def initialize(plugin_dir)
      @plugins_dir = plugin_dir
      @plugins = []
      load_plugins
    end

    def match?(pattern)
      !get_plugin(pattern).nil?
    end

    def scrap(pattern)
      get_plugin(pattern).scrap(pattern)
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

     def get_plugin(pattern)
       @plugins.each do |plugin|
         if pattern =~ plugin.pattern
           return plugin
         end
       end
       return nil
     end
  end
end
