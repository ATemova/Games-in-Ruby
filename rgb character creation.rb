class RPGCharacter
  attr_reader :name, :class_type, :level, :hp

  def initialize(name, class_type)
    @name = name
    @class_type = class_type
    @level = 1
    @hp = 100
  end

  def level_up
    @level += 1
    @hp += 20
    puts "#{@name} leveled up to #{@level}!"
  end

  def status
    puts "#{@name} - Level: #{@level}, HP: #{@hp}, Class: #{@class_type}"
  end
end

character = RPGCharacter.new("Temova", "Warrior")
character.status
character.level_up
