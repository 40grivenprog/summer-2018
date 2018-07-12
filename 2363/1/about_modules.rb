require File.expand_path(File.dirname(__FILE__) + '/neo')

# Class about modules
# This class smells of :reek:UncommunicativeModuleName
# This class smells of :reek:DuplicateMethodCall
class AboutModules < Neo::Koan
  # Module nameable
  module Nameable
    # rubocop:disable Naming/AccessorMethodName
    def set_name(new_name)
      @name = new_name
    end
    # rubocop:enable Naming/AccessorMethodName

    def here
      :in_module
    end
  end

  # This method smells of :reek:UncommunicativeMethodName
  # This method smells of :reek:UncommunicativeVariableName
  # This method smells of :reek:TooManyStatements
  # This method smells of :reek:FeatureEnvy
  def test_cant_instantiate_modules
    assert_raise(NoMethodError) do
      Nameable.new
    end
  end

  # ------------------------------------------------------------------

  # Class dog
  class Dog
    include Nameable

    attr_reader :name

    def initialize
      @name = 'Fido'
    end

    def bark
      'WOOF'
    end

    def here
      :in_object
    end
  end

  # This method smells of :reek:UncommunicativeMethodName
  # This method smells of :reek:UncommunicativeVariableName
  # This method smells of :reek:TooManyStatements
  # This method smells of :reek:FeatureEnvy
  def test_normal_methods_are_available_in_the_object
    fido = Dog.new
    assert_equal 'WOOF', fido.bark
  end

  # This method smells of :reek:UncommunicativeMethodName
  # This method smells of :reek:UncommunicativeVariableName
  # This method smells of :reek:TooManyStatements
  # This method smells of :reek:FeatureEnvy
  def test_module_methods_are_also_available_in_the_object
    fido = Dog.new
    assert_nothing_raised do
      fido.set_name('Rover')
    end
  end

  # This method smells of :reek:UncommunicativeMethodName
  # This method smells of :reek:UncommunicativeVariableName
  # This method smells of :reek:TooManyStatements
  # This method smells of :reek:FeatureEnvy
  def test_module_methods_can_affect_instance_variables_in_the_object
    fido = Dog.new
    assert_equal 'Fido', fido.name
    fido.set_name('Rover')
    assert_equal 'Rover', fido.name
  end

  # This method smells of :reek:UncommunicativeMethodName
  # This method smells of :reek:UncommunicativeVariableName
  # This method smells of :reek:TooManyStatements
  # This method smells of :reek:FeatureEnvy
  def test_classes_can_override_module_methods
    fido = Dog.new
    assert_equal :in_object, fido.here
  end
end
