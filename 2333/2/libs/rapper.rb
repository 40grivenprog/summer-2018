# class Rapper
class Rapper
  attr_reader :name, :battles, :number_of_bad_words
  ROUNDS_ON_BATTLE = 3

  def initialize(name, battles)
    @name = name
    @battles = battles
    @number_of_bad_words ||= bad_words
    RussianObscenity.dictionary = [:default, './my_dictionary.yml']
  end

  def bad_words
    unique_bad_words.map { |word| battles_words.count(word) }.reduce(:+)
  end

  def battles_words
    @battles.join(' ').split(/[^[а-яА-Я*ёЁa-zA-Z]]+/)
  end

  def bad_words_on_battle
    (number_of_bad_words / @battles.count.to_f).round(2)
  end

  def words_on_round
    battles_words.count / (@battles.count * ROUNDS_ON_BATTLE)
  end

  private

  def unique_bad_words
    RussianObscenity.find(@battles.join(' '))
  end
end
