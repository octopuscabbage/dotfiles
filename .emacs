
;;; Code:
; list the packages you want
(setq package-list '(evil
		     flycheck
		     autopair
		     latex-preview-pane
		     auto-complete
		     color-identifiers-mode
                     zenburn-theme
		     neotree
		     arduino-mode
		     spotify
		     haskell-mode
		     ido
		     howdoi
		     avy
		     flycheck-hdevtools
		     flycheck-pos-tip
                     angularjs-mode
                     exec-path-from-shell
		     yasnippet
		     ))

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa-stable" . "http://stable.melpa.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")
			 ))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))



;;Evil conf
(require 'evil)
(evil-mode 1)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;;Random config
(load-theme 'zenburn t) ;T is for trust
(desktop-save-mode 0)
(show-paren-mode t)
(setq gdb-many-windows t)
(latex-preview-pane-enable)

;;Syntax and spell check
;; Flyspell
(flyspell-prog-mode)
(dolist (hook '(text-mode-hook))
     (add-hook hook (lambda () (flyspell-mode 1))))

;; Flycheck
(require 'flycheck)
;(require 'flycheck-pos-tip)
;(add-hook 'after-init-hook #'global-flycheck-mode)

(global-flycheck-mode t)

;; flycheck errors on a tooltip (doesnt work on console)
;(when (display-graphic-p (selected-frame))
;  (eval-after-load 'flycheck
;   '(custom-set-variables
;     '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))


(require 'autopair)
(autopair-global-mode)

;;Small packages
(require 'auto-complete)
(ac-config-default)


;;Neotree
(require 'neotree)
(global-set-key (kbd "C-c o") 'neotree-dir)

;;Semantic Hightlighting
(color-identifiers-mode)
(add-hook 'after-init-hook 'global-color-identifiers-mode)
(add-to-list
 'color-identifiers:modes-alist
 `(haskell-mode . ("[^.][[:space:]]*" "\\_<\\([a-zA-Z_$]\\(?:\\s_\\|\\sw\\)*\\)" (nil))))
(add-to-list
 'color-identifiers:modes-alist
 `(emacs-lisp-mode . ("[^.][[:space:]]*" "\\_<\\([a-zA-Z_$]\\(?:\\s_\\|\\sw\\)*\\)" (nil))))
(add-to-list
 'color-identifiers:modes-alist
 `(arduino-mode . ("[^.][[:space:]]*" "\\_<\\([a-zA-Z_$]\\(?:\\s_\\|\\sw\\)*\\)" (nil))))


;;Spotify
(when (eq system-type 'gnu/linux) 
    (global-set-key (kbd "s-<pause>") #'spotify-playpause)
    (global-set-key (kbd "s-M-<pause>") #'spotify-next)
    (spotify-enable-song-notifications)
)

;(add-hook 'after-save-hook 'color-identifiers-mode)

;;Haskell
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;;Midnight
(require 'midnight)
(setq midnight-mode t)
(require 'ido)
(ido-mode t)
(neotree-show)
(require 'howdoi)
(require 'avy)
(define-key evil-normal-state-map "s" 'avy-goto-char)
(require 'flycheck-hdevtools)
(require 'flycheck-pos-tip)
(eval-after-load 'flycheck '(custom-set-variables '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
(setq-default indent-tabs-mode nil)

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)




(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(add-hook 'js-mode-hook (lambda () (flycheck-select-checker 'javascript jscs)))

(provide '.emacs) 

;;; .emacs ends here

