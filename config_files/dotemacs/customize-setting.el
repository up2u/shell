
;; user name and email
(setq user-full-name "毛礼杰")
(setq user-mail-address "maolijie@gmail.com")

;; customize setting
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(ecb-options-version "2.40")
 '(ido-ignore-files (quote ("\\.out" "\\.a" "\\.o" "\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./")))
 '(highlight-beyond-fill-column-in-modes (quote ("c-mode" "c++-mode")))
 '(org-M-RET-may-split-line (quote ((headline) (default . t))))
 '(org-adapt-indentation nil)
 '(org-export-html-postamble t)
; '(org-agenda-auto-exclude-function (quote org-my-auto-exclude-function))
; '(org-agenda-custom-commands (quote (("h" "Current Hotlist" tags "HOT&TODO=\"PROJECT\"" ((org-agenda-overriding-header "Current Hotlist"))) ("H" "Non-Hot Projects" tags "-HOT&TODO=\"PROJECT\"" ((org-agenda-overriding-header "Non-Hot Projects"))) ("A" "Priority #A tasks" agenda "" ((org-agenda-ndays 1) (org-agenda-overriding-header "Today's priority #A tasks: ") (org-agenda-skip-function (quote (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]"))))) ("b" "Priority #A and #B tasks" agenda "" ((org-agenda-ndays 1) (org-agenda-overriding-header "Today's priority #A and #B tasks: ") (org-agenda-skip-function (quote (org-agenda-skip-entry-if (quote regexp) "\\=.*\\[#C\\]"))))) ("E" "Errands (next 7 days)" tags "Errand&TODO<>\"DONE\"&TODO<>\"CANCELED\"&STYLE<>\"habit\"&SCHEDULED<\"<+7d>\"" ((org-agenda-overriding-header "Errands (next 7 days)"))) ("Z" "Agenda (next 7 days)" agenda "" ((org-agenda-ndays 7) (org-agenda-overriding-header "Agenda (next 7 days)"))) ("r" "Uncategorized items" tags "CATEGORY=\"Inbox\"&LEVEL=2" ((org-agenda-overriding-header "Uncategorized items"))) ("W" "Waiting/delegated tasks" tags "TODO=\"WAITING\"|TODO=\"DELEGATED\"" ((org-agenda-overriding-header "Waiting/delegated tasks:") (org-agenda-sorting-strategy (quote (todo-state-up priority-down category-up))))) ("z" "Computer-related tasks" tags "AREA=\"Computer\"&TODO<>\"\"&TODO<>{DONE\\|CANCELED\\|NOTE\\|PROJECT}" ((org-agenda-files (quote ("~/Documents/Tasks/todo.txt"))) (org-agenda-overriding-header "Computer-related tasks: ") (org-agenda-skip-function (quote (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote timestamp) (quote regexp) "\\* \\(DEFERRED\\|SOMEDAY\\)"))) (org-agenda-sorting-strategy (quote (priority-down))))) ("u" "Unscheduled tasks" tags "AREA<>{Work\\|Computer\\|Statements}&TODO<>\"\"&TODO<>{DONE\\|CANCELED\\|NOTE\\|PROJECT}" ((org-agenda-files (quote ("~/Documents/Tasks/todo.txt"))) (org-agenda-overriding-header "Unscheduled tasks: ") (org-agenda-skip-function (quote (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote timestamp) (quote regexp) "\\* \\(DEFERRED\\|SOMEDAY\\)"))) (org-agenda-sorting-strategy (quote (priority-down))))) ("U" "Deferred tasks" tags "TODO=\"DEFERRED\"" ((org-agenda-files (quote ("~/Documents/Tasks/todo.txt"))) (org-agenda-overriding-header "Deferred tasks:"))) ("Y" "Someday tasks" tags "TODO=\"SOMEDAY\"" ((org-agenda-overriding-header "Someday tasks:"))) ("w" "Unscheduled work-related tasks" tags "AREA=\"Work\"&TODO<>\"\"&TODO<>{DONE\\|CANCELED\\|NOTE\\|PROJECT}" ((org-agenda-overriding-header "Unscheduled work-related tasks") (org-agenda-files (quote ("~/Documents/Tasks/todo.txt"))) (org-agenda-sorting-strategy (quote (todo-state-up priority-down category-up))) (org-agenda-skip-function (quote (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote timestamp)))))) ("v" "All work-related tasks" tags "AREA=\"Work\"&TODO<>\"\"&TODO<>{DONE\\|CANCELED\\|NOTE\\|PROJECT}" ((org-agenda-overriding-header "Work-related tasks") (org-agenda-files (quote ("~/Documents/Tasks/todo.txt"))) (org-agenda-sorting-strategy (quote (category-up priority-down todo-state-up alpha-up))) (org-agenda-skip-function (quote (org-agenda-skip-entry-if (quote regexp) "\\* \\(DEFERRED\\|SOMEDAY\\)"))))) ("l" "Ledger tasks" tags-todo "TODO<>{SOMEDAY\\|DEFERRED}" ((org-agenda-files (quote ("~/src/ledger/plan/TODO"))) (org-agenda-overriding-header "Ledger tasks:") (org-agenda-sorting-strategy (quote (todo-state-up priority-down category-up))) (org-agenda-skip-function (quote (org-agenda-skip-entry-if (quote regexp) "\\=.*\\[#C\\]"))))) ("L" "Ledger tasks not in Bugzilla" tags "TODO<>{DONE\\|TESTED\\|CLOSED\\|NOTE}&LEVEL=2" ((org-agenda-files (quote ("~/src/ledger/plan/TODO"))) (org-agenda-overriding-header "Ledger tasks:") (org-agenda-sorting-strategy (quote (todo-state-up priority-down category-up))) (org-agenda-skip-function (quote (org-agenda-skip-entry-if (quote regexp) "[^(]#[0-9]"))))) ("G" "Ledger tasks (all)" alltodo "" ((org-agenda-files (quote ("~/src/ledger/plan/TODO"))) (org-agenda-overriding-header "Ledger tasks:") (org-agenda-sorting-strategy (quote (todo-state-up priority-down category-up))))) ("N" "Ledger tasks (all, alphabetical)" alltodo "" ((org-agenda-files (quote ("~/src/ledger/plan/TODO"))) (org-agenda-overriding-header "Ledger tasks, alphabetical:") (org-agenda-sorting-strategy (quote (alpha-up))))) ("n" "Notes" tags "TODO=\"NOTE\"" ((org-agenda-files (quote ("~/Documents/Tasks/archive-2009.txt" "~/Documents/Tasks/archive-2010.txt" "~/Documents/Tasks/archive-2011.txt" "~/Documents/Tasks/archive.txt" "~/Documents/Tasks/notes.txt"))) (org-agenda-overriding-header "Notes") (org-agenda-sorting-strategy (quote (time-down))))) ("S" "Assembly Action Items" tags-todo "TODO<>\"PROJECT\"" ((org-agenda-files (quote ("~/Documents/Tasks/assembly.txt.gpg"))) (org-agenda-overriding-header "Assembly Action Items") (org-agenda-sorting-strategy (quote (alpha-up time-up))))))))
;  '(org-agenda-deadline-leaders (quote ("!D!: " "D%02d: ")))
;  '(org-agenda-default-appointment-duration 60)
;  '(org-agenda-files (quote ("~/Documents/Tasks/todo.txt" "~/Documents/Tasks/assembly.txt.gpg")))
;  '(org-agenda-fontify-priorities t)
;  '(org-agenda-include-diary t)
;  '(org-agenda-log-mode-items (quote (closed clock state)))
;  '(org-agenda-ndays 1)
;  '(org-agenda-persistent-filter t)
;  '(org-agenda-prefix-format (quote ((agenda . "  %-11c%?-12t% s") (timeline . "  % s") (todo . "  %-11c") (tags . "  %-11c"))))
;  '(org-agenda-scheduled-leaders (quote ("" "S%d: ")))
;  '(org-agenda-scheduled-relative-text "S%d: ")
;  '(org-agenda-scheduled-text "")
;  '(org-agenda-show-all-dates t)
;  '(org-agenda-skip-deadline-if-done t)
;  '(org-agenda-skip-scheduled-if-deadline-is-shown t)
;  '(org-agenda-skip-scheduled-if-done t)
;  '(org-agenda-skip-unavailable-files t)
;  '(org-agenda-sorting-strategy (quote ((agenda habit-down time-up todo-state-up priority-down category-keep) (todo priority-down category-keep) (tags priority-down category-keep) (search category-keep))))
;  '(org-agenda-start-on-weekday nil)
;  '(org-agenda-start-with-log-mode t)
;  '(org-agenda-tags-column -100)
;  '(org-agenda-text-search-extra-files (quote (agenda-archives)))
;  '(org-archive-location "TODO-archive::")
;  '(org-archive-save-context-info (quote (time category itags)))
;  '(org-attach-method (quote mv))
;  '(org-capture-templates (quote (("t" "Task" entry (file+headline "~/Documents/Tasks/todo.txt" "Inbox") "* TODO %?
; SCHEDULED: %t
; :PROPERTIES:
; :ID:       %(shell-command-to-string \"uuidgen\"):CREATED:  %U
; :END:" :prepend t))))
 '(org-clock-idle-time 10)
 '(org-clock-in-resume t)
 '(org-clock-in-switch-to-state "STARTED")
 '(org-clock-into-drawer "LOGBOOK")
 '(org-clock-modeline-total (quote current))
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-clock-out-switch-to-state nil)
 '(org-clock-persist (quote history))
 '(org-completion-use-ido t)
 '(org-confirm-elisp-link-function nil)
 '(org-confirm-shell-link-function nil)
 '(org-crypt-disable-auto-save nil)
 '(org-cycle-global-at-bob t)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/Documents/Tasks/todo.txt")
 '(org-directory "~/Documents/Tasks/")
 '(org-drawers (quote ("PROPERTIES" "CLOCK" "LOGBOOK" "OUT")))
 '(org-edit-src-content-indentation 0)
 '(org-enforce-todo-dependencies t)
 '(org-export-babel-evaluate nil)
 '(org-extend-today-until 8)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-footnote-section nil)
 '(org-habit-preceding-days 42)
 '(org-habit-today-glyph 45)
 '(org-hide-leading-stars t)
 '(org-id-locations-file "~/.emacs.d/data/org-id-locations")
 '(org-insert-heading-respect-content t)
 '(org-irc-link-to-logs t t)
