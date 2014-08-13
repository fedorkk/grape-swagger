module GrapeSwagger
  class Markdown
    attr_reader :adapter

    ###
    # Initializes the markdown class with an adapter.
    # The adapter needs to implement the method markdown which will be called by this interface class.
    # The adapters are responsible of loading the required markdown dependencies and throw errors.
    ###
    def initialize(adapter)
      fail StandardError "The configured markdown adapter should implement a method #{ :markdown }." unless adapter.respond_to? :markdown
      @adapter = adapter
    end

    ###
    # Calls markdown to the configured adapter.
    ###
    def as_markdown(text)
      @adapter.markdown(text)
    end
  end
end
