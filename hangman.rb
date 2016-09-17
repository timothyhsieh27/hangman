
old_dict = File.readlines "/usr/share/dict/words"
new_dict = old_dict.map do |x| x.chomp end

easy_array = []
normal_array = []
difficult_array = []
letters_array = ('a'..'z').to_a


puts "Please type 'Easy', 'Normal', or 'Difficult' to select the difficulty of your mystery word: "
game_choice = gets.chomp.downcase

loop do
  if game_choice != "easy" && game_choice != "normal" && game_choice != "difficult"
    puts "Invalid input, please enter your choice precisely: "
    game_choice = gets.chomp.downcase
  else
    break
  end
end

def store_sort_words(all_words, choice, word, all_easy, all_normal, all_difficult)
  if choice == "easy"
    all_words.each do |word|
      if  4 <= word.length && word.length <= 6
        all_easy << word
      end
    end
  elsif choice == "normal"
    all_words.each do |word|
      if  6 <= word.length && word.length <= 8
        all_normal << word
      end
    end
  elsif choice == "difficult"
    all_words.each do |word|
      if  8 <= word.length
        all_difficult << word
      end
    end
  end
end
#based on the user's answer in line 9, creates a bank of possible answer choices of the appropriate length in the appropriate array.

def select_answer(choice, emystery, all_easy, nmystery, all_normal, dmystery, all_difficult)
  if choice == "easy"
    emystery = all_easy.sample
    puts "Your word is #{emystery.length} letters long."

  elsif choice == "normal"
      nmystery = all_normal.sample
      puts "Your word is #{nmystery.length} letters long."

  elsif choice == "difficult"
        dmystery = all_difficult.sample
        puts "Your word is #{dmystery.length} letters long."
  end
end

def input_error(guess, letters)
  puts "Okay, let's do this! Guess one letter at a time: "
    loop do
      guess = gets.chomp
      if guess.length > 1 || !letters.include?(guess)
        puts "Input error: you cannot type more than one letter at a time. You may not type in non-letters. Please try again: "
      elsif guess.length == 1 && letters.include?(guess)
        puts "Analyzing guess..."
      else
        break
      end
    end
end

a_word = new_dict.each #ask how I did this.
mystery_easy = easy_array.sample
mystery_normal = normal_array.sample
mystery_difficult = difficult_array.sample
user_guess = gets.chomp

store_sort_words(new_dict, game_choice, a_word, easy_array, normal_array, difficult_array)
select_answer(game_choice, mystery_easy, easy_array, mystery_normal, normal_array, mystery_difficult, difficult_array)
input_error(user_guess, letters_array)

# p easy_array
# p normal_array
# p difficult_array
