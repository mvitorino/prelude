(prelude-require-packages '(solarized-theme
                            window-numbering
                            ;;go-eldoc
                            ;;go-autocomplete
                            dockerfile-mode
                            ;;sbt-mode
                            ensime
                            neotree
                            json-mode
                            helm-dash
                            sunshine
                            ;;restclient
                            skewer-mode
                            tern
                            company-tern
                            company-cabal
                            top-mode
                            tide ;; typescript
                            ;;omnisharp
                            alchemist
                            ;;fsharp-mode
                            ;;company-go
                            ;;exec-path-from-shell
                            ;;go-test
                            ;;dash-at-point
                            ;;desktop-save-mode
                            ;;battery
                            ))

;; (custom-set-variables '(sunshine-units 'metric)
;;                       '(sunshine-location "Lisbon"))

(setq org-time-clocksum-use-effort-durations t)

(setq neo-theme 'nerd)
(setq neo-window-width 30)
(global-set-key [f8] 'neotree-toggle)

;;(custom-set-variables  '(css-indent-offset 4))
(setq css-indent-offset 4)

;; (disable-theme 'zenburn)

;; regular expression builder
;;(require 're-builder)
;;(setq reb-re-syntax 'string)

;; - rust-mode
;; - go-mode
;; - omnisharp
;; - jedi  (for Python autocomplete)

(window-numbering-mode 1)

;; automatically save/restore opened files, windows config (number of windows, size, position), when quit ＆ restart emacs.
;;(desktop-save-mode 1)

;;(ido-mode 1)
;;(setq ido-enable-flex-matching t)
;;;; IF you want Ido mode to work with C-x C-f (find-files) then add this as well:
;;(setq ido-everywhere t)

;; Hacker News
(setq hackernews-top-story-limit 30)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Misc Settings
;;

;; http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
;; 4 space identation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(add-to-list 'projectile-globally-ignored-files "coverage.out")
(add-to-list 'projectile-globally-ignored-files "*.test")

;;
;;  JavaScript/CSS/HTML
;;
;; https://github.com/skeeto/skewer-mode
;; Provides live interaction with JavaScript, CSS, and HTML in a web browser.
;; Expressions are sent on-the-fly from an editing buffer to be evaluated in the
;; browser, just like Emacs does with an inferior Lisp process in Lisp modes.
(skewer-setup) ;; configure all of mode hooks (js2, css, html)
(add-hook 'js2-mode-hook 'tern-mode)
(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))))

;;
;;  TypeScript
;;
;;  https://github.com/ananthakumaran/tide
;;
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; format options
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))

;; setup tide for .js files also
;;(add-hook 'js2-mode-hook #'setup-tide-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  C#
;;

;; (yas-reload-all)
;; (add-hook 'csharp-mode-hook #'yas-minor-mode)

;; (setq omnisharp-server-executable-path
;;       "/Users/miguel/persomi/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-omnisharp))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Scala
;;
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; from: https://github.com/hvesalai/scala-mode2
;; (add-hook 'scala-mode-hook '(lambda ()
;;                               (require 'whitespace)

;;                               ;; clean-up whitespace at save
;;                               (make-local-variable 'before-save-hook)
;;                               (add-hook 'before-save-hook 'whitespace-cleanup)

;;                               ;; turn on highlight. To configure what is highlighted, customize
;;                               ;; the *whitespace-style* variable. A sane set of things to
;;                               ;; highlight is: face, tabs, trailing
;;                               (whitespace-mode)

;;                               (ensime-scala-mode-hook)
;;                               ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Haskell
;;
;; (add-hook 'haskell-mode-hook 'haskell-indentation-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  GoLang
;;

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

;; (setenv "GOPATH" (concat (getenv "HOME") "/workspace/go-path/"))
;;(setenv "GOROOT" (concat (getenv "HOME") "/bin/google-cloud-sdk/platform/google_appengine/goroot/"))

;;(cond
;; ((string-equal system-type "darwin")   ; Mac OS X
;;  (setenv "GOROOT" "/usr/local/Cellar/go/1.5.1/libexec")) ;; (concat (getenv "HOME") "/bin/go_appengine/goroot/")
;; ;;((string-equal system-type "gnu/linux")
;; ;;(setenv "GOROOT" "/usr/local/go/"))
;; )

;; Go setup
;; run this to get the dependencies:
;; go get -u github.com/nsf/gocode
;; go get -u github.com/rogpeppe/godef
;; go get -u golang.org/x/tools/cmd/goimports
;; go get -u golang.org/x/tools/cmd/cover
;; go get -u github.com/dougm/goflymake
;; go get golang.org/x/tools/cmd/oracle

;;(require 'gotest)
;;(custom-set-variables  '(go-command "~/bin/google-cloud-sdk/platform/google_appengine/goapp"))
;;

;;(load-file (concat (getenv "HOME")
;;                   "/workspace/go-path/src/golang.org/x/tools/cmd/oracle/oracle.el"))
;;(require 'go-oracle)
;; (add-to-list 'load-path )

;; ;; OS X
;; ;;(if  (file-directory-p "/usr/local/opt/go/libexec/misc/emacs/")
;; ;;    (add-to-list 'load-path "/usr/local/opt/go/libexec/misc/emacs/"))
;; ;; Ubuntu
;; ;;(if  (file-directory-p "/usr/local/go/misc/emacs/")
;; ;;    (add-to-list 'load-path "/usr/local/go/misc/emacs/"))
;; ;; (add-to-list 'load-path (concat (live-pack-lib-dir) "go-mode.el/"))

;; ;; http://godoc.org/code.google.com/p/go.tools/cmd/goimports

;; ;;(require 'go-mode-load)
;; ;;(require 'go-mode-autoloads)

(require 'flycheck)
(setq flycheck-highlighting-mode 'lines)

(global-company-mode '(not go-mode))

;; gocode for autocomplete
(add-to-list 'load-path "~/workspace/go-path/src/github.com/nsf/gocode/emacs/")
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)


;; ;;(require 'company)
;; ;;(require 'company-go)
;; ;; (setq company-tooltip-limit 20)                      ; bigger popup window
;; ;; (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
;; ;; (setq company-echo-delay 0)                          ; remove annoying blinking
;; ;; (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing


;;(add-hook 'go-mode-hook 'company-mode)
;;(add-hook 'go-mode-hook (lambda ()
;;                          (set (make-local-variable 'company-backends) '(company-go))
;;                           (company-mode)))

;;;;;;;   below already in prelude
;; M-x package-install go-eldoc
;; (require 'go-eldoc)
;;(setq gofmt-command "goimports")
;;(add-hook 'go-mode-hook 'go-eldoc-setup)
;;(add-hook 'before-save-hook 'gofmt-before-save)
;;;;;

;; (add-hook 'go-mode-hook (lambda ()
;;                           (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
;; (add-hook 'go-mode-hook (lambda ()
;;                           (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") 'godef-jump)))
;; (add-hook 'go-mode-hook '(lambda ()
;;                            (local-set-key (kbd "C-c C-k") 'godoc)))
;; (add-hook 'go-mode-hook '(lambda ()
;;                            (local-set-key (kbd "C-c C-d") 'godef-describe)))
;; ;;(defun my-go-mode-hook ()
;; ;;  ; Customize compile command to run go build
;; ;;  (if (not (string-match "go" compile-command))
;; ;;      (set (make-local-variable 'compile-command)
;; ;;          "go generate && go build -v && go test -v && go vet"))
;; ;;                                        ; Godef jump key binding
;; ;;  (local-set-key (kbd "M-.") 'godef-jump))
;; ;;(add-hook 'go-mode-hook 'my-go-mode-hook)

;;(add-to-list 'load-path "~/workspace/go-path/src/github.com/dougm/goflymake")
;;(require 'go-flymake)

;; ;;(add-to-list 'load-path "~/workspace/go-path/src/github.com/dougm/goflymake")
;; ;;(require 'go-flycheck)

;; ;; TODO
;; ;; go-errcheck
;; ;; (add-to-list 'load-path "~/.live-packs/miguel-pack/lib/go-errcheck.el")
;;(require 'go-errcheck)

;; ;; TODO https://github.com/dominikh/go-errcheck.el


(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                    :weight 'bold)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    EShell
;;
;; http://www.howardism.org/Technical/Emacs/eshell-fun.html
(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)


(defun eshell/x ()
  (insert "exit")
  (eshell-send-input)
  (delete-window))

(defun eshell/l ()
  (insert "ls -la")
  (eshell-send-input))

(defun gotest ()
  """Opens a new shell on a buffer called gotest if not open yet and runs tests"""
  (interactive)
  (let* ((name "*gotest*")
         (buf (get-buffer name))
         ;(default-directory "~/persomi")
         )
    (when (not buf)
      (switch-to-buffer-other-window name))

    (set-buffer name)
    (erase-buffer)
    (insert "\n")
    (when (get-buffer-process name)
      (delete-process name))
    ;; (start-process "gowatch once" name "python"
    ;;                (expand-file-name
    ;;                 "~/workspace/go-path/src/persomi.com/scripts/gowatch/test.py") "-once")
    (start-process "gotest.sh" name
                   (expand-file-name
                    "~/workspace/go-path/src/persomi.com/scripts/gotest.sh"))
    ))

(defun gotestlong ()
  (interactive)
  (let* ((name "*gotest*")
         (buf (get-buffer name)))
    (when (not buf)
      (switch-to-buffer-other-window name))
    (set-buffer name)
    (erase-buffer)
    ;;(insert "\n")
    (when (get-buffer-process name)
      (delete-process name))
    (start-process "gotest" name "goapp test persomi.com/... ")))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-t") 'gotest)))

(defun start-redis ()
  (interactive)
  (start-process "redis" "*redis*" "redis-server"
                 (expand-file-name "~/persomi/bin/redis.conf")))

(defun start-elastic ()
  (interactive)
  (start-process "elastic-search" "*elastic*" (expand-file-name "~/persomi/scripts/start-elastic.sh")))


;; (add-to-list 'vc-diff-switches "-b")
;; vc-diff-switches
;;(vc-diff-switches-list)