; '(org-mobile-agendas (quote ("Z")))
; '(org-mobile-directory "~/Dropbox/MobileOrg")
; '(org-mobile-files (quote ("~/Documents/Tasks/todo.txt")))
; '(org-mobile-files-exclude-regexp "\\(TODO\\(-.*\\)?\\)\\'")
; '(org-mobile-inbox-for-pull "~/Documents/Tasks/from-mobile.org")
; '(org-modules (quote (org-gnus org-id org-info org-habit org-depend)))
; '(org-refile-targets (quote (("~/Documents/Tasks/todo.txt" :level . 1) ("~/Documents/Tasks/todo.txt" :todo . "PROJECT") ("~/Documents/Tasks/assembly.txt.gpg" :todo . "PROJECT") ("~/Documents/Tasks/notes.txt" :level . 1) ("~/src/ledger/plan/TODO" :level . 1))))
 '(org-return-follows-link t)
 '(org-reverse-note-order t)
 '(org-tags-column -97)
 '(org-time-clocksum-use-fractional t)
 '(org-todo-keyword-faces (quote (("TODO" :foreground "medium blue" :weight bold) ("APPT" :foreground "medium blue" :weight bold) ("NOTE" :foreground "brown" :weight bold) ("STARTED" :foreground "dark orange" :weight bold) ("WAITING" :foreground "red" :weight bold) ("DELEGATED" :foreground "dark violet" :weight bold) ("DEFERRED" :foreground "dark blue" :weight bold) ("SOMEDAY" :foreground "dark blue" :weight bold) ("PROJECT" :foreground "#088e8e" :weight bold))))
 '(org-todo-repeat-to-state "TODO")
 '(org-use-property-inheritance (quote ("AREA")))
 '(org-use-speed-commands t)
 '(org-use-tag-inheritance nil)
 '(org-x-backends (quote (ox-org ox-redmine)))
 '(org-x-redmine-title-prefix-function (quote org-x-redmine-title-prefix))
 '(org-x-redmine-title-prefix-match-function (quote org-x-redmine-title-prefix-match))
) ; custom-set-variables
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-habit-alert-face ((((background light)) (:background "#f5f946"))))
 '(org-habit-alert-future-face ((((background light)) (:background "#fafca9"))))
 '(org-habit-clear-face ((((background light)) (:background "#8270f9"))))
 '(org-habit-clear-future-face ((((background light)) (:background "#d6e4fc"))))
 '(org-habit-overdue-face ((((background light)) (:background "#f9372d"))))
 '(org-habit-overdue-future-face ((((background light)) (:background "#fc9590"))))
 '(org-habit-ready-face ((((background light)) (:background "#4df946"))))
 '(org-habit-ready-future-face ((((background light)) (:background "#acfca9"))))
 '(org-scheduled ((((class color) (min-colors 88) (background light)) nil)))
 '(org-upcoming-deadline ((((class color) (min-colors 88) (background light)) (:foreground "Brown"))))
) ; custom-set-faces

