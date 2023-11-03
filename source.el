(setq emi_items '())

(defun skip-to-plane (&optional plane)
  (interactive)
  (if (not plane)
      (setq plane (read-number "Skip to plane number:  ")))  
  (let ((org-file-name (concat "plane" (number-to-string plane) ".org"))
    (opening-buffer (current-buffer)))
      (progn
	(find-file org-file-name)
	(rename-buffer (concat "Current Location: Plane " (number-to-string plane)) nil)
	(beginning-of-buffer)
	(read-only-mode)
	(kill-buffer opening-buffer)
	)
      ))

(defun enter-the-dungeon ()
  (skip-to-plane 10))

(defun emi-escape-10 ()
  "This function makes you escape Plane 10 and jump to the next plane. To launch this program: press ~M-x~ and then enter emi-escape-10. (~M~ stands for \"Meta\". On most of the keyboards, that's the \"Alt\" key. You may dismiss this help file by pressing ~C-x 1~."
  (interactive)
  (skip-to-plane 12))

(defun emi-escape-12 ()
  "This function makes you escape Plane 12 and jump to the next plane. You will be asked to enter a password. The password is 'emi'. You may dismiss this help file by pressing ~C-x 1~."
  (interactive)
  (if (string= (read-string "Password: ") "emi")
      (skip-to-plane 30)
    (message "Incorrect password.")
    ))

(defun same-piece ()
  "This function makes you escape Plane 30 and jump to the next plane. You will be asked to enter a password. The password is the name of this function. If you don't understand what you saw. A key sequence might have bound to something like `(hello)`. In this case, the name of the function is \"hello\".
 You may dismiss this help file by pressing ~C-x 1~."
  (interactive)
  (if (string= (read-string "Password: ") "same-piece")
      (skip-to-plane 13)
    (message "Incorrect password."))
  )

(global-set-key (kbd "C-c M-o") 'same-piece)

(defun emi-escape-13 ()
  "This function makes you escape Plane 13 and jump to the next plan. Please note that this is not an interactive function. You may dismiss this help file by pressing ~C-x 1~."
  (skip-to-plane 32)
  )

(defun guess-emi-favourite-punct ()
  (interactive)
  "Please try to guess what emi's favourite punctuation mark is."
  (setq guess (read-string "What is Emi's favourite punctuation mark? "))
  (if (or (string= guess "(") (string= guess ")") (string= guess "()") (string= guess ")("))
      (describe-variable '*EMI-PUNCT*)
    (message "\"You don't understand Emi!\" Emi says.")
    )
  )
  
(defvar *EMI-PUNCT* "()" "This is org-mode. This is a recorded message for you.

There are actually two kinds of functions provided by Emi. One type is called \"Interactive functions\", or commands. You usually would encounter this kind of functions and these functions can be launched with ~M-x~.

Another kind of functions is called \"Non-interactive functions\". This kind of functions cannot be launced wtih ~M-x~. Instead, you need to use another method to launch them. You should type ~M-:~. You will be asked for a line of code to evaluate with an \"eval\" prompt. And then type in the name of the function with a pair of surrounding ... Emi's punctuation mark. For example, if there is a function called emacs-version, you should type in: (emacs-version) and then press enter.

And this is an important information: actually, interaction functions can also be launched with `M-:`.

You may dismiss this help file by pressing ~C-x 1~.
")

(defun emi-eval-string (string)
  "Evaluate elisp code stored in a string."
  (eval (car (read-from-string string))))

(defun emi-escape-32 ()
  (interactive)
  (setq guess (read-string "Write an S-expression that evaluates to 32: "))
  (setq var (ignore-errors (emi-eval-string guess)))
  ;; (setq var 32)
  (if (= var 32)
      (skip-to-plane 39)
    (message "Your S-expression does not evaluate to 32.")))
