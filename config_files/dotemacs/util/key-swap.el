
;; http://ted.is-programmer.com/tag/emacs
;; "funky stuff" ;; proceed with caution
;; The below function "swaps" the numeric keys with the respective characters
;; (e.g., '*' with '8' and '(' with '9'). Why? It appears to me that the upper
;; row of characters is used more often in C/C++. So we need fewer key-strokes
;; (the 'Shift' is avoided) with the swappings in place. 'F9' and 'Shift-F9'
;; allow u to toggle between these key-swaps.

(global-set-key [f9]   '(lambda () (interactive) (my-key-swap    my-key-pairs)))
(global-set-key [S-f9] '(lambda () (interactive) (my-key-restore my-key-pairs)))

(setq my-key-pairs
      '((?! ?1) (?@ ?2) (?# ?3) (?$ ?4) (?% ?5)
        (?^ ?6) (?& ?7) (?* ?8) (?( ?9) (?) ?0)
        (?- ?_) (?\" ?') (?{ ?[) (?} ?])        ; (?| ?\\)
        ))

(defun my-key-swap (key-pairs)
  (if (eq key-pairs nil)
      (message "Keyboard zapped!! Shift-F9 to restore!")
	(progn
	  (keyboard-translate (caar key-pairs)  (cadar key-pairs))
	  (keyboard-translate (cadar key-pairs) (caar key-pairs))
	  (my-key-swap (cdr key-pairs))
	  )
    ))

(defun my-key-restore (key-pairs)
  (if (eq key-pairs nil)
      (message "Keyboard restored!! F9 to Zap!")
	(progn
	  (keyboard-translate (caar key-pairs)  (caar key-pairs))
	  (keyboard-translate (cadar key-pairs) (cadar key-pairs))
	  (my-key-restore (cdr key-pairs))
	  )
    ))

;; "funky stuff" ;; proceed with caution

(defun my-editing-function (first last len)
  (interactive)
  (if (and (boundp 'major-mode)
           (member major-mode (list 'c-mode 'c++-mode 'gud-mode 'fundamental-mode 'ruby-mode))
           (= len 0)
           (> (point) 4)
           (= first (- (point) 1)))
      (cond
       ((and (string-equal (buffer-substring (point) (- (point) 2)) "__")
             (not (string-equal (buffer-substring (point) (- (point) 3)) "___")))
        (progn (delete-backward-char 2) (insert-char ?- 1) (insert-char ?> 1)))

       ((string-equal (buffer-substring (point) (- (point) 3)) "->_")
        (progn (delete-backward-char 3) (insert-char ?_ 3)))

       ((and (string-equal (buffer-substring (point) (- (point) 2)) "..")
             (not (string-equal (buffer-substring (point) (- (point) 3)) "...")))
        (progn (delete-backward-char 2) (insert-char ?[ 1) (insert-char ?] 1) (backward-char 1)))

       ((and (> (point-max) (point))
             (string-equal (buffer-substring (+ (point) 1) (- (point) 2)) "[.]"))
        (progn (forward-char 1) (delete-backward-char 3) (insert-char ?. 1) (insert-char ?. 1) ))
       )
    nil))

(add-hook 'after-change-functions 'my-editing-function)

(provide 'key-swap)