;; seems that after update tabbar & tabbar-ruler them don't work, so just comment them
;;comment: ;;from http://wwliu.is-programmer.com/posts/14728.html
;;comment: ;;;; 设置tabbar外观
;;comment: ;; 设置默认主题: 字体, 背景和前景颜色，大小
;;comment: (set-face-attribute 'tabbar-default nil
;;comment:                     :family "DejaVu Sans Mono"
;;comment:                     :background "gray80"
;;comment:                     :foreground "gray30"
;;comment:                     :height 0.8
;;comment:                     )
;;comment: ;; 设置左边按钮外观：外框框边大小和颜色
;;comment: (set-face-attribute 'tabbar-button nil
;;comment:                     :inherit 'tabbar-default
;;comment:                     :box '(:line-width 1 :color "gray30")
;;comment:                     )
;;comment: ;; 设置当前tab外观：颜色，字体，外框大小和颜色
;;comment: (set-face-attribute 'tabbar-selected nil
;;comment:                     :inherit 'tabbar-default
;;comment:                     :foreground "Black"
;;comment:                     :background "Yellow"
;;comment:                     :box '(:line-width 1 :color "DarkGoldenrod")
;;comment:                     ;; :overline "black"
;;comment:                     ;; :underline "black"
;;comment:                     :weight 'bold
;;comment:                     )
;;comment: ;; 设置非当前tab外观：外框大小和颜色
;;comment: (set-face-attribute 'tabbar-unselected nil
;;comment:                     :inherit 'tabbar-default
;;comment:                     :box '(:line-width 1 :color "gray70")
;;comment:                     )

(provide 'customize-setting)
