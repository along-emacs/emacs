;; -*- coding: utf-8-unix -*-

;; Common
(require 'cl-lib)

(fset 'yes-or-no-p               'y-or-n-p)
(put  'dired-find-alternate-file 'disabled nil)
(set-language-environment        "utf-8")

(column-number-mode    1)
(delete-selection-mode 1)
(display-time-mode     1)
(global-hl-line-mode   1)
(ido-mode              1)
(show-paren-mode       1)
(size-indication-mode  1)

(setq column-number-mode                  t
      echo-keystrokes                     .01
      ido-enable-flex-matching            t
      inhibit-compacting-font-caches      t
      inhibit-startup-message             t
      ;; initial-buffer-choice               ""
      line-number-mode                    t
      make-backup-files                   nil
      save-interprogram-paste-before-kill t
      search-whitespace-regexp            nil
      set-mark-command-repeat-pop         t
      url-proxy-services                  '(("no_proxy" . "^\\(localhost\\|10.*\\)")
					    ("http"     . "127.0.0.1:8889")
					    ("https"    . "127.0.0.1:8889"))
      yank-pop-change-selection           t )

;; GUI
(when (display-graphic-p)
  (menu-bar-mode 1)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)

  ;; | English font and size | Chinese font and size |中文|
  ;; |-----------------------+-----------------------|AbcD|
  ;; | Consolas 12           | Microsoft Yahei 22    |
  ;; |-----------------------+-----------------------|
  ;; | Lucida Console 16     | Microsoft Yahei 32    |
  ;; | Lucida Console 20     | Microsoft Yahei 40    |
  (set-face-attribute 'default nil :font "Lucida Console 16")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset (font-spec :family "等线"
					 :size 32)))

  (add-to-list 'default-frame-alist '(foreground-color . "black")) ;0 0 0
  (add-to-list 'default-frame-alist '(background-color . "#fffacd")) ;255 250 205
  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  (add-to-list 'default-frame-alist '(alpha . (95 80)))
  (set-face-foreground 'region "black")
  (set-face-background 'region "#eedc82") ;238 220 82
  )

;; CLI
(when (not (display-graphic-p))
  (menu-bar-mode 0)
  (set-face-background hl-line-face "darkgray"))
