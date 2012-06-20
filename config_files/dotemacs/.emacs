;; add load path
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/util")
(add-to-list 'load-path "~/.emacs.d/lisp/cscope")
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete")
;(add-to-list 'load-path "~/.emacs.d/lisp/gnuserv")
(add-to-list 'load-path "~/.emacs.d/lisp/global")
(add-to-list 'load-path "~/.emacs.d/lisp/rect-mark")
(add-to-list 'load-path "~/.emacs.d/lisp/tabbar")
(add-to-list 'load-path "~/.emacs.d/lisp/speedbar")
(add-to-list 'load-path "~/.emacs.d/lisp/cedet-1.1/common/")
(add-to-list 'load-path "~/.emacs.d/lisp/cedet-1.1/semantic/")
;(add-to-list 'load-path "~/.emacs.d/lisp/cedet-1.0.1/common/")
;(add-to-list 'load-path "~/.emacs.d/lisp/cedet-1.0.1/semantic/")
(add-to-list 'load-path "~/.emacs.d/lisp/ecb-2.40/")

;;customize defined variable to storing path
(defconst my-emacs-path "~/.emacs.d/")
(defconst my-emacs-lisps-path (concat my-emacs-path "lisp"))

;; default open directory
(setq default-directory "/work/")
;; frame title
;(setq frame-title-format (list '(buffer-file-name "emacs@%f" (dired-directory dired-directory "emacs@%b"))))
(setq frame-title-format '("%m @ "(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
;(warn "my warning msg 1: default-directory: %s" default-directory)
;(warn "my warning msg 1: frame-title-format:%s" frame-title-format)

;; binding for previous/next-buffer
(global-set-key [f2]  'previous-buffer)
(global-set-key [f1]  'next-buffer)
(global-set-key [f12] 'kill-buffer)

;; auto revert buffers
(global-auto-revert-mode t)
;; not output backtrace buffer when warning or errors
;(setq stack-trace-on-error t) ;; not needed

;; code folding
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(global-set-key [f11] 'hs-hide-all)
(global-set-key [(shift f11)] 'hs-show-all)

;; sr-speedbar
(require 'sr-speedbar)
(require 'speedbar-extension)
(setq sr-speedbar-right-side nil)
;(setq sr-speedbar-width 25)
;; Show all files
;(setq speedbar-show-unknown-files t)
;; fix speedbar in left, and set auto raise mode
;;(add-hook
;;'speedbar-mode-hook
;;(lambda ()
;;(auto-raise-mode 1)
;;(add-to-list 'speedbar-frame-parameters '(top . 30))
;;(add-to-list 'speedbar-frame-parameters '(left . 0))))

;; inhibit tags grouping and sorting
(setq speedbar-tag-hierarchy-method
'(speedbar-simple-group-tag-hierarchy)
)
;;;;(defun speedbar-expand-all-lines ()
;;;;  "Expand all items in the speedbar buffer.
;;;; But be careful: this opens all the files to parse them."
;;;;  (interactive)
;;;;  (goto-char (point-min))
;;;;  (while (not (eobp))
;;;;    (forward-line)
;;;;    (speedbar-expand-line)))
;;(defun speedbar-expand-all-lines ()
;;  (interactive)
;;  (goto-char (0))
;;  (while (not (0))
;;    (forward-line)
;;    (speedbar-expand-line)))

;;(defcustom speedbar-tag-hierarchy-method
;;'(speedbar-prefix-group-tag-hierarchy
;;speedbar-trim-words-tag-hierarchy))

;; start speedbar if we're using a window system
(when window-system
  (sr-speedbar-open))

;; tabbar + tabbar-ruler
(require 'tabbar)
;; tabbar-ruler, make tabbar look pretty
(require 'tabbar-ruler)
(tabbar-mode t)
(define-prefix-command 'lwindow-map)
;(global-set-key (kbd "<M-left>")  'tabbar-backward);; will cross group ?
;(global-set-key (kbd "<M-right>") 'tabbar-forward)
(global-set-key (kbd "<M-left>")  'tabbar-backward-tab);;will not cross group ?
(global-set-key (kbd "<M-right>") 'tabbar-forward-tab)
(global-set-key (kbd "<M-up>")    'tabbar-backward-group)
(global-set-key (kbd "<M-down>")  'tabbar-forward-group)

;;from http://wwliu.is-programmer.com/posts/14728.html
;;;; 设置tabbar外观
;; 设置默认主题: 字体, 背景和前景颜色，大小
(set-face-attribute 'tabbar-default nil
                    :family "DejaVu Sans Mono"
                    :background "gray80"
                    :foreground "gray30"
                    :height 0.8
                    )
;; 设置左边按钮外观：外框框边大小和颜色
(set-face-attribute 'tabbar-button nil
                    :inherit 'tabbar-default
                    :box '(:line-width 1 :color "gray30")
                    )
;; 设置当前tab外观：颜色，字体，外框大小和颜色
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :foreground "Black"
                    :background "Yellow"
                    :box '(:line-width 1 :color "DarkGoldenrod")
                    ;; :overline "black"
                    ;; :underline "black"
                    :weight 'bold
                    )
;; 设置非当前tab外观：外框大小和颜色
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :box '(:line-width 1 :color "gray70")
                    )

;; rectangle
(require 'rect-mark)
(global-set-key (kbd "C-@") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)

;;;;;;; gnuserv
;;;;;(require 'gnuserv-compat)
;;;;;(gnuserv-start)
;;;;;;; When loading files reuse existing frames.
;;;;;(setq gnuserv-frame (car (frame-list)))
;;;;;;;
;;;;;(setq gnuserv-frame (lambda (f) (eq f (quote x))))

;;Emacs server for emacsclient
;(server-start)

;; show files with same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator ":")

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

;; cscope - i don't use etags any more
(require 'xcscope)
(setq cscope-do-not-update-database t)
;; cscope key binding
(global-set-key [f4] 'cscope-find-functions-calling-this-function)
(global-set-key [(shift f4)] 'cscope-find-called-functions)
(global-set-key [f5] 'cscope-find-this-symbol)
(global-set-key [f6] 'cscope-find-this-text-string)
(global-set-key [f7] 'cscope-find-global-definition)
(global-set-key [f8] 'cscope-find-this-file)

;; show which function of current cursor
(require 'which-func)
(which-func-mode 1)

;; auto complete
(require 'auto-complete-config)
(require 'auto-complete+)
(require 'util)
(ac-config-default)

;; After do this, isearch any string, M-: (match-data) always
;; return the list whose elements is integer
(global-auto-complete-mode 1)

;; 不让回车的时候执行`ac-complete', 因为当你输入完一个
;; 单词的时候, 很有可能补全菜单还在, 这时候你要回车的话,
;; 必须要干掉补全菜单, 很麻烦, 用M-j来执行`ac-complete'
(eal-define-keys
 'ac-complete-mode-map
 `(("<return>"   nil)
   ("RET"        nil)
   ("M-j"        ac-complete)))

(defun auto-complete-settings ()
  "Settings for `auto-complete'."
  (setq help-xref-following nil)

  (add-to-list 'ac-dictionary-directories (concat my-emacs-lisps-path "dict"))

  (setq ac-auto-show-menu t
        ac-auto-start t
        ac-dwim t
        ac-candidate-limit ac-menu-height
        ac-quick-help-delay .5
        ac-disable-faces nil)

  (set-default 'ac-sources
               '(;;ac-source-semantic-raw
                 ac-source-yasnippet
                 ac-source-dictionary
                 ac-source-abbrev
                 ac-source-words-in-buffer
                 ac-source-words-in-same-mode-buffers
                 ac-source-imenu
                 ac-source-files-in-current-dir
                 ac-source-filename))
  (setq ac-modes ac+-modes)

  (defun ac-start-use-sources (sources)
    (interactive)
    (let ((ac-sources sources))
      (call-interactively 'ac-start))))

(eval-after-load "auto-complete"
  '(auto-complete-settings))

(eval-after-load "cc-mode"
  '(ac-settings-4-cc))

(defun ac-settings-4-cc ()
  "`auto-complete' settings for `cc-mode'."
     (dolist (command `(c-electric-backspace
                        c-electric-backspace-kill))
       (add-to-list 'ac-trigger-commands-on-completing command)))

(defun ac-settings-4-autopair ()
  "`auto-complete' settings for `autopair'."
  (defun ac-trigger-command-p (command)
    "Return non-nil if `this-command' is a trigger command."
    (or
     (and
      (symbolp command)
      (or (memq command ac-trigger-commands)
          (string-match "self-insert-command" (symbol-name command))
          (string-match "electric" (symbol-name command))
          (let* ((autopair-emulation-alist nil)
                 (key (this-single-command-keys))
                 (beyond-autopair (or (key-binding key)
                                      (and (setq key (lookup-key local-function-key-map key))
                                           (key-binding key)))))
            (or
             (memq beyond-autopair ac-trigger-commands)
             (and ac-completing
                  (memq beyond-autopair ac-trigger-commands-on-completing)))))))))

(eval-after-load "autopair"
  '(ac-settings-4-autopair))

(defun ac-settings-4-lisp ()
  "Auto complete settings for lisp mode."
  (setq ac-omni-completion-sources '(("\\<featurep\s+'" ac+-source-elisp-features)
                                     ("\\<require\s+'"  ac+-source-elisp-features)
                                     ("\\<load\s+\""    ac-source-emacs-lisp-features)))
  (ac+-apply-source-elisp-faces)
  (setq ac-sources
        '(ac-source-features
          ac-source-functions
          ac-source-yasnippet
          ac-source-variables
          ac-source-symbols
          ac-source-dictionary
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-files-in-current-dir
          ac-source-filename
          ac-source-words-in-same-mode-buffers)))

(defun ac-settings-4-java ()
  (setq ac-omni-completion-sources (list (cons "\\." '(ac-source-semantic))
                                         (cons "->" '(ac-source-semantic))))
  (setq ac-sources
        '(;;ac-source-semantic
          ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-c ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-dictionary
          ;; ac-source-semantic
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-cpp ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-dictionary
          ;; ac-source-semantic
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-text ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-imenu)))

(defun ac-settings-4-eshell ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename
          ac-source-symbols
          ac-source-imenu)))

(defun ac-settings-4-ruby ()
  (require 'rcodetools-settings)
  (setq ac-omni-completion-sources
        (list (cons "\\." '(ac-source-rcodetools))
              (cons "::" '(ac-source-rcodetools)))))

(defun ac-settings-4-html ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-tcl ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

(defun ac-settings-4-awk ()
  (setq ac-sources
        '(ac-source-yasnippet
          ac-source-abbrev
          ac-source-words-in-buffer
          ac-source-words-in-same-mode-buffers
          ac-source-files-in-current-dir
          ac-source-filename)))

;; from ahei
(defun am-add-hooks (hooks function &optional append local)
  "Call `add-hook' on hook list HOOKS use arguments FUNCTION, APPEND, LOCAL.HOOKS can be one list or just a hook."
  (if (listp hooks)
      (mapc
       `(lambda (hook)
          (add-hook hook ',function append local))
       hooks)
    (add-hook hooks function append local)))

(defun am-intern (&rest strings)
  "`intern' use STRINGS."
  (intern
   (apply
    'concat
    (mapcar
     (lambda (element)
       (if (stringp element) element (symbol-name element)))
     strings))))

(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
                  svn-log-edit-mode-hook change-log-mode-hook)
 'ac-settings-4-lisp)

(apply-args-list-to-fun
 (lambda (hook fun)
   (am-add-hooks hook fun))
 `(('java-mode-hook   'ac-settings-4-java)
   ('c-mode-hook      'ac-settings-4-c)
   ('c++-mode-hook    'ac-settings-4-cpp)
   ('text-mode-hook   'ac-settings-4-text)
   ('eshell-mode-hook 'ac-settings-4-eshell)
   ('ruby-mode-hook   'ac-settings-4-ruby)
   ('html-mode-hook   'ac-settings-4-html)
   ('awk-mode-hook    'ac-settings-4-awk)
   ('tcl-mode-hook    'ac-settings-4-tcl)))

(eal-eval-by-modes
 ac-modes
 (lambda (mode)
   (let ((mode-name (symbol-name mode)))
     (when (and (intern-soft mode-name) (intern-soft (concat mode-name "-map")))
       (define-key (symbol-value (am-intern mode-name "-map")) (kbd "C-c a") 'ac-start)))))

(provide 'auto-complete-settings)

;; minibuf
(setq enable-recursive-minibuffers t)

;;Scrolling without moving the point, not work ?
;;(setq scroll-conservatively 10000)
;;(setq scroll-preserve-screen-position t)

;; selected region to upcase/downcase
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;; narrowing
;;(put 'narrow-to-region 'disabled nil)

;;
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; vertical motion starting at end of line keeps to ends of lines
(setq track-eol t)

;; user name and email
;;(setq user-full-name "name")
;;(setq user-mail-address "name@gmail.com")


;; default 70
;(setq-default fill-column 50)

;; set identation
(setq indent-line-function 'insert-tab)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44))
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-width 4)

;; c-set-style
(setq c-default-style "linux")
(setq c-basic-offset 4)

;; Don't want any backup files
(setq make-backup-files nil)
;; Don't want any auto saving
;; not generate temp file #filename#
(setq auto-save-default nil)

;; iswitchb
(iswitchb-mode 1)
;;prevent certain buffers from showing up
;;(setq iswitchb-buffer-ignore '("^ " "*Buffer"))
;;prevent switching to another frame
(setq iswitchb-default-method 'samewindow)

;; M-x give optinal command
(icomplete-mode 1)

;; gud mode use cursor show variable value
(gud-tooltip-mode)

;; kill buffer of gud
(add-hook 'gdb-mode-hook 'kill-buffer-when-shell-command-exit)

;; kill buffer of shell term
(add-hook 'term-mode-hook 'kill-buffer-when-shell-command-exit)

;; make it easy on eyes first ...
(set-foreground-color "Wheat")   ;; look ok
(set-background-color "DarkSlateGray")  ;; look ok
(set-cursor-color "Yellow")  ;; Yellow looks good
(set-mouse-color "Orchid")   ;; so so

;; where my elisp stuff is
;;(setq load-path (cons "/path" load-path))

;; none of these plese
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode nil)

;; way better buffer-switching
;; ido - interactively do things with buffers and files
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-ignore-extensions t)

;;show date and time in mode-line
;;(setq display-time-day-and-date t)
;;(display-time)

;; no need startup screen
(setq inhibit-startup-message t)

;; yank to cursor but not mouse point
(setq mouse-yank-at-point t)

;; kill-ring num
(setq kill-ring-max 200)

;; scroll
;(setq scroll-margin 2)

;; cursor to be vertical bar, not a block
(setq-default cursor-type 'bar)

;; text mode
(setq default-major-mode 'text-mode)
;(add-hook 'text-mode-hook 'turn-on-auto-fill) ;; comment it because it had previous !!, i don't know how its effect !

;; add line at end of file
(setq require-final-newline t)

;; cursor and mouse point avoidance
(setq mouse-avoidance-mode 'animate)

;; C-K delete line at the same time
(setq-default kill-whole-line t)

;; binding
;(global-set-key [f1] 'goto-line)
(global-set-key "\M-q" 'other-window)
;; make other-window ignore a certain window
(defvar ignore-windows-containing-buffers-matching-res '("\\*Help" "Speedbar\\*" "Minibuf\\*")
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

;; line and column num
(global-linum-mode t)
(setq column-number-mode t)
(setq line-number-mode t)

;; highlight
(global-font-lock-mode 't)
;; highlight current line
(global-hl-line-mode 1)

;; parenthese match
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; copy & paste with outside
(setq x-select-enable-clipboard t)

;; customize setting
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ido-ignore-files (quote ("\\.out" "\\.a" "\\.o" "\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 )

;; Warning:cedet-called-interactively-p called with 0 arguments, but requires 1
(setq byte-compile-warnings nil)
(require 'cedet)
;(require 'semantic)
;(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;(semantic-load-enable-guady-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
;(global-srecode-minor-mode 1)  ;; need to learn more.
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
;; from http://emacser.com/cedet.htm
(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all)

;; manual fresh
(global-set-key [(control f1)] 'senator-force-refresh)

;; jump
;;(global-set-key [f12] 'semantic-ia-fast-jump)
;;(global-set-key [S-f12]
;;                (lambda ()
;;                  (interactive)
;;                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
;;                      (error "Semantic Bookmark ring is currently empty"))
;;                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
;;                         (alist (semantic-mrub-ring-to-assoc-list ring))
;;                         (first (cdr (car alist))))
;;                    (if (semantic-equivalent-tag-p (oref first tag)
;;                                                   (semantic-current-tag))
;;                        (setq first (cdr (car (cdr alist)))))
;;                    (semantic-mrub-switch-tags first))))
;; hide and show macro #ifdef #endif
;(setq hide-ifdef-mode t)

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

;; highlight-symbol for highlight variable
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)  ;; go to next symbol
(global-set-key [(shift f3)] 'highlight-symbol-prev) ;; go prev
;(global-set-key [(meta f3)] 'highlight-symbol-prev) ;; comment for don't use meta key

;;
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'c-mode-hook
          '(lambda ()
             (gtags-mode t)))
;; 2 useful binding, but how use its own keymap ???
(global-set-key (kbd "C-c t") 'gtags-find-tag)
(global-set-key (kbd "C-t")   'gtags-pop-stack)

;;;;;;; ECB
;;;;;(require 'ecb)
;;;;;;(require 'ecb-autoloads)
;;;;;(setq ecb-tip-of-the-day nil) ;; not work ??
;;;;;(setq ecb-tree-navigation-by-arrow nil) ;; not use arrow key (left right up down)
;;;;;
;;;;;;; myself layout of ecb and scope
;;;;;(ecb-layout-define "my-cscope-layout" left nil
;;;;;(ecb-set-sources-buffer)
;;;;;(ecb-split-ver 0.30 t)
;;;;;(other-window 1)
;;;;;(ecb-set-methods-buffer)
;;;;;;(ecb-split-ver 0.45 t)
;;;;;;(other-window 1)
;;;;;;(ecb-set-cscope-buffer)
;;;;;)
;;;;;;(defecb-window-dedicator ecb-set-cscope-buffer " *ECB cscope-buf*"
;;;;;;(switch-to-buffer "*cscope*"))
;;;;;
;;;;;(setq ecb-layout-name "my-cscope-layout")
;;;;;
;;;;;;; Disable buckets so that history buffer can display more entries
;;;;;(setq ecb-history-make-buckets 'never)
;;;;;
;;;;;;; start ECB
;;;;;;(ecb-activate)
