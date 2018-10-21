(setq prelude-theme 'solarized-dark)

;; make sure org-mode uses monospaced font (had issues with solarized)
(setq solarized-scale-org-headlines nil)
(setq solarized-use-variable-pitch nil)

(global-set-key "\M-`" 'other-frame)

(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

;;(add-hook 'org-mode-hook
;;          (lambda () (face-remap-add-relative 'default :family "Monospace")))

;;(add-hook 'org-mode-hook (lambda () (variable-pitch-mode nil)))

;; Prelude does not mess by default with the standard mapping of Command (to Super) and Option (to Meta).
;; If you want to swap them add this to your personal config:
;; Change meta key to cmd
;; http://stackoverflow.com/questions/7743402/how-can-i-change-meta-key-from-alt-to-cmd-on-mac-in-emacs-24
(setq mac-command-modifier 'meta
      mac-option-modifier 'super)

(toggle-scroll-bar -1)
;; for new frames
(add-hook 'after-make-frame-functions
          '(lambda (frame)
             (modify-frame-parameters frame
                                      '((vertical-scroll-bars . nil)
                                        (horizontal-scroll-bars . nil)))))

(setq prelude-whitespace nil)

;;; You email address
(setq user-mail-address "mvitorino@gmail.com")

(setq erc-nick "miguelv")
;; (erc :server "irc.freenode.net" :port 6667 :nick "miguelv")
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#go-nuts" "#appengine" "#gcloud" "#google-containers")))

;; show battery percentage in mode line
(setq battery-mode-line-format "[%b%p%%]") ;; "#%b %p %t" ;; "[%b%p%%]"
(setq battery-load-critical 7)
(display-battery-mode t)

;; display current time
;;(setq display-time-day-and-date nil)
;;(setq display-time-24hr-format nil)
(setq display-time-format " %H:%M"
      display-time-default-load-average nil)
(display-time-mode 1)

;;(defun set-exec-path-from-shell-PATH ()
;;  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
;;
;;This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
;;  (interactive)
;;  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;    (setenv "PATH" path-from-shell)
;;    (setq exec-path (split-string path-from-shell path-separator))))

;;(set-exec-path-from-shell-PATH)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))
