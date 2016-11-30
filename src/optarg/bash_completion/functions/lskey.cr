module Optarg::BashCompletion::Functions
  class Lskey < Function
    def initialize(g)
      super g
      body << <<-EOS
      if #{f(:keyerr)}; then return 1; fi
      local v="${#{words}[$#{key}]}"
      if [ "$v" != "" ]; then
        local a=("$v")
        if [ ${#a[@]} -gt 1 ]; then
          #{f(:cur)}
          COMPREPLY=( $(compgen -W "$(echo ${a[@]})" -- "$#{cursor}") )
          return 0
        fi
      fi
      #{f(:any)}
      return $?
      EOS
    end
  end
end
