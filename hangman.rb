old_dict = File.readlines "/usr/share/dict/words"
new_dict = old_dict.map do |x| x.downcase.chomp end

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

# def select_answer(choice, eword, nword, dword, all_easy, all_normal, all_difficult, mys_array)
#   if choice == "easy"
#     eword = all_easy.sample
#     puts "Your word is #{eword.length} letters long."
#     mys_array = "eword".split("")
#   elsif choice == "normal"
#     nword = all_normal.sample
#     puts "Your word is #{nword.length} letters long."
#     mys_array = "nword".split("")
#   elsif choice == "difficult"
#     dword = all_difficult.sample
#     puts "Your word is #{dword.length} letters long."
#     mys_array = "dword".split("")
#   end
#   p mys_array
#   puts "This is your mystery array. You should see individual letters as strings."
# end

#THIS SELECT ANSWER METHOD WAS MUTED BECAUSE THE "mys_array" WOULD NOT BE UPDATED IN THE NEXT GUESSES SHOW RIGHT AND WRONG METHOD

def guesses_show_right_and_wrong(guess, letters, mys_array, letter, dis_array, showletter, counter, guesses)
x = 0
"#{mys_array.count}".to_i.times do
  dis_array[x] = " _ "
  x += 1
end
  until mys_array == dis_array ||counter == 0
    puts "Guess a letter to reveal the mystery word: "
    guess = gets.chomp
    if guess.length > 1 || !letters.include?(guess) || guess.length < 1
      puts "Input error: Please only type one letter. You may not type non-letters. Please, try again: "
    elsif guesses.include?(guess)
      puts "Input error: You've already guessed that letter! Dont worry, I account for repititous letter occurences."
    elsif guess.length == 1 && letters.include?(guess) && !guesses.include?(guess)
      puts "Analyzing user guess..."
      if mys_array.include?(guess)
        puts "WOW! Your guess was correct!"
        guesses << guess
        i = 0
        mys_array.each do |letter|
            if letter == guess
            dis_array[i] = guess
            end
          i += 1
        end
        puts "The mystery word is #{dis_array}"
      elsif mys_array.include?(guess) == false
        counter -= 1
        puts "Sorry, the mystery word doesnt contain #{guess}. You have #{counter} turns remaining."
        puts "This is the mystery word: #{dis_array}"
        guesses << guess
      end
      puts "All user guesses: #{guesses}. "
    end
  end
end

easy_array = []
normal_array = []
difficult_array = []

letters_array = ('a'..'z').to_a
emystery = easy_array.sample  #this is a string
nmystery = normal_array.sample
dmystery = difficult_array.sample

mystery_array = []

display_array = []
guesses_array = []

a_word = new_dict.each #ask how I did this.
display_letter = display_array.each
mystery_letter = mystery_array.each
mystery_easy = easy_array.sample
mystery_normal = normal_array.sample
mystery_difficult = difficult_array.sample
user_guess =
input =
wrong_guesses = 8

store_sort_words(new_dict, game_choice, a_word, easy_array, normal_array, difficult_array)
if game_choice == "easy"
  emystery = easy_array.sample
  puts "The mystery word is #{emystery.length} letters long."
  mystery_array = emystery.split("")
elsif game_choice == "normal"
  nmystery = normal_array.sample
  puts "The mystery word is #{nmystery.length} letters long."
  mystery_array = nmystery.split("")
elsif game_choice == "difficult"
  dmystery = difficult_array.sample
  puts "The mystery word is #{dmystery.length} letters long."
  mystery_array = dmystery.split("")
end
guesses_show_right_and_wrong(user_guess, letters_array, mystery_array, mystery_letter, display_array, display_letter, wrong_guesses, guesses_array)
puts "Game Over!"
