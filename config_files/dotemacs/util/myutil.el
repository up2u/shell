;; put some util into here


;; auto close Completions buffer when you’re done with it
(defun comint-close-completions ()
  "Close the comint completions buffer.
Used in advice to various comint functions to automatically close
the completions buffer as soon as I'm done with it. Based on
Dmitriy Igrishin's patched version of comint.el."
  (if comint-dynamic-list-completions-config
      (progn
        (set-window-configuration comint-dynamic-list-completions-config)
        (setq comint-dynamic-list-completions-config nil))))

(defadvice comint-send-input (after close-completions activate)
  (comint-close-completions))

(defadvice comint-dynamic-complete-as-filename (after close-completions activate)
  (if ad-return-value (comint-close-completions)))

(defadvice comint-dynamic-simple-complete (after close-completions activate)
  (if (member ad-return-value '('sole 'shortest 'partial))
      (comint-close-completions)))

(defadvice comint-dynamic-list-completions (after close-completions activate)
  v  (comint-close-completions)
  (if (not unread-command-events)
      ;; comint's "Type space to flush" swallows space. put it back in.
      (setq unread-command-events (listify-key-sequence " "))))

;; make other-window ignore a certain window
(defvar ignore-windows-containing-buffers-matching-res '("\\*Help" "\\*ECB\\*" "Speedbar\\*" "Minibuf\\*")
  "List of regular expressions specifying windows to skip (if window contains buffer that matches, skip)")

(defadvice other-window (before other-window-ignore-windows-containing activate)
  "skip over windows containing buffers which match regular expressions in 'ignore-windows-containing-buffers-matching-res"
  (if (and (= 1 (ad-get-arg 0)) (interactive-p))
      (let* ((win (next-window))
             (bname (buffer-name (window-buffer win))))
        (when (some 'identity (mapcar '(lambda (re)
                                         (string-match re bname))
                                      ignore-windows-containing-buffers-matching-res))
          (ad-set-arg 0 2)))))

;; sort
(add-hook 'dired-mode-hook (lambda ()
  (interactive)
  (make-local-variable 'dired-sort-map)
  (setq dired-sort-map (make-sparse-keymap))
  (define-key dired-mode-map "s" dired-sort-map)
  (define-key dired-sort-map "s"
              '(lambda () "sort by Size"
                (interactive) (dired-sort-other (concat dired-listing-switches "S"))))
  (define-key dired-sort-map "x"
              '(lambda () "sort by eXtension"
                 (interactive) (dired-sort-other (concat dired-listing-switches "X"))))
  (define-key dired-sort-map "t"
              '(lambda () "sort by Time"
                 (interactive) (dired-sort-other (concat dired-listing-switches "t"))))
  (define-key dired-sort-map "n"
              '(lambda () "sort by Name"
                 (interactive) (dired-sort-other (concat dired-listing-switches ""))))))
;; directory first
(defun sof/dired-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))
(add-hook 'dired-after-readin-hook 'sof/dired-sort)

;; #if 0 到 #endif 之间的应该算做注释
(defun my-c-mode-font-lock-if0 (limit)
  (save-restriction
    (widen)
    (save-excursion
      (goto-char (point-min))
      (let ((depth 0) str start start-depth)
        (while (re-search-forward "^\\s-*#\\s-*\\(if\\|else\\|endif\\)" limit 'move)
          (setq str (match-string 1))
          (if (string= str "if")
              (progn
                (setq depth (1+ depth))
                (when (and (null start) (looking-at "\\s-+0"))
                  (setq start (match-end 0)
                        start-depth depth)))
            (when (and start (= depth start-depth))
              (c-put-font-lock-face start (match-beginning 0) 'font-lock-comment-face)
              (setq start nil))
            (when (string= str "endif")
              (setq depth (1- depth)))))
        (when (and start (> depth 0))
          (c-put-font-lock-face start (point) 'font-lock-comment-face)))))
  nil)

(defun my-c-mode-common-hook-if0 ()
  (font-lock-add-keywords
   nil
   '((my-c-mode-font-lock-if0 (0 font-lock-comment-face prepend))) 'add-to-end))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook-if0)

;; jump to and jump back from 王垠
;(global-set-key [(control ?\.)] 'ska-point-to-register)
;(global-set-key [(control ?\,)] 'ska-jump-to-register)
(global-set-key [(M ?\.)] 'ska-point-to-register)
(global-set-key [(M ?\,)] 'ska-jump-to-register)

(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
Use ska-jump-to-register to jump back to the stored
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))

;; http://emacser.com/org-mode-tricks.htm
;; iexp
(define-skeleton 1exp
  "Input #+BEGIN_EXAMPLE #+END_EXAMPLE in org-mode"
""
"#+BEGIN_EXAMPLE\n"
 _ "\n"
"#+END_EXAMPLE"
)
(define-abbrev org-mode-abbrev-table "iexp" "" '1exp)

;; isrc
(define-skeleton 1src
  "Input #+begin_src #+end_src in org-mode"
""
"#+begin_src lisp \n"
 _ "\n"
"#+end_src"
)
(define-abbrev org-mode-abbrev-table "isrc" "" '1src)

;; iprop
(define-skeleton 1prop
  "Input :PROPERTIES: :END: in org-mode"
""
>":PROPERTIES:\n"
> _ "\n"
>":END:"
)
(define-abbrev org-mode-abbrev-table "iprop" "" '1prop)

;; insert-emacser-code
(define-skeleton insert-emacser-code
  ""
  ""
  "#+BEGIN_HTML\n"
"<pre lang=\"lisp\" line=\"1\">\n"
_"\n"
"</pre>\n"
"#+END_HTML\n"
)
(define-abbrev org-mode-abbrev-table "ihtml"  "" 'insert-emacser-code)

(provide 'myutil)
