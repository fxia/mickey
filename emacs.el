;-*- mode: emacs-list-mode -*-
(setq debug-on-error nil)

(setq load-path
      (append (list "/home/fxia/mickey")
              load-path))

;;; Load Perforce Emacs Utilities ;;;
(load-library "p4")
(load-library "ps-ccrypt")
;(load-library "tabbar")
;(require 'multi-term)
;(require 'python-mode)
;(require 'nav)

(require 'shell-pop)
(shell-pop-set-window-height 80)


(global-visual-line-mode t)

;;; Mode suffix mapping ;;;
(setq auto-mode-alist '(("\\.tac$" . c++-mode)
                        ("\\.tin$" . c++-mode)
                        ("\\.py$"  . python-mode)
                        ("\\.cpp$" . c++-mode)
                        ("\\.h$"   . c++-mode)
                        ("\\.c$"   . c++-mode)
                        ("\\.cc$"  . c++-mode)
                        ("\\.pl$"  . perl-mode)
                        ("\\.pm$"  . perl-mode)
                        ("\\.cpt$" . org-mode)
;                        ("\\.emacs$" . emacs-list-mode)
                        ))

;;; Set tab stops to 4-spaced ;;;
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88))

;;; Prohibit generation of "~" backup files ;;;
(setq backup-inhibited t)

;;; Don't do tab-indent ;;;
(setq-default indent-tabs-mode nil)

;;; Turn off widgets to save space ;;;
;(menu-bar-mode nil)
;(tool-bar-mode nil)
;(tabbar-mode t)

;;; Display columns ;;;
(setq-default column-number-mode t)

(global-set-key "\M-i" 'tab-to-tab-stop)
(global-set-key "\C-q" 'dabbrev-expand)
(global-set-key "\r"   'newline-and-indent)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-1" 'replace-string)
(global-set-key "\M-2" 'query-replace-string)
(global-set-key "\M-3" 'replace-regexp)
(global-set-key "\M-4" 'query-replace-regexp)
(global-set-key "\C-cc"	'calendar)
(global-set-key "\C-c\C-g"	'indent-region)
;(global-set-key "\C-c\C-h" 'highlight-changes-mode)
;(global-set-key "\C-c\C-j" 'tabbar-backward-tab)
;(global-set-key "\C-c\C-g" 'tabbar-forward-group)
;(global-set-key "\C-c\C-g" 'tabbar-backward-group)
(global-set-key "\C-c\C-j" 'sr-speedbar-open)
(global-set-key "\M-s\M-s" 'shell-pop)

;hide-show blocks
(global-set-key "\M-h" 'hs-hide-all)
(global-set-key "\M-j" 'hs-show-all)

(defun hs-hide-level-1 ()
  (hs-hide-level 1))
(global-set-key "\M-k" 'hs-hide-block)
(global-set-key "\M-l" 'hs-show-block)

(blink-cursor-mode nil)
;(set-cursor-color "chartreuse")
;(set-fringe-style "none")

(set-background-color "gray10")
;(set-face-foreground 'default "color-252")
(set-face-foreground 'default "color-187")

;;; iswitchb
(iswitchb-mode t)
(add-to-list 'iswitchb-buffer-ignore "*Mini")

;;; Old font-lock hook
(defun font-lock-hook ()
;  (set-face-foreground 'font-lock-keyword-face "color-252")
;  (set-face-foreground 'font-lock-builtin-face "color-252")
;  (set-face-foreground 'font-lock-constant-face "color-252")
;  (set-face-foreground 'font-lock-function-name-face "cyan")
;  (set-face-foreground 'font-lock-type-face "cyan")
;  (set-face-foreground 'font-lock-doc-string-face "orangered")
;  (set-face-foreground 'font-lock-string-face "orangered")
;  (set-face-foreground 'font-lock-comment-face "yellow2")
;  (set-face-foreground 'font-lock-variable-name-face "color-252")
;  (set-face-foreground 'font-lock-preprocessor-face "color-252")
  )

; Basic faces for light background
;(set-face-foreground 'bold-italic "color-152")

(make-face-bold 'mode-line)
(make-face-bold 'mode-line-buffer-id)
;(set-face-foreground 'mode-line "color-152")
;(set-face-background 'mode-line "grey30")
;(set-face-foreground 'mode-line-inactive "color-248")
;(set-face-background 'mode-line-inactive "grey30")  
;(set-face-foreground 'button "color-152")
;(set-face-foreground 'minibuffer-prompt "color-152")
;(set-face-foreground comint-highlight-prompt "blue")

;(defun font-lock-hook2 ()
;  (set-face-foreground font-lock-constant-face "peachbuff")
;  (set-face-foreground font-lock-type-face "color-252")
;  (set-face-foreground font-lock-comment-face "color-162")
;  (set-face-foreground font-lock-string-face "color-162")
;  )

(add-hook 'c++-mode-hook 'font-lock-hook)
(add-hook 'c-mode-hook 'font-lock-hook)
(add-hook 'emacs-lisp-mode-hook 'font-lock-hook)
(add-hook 'python-mode-hook 'font-lock-hook)

(defun py-hook()
  (setq py-indent-offset 4)
  (setq python-indent 4)
  (setq python-continuation-offset 4)
  (set-face-foreground 'py-builtins-face "skyblue")
  (set-face-foreground 'py-pseudo-keyword-face "skyblue")
  )

;(add-hook 'python-mode-hook 'py-hook)

;(set-cursor-color "orange red" )

;; your coding style
(c-add-style "mycodingstyle"
             '((c-basic-offset . 4)
               (c-comment-only-line-offset . 0)
               (c-hanging-braces-alist . ((substatement-open before after)))
               (c-offsets-alist . ((topmost-intro        . 0)
                                   (topmost-intro-cont   . 0)
                                   (substatement         . 4)
                                   (substatement-open    . 0)
                                   (statement-case-open  . 4)
                                   (statement-cont       . 4)
                                   (access-label         . -4)
                                   (inclass              . 4)
                                   (inline-open          . 4)
                                   (innamespace          . 0)
                                   ))))

(defun cc-hook()
  (c-set-style "mycodingstyle")
  ;  (setq c-basic-offset 8)
  (setq c-indent-offset 4)
  (c-set-offset 'innamespace 0)
  (setq indent-tabs-mode nil)
  (setq c-tab-always-indent nil)
  (setq c-append-paragraph-start 0)
  ; (setq show-trailing-whitespace t)
  )

(add-hook 'c++-mode-hook 'cc-hook)
(add-hook 'c-mode-hook 'cc-hook)

(defun org-hook()
  (setq 'org-time-stamp-custom-formats ( "<%m/%d %a>" . "<%m/%d %H:%M>" ) )
  (set-face-underline 'org-date nil)
;  (set-face-foreground 'org-date "orange")
;  (set-face-foreground 'org-level-1 "cyan")
  (setq org-todo-keyword-faces
        '(("WORK"  . (:foreground "turquoise" :weight bold))
          ("HOME"  . (:foreground "tomato" :weight bold))
          ("NOTE"  . (:foreground "spring green" :weight bold))
          ("DONE"  . (:foreground "goldenrod" :weight bold))
          ("PERSONAL" . (:foreground "goldenrod" :weight bold))
          ("PROJECT" . (:foreground "spring green" :weight bold))
          ))
  )
;(add-hook 'org-mode-hook 'org-hook)
(load-library "org")
(setq org-todo-keywords
  '((type "WORK" "HOME" "NOTE" "DONE")))
  
(setq p4-verbose nil)

;;; Set up ediff ;;;
(setq ediff-split-window-function 'split-window-vertically)
(cond ((eq window-system 'x)
       (setq screen-width (x-display-pixel-width)
	     screen-height (x-display-pixel-height))
       (ediff-toggle-multiframe)))
(defun my-ediff-hook ()
  (setq ediff-split-window-function 'split-window-vertically)
  (setq truncate-partial-width-windows nil))
(add-hook 'ediff-mode-hook 'my-ediff-hook)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(frame-background-mode (quote dark))
 '(fringe-mode 0 nil (fringe))
 '(grep-files-aliases (quote (("el" . "*.el") ("ch" . "*.[ch] *.cpp
*.hxx *.cxx *.hpp") ("t" . "*.tac *.tin *.py *.[ch] *.cpp *.hxx *.cxx
*.hpp"))))
 '(indent-tabs-mode nil)
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/new.cpt")))
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "unspecified-bg" :foreground "color-187" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
 '(bold ((t (:foreground "color-123" :weight bold))))
 '(custom-comment ((((type tty)) (:background "grey30" :foreground "pale green"))))
 '(ediff-current-diff-A ((((class color) (min-colors 16)) (:background "color-26" :foreground "pale green"))))
 '(ediff-current-diff-Ancestor ((((class color) (min-colors 16)) (:background "skyblue4" :foreground "white"))))
 '(ediff-current-diff-B ((((class color) (min-colors 16)) (:background "color-26" :foreground "pale green"))))
 '(ediff-current-diff-C ((((class color) (min-colors 16)) (:background "grey50" :foreground "skyblue"))))
 '(ediff-even-diff-A ((((class color) (min-colors 16)) (:background "color-238" :foreground "color-220"))))
 '(ediff-even-diff-Ancestor ((((class color) (min-colors 16)) (:background "Grey30" :foreground "White"))))
 '(ediff-even-diff-B ((((class color) (min-colors 16)) (:background "Grey30" :foreground "color-202"))))
 '(ediff-even-diff-C ((((class color) (min-colors 16)) (:background "grey50" :foreground "skyblue"))))
 '(ediff-odd-diff-A ((((class color) (min-colors 16)) (:background "color-238" :foreground "color-81"))))
 '(ediff-odd-diff-C ((((class color) (min-colors 16)) (:background "Grey50" :foreground "White"))))
 '(font-lock-builtin-face ((((class color) (min-colors 88) (background dark)) (:foreground "color-187"))))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background dark)) (:foreground "color-226"))))
 '(font-lock-doc-face ((t (:foreground "color-226"))))
 '(font-lock-function-name-face ((t (:foreground "color-46" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "cyan"))))
 '(font-lock-string-face ((t (:foreground "color-202"))))
 '(font-lock-type-face ((t (:foreground "color-172" :weight bold))))
 '(font-lock-variable-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "color-187"))))
 '(isearch ((((class color) (min-colors 88) (background dark)) (:background "gray60" :foreground "blue"))))
 '(link ((((class color) (min-colors 88) (background dark)) (:foreground "pink" :underline t))))
 '(minibuffer-prompt ((t (:foreground "color-221"))))
 '(mode-line ((t (:background "color-22" :foreground "color-178" :box (:line-width -1 :style released-button) :weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "color-76" :style released-button)))))
 '(org-date ((((class color) (background dark)) (:foreground "color-108" :underline t))))
 '(org-hide ((((background dark)) (:foreground "grey10"))))
 '(org-level-1 ((t (:foreground "brightyellow" :underline nil :slant italic :weight normal))))
 '(org-level-2 ((t (:inherit nil :foreground "color-187" :weight normal))))
 '(p4-depot-added-face ((t (:foreground "skyblue"))) t)
 '(p4-depot-branch-op-face ((t (:foreground "skyblue"))) t)
 '(p4-depot-unmapped-face ((t (:foreground "white"))) t)
 '(p4-diff-change-face ((t (:foreground "cornsilk"))) t)
 '(p4-diff-file-face ((t (:background "gray30"))) t)
 '(p4-diff-head-face ((t (:background "gray30"))) t)
 '(p4-diff-ins-face ((t (:foreground "skyblue"))) t)
 '(region ((((class color) (min-colors 88) (background dark)) (:background "brown4"))))
 '(rfcview-headname-face ((t (:foreground "orangered" :underline t :weight bold))))
 '(speedbar-directory-face ((((class color) (background dark)) (:foreground "brown"))))
 '(speedbar-file-face ((((class color) (background dark)) (:foreground "color-180"))))
 '(speedbar-separator-face ((((class color) (background dark)) (:background "grey30" :foreground "color-155" :overline "gray" :underline t))))
 '(tool-bar ((default (:foreground "white" :box (:line-width 1 :style released-button))) (nil nil)))
 '(trailing-whitespace ((((class color) (background dark)) (:background "yellow2"))))
 '(underline ((((supports :underline t)) (:foreground "brightgreen" :underline t))))
 '(vertical-border ((t (:inherit mode-line-inactive :background "color-23" :foreground "color-23")))))


(defun terminal-init-screen ()
  (load "term/xterm")
  (xterm-register-default-colors)
  (tty-set-up-initial-frame-faces))

(defun open-bug (bugno)
  (interactive (list
                (completing-read "Bug No: " nil nil nil (bugno))))
  )

