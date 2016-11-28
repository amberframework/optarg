require "./value"

module Optarg::Definitions
  abstract class Argument < Value
    macro inherited
      {% unless @type.abstract? %}
        def get_value?(parser)
          parser.args.__named[value_key]?
        end

        def set_value(parser, value)
          parser.args.__named[value_key] = value
        end
      {% end %}
    end
  end
end
