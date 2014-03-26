require 'erubis'

module AresMUSH
  module Who
    class WhereCmd
      include AresMUSH::Plugin

      # Validators
      no_args
      no_switches
      
      def after_initialize
        @renderer =  WhoRenderer.new("where.erb")
      end

      def want_command?(client, cmd)
        cmd.root_is?("where")
      end
      
      def handle
        client.emit @renderer.render
      end      
    end
  end
end
