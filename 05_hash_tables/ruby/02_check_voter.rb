# in order to be accessible from within the check_voter function
# voted has to be an instance variable (or global / class)
@voted = {}

def check_voter(name)
  if @voted[name]
    puts "kick them out!"
  else
    @voted[name] = true
    puts "let them vote!"
  end
end

check_voter("tom")
check_voter("mike")
check_voter("mike")
