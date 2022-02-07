(defun skip-to-plane (&optional plane)
  (interactive)
  (progn
    (if (not plane)
	(setq plane (read-number "Skip to plane number:  ")))
    (beginning-of-buffer)
    (org-global-cycle 1)
    (next-line (- plane 1))
    (org-cycle)
    )
  )

(defun emi-escape-10 ()
  "This function makes you escape Plane 10 and jump to the next plane. To launch this program: press `M-x` and then enter emi-escape-10. You may dismiss this help file by pressing `C-x 1`."
  (interactive)
  (skip-to-plane 12))

(defun emi-escape-12 ()
  "This function makes you escape Plane 12 and jump to the next plane. You will be asked to enter a password. The password is 'emi'. You may dismiss this help file by pressing `C-x 1`."
  (interactive)
  (if (string= (read-string "Password: ") "emi")
      (skip-to-plane 30)
    (message "Incorrect password.")
    ))

(defun same-piece ()
  "This function makes you escape Plane 30 and jump to the next plane. You will be asked to enter a password. The password is the name of this function. If you don't understand what you saw. A key sequence might have bound to something like `(hello)`. In this case, the name of the function is \"hello\".
 You may dismiss this help file by pressing `C-x 1`."
  (interactive)
  (if (string= (read-string "Password: ") "same-piece")
      (skip-to-plane 13)
    (message "Incorrect password. The password is the name of the function mapped to this key combination."))
  )

(global-set-key (kbd "C-c M-o") 'same-piece)
