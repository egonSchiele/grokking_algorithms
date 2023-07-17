void main(List<String> args) {
  final voted = <String, bool>{};

  checkVoter('tom', voted);
  checkVoter('mike', voted);
  checkVoter('mike', voted);
}

void checkVoter(String name, Map<String, bool> voted) {
  if (voted[name] != null) {
    print('Kick them out!');
  } else {
    voted[name] = true;
    print('Let them vote');
  }
}
