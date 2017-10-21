const voted = {};
const checkVoter = (name) => {
  if (voted[name]) {
    console.log('kick them out!');
  } else {
    voted[name] = true;
    console.log('let them vote!');
  }
};


checkVoter('tom'); // let them vote!
checkVoter('mike'); // let them vote!
checkVoter('mike'); // kick them out!
