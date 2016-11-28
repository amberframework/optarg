require "./value"

module Optarg::Definitions
  abstract class Option < Definitions::Value
    macro inherited
      {% unless @type.abstract? %}
        def get_value?(parser)
          parser.options[Typed::TYPE][value_key]?
        end

        def set_value(parser, value)
          parser.options[Typed::TYPE][value_key] = value
        end
      {% end %}
    end

    include DefinitionMixins::Visit
    include DefinitionMixins::VisitConcatenated
  end
end
