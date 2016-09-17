
old_dict = File.readlines "/usr/share/dict/words"
new_dict = old_dict.map do |x| x.chomp end

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

def select_answer(choice, mystery, all_easy, all_normal, all_difficult, mys_array)
  if choice == "easy"
    mystery = all_easy.sample
    puts "Your word is #{mystery.length} letters long."
    mys_array = mystery.split("")
  elsif choice == "normal"
    mystery = all_normal.sample
    puts "Your word is #{mystery.length} letters long."
    mys_array = mystery.split("")
  elsif choice == "difficult"
    mystery = all_difficult.sample
    puts "Your word is #{mystery.length} letters long."
    mys_array = mystery.split("")
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
        break
      else
        break
      end
    end
end

def guesses_show_right_and_wrong(guess, mys_array, letter, dis_array, showletter, counter)
  while mys_array.each != dis_array.each || wrong_guesses != 0
    if mys_array.include?(guess)
      puts "Your guess was correct."
      mys_array.each do |letter|
        if letter == guess
          dis_array.map {|showletter| showletter = guess}
          break
        else
          dis_array.map {|showletter| showletter = "_" }
          break
        end
      end
      break
    elsif !mys_array.include?(guess)
      counter += 1
      puts "Your guess was incorrect. You have #{counter} turns remaining."
      break
    end
  end
  p dis_array
end

easy_array = []
normal_array = []
difficult_array = []

letters_array = ('a'..'z').to_a
mystery = []  #this is a string
mystery_array = [] #this is an array made of each string's split letters
display_array = []

a_word = new_dict.each #ask how I did this.
display_letter = display_array.each
mystery_letter = mystery_array.each
mystery_easy = easy_array.sample
mystery_normal = normal_array.sample
mystery_difficult = difficult_array.sample
user_guess = gets.chomp
wrong_guesses = 0

store_sort_words(new_dict, game_choice, a_word, easy_array, normal_array, difficult_array)
select_answer(game_choice, mystery, easy_array, normal_array, difficult_array, mystery_array)
input_error(user_guess, letters_array)
guesses_show_right_and_wrong(user_guess, mystery_array, mystery_letter, display_array, display_letter, wrong_guesses)


# guess_counter(user_guess, mystery_array, wrong_guesses)
# p easy_array
# p normal_array
# p difficult_array
