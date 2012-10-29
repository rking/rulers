class Object
  def self.const_missing c
    return nil if @calling_const_missing

    @calling_const_missing = true
    require Rulers.to_underscore c.to_s
    klass = Object.const_get c

    raise "Could not find #{c}" if klass.nil?

    klass
  end
end
