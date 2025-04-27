// This script creates a typewriter effect for elements with the class 'typing-text'.
document.addEventListener('DOMContentLoaded', function() {
  const typingElements = document.querySelectorAll('.typing-text');

  typingElements.forEach(el => {
    const words = el.getAttribute('data-words').split(',');
    let currentWordIndex = 0;
    let currentCharIndex = 0;
    let isDeleting = false;
    const typingSpeed = 100;
    const deletingSpeed = 60;
    const waitBetweenWords = 1000;
    const cursor = el.nextElementSibling; // assumes the cursor span is right after

    function type() {
      const currentWord = words[currentWordIndex].trim();

      if (isDeleting) {
        el.textContent = currentWord.substring(0, currentCharIndex--);
      } else {
        el.textContent = currentWord.substring(0, currentCharIndex++);
      }

      if (!isDeleting && currentCharIndex === currentWord.length + 1) {
        setTimeout(() => {
          isDeleting = true;
        }, waitBetweenWords);
      } else if (isDeleting && currentCharIndex === 0) {
        isDeleting = false;
        currentWordIndex = (currentWordIndex + 1) % words.length;
      }

      setTimeout(type, isDeleting ? deletingSpeed : typingSpeed);
    }

    type();
  });
});
