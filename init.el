(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'org)
(straight-use-package 'use-package)
 (use-package magit
   :straight t
   :config
   (global-set-key (kbd "C-x g") 'magit-status))

(straight-use-package
 '(nano-emacs :type git :host github :repo "rougier/nano-emacs"))

;; Window layout (optional)
;;(require 'nano-layout)

;; Theming Command line options (this will cancel warning messages)
(add-to-list 'command-switch-alist '("-dark"   . (lambda (args))))
(add-to-list 'command-switch-alist '("-light"  . (lambda (args))))
(add-to-list 'command-switch-alist '("-default"  . (lambda (args))))

(cond
 ((member "-default" command-line-args) t)
 ((member "-dark" command-line-args) (require 'nano-theme-dark))
 (t (require 'nano-theme-light)))


;; Customize support for 'emacs -q' (Optional)
;; You can enable customizations by creating the nano-custom.el file
;; with e.g. `touch nano-custom.el` in the folder containing this file.
(let* ((this-file  (or load-file-name (buffer-file-name)))
       (this-dir  (file-name-directory this-file))
       (custom-path  (concat this-dir "nano-custom.el")))
  (when (and (eq nil user-init-file)
             (eq nil custom-file)
             (file-exists-p custom-path))
    (setq user-init-file this-file)
    (setq custom-file custom-path)
    (load custom-file)))

;; Theme
(require 'nano-faces)
(nano-faces)

(require 'nano-theme)
(nano-theme)

;;(require 'nano-theme-light)
;;(nano-theme-set-light)

;;(require 'nano-theme-light)
;;(nano-theme-set-light)

;; Nano default settings (optional)
(require 'nano-defaults)

;; Nano session saving (optional)
(require 'nano-session)

;; Nano header & mode lines (optional)
(require 'nano-modeline)

;; Nano key bindings modification (optional)
(require 'nano-bindings)

;; Nano counsel configuration (optional)
;; Needs "counsel" package to be installed (M-x: package-install)
;; (require 'nano-counsel)

;; Welcome message (optional)
(let ((inhibit-message t))
  (message "Welcome to GNU Emacs / N Λ N O edition")
  (message (format "Initialization time: %s" (emacs-init-time))))

;; Splash (optional)
(add-to-list 'command-switch-alist '("-no-splash" . (lambda (args))))
(unless (member "-no-splash" command-line-args)
  (require 'nano-splash))

;; Help (optional)
(add-to-list 'command-switch-alist '("-no-help" . (lambda (args))))
(unless (member "-no-help" command-line-args)
  (require 'nano-help))


 (set-face-attribute 'default nil :height 180)

 ;; Set the default comment column to 70

 (setq-default comment-column 70)

 (set-language-environment "UTF-8")

 ;; Every time a window is started, make sure it get maximized

 (add-to-list 'default-frame-alist '(fullscreen . maximized))


 ;; switch to other frame http://stackoverflow.com/questions/93058/emacs-switching-to-another-frame-mac-os-x
 (global-set-key (kbd "M-o") 'other-frame)




(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)




(use-package yasnippet
  :straight t
  :config (yas-global-mode 1))


(use-package org-roam
  :straight t
  :hook
  (after-init . org-roam-mode)
  :custom
  ((make-directory "~/org-roam")
   (org-roam-directory "~/org-roam")
   )
   :bind (("M-F" . org-roam-find-file)
           ("M-I" . org-roam-insert)
           ("M-G" . org-roam-graph)
           ("M-R" . org-roam))
  )



(straight-use-package 'ctrlf)

(straight-use-package 'selectrum)


(selectrum-mode +1)


(delete-selection-mode 1)
