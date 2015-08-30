class Definition

  @@definitions =[]

  define_method(:initialize) do |definition|
    @definition = definition
    @id = @@definitions.length + 1
  end

  define_method(:definition) do
    @definition
  end
end
