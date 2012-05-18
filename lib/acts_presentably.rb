require 'active_record'
require 'acts_presentably/version'
require 'acts_presentably/presenters/default_presenter'

module ActsPresentably
  def acts_presentably
    include InstanceMethods
  end
  module InstanceMethods
    def presentable?
      true
    end
    def presenter_class
      self.class.name + 'Presenter'
    end
    def presenter_key
      (self.class.name.underscore.downcase + '_presenter').to_sym
    end
    def as_json(options={})
      if options && options.has_key?(presenter_key)
        if options[presenter_key].nil?
          options = options.clone
          options.delete(presenter_key)
          super(options)
        else
          options[presenter_key].new(self).as_json(options)
        end
      else
        klass = Module.const_get(presenter_class)
        return klass.new(self).as_json(options) if klass.is_a?(Class)
        super
      end
    end
  end
end

ActiveRecord::Base.extend ActsPresentably